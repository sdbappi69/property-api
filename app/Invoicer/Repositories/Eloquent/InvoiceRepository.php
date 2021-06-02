<?php

namespace App\Invoicer\Repositories\Eloquent;

use App\Models\Invoice;
use App\Invoicer\Repositories\Contracts\InvoiceInterface;

class InvoiceRepository extends BaseRepository implements InvoiceInterface {

    protected $model;

    /**
     * InvoiceRepository constructor.
     * @param Invoice $model
     */
    function __construct(Invoice $model)
    {
        $this->model = $model;
    }

}
