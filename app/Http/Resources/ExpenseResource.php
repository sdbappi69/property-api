<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ExpenseResource extends JsonResource
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
            'id'                                    => $this->id,
            'name'                                  => $this->name,
            'amount'                                => $this->amount,
            'note'                                  => $this->note,
            'date'                                  => $this->date,
            'currency_id'                           => $this->currency_id,
            'expense_categories_id'                 => $this->expense_categories_id,
            'created_at'                            => $this->created_at,
            'updated_at'                            => $this->updated_at
        ];
    }
}
