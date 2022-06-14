<?php
/**
 * Created by PhpStorm.
 * User: SD Bappi
 * WhatsApp: +8801763456950
 * Date: 6/19/2021
 * Time: 1:11 PM
 */

namespace App\Rental\Repositories\Eloquent;

use App\Models\SmsConfigSetting;
use App\Rental\Repositories\Contracts\SmsConfigSettingInterface;

class SmsConfigSettingRepository extends BaseRepository implements SmsConfigSettingInterface
{
    protected $model;

    /**
     * GuestRepository constructor.
     * @param SmsConfigSetting $model
     */
    function __construct(SmsConfigSetting $model)
    {
        $this->model = $model;
    }
}
