<?php

namespace App\Http\Controllers;

use App\Events\InvoiceCreated;
use App\Http\Resources\InvoiceResource;
use App\Models\Lease;
use App\Rental\Repositories\Contracts\AccountInterface;
use App\Rental\Repositories\Contracts\InvoiceInterface;
use App\Rental\Repositories\Contracts\InvoiceItemInterface;
use App\Rental\Repositories\Contracts\JournalInterface;
use App\Rental\Repositories\Contracts\PeriodInterface;
use App\Rental\Repositories\Contracts\ReadingInterface;
use App\Rental\Repositories\Contracts\TransactionInterface;
use App\Rental\Repositories\Contracts\UnitInterface;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class TestMeController extends Controller
{
    //
    private $journalRepository, $periodRepository,
        $readingRepository, $invoiceItemRepository,
        $invoiceRepository, $unitRepository, $transactionRepository, $accountRepository;

    function __construct(Lease                $model,
                         AccountInterface     $accountRepository,
                         PeriodInterface      $periodRepository,
                         UnitInterface        $unitRepository,
                         JournalInterface     $journalInterface,
                         ReadingInterface     $readingInterface,
                         InvoiceItemInterface $invoiceItemRepository,
                         TransactionInterface $transactionRepository,
                         InvoiceInterface     $invoice)
    {
        $this->model = $model;
        $this->periodRepository = $periodRepository;
        $this->journalRepository = $journalInterface;
        $this->readingRepository = $readingInterface;
        $this->invoiceItemRepository = $invoiceItemRepository;
        $this->invoiceRepository = $invoice;
        $this->transactionRepository = $transactionRepository;
        $this->unitRepository = $unitRepository;
        $this->accountRepository = $accountRepository;
    }

    private function processRent($date, $lease, $invoiceID, $periodName)
    {
        $rentAmount = $lease['rent_amount'];
        $rentNarration = 'Rent - ' . $periodName;

        // Journal entry - rent
        if ($rentAmount > 0)
            $this->journalRepository->earnRent([
                'narration' => $rentNarration,
                'property_id' => $lease['property_id'],
                'amount' => $rentAmount,
                'reference_id' => $lease['id'],
                'lease_number' => $lease['lease_number'],
                'created_by' => $lease['created_by']
            ]);

        // Billing for rent
        if ($rentAmount > 0)
            $this->invoiceItemRepository->item($date, $lease, [
                'invoice_id' => $invoiceID,
                'item_name' => $rentNarration,
                'item_type' => ITEM_RENT,
                'item_description' => $rentNarration,
                'quantity' => 1,
                'price' => $rentAmount,
                'amount' => $rentAmount,
                'discount' => 0,
                'tax' => 0,
                'tax_id' => '',
            ]);
    }

    private function processRentDeposit($date, $lease, $invoiceID, $periodName)
    {
        $rentDepositAmount = $lease['rent_deposit'];
        $rentDepositNarration = 'Rent Deposit';

        // Journal entry for rent deposit
        if ($rentDepositAmount > 0)
            $this->journalRepository->earnRentDeposit([
                'narration' => $rentDepositNarration,
                'property_id' => $lease['property_id'],
                'amount' => $rentDepositAmount,
                'reference_id' => $lease['id'],
                'lease_number' => $lease['lease_number'],
                'created_by' => $lease['created_by']
            ]);

        // Billing for rent deposit
        if ($rentDepositAmount > 0)
            $this->invoiceItemRepository->item($date, $lease, [
                'invoice_id' => $invoiceID,
                'item_name' => $rentDepositNarration,
                'item_type' => ITEM_RENT_DEPOSIT,
                'item_description' => $rentDepositNarration,
                'quantity' => 1,
                'price' => $rentDepositAmount,
                'amount' => $rentDepositAmount,
                'discount' => 0,
                'tax' => 0,
                'tax_id' => '',
            ]);
    }

    private function processExtraCharge($date, $lease, $invoiceID, $periodName)
    {
        if (isset($lease['deposit_deduction_percentage']) and $lease['deposit_deduction_percentage'] > 0) {
            $extraChargeDisplayName = 'Deposit Deduction';
            $extraChargeAmount = round(
                    (($lease['rent_deposit'] * $lease['deposit_deduction_percentage']) / 100),
                    2) * -1;
            $extraChargeNarration = $extraChargeDisplayName . ' - ' . $periodName;
            $this->journalRepository->earnExtraCharge([
                'narration' => $extraChargeNarration,
                'lease_id' => $lease['id'],
                'lease_number' => $lease['lease_number'],
                'property_id' => $lease['property_id'],
                'created_by' => $lease['created_by'],
                'reference_id' => '-',
                'amount' => $extraChargeAmount,
            ]);
            $this->invoiceItemRepository->item($date, $lease, [
                'invoice_id' => $invoiceID,
                'item_name' => $extraChargeNarration,
                'item_type' => ITEM_EXTRA_CHARGE,
                'item_description' => $extraChargeNarration,
                'quantity' => 1,
                'price' => $extraChargeAmount,
                'amount' => $extraChargeAmount,
                'discount' => 0,
                'tax' => 0,
                'tax_id' => '',
            ]);
            $lease->update(['rent_deposit' => ($lease['rent_deposit'] + $extraChargeAmount)]);
        }
        if (isset($lease['meter_readings'])) {
            $meterReadings = $lease['meter_readings'];
            $currentMeterReadings = $meterReadings->where('year',
                date('Y', strtotime($date))
            )->where('month',
                date('m', strtotime($date))
            )->first();
            if ($currentMeterReadings and $currentMeterReadings->reading > 0) {
                $extraChargeDisplayName = 'Meter reading amount';
                $extraChargeAmount = $currentMeterReadings->reading * -1;
                $extraChargeNarration = $extraChargeDisplayName . ' - ' . $periodName;
                $this->journalRepository->earnExtraCharge([
                    'narration' => $extraChargeNarration,
                    'lease_id' => $lease['id'],
                    'lease_number' => $lease['lease_number'],
                    'property_id' => $lease['property_id'],
                    'created_by' => $lease['created_by'],
                    'reference_id' => $currentMeterReadings['id'],
                    'amount' => $extraChargeAmount,
                ]);
                $this->invoiceItemRepository->item($date, $lease, [
                    'invoice_id' => $invoiceID,
                    'item_name' => $extraChargeNarration,
                    'item_type' => ITEM_EXTRA_CHARGE,
                    'item_description' => $extraChargeNarration,
                    'quantity' => 1,
                    'price' => $extraChargeAmount,
                    'amount' => $extraChargeAmount,
                    'discount' => 0,
                    'tax' => 0,
                    'tax_id' => '',
                ]);
            }
        }
        if (isset($lease['extra_charges'])) {
            $extraChargesData = $lease['extra_charges'];
            if (isset($extraChargesData)) {
                foreach ($extraChargesData as $key => $value) {

                    $extraChargeAmount = 0;
                    $extraChargeDisplayName = $value['extra_charge_display_name'];

                    $extraChargeNarration = $extraChargeDisplayName . ' - ' . $periodName;

                    try {
                        $extraChargeAmount = $this->calculateChargeAmount(
                            $lease['id'], $value['pivot']['extra_charge_value'], $value['pivot']['extra_charge_type']
                        );
                    } catch (\Exception $e) {
                        Log::info(json_encode('LeaseRepository - processExtraCharge - ' . $e->getMessage()));
                    }

                    if (isset($extraChargeAmount) && $extraChargeAmount > 0) {
                        $extraChargeAmount = $value['extra_charge_name'] == 'ATI' ? -abs($extraChargeAmount) : $extraChargeAmount;
                        $this->journalRepository->earnExtraCharge([
                            'narration' => $extraChargeNarration,
                            'lease_id' => $lease['id'],
                            'lease_number' => $lease['lease_number'],
                            'property_id' => $lease['property_id'],
                            'created_by' => $lease['created_by'],
                            'reference_id' => $value['id'],
                            'amount' => $extraChargeAmount,
                        ]);

                        // Billing for extra charge
                        $this->invoiceItemRepository->item($date, $lease, [
                            'invoice_id' => $invoiceID,
                            'item_name' => $extraChargeNarration,
                            'item_type' => ITEM_EXTRA_CHARGE,
                            'item_description' => $extraChargeNarration,
                            'quantity' => 1,
                            'price' => $extraChargeAmount,
                            'amount' => $extraChargeAmount,
                            'discount' => 0,
                            'tax' => 0,
                            'tax_id' => '',
                        ]);
                    }
                }
            }
        }
    }

    private function processUtilityCharge($date, $lease, $invoiceID, $periodName)
    {
        if (isset($lease['utility_charges'])) {
            $utilityChargesData = $lease['utility_charges'];
            if (isset($utilityChargesData)) {
                foreach ($utilityChargesData as $key => $value) {
                    $utilityID = $value['id'];
                    $unitCost = $value['pivot']['unit_cost'];
                    $baseFee = $value['pivot']['base_fee'];
                    $utilityDisplayName = $value['utility_display_name'];
                    $utilityNarration = $utilityDisplayName . ' - ' . $periodName;

                    // go to readings table with previous_billing_date
                    // - get the last reading that is less or equal to previous_reading_date
                    // - get the difference between this figure and the most recent reading that equal or less that today ()

                    try {
                        $consumption = $this->readingRepository->periodicalUtilityConsumption(
                            $utilityID,
                            $date,
                            $lease['billed_on']
                        );
                        $totalCost = ($consumption * $unitCost) + $baseFee;

                        if (isset($totalCost) && $totalCost > 0) {
                            // Accounting for UtilityCharge
                            $this->journalRepository->earnUtility([
                                'narration' => $utilityNarration,
                                'lease_id' => $lease['id'],
                                'lease_number' => $lease['lease_number'],
                                'property_id' => $lease['property_id'],
                                'created_by' => $lease['created_by'],
                                'reference_id' => $value['id'],
                                'amount' => $totalCost,
                            ]);

                            // Billing for UtilityCharge
                            $this->invoiceItemRepository->item($date, $lease, [
                                'invoice_id' => $invoiceID,
                                'item_name' => $utilityNarration,
                                'item_type' => ITEM_UTILITY,
                                'item_description' => $utilityNarration,
                                'quantity' => 1,
                                'price' => $totalCost,
                                'amount' => $totalCost,
                                'discount' => 0,
                                'tax' => 0,
                                'tax_id' => '',
                            ]);
                        }
                    } catch (\Exception $exception) {
                        Log::info('LeaseRepository - processUtilityCharge - ' . $exception->getMessage());
                    }
                }
            }
        }
    }

    private function updateBillingDates($date, $lease)

    {
        $nextBillingDate = $this->makeNextBillingDate($date, $lease);
        $this->update([
            'billed_on' => $date,
            'next_billing_date' => $nextBillingDate
        ], $lease['id']);
    }

    private function makeNextBillingDate($billingDate, $lease)
    {
        $generateInvoiceOn = $lease['generate_invoice_on']; // day of month

        /// New lease
        if (is_null($lease['billed_on'])) {
            if (isset($lease['skip_starting_period']) && $lease['skip_starting_period'] == true) {
                //  $billingDate = Carbon::parse($billingDate)->addMonth();
                $billingDate = Carbon::parse($billingDate)->addMonthsNoOverflow();
            }
            $nextBillingDate = Carbon::parse($billingDate)
                ->setUnitNoOverflow('day', $generateInvoiceOn, 'month')
                ->format('Y-m-d');
            if ($nextBillingDate <= $billingDate)
                $nextBillingDate = Carbon::parse($nextBillingDate)->addMonthsNoOverflow();

            return $nextBillingDate;
        }
        return Carbon::parse($billingDate)
            ->addMonthsNoOverflow()
            ->setUnitNoOverflow('day', $generateInvoiceOn, 'month')
            ->format('Y-m-d');
    }

    public function update(array $data, $id)
    {
        try {
            $record = $this->model->find($id);

            if (is_null($record))
                throw new ModelNotFoundException('Record not found');

            if (isset($record)) {
                return $record->update($data);
            }

        } catch (\Exception $exception) {
            report($exception);
        }
        return null;
    }

    public function invoice_test()
    {
        $date = '2022-07-29';
        $leases = Lease::where('id', '7a89d2a9-e085-4b22-8612-ae033a9ec2ca')
            ->where('terminated_on', null)
            //->where('next_billing_date', $date)
            //->orWhere('billed_on', NULL)
            ->with(['meter_readings', 'utility_charges', 'extra_charges', 'utility_deposits'])
            ->get();
        //return $leases->toJson();
        if (isset($leases)) {
            foreach ($leases as $lease) {
                $invoice = $this->invoiceRepository->newInvoice($date, $lease);
                $invoiceID = $invoice['id'];
                $periodID = $invoice['period_id'];
                $periodName = $invoice['period_name'];
                // Virgin lease - has deposits
                if (is_null($lease['billed_on'])) {
                    $this->processRentDeposit($date, $lease, $invoiceID, $periodName);
                    $this->processUtilityDeposit($date, $lease, $invoiceID, $periodName);
                }

                // Accounting and billing - rent
                $this->processRent($date, $lease, $invoiceID, $periodName);

                // Accounting and billing - Extra charges
                $this->processExtraCharge($date, $lease, $invoiceID, $periodName);

                // Accounting and billing - utility_charges
                if (isset($lease['billed_on'])) {
                    $this->processUtilityCharge($date, $lease, $invoiceID, $periodName);
                }
                $this->updateBillingDates($date, $lease);
                event(new InvoiceCreated($invoice));
            }
        }
        return $leases->toJson();
    }
}
