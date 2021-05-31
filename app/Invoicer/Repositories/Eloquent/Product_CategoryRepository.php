<?php

namespace App\Invoicer\Repositories\Eloquent;

use App\Models\Product_Category;
use App\Invoicer\Repositories\Contracts\CustomerInterface;
use App\Invoicer\Repositories\Contracts\Product_CategoryInterface;

class Product_CategoryRepository extends BaseRepository implements Product_CategoryInterface {

    protected $model;

    /**
     * CustomerRepository constructor.
     * @param Customer $model
     */
    function __construct(Product_Category $model)
    {
        $this->model = $model;
    }

}
