<?php
/**
 * Created by PhpStorm.
 * User: SD Bappi
 * WhatsApp: +8801763456950
 * Date: 6/6/2021
 * Time: 7:27 AM
 */

namespace App\Rental\Repositories\Eloquent;

use App\Models\GeneralSetting;
use App\Rental\Repositories\Contracts\GeneralSettingInterface;

class GeneralSettingRepository extends BaseRepository implements GeneralSettingInterface
{
    protected $model;

    /**
     * GeneralSettingRepository constructor.
     * @param GeneralSetting $model
     */
    function __construct(GeneralSetting $model)
    {
        $this->model = $model;
    }
}
