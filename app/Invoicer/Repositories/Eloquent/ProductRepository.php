<?php

namespace App\Invoicer\Repositories\Eloquent;

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
