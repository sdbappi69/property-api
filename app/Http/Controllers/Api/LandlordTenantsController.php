<?php
/**
 * Created by PhpStorm.
 * User: SD Bappi
 * WhatsApp: +8801763456950
 * Date: 7/12/2021
 * Time: 4:41 PM
 */

namespace App\Http\Controllers\Api;

use App\Models\Landlord;

class LandlordTenantsController extends ApiController
{
    /**
     * @param Landlord $landlord
     * @return mixed
     */
    public function index(Landlord $landlord)
    {
        return $landlord->tenants();
    }

}
