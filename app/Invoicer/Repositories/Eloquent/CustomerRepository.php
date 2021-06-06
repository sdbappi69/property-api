<?php

namespace App\Invoicer\Repositories\Eloquent;

use App\Models\Customer;
use App\Invoicer\Repositories\Contracts\CustomerInterface;

class CustomerRepository extends BaseRepository implements CustomerInterface {

    protected $model;

    /**
     * CustomerRepository constructor.
     * @param Customer $model
     */
    function __construct(Customer $model)
    {
        $this->model = $model;
    }

}
