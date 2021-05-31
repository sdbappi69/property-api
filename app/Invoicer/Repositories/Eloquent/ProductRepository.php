<?php

namespace App\Invoicer\Repositories\Eloquent;

use App\Models\Product_Category;
use App\Invoicer\Repositories\Contracts\CustomerInterface;
use App\Invoicer\Repositories\Contracts\ProductInterface;
use App\Models\Product;

class ProductRepository extends BaseRepository implements ProductInterface {

    protected $model;

    /**
     * CustomerRepository constructor.
     * @param Customer $model
     */
    function __construct(Product $model)
    {
        $this->model = $model;
    }

}
