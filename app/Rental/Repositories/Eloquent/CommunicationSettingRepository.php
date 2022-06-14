<?php
/**
 * Created by PhpStorm.
 * User: SD Bappi
 * WhatsApp: +8801763456950
 * Date: 6/19/2021
 * Time: 1:06 PM
 */

namespace App\Rental\Repositories\Eloquent;

use App\Models\CommunicationSetting;
use App\Rental\Repositories\Contracts\CommunicationSettingInterface;

class CommunicationSettingRepository extends BaseRepository implements CommunicationSettingInterface
{

    protected $model;

    /**
     * CommunicationSettingRepository constructor.
     * @param CommunicationSetting $model
     */
    function __construct(CommunicationSetting $model)
    {
        $this->model = $model;
    }

}
