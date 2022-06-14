<?php
/**
 * Created by PhpStorm.
 * User: SD Bappi
 * WhatsApp: +8801763456950
 * Date: 6/17/2021
 * Time: 3:17 PM
 */

namespace App\Rental\Repositories\Eloquent;

use App\Rental\Repositories\Contracts\LeaseSettingInterface;
use App\Models\LeaseSetting;

class LeaseSettingRepository extends BaseRepository implements LeaseSettingInterface
{

    protected $model;

    /**
     * CustomerRepository constructor.
     * @param LeaseSetting $model
     */
    function __construct(LeaseSetting $model)
    {
        $this->model = $model;
    }

}
