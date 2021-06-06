<?php
/**
 * Created by PhpStorm.
 * User: Kevin G. Mungai
 * WhatsApp: +254724475357
 * Date: 6/6/2021
 * Time: 7:28 AM
 */

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class GeneralSettingResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param \Illuminate\Http\Request $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id'                            => $this->id,
            'business_name'                 => $this->business_name,
            'business_type'                 => $this->business_type,
            'email'                         => $this->email,
            'phone'                         => $this->phone,
            'physical_address'              => $this->physical_address,
            'postal_address'                => $this->postal_address,
            'postal_code'                   => $this->postal_code,
            'logo'                          => $this->logo,

            'default_company'               => $this->default_company,
            'favicon'                       => $this->favicon,

            'date_format'                   => $this->date_format,
            'amount_thousand_separator'     => $this->amount_thousand_separator,
            'amount_decimal_separator'      => $this->amount_decimal_separator,
            'amount_decimal'                => (int)$this->amount_decimal,

            // Fields with select drop down data
            'date_formats'                  => $this->date_formats,
            'amount_thousand_separators'    => $this->amount_thousand_separators,
            'amount_decimal_separators'     => $this->amount_decimal_separators,
            'amount_decimals'               => $this->amount_decimals,

            'created_at'                    => $this->created_at,
            'updated_at'                    => $this->updated_at
        ];
    }
}
