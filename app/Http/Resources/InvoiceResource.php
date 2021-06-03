<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class InvoiceResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id'                        => $this->id,
            'invoice_number'             => $this->invoice_number,
            'invoice_date'               => $this->invoice_date,
            'due_date'                   => $this->due_date,
            'status'                    => $this->status,
            'note'                      => $this->note,
            'product_id'                => $this->product_id,
            'customer_id'               => $this->customer_id,
            'currency_id'               => $this->currency_id,
            'created_at'                => $this->created_at,
            'updated_at'                => $this->updated_at
        ];
    }
}
