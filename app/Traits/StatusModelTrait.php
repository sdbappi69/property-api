<?php
/**
 * Created by PhpStorm.
 * User: SD Bappi
 * WhatsApp: +8801763456950
 * Date: 8/26/2021
 * Time: 12:07 PM
 */

namespace App\Traits;

use App\Enum\StatusEnum;

trait StatusModelTrait
{
    public function getStatusTitleAttribute(): string
    {
        if ($this->status == StatusEnum::$ACTIVE) {
            return StatusEnum::$ACTIVE_TITLE;
        } elseif ($this->status == StatusEnum::$INACTIVE) {
            return StatusEnum::$INACTIVE_TITLE;
        } else {
            return StatusEnum::$NA;
        }
    }
}
