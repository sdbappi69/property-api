<?php
/**
 * Created by PhpStorm.
 * User: bappi
 * Email: sdbappi69@gmail.com
 * WhatsApp: +8801763456950
 * Date: 15/05/2020
 * Time: 23:14
 */

namespace App\Rental\Repositories\Eloquent;

use App\Rental\Repositories\Contracts\FeeInterface;
use App\Models\Fee;

class FeeRepository extends BaseRepository implements FeeInterface
{
    protected $model;

    /**
     * GuestRepository constructor.
     * @param Fee $model
     */
    function __construct(Fee $model)
    {
        $this->model = $model;
    }

}
