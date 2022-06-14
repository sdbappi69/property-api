<?php
/**
 * Created by PhpStorm.
 * User: bappi
 * Email: sdbappi69@gmail.com
 * WhatsApp: +8801763456950
 * Date: 22/05/2020
 * Time: 12:55
 */

namespace App\Rental\Repositories\Eloquent;


use App\Rental\Repositories\Contracts\UnitTypeInterface;
use App\Models\UnitType;

class UnitTypeRepository extends BaseRepository implements UnitTypeInterface
{
    protected $model;

    /**
     * GuestRepository constructor.
     * @param UnitType $model
     */
    function __construct(UnitType $model)
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
        return (string)(request()->query('sortField')) ? : 'unit_type_display_name';
    }

}
