<?php

namespace App\Invoicer\Repositories\Eloquent;

use App\Models\ExpenseCategory;
use App\Invoicer\Repositories\Contracts\ExpenseCategoryInterface;

class ExpenseCategoryRepository extends BaseRepository implements ExpenseCategoryInterface {

    protected $model;

    /**
     * ExpenseCategoryRepository constructor.
     * @param ExpenseCategory $model
     */
    function __construct(ExpenseCategory $model)
    {
        $this->model = $model;
    }

}
