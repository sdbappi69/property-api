<?php
/**
 * Created by PhpStorm.
 * User: bappi
 * Email: sdbappi69@gmail.com
 * WhatsApp: +8801763456950
 * Date: 15/05/2020
 * Time: 23:03
 */

namespace App\Rental\Repositories\Eloquent;

use App\Rental\Repositories\Contracts\UtilityInterface;
use App\Models\Utility;

class UtilityRepository extends BaseRepository implements UtilityInterface
{
    protected $model;

    /**
     * GuestRepository constructor.
     * @param Utility $model
     */
    function __construct(Utility $model)
    {
        $this->model = $model;
    }

    /**
     * As an entity used for drop down select, we load all possible values. 100 is large enough guess for a max records
     * @return int
     */
    public function limit()
    {
        return (int)(request()->query('limit')) ? : 3;
    }

}
