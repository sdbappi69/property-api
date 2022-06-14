<?php
/**
 * Created by PhpStorm.
 * User: bappi
 * Email: sdbappi69@gmail.com
 * WhatsApp: +8801763456950
 * Date: 15/05/2020
 * Time: 23:08
 */

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class AmenityResource extends JsonResource
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

            'amenity_name'          => $this->amenity_name,
            'amenity_display_name'  => $this->amenity_display_name,
            'amenity_description'   => $this->amenity_description,

            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
