<?php

namespace App\Invoicer\Repositories\Eloquent;

use App\Models\ProductCategory;
use App\Invoicer\Repositories\Contracts\ProductCategoryInterface;
use App\Models\Product_Category;

class ProductCategoryRepository extends BaseRepository implements ProductCategoryInterface {

    protected $model;

    /**
     * CustomerRepository constructor.
     * @param Customer $model
     */
    function __construct(ProductCategory $model)
    {
        $this->model = $model;
    }

}
