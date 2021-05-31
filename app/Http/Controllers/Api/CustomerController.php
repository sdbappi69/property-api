<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\CustomerRequest;
use App\Http\Resources\CustomerResource;
use Illuminate\Http\Request;
use App\Invoicer\Repositories\Contracts\CustomerInterface;

class CustomerController extends ApiController
{
    /**
    * @var CustomerInterface
    */
    protected $customerRepository, $load;

    /**
     * CustomerController constructor.
     * @param CustomerInterface $customerInterface
     */
    public function __construct(CustomerInterface $customerInterface)
    {
        $this->customerRepository = $customerInterface;
        $this->load = [];
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if ($select = request()->query('list')) {
            return $this->customerRepository->listAll($this->formatFields($select), []);
        } else
            $data = CustomerResource::collection($this->customerRepository->getAllPaginate($this->load));
        return $this->respondWithData($data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CustomerRequest $request)
    {
        $data = $request->all();
        $save = $this->customerRepository->create($data);

        if (!is_null($save) && $save['error']) {
            return $this->respondNotSaved($save['message']);
        } else {
            return $this->respondWithSuccess('Success !! Custometer has been created.');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($uuid)
    {
        $customer = $this->customerRepository->getById($uuid);

        if (!$customer) {
            return $this->respondNotFound('Customer not found.');
        }
        return $this->respondWithData(new CustomerResource($customer));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(CustomerRequest $request, $uuid)
    {
        $save = $this->customerRepository->update(array_filter($request->all()), $uuid);

        if (!is_null($save) && $save['error']) {
            return $this->respondNotSaved($save['message']);
        } else {
          //  $this->loginProxy->logout();
            return $this->respondWithSuccess('Success !! Customer has been updated.');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($uuid)
    {
        if ($this->customerRepository->delete($uuid)) {
            return $this->respondWithSuccess('Success !! Customer has been deleted');
        }
        return $this->respondNotFound('Customer not deleted');
    }
}
