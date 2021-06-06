<?php
/**
 * Created by PhpStorm.
 * User: Kevin G. Mungai
 * WhatsApp: +254724475357
 * Date: 6/6/2021
 * Time: 7:27 AM
 */

namespace App\Invoicer\Repositories\Eloquent;

use App\Models\GeneralSetting;
use App\Invoicer\Repositories\Contracts\GeneralSettingInterface;

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
