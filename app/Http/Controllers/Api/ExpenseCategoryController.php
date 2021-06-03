<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\ExpenseCategoryRequest;
use App\Http\Resources\ExpenseCategoryResource;
use App\Invoicer\Repositories\Contracts\ExpenseCategoryInterface;
use Illuminate\Http\Request;

class ExpenseCategoryController extends ApiController
{
    /**
    * @var ExpenseCategoryInterface
    */
    protected $expenseCategoryRepository, $load;

    /**
     * @param ExpenseCategoryInterface $expenseCategoryInterface
     */
    public function __construct(ExpenseCategoryInterface $expenseCategoryInterface)
    {
        $this->expenseCategoryRepository = $expenseCategoryInterface;
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
            return $this->expenseCategoryRepository->listAll($this->formatFields($select), []);
        } else
            $data = ExpenseCategoryResource::collection($this->expenseCategoryRepository->getAllPaginate($this->load));
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
    public function store(ExpenseCategoryRequest $request)
    {
        $data = $request->all();
        $save = $this->expenseCategoryRepository->create($data);

        if (!is_null($save) && $save['error']) {
            return $this->respondNotSaved($save['message']);
        } else {
            return $this->respondWithSuccess('Success !! Expense Category has been created.');
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
        $expense = $this->expenseCategoryRepository->getById($uuid);

        if (!$expense) {
            return $this->respondNotFound('Expense Category not found.');
        }
        return $this->respondWithData(new ExpenseCategoryResource($expense));
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
    public function update(ExpenseCategoryRequest $request, $uuid)
    {
        $save = $this->expenseCategoryRepository->update(array_filter($request->all()), $uuid);

        if (!is_null($save) && $save['error']) {
            return $this->respondNotSaved($save['message']);
        } else {
            return $this->respondWithSuccess('Success !! Expense category has been updated.');
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
        if ($this->expenseCategoryRepository->delete($uuid)) {
            return $this->respondWithSuccess('Success !! Expense category has been deleted');
        }
        return $this->respondNotFound('Expense category not deleted');
    }
}
