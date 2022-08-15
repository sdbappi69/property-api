<?php

namespace App\Http\Controllers\Api\CustomReports;

use App\Http\Controllers\Api\ApiController;
use App\Models\Lease;


class ReportController extends ApiController
{
    /**
     * @return \Illuminate\Database\Eloquent\Builder
     */
    private $headers = [];

    private function returnResponse($reports): array
    {
        return ['headers' => $this->headers, 'reports' => $reports];
    }

    private function getBuilder(): \Illuminate\Database\Eloquent\Builder
    {
        $user = auth()->user();
        $query = Lease::query()->with(['units', 'landlord', 'property', 'tenants']);
        if ($user->tokenCan('am-landlord')) {
            $query->where('landlord_id', $user->id);

        } elseif ($user->tokenCan('am-tenant')) {
            $query->whereHas('tenants', function ($q) use ($user) {
                $q->where('tenant_id', $user->id);
            });
        }
        return $query;
    }

    private function commonData($item, $additional = null): array
    {
        $data = [
            'Landlord Name' => $item->landlord->full_name ?? 'N/A',
            'Lease' => $item->lease_number,
            'Tenant Name' => $item->tenants->first()->full_name,
        ];
        if (isset($additional['tenant_more_info'])) {
            $data += $additional['tenant_more_info'];
        }
        $data += [
            'Property Name' => $item->property->property_name ?? 'N/A',
            'Property Type' => $item->property->property_type->display_name ?? 'N/A',
            'Unit Name' => $item->units->first()->unit_name ?? 'N/A',
        ];
        if (isset($additional['property_more_info'])) {
            $data += $additional['property_more_info'];
        }
        return $data;
    }

    public function item_wise()
    {
        $reports = $this->getBuilder()->get()->map(function ($item) {
            $data = $this->commonData($item) + [
                    'Period' => $item->billed_on ?? 'N/A',
                    'Rent' => $item->rent_amount ?? 'N/A',
                    'Service Charge' => 0,
                    'Security Guard' => 0,
                    'Penalty' => 0,
                    'Electricity' => 0,
                    'Water' => 0,
                    'Gas' => 0,
                    'Total Amount' => 0,
                    'Paid Amount' => 0,
                    'Due Amount' => 0
                ];
            if (!is_null($this->headers)) {
                $this->headers = array_keys($data);
            }
            return $data;
        });
        return $this->returnResponse($reports);
    }

    public function details_tenant_summary()
    {
        $reports = $this->getBuilder()->get()->map(function ($item) {
            $property_more_info = [
                'Property Code' => $item->property->property_code,
                'Location' => $item->property->location,
                'Unit Type' => $item->units->first()->unit_type->unit_type_display_name ?? 'N/A',
                'Unit Floor' => $item->units->first()->unit_type->unit_floor ?? 'N/A',
                'Rent Amount' => $item->rent_amount ?? 0,
                'Total Rooms' => $item->units->first()->total_rooms ?? 'N/A'
            ];
            $tenant_more_info = [
                'Tenants Phone' => $item->tenants->first()->phone ?? 'N/A',
                'Tenants Email' => $item->tenants->first()->email ?? 'N/A',
                'Date of Birth' => $item->tenants->first()->date_of_birth ?? 'N/A',
                'Address' => $item->tenants->first()->date_of_birth ?? 'N/A',
                'NID/Passport' => $item->tenants->first()->id_passport_number ?? 'N/A',
                'Emergency Contact Name' => $item->tenants->first()->emergency_contact_name ?? 'N/A',
                'Emergency Contact Phone' => $item->tenants->first()->emergency_contact_phone ?? 'N/A',
                'Organization Name' => $item->tenants->first()->business_name ?? 'N/A'
            ];
            $data = $this->commonData($item, compact('property_more_info', 'tenant_more_info'));
            if (!is_null($this->headers)) {
                $this->headers = array_keys($data);
            }
            return $data;
        });
        return $this->returnResponse($reports);
    }

    public function service_charge_report()
    {
        $reports = $this->getBuilder()->get()->map(function ($item) {
            $data = $this->commonData($item) + [
                    'Invoice Date' => $item->billed_on ?? 'N/A',
                    'Service Charge' => 0,
                    'Total Amount' => 0
                ];
            if (!is_null($this->headers)) {
                $this->headers = array_keys($data);
            }
            return $data;
        });
        return $this->returnResponse($reports);
    }

    public function collection_report()
    {
        $reports = $this->getBuilder()->get()->map(function ($item) {
            $data = $this->commonData($item) + [
                    'Payment Method' => $item->units->first()->unit_name ?? 'N/A',
                    'Total Amount' => 0,
                    'Payment Date' => $item->billed_on ?? 'N/A',
                    'Total Paid Amount' => 0,
                    'Invoice Date' => 0,
                    'Receipt Number' => 0,

                ];
            if (!is_null($this->headers)) {
                $this->headers = array_keys($data);
            }
            return $data;
        });
        return $this->returnResponse($reports);
    }

    public function due_statement()
    {
        $reports = $this->getBuilder()->get()->map(function ($item) {
            $data = $this->commonData($item) + [
                    'Period' => 0,
                    'Due Amount' => 0
                ];
            if (!is_null($this->headers)) {
                $this->headers = array_keys($data);
            }
            return $data;
        });
        return $this->returnResponse($reports);
    }

    public function monthly_invoice()
    {
        $reports = $this->getBuilder()->get()->map(function ($item) {
            $data = $this->commonData($item) + [
                    'Period' => 0,
                    'Paid' => 0,
                    'Due' => 0,
                    'Balance' => 0,
                    'Invoice Date' => today()->format('Y-m-d'),
                    'Invoice Number' => 0
                ];
            if (!is_null($this->headers)) {
                $this->headers = array_keys($data);
            }
            return $data;
        });
        return $this->returnResponse($reports);
    }

    public function notice()
    {
        $reports = $this->getBuilder()->get()->map(function ($item) {
            $data = $this->commonData($item) + [
                    'Vacating Date' => today()->format('Y-m-d')
                ];
            if (!is_null($this->headers)) {
                $this->headers = array_keys($data);
            }
            return $data;
        });
        return $this->returnResponse($reports);
    }

    public function vat_tax()
    {
        $reports = $this->getBuilder()->get()->map(function ($item) {
            $data = $this->commonData($item) + [
                    'Invoice Date' => today()->format('Y-m-d'),
                    'TAX Amount' => 0,
                    'VAT Amount' => 0,
                    'Total Amount' => 0
                ];
            if (!is_null($this->headers)) {
                $this->headers = array_keys($data);
            }
            return $data;
        });
        return $this->returnResponse($reports);
    }
}
