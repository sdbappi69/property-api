<?php
/**
 * Created by PhpStorm.
 * User: SD Bappi
 * Email: sdbappi69@gmail.com
 * WhatsApp: +8801763456950
 * Date: 12/31/2020
 * Time: 10:22 AM
 */

namespace App\Rental\Repositories\Contracts;

interface LedgerInterface extends BaseInterface
{
    /**
     * @param $journalId
     * @return mixed
     */
    function ledgerEntry($journalId);
}
