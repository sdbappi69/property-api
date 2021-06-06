<?php

namespace App\Invoicer\Repositories\Eloquent;

use App\Invoicer\Repositories\Contracts\PaymentInterface;
use App\Models\Payment;

class PaymentRepository extends BaseRepository implements PaymentInterface {

    protected $model;

    /**
     * CustomerRepository constructor.
     * @param Customer $model
     */
    function __construct(Payment $model)
    {
        $this->model = $model;
    }

}
