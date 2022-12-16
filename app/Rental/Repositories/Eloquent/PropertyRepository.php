<?php
/**
 * Created by PhpStorm.
 * Property: bappi
 * Email: sdbappi69@gmail.com
 * WhatsApp: +8801763456950
 * Date: 14/04/2020
 * Time: 13:11
 */

namespace App\Rental\Repositories\Eloquent;

use App\Rental\Repositories\Contracts\PropertyInterface;
use App\Models\Property;

class PropertyRepository extends BaseRepository implements PropertyInterface
{
    protected $model;

    /**
     * GuestRepository constructor.
     * @param Property $model
     */
    function __construct(Property $model)
    {
        $this->model = $model;
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
