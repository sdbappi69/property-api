<?php
/**
 * Created by PhpStorm.
 * Role: kevin
 * Date: 26/10/2018
 * Time: 21:54
 */

namespace App\Invoicer\Repositories\Eloquent;

use App\Invoicer\Repositories\Contracts\RoleInterface;
use App\Models\Role;

class RoleRepository extends BaseRepository implements RoleInterface {

    protected $model;

    /**
     * RoleRepository constructor.
     * @param Role $model
     */
    function __construct(Role $model)
    {
        $this->model = $model;
    }
}
