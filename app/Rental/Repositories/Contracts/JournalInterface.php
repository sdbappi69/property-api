<?php
/**
 * Created by PhpStorm.
 * User: SD Bappi
 * Email: sdbappi69@gmail.com
 * WhatsApp: +8801763456950
 * Date: 12/29/2020
 * Time: 11:51 AM
 */

namespace App\Rental\Repositories\Contracts;

interface JournalInterface extends BaseInterface
{
    public function earnRentDeposit($data = []);
}
