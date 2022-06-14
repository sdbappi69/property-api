<?php
/**
 * Created by PhpStorm.
 * PropertyCategory: bappi
 * Email: sdbappi69@gmail.com
 * WhatsApp: +8801763456950
 * Date: 14/04/2020
 * Time: 13:11
 */

namespace App\Rental\Repositories\Eloquent;

use App\Rental\Repositories\Contracts\PropertyCategoryInterface;
use App\Models\PropertyCategory;

class PropertyCategoryRepository extends BaseRepository implements PropertyCategoryInterface
{
    protected $model;

    /**
     * GuestRepository constructor.
     * @param PropertyCategory $model
     */
    function __construct(PropertyCategory $model)
    {
        $this->model = $model;
    }

}
