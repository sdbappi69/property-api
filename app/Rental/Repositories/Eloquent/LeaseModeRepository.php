<?php
/**
 * Created by PhpStorm.
 * User: bappi
 * Email: sdbappi69@gmail.com
 * WhatsApp: +8801763456950
 * Date: 22/05/2020
 * Time: 13:34
 */

namespace App\Rental\Repositories\Eloquent;

use App\Rental\Repositories\Contracts\LeaseModeInterface;
use App\Models\LeaseMode;

class LeaseModeRepository extends BaseRepository implements LeaseModeInterface
{
    protected $model;

    /**
     * GuestRepository constructor.
     * @param LeaseMode $model
     */
    function __construct(LeaseMode $model)
    {
        $this->model = $model;
    }

    /**
     * As an entity used for drop down select, we load all possible values. 100 is large enough guess for a max records
     * @return int
     */
    public function limit()
    {
        return (int)(request()->query('limit')) ? : 100;
    }

    /**
     * @return string
     */
    public function sortField ()
    {
        return (string)(request()->query('sortField')) ? : 'lease_mode_display_name';
    }

}
