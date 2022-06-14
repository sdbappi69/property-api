<?php
/**
 * Created by PhpStorm.
 * User: bappi
 * Email: sdbappi69@gmail.com
 * WhatsApp: +8801763456950
 * Date: 22/05/2020
 * Time: 13:06
 */

namespace App\Rental\Repositories\Eloquent;

use App\Rental\Repositories\Contracts\TenantTypeInterface;
use App\Models\TenantType;

class TenantTypeRepository extends BaseRepository implements TenantTypeInterface
{
    protected $model;

    /**
     * GuestRepository constructor.
     * @param TenantType $model
     */
    function __construct(TenantType $model)
    {
        $this->model = $model;
    }
}
