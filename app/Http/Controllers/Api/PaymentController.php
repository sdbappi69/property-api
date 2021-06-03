<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\PaymentRequest;
use App\Http\Resources\PaymentResource;
use App\Invoicer\Repositories\Contracts\PaymentInterface;
use Illuminate\Http\Request;

class PaymentController extends ApiController
{
    protected $paymentRepository, $load;

    public function __construct(PaymentInterface $paymentInterface)
    {
        $this->paymentRepository = $paymentInterface;
        $this->load = [];
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if ($select = request()->query('list')) {
            return $this->paymentRepository->listAll($this->formatFields($select), []);
        } else
            $data = PaymentResource::collection($this->paymentRepository->getAllPaginate($this->load));
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
    public function store(PaymentRequest $request)
    {
        $data = $request->all();
        $save = $this->paymentRepository->create($data);

        if (!is_null($save) && $save['error']) {
            return $this->respondNotSaved($save['message']);
        } else {
            return $this->respondWithSuccess('Success !! Payment has been created.');
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
        $payment = $this->paymentRepository->getById($uuid);

        if (!$payment) {
            return $this->respondNotFound('Payment not found.');
        }
        return $this->respondWithData(new PaymentResource($payment));
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
    public function update(PaymentRequest $request, $uuid)
    {
        $save = $this->paymentRepository->update(array_filter($request->all()), $uuid);

        if (!is_null($save) && $save['error']) {
            return $this->respondNotSaved($save['message']);
        } else {
            return $this->respondWithSuccess('Success !! Payment has been updated.');
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
        if ($this->paymentRepository->delete($uuid)) {
            return $this->respondWithSuccess('Success !! Payment has been deleted');
        }
        return $this->respondNotFound('Payment not deleted');
    }
}
