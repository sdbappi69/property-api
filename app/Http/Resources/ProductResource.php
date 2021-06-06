<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ProductResource extends JsonResource
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
            'product_name'                      => $this->product_name,
            'product_code'                      => $this->product_code,
            'product_price'                     => $this->product_price,
            'product_description'               => $this->product_description,
            'discount'                          => $this->discount,
            'total_price'                       => round(( 1 - ($this->discount/100)) * $this->product_price,2),
            'product_categories_id'             => $this->product_categories_id,
            'company_id'                        => $this->company_id,
            'created_at'                        => $this->created_at,
            'updated_at'                        => $this->updated_at
        ];
    }
}
