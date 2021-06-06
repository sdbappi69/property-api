<?php

namespace App\Invoicer\Repositories\Eloquent;

use App\Invoicer\Repositories\Contracts\CompanyInterface;
use App\Models\Company;

class CompanyRepository extends BaseRepository implements CompanyInterface {

    protected $model;

    /**
     * CompanyRepository constructor.
     * @param Company $model
     */
    function __construct(Company $model)
    {
        $this->model = $model;
    }
}
