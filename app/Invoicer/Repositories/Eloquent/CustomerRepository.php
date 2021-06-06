<?php

namespace App\Invoicer\Repositories\Eloquent;

use App\Models\Customer;
use App\Invoicer\Repositories\Contracts\CustomerInterface;
use Illuminate\Support\Facades\DB;

class CustomerRepository extends BaseRepository implements CustomerInterface {

    protected $model;

    /**
     * CustomerRepository constructor.
     * @param Customer $model
     */
    function __construct(Customer $model)
    {
        $this->model = $model;
    }

    /**
     * @param $email
     * @return \Illuminate\Database\Eloquent\Model|\Illuminate\Database\Query\Builder|object|null
     */
    function getViaEmail($email) {

        $member =  DB::table('customers')
            ->where('email', $email)
            ->orderBy('updated_at', 'desc')
            ->first();

        return $this->model->where('email', $email)
            ->orderBy('updated_at', 'desc')
            ->first();
    }

}
