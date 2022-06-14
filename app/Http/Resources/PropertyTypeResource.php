<?php
/**
 * Created by PhpStorm.
 * User: bappi
 * Email: sdbappi69@gmail.com
 * WhatsApp: +8801763456950
 * Date: 13/05/2020
 * Time: 15:03
 */

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class PropertyTypeResource extends JsonResource
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

            'name'=> $this->name,
            'display_name'=> $this->display_name,
            'description'=> $this->description,

            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
