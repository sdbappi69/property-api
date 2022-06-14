<?php
/**
 * Created by PhpStorm.
 * User: SD Bappi
 * WhatsApp: +8801763456950
 * Date: 7/12/2021
 * Time: 4:41 PM
 */

namespace App\Http\Controllers\Api;

use App\Models\Property;

class PropertyTenantsController extends ApiController
{
    /**
     * @param Property $property
     * @return mixed
     */
    public function index(Property $property)
    {
        return $property->tenants();
    }

}
