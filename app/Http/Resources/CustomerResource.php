<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class CustomerResource extends JsonResource
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
            'id'                    => $this->id,
            'first_name'            => $this->first_name,
            'middle_name'           => $this->middle_name,
            'last_name'             => $this->last_name,
            'email'                 => $this->email,
            'phone'                 => $this->phone,
            'city'                  => $this->city,
            'country'               => $this->country,
            'company_id'            => $this->company_id,
            'created_at'            => $this->created_at,
            'updated_at'            => $this->updated_at
        ];
    }
}
