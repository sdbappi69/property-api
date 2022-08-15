<?php

namespace App\Http\Controllers\Api\CustomReports;

use App\Http\Controllers\Api\ApiController;
use App\Models\Lease;


class ReportController extends ApiController
{
    /**
     * @return \Illuminate\Database\Eloquent\Builder
     */
    private function getBuilder(): \Illuminate\Database\Eloquent\Builder
    {
        $user = auth()->user();
        $query = Lease::query()->with(['landlord', 'property.property_type', 'tenants']);
        if ($user->tokenCan('am-landlord')) {
            $query->where('landlord_id', $user->id);

        } elseif ($user->tokenCan('am-tenant')) {
            $query->whereHas('tenants', function ($q) use ($user) {
                $q->where('tenant_id', $user->id);
            });
        }
        return $query;
    }

    private function commonData($item): array
    {
        return [
            'Landlord Name' => $item->landlord->full_name ?? 'N/A',
            'Property Name' => $item->property->property_name ?? 'N/A',
            'Property Type' => $item->property->property_type->display_name ?? 'N/A',
            'Tenant Name' => $item->tenants->first()->full_name,
            'Lease' => $item->lease_number,
            'Unit Name' => $item->units->first()->unit_name ?? 'N/A',
        ];
    }

    public function service_charge_report()
    {
        $reports = $this->getBuilder()->get()->map(function ($item) {
            return $this->commonData($item) + [
                    'Invoice Date' => $item->billed_on ?? 'N/A',
                    'Service Charge' => 0,
                    'Total Amount' => 0
                ];
        });
        return $reports;
    }

    public function collection_report()
    {
        $reports = $this->getBuilder()->get()->map(function ($item) {
            return $this->commonData($item) + [
                    'Payment Method' => $item->units->first()->unit_name ?? 'N/A',
                    'Total Amount' => 0,
                    'Payment Date' => $item->billed_on ?? 'N/A',
                    'Total Paid Amount' => 0,
                    'Invoice Date' => 0,
                    'Receipt Number' => 0,

                ];
        });
        return $reports;
    }

    public function due_statement()
    {
        $reports = $this->getBuilder()->get()->map(function ($item) {
            return $this->commonData($item) + [
                    'Period' => 0,
                    'Due Amount' => 0
                ];
        });
        return $reports;
    }

    public function monthly_invoice()
    {
        $reports = $this->getBuilder()->get()->map(function ($item) {
            return $this->commonData($item) + [
                    'Period' => 0,
                    'Paid' => 0,
                    'Due' => 0,
                    'Balance' => 0,
                    'Invoice Date' => today()->format('Y-m-d'),
                    'Invoice Number' => 0
                ];
        });
        return $reports;
    }

    public function notice()
    {
        $reports = $this->getBuilder()->get()->map(function ($item) {
            return $this->commonData($item) + [
                    'Vacating Date' => today()->format('Y-m-d')
                ];
        });
        return $reports;
    }

    public function vat_tax()
    {
        $reports = $this->getBuilder()->get()->map(function ($item) {
            return $this->commonData($item) + [
                    'Invoice Date' => today()->format('Y-m-d'),
                    'TAX Amount' => 0,
                    'VAT Amount' => 0,
                    'Total Amount' => 0
                ];
        });
        return $reports;
    }
}
