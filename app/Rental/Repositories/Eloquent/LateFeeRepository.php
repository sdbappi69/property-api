<?php
/**
 * Created by PhpStorm.
 * User: SD Bappi
 * WhatsApp: +8801763456950
 * Date: 7/27/2021
 * Time: 9:53 AM
 */

namespace App\Rental\Repositories\Eloquent;

use App\Rental\Repositories\Contracts\LateFeeInterface;
use App\Models\LateFee;

class LateFeeRepository extends BaseRepository implements LateFeeInterface
{
    protected $model;

    /**
     * GuestRepository constructor.
     * @param LateFee $model
     */
    function __construct(LateFee $model)
    {
        $this->model = $model;
    }

    /**
     * As an entity used for drop down select, we load all possible values. 100 is large enough guess for a max records
     * @return int
     */
    public function limit()
    {
        return (int)(request()->query('limit')) ?: 100;
    }

    /**
     * @return string
     */
    public function sortField()
    {
        return (string)(request()->query('sortField')) ?: 'late_fee_display_name';
    }

}
