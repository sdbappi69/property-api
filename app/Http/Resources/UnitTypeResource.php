<?php
/**
 * Created by PhpStorm.
 * User: bappi
 * Email: sdbappi69@gmail.com
 * WhatsApp: +8801763456950
 * Date: 22/05/2020
 * Time: 12:53
 */

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class UnitTypeResource extends JsonResource
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

            'unit_type_name' => $this->unit_type_name,
            'unit_type_display_name' => $this->unit_type_display_name,
            'unit_type_description' => $this->unit_type_description,

            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
