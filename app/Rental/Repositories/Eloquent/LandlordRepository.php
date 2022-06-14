<?php
/**
 * Created by PhpStorm.
 * User: bappi
 * Email: sdbappi69@gmail.com
 * WhatsApp: +8801763456950
 * Date: 06/05/2020
 * Time: 12:47
 */

namespace App\Rental\Repositories\Eloquent;

use App\Rental\Repositories\Contracts\LandlordInterface;
use App\Models\Landlord;

class LandlordRepository extends BaseRepository implements LandlordInterface
{
    protected $model;

    /**
     * LandlordRepository constructor.
     * @param Landlord $model
     */
    function __construct(Landlord $model )
    {
        $this->model = $model;
    }

    /**
     * @param $email
     * @return \Illuminate\Database\Eloquent\Model|\Illuminate\Database\Query\Builder|object|null
     */
    function getViaEmail($email) {
        return $this->model->where('email', $email)
            ->orderBy('updated_at', 'desc')
            ->first();
    }
}
