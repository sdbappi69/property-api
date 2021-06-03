<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class PaymentResource extends JsonResource
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
            'id'                                => $this->id,
            'date'                              => $this->date,
            'amount'                            => $this->amount,
            'note'                              => $this->note,
            'payment_method'                    => $this->payment_method,
            'transaction_number'                => $this->transaction_number,
            'invoice_number_id'                 => $this->invoice_number_id,
            'customer_id'                       => $this->customer_id,
            'currency_id'                       => $this->currency_id,
            'created_at'                        => $this->created_at,
            'updated_at'                        => $this->updated_at
        ];
    }
}
