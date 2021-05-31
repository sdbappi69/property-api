<?php

namespace App\Invoicer\Repositories\Eloquent;

use App\Models\Customer;
use App\Invoicer\Repositories\Contracts\CustomerInterface;
use App\Invoicer\Repositories\Contracts\Product_CategoryInterface;

class Product_CategoryRepository extends BaseRepository implements Product_CategoryInterface {

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
