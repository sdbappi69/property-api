<?php
/**
 * Created by PhpStorm.
 * User: bappi
 * Email: sdbappi69@gmail.com
 * Date: 20/10/2019
 * Time: 01:59
 */

namespace App\Rental\Repositories\Contracts;

interface AccountLedgerInterface extends BaseInterface
{
    /**
     * @param $journalId
     * @return mixed
     */
    function ledgerEntry($journalId);
}
