<?php

namespace App\Invoicer\Repositories\Eloquent;

use App\Models\Currency;
use App\Invoicer\Repositories\Contracts\CurrencyInterface;

class CurrencyRepository extends BaseRepository implements CurrencyInterface {

    protected $model;

    /**
     * CurrencyRepository constructor.
     * @param Currency $model
     */
    function __construct(Currency $model)
    {
        $this->model = $model;
    }

}
