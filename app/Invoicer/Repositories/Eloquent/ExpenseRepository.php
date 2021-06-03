<?php

namespace App\Invoicer\Repositories\Eloquent;

use App\Invoicer\Repositories\Contracts\ExpenseInterface;
use App\Models\Expense;

class ExpenseRepository extends BaseRepository implements ExpenseInterface {

    protected $model;

    /**
     * InvoiceRepository constructor.
     * @param Invoice $model
     */
    function __construct(Expense $model)
    {
        $this->model = $model;
    }

}
