<?php

namespace App\Invoicer\Repositories\Eloquent;

use App\Models\Quotation;
use App\Invoicer\Repositories\Contracts\QuotationInterface;
use App\Models\Product_Category;

class QuotationRepository extends BaseRepository implements QuotationInterface {

    protected $model;

    /**
     * CustomerRepository constructor.
     * @param Customer $model
     */
    function __construct(Quotation $model)
    {
        $this->model = $model;
    }

}
