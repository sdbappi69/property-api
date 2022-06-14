<?php
/**
 * Created by PhpStorm.
 * User: bappi
 * Email: sdbappi69@gmail.com
 * WhatsApp: +8801763456950
 * Date: 22/05/2020
 * Time: 13:29
 */

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class LeaseTypeResource extends JsonResource
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

            'lease_type_name' => $this->lease_type_name,
            'lease_type_display_name' => $this->lease_type_display_name,
            'lease_type_description' => $this->lease_type_description,

            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
