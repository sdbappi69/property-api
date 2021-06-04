<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\ExpenseRequest;
use App\Http\Requests\InvoiceRequest;
use App\Http\Resources\ExpenseResource;
use App\Invoicer\Repositories\Contracts\ExpenseInterface;
use Illuminate\Http\Request;

class ExpenseController extends ApiController
{
    protected $expenseRepository, $load;

    public function __construct(ExpenseInterface $expenseInterface)
    {
        $this->expenseRepository = $expenseInterface;
        $this->load = [
            'expenseCategory',
            'company'
        ];
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if ($select = request()->query('list')) {
            return $this->expenseRepository->listAll($this->formatFields($select), []);
        } else
            $data = ExpenseResource::collection($this->expenseRepository->getAllPaginate($this->load));
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
    public function store(ExpenseRequest $request)
    {
        $data = $request->all();
        //dd($data);
        $save = $this->expenseRepository->create($data);

        if (!is_null($save) && $save['error']) {
            return $this->respondNotSaved($save['message']);
        } else {
            return $this->respondWithSuccess('Success !! Expense has been created.');
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
        $expense = $this->expenseRepository->getById($uuid);

        if (!$expense) {
            return $this->respondNotFound('Expense not found.');
        }
        return $this->respondWithData(new ExpenseResource($expense));
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
    public function update(InvoiceRequest $request, $uuid)
    {
        $save = $this->expenseRepository->update(array_filter($request->all()), $uuid);

        if (!is_null($save) && $save['error']) {
            return $this->respondNotSaved($save['message']);
        } else {
            return $this->respondWithSuccess('Success !! Expense has been updated.');
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
        if ($this->expenseRepository->delete($uuid)) {
            return $this->respondWithSuccess('Success !! Expense has been deleted');
        }
        return $this->respondNotFound('Expense not deleted');
    }
}
