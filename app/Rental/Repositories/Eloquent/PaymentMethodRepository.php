<?php
/**
 * Created by PhpStorm.
 * User: bappi
 * Email: sdbappi69@gmail.com
 * WhatsApp: +8801763456950
 * Date: 22/05/2020
 * Time: 17:53
 */

namespace App\Rental\Repositories\Eloquent;

use App\Rental\Repositories\Contracts\PaymentMethodInterface;
use App\Models\PaymentMethod;

class PaymentMethodRepository extends BaseRepository implements PaymentMethodInterface
{
    protected $model;

    /**
     * GuestRepository constructor.
     * @param PaymentMethod $model
     */
    function __construct(PaymentMethod $model)
    {
        $this->model = $model;
    }

}
