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
            'product__categoriesId'             => $this->product__categoriesId,
            'created_at'                        => $this->created_at,
            'updated_at'                        => $this->updated_at
        ];
    }
}
