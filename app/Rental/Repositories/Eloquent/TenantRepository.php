<?php
/**
 * Created by PhpStorm.
 * User: bappi
 * Email: sdbappi69@gmail.com
 * WhatsApp: +8801763456950
 * Date: 05/05/2020
 * Time: 01:05
 */

namespace App\Rental\Repositories\Eloquent;

use App\Rental\Repositories\Contracts\TenantInterface;
use App\Models\Tenant;

class TenantRepository extends BaseRepository implements TenantInterface
{
    protected $model;

    /**
     * GuestRepository constructor.
     * @param Tenant $model
     */
    function __construct(Tenant $model)
    {
        $this->model = $model;
    }

    /**
     * @param $email
     * @return \Illuminate\Database\Eloquent\Model|\Illuminate\Database\Query\Builder|object|null
     */
    function getViaEmail($email)
    {
        return $this->model->where('email', $email)
            ->where('status', 1)
            ->orderBy('updated_at', 'desc')
            ->first();
    }

    public function search($searchFilter, $load = array())
    {
        $query = $this->model;
        if (auth()->user()->tokenCan('am-landlord')) {
            $query = $query->where('landlord_id', auth()->user()->id);
        }
        return $query->with($load)->search($searchFilter, null, true, true)
            ->get();
    }

}
