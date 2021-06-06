<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class CompanyResource extends JsonResource
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
            'name'                  => $this->name,
            'logo'                  => $this->photo,
            'postal_code'           => $this->postal_code,
            'postal_address'        => $this->postal_address,
            'physical_address'      => $this->physical_address,
            'city'                  => $this->city,
            'country'               => $this->country,
            'phone'                 => $this->phone,
            'email'                 => $this->email,
            'user_id'              => $this->user_id,
            'start_at'              => $this->start_at,
            'created_at'            => $this->created_at,
            'updated_at'            => $this->updated_at,
        ];
    }
}
