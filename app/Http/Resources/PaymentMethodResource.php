<?php
/**
 * Created by PhpStorm.
 * User: bappi
 * Email: sdbappi69@gmail.com
 * WhatsApp: +8801763456950
 * Date: 22/05/2020
 * Time: 17:52
 */

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class PaymentMethodResource extends JsonResource
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
            'id' => $this->id,

            'payment_method_name' => $this->payment_method_name,
            'payment_method_display_name' => $this->payment_method_display_name,
            'payment_method_description' => $this->payment_method_description,

            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
