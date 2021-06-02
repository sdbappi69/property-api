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
            'productName'                      => $this->product_name,
            'productCode'                      => $this->product_code,
            'productPrice'                     => $this->product_price,
            'productDescription'               => $this->product_description,
            'product_categoriesId'             => $this->product__categoriesId,
            'created_at'                        => $this->created_at,
            'updated_at'                        => $this->updated_at
        ];
    }
}
