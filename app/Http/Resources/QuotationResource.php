<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class QuotationResource extends JsonResource
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
            'id'                            => $this->id,
            'quotation_number'               => $this->quotation_number,
            'date'                          => $this->date,
            'note'                          => $this->note,
            'product_id'                    => $this->product_id,
            'customer_id'                   => $this->customer_id,
            'currency_id'                   => $this->currency_id,
            'company_id'                    => $this->company_id,
            'created_at'                    => $this->created_at,
            'updated_at'                    => $this->updated_at
        ];
    }
}
