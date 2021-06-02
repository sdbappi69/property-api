<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\QuotationRequest;
use App\Http\Resources\QuotationResource;
use App\Invoicer\Repositories\Contracts\QuotationInterface;
use Illuminate\Http\Request;

class QuotationController extends ApiController
{
    protected $quotationRepository, $load;

    public function __construct(QuotationInterface $quotationInterface)
    {
        $this->quotationRepository = $quotationInterface;
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
            return $this->quotationRepository->listAll($this->formatFields($select), []);
        } else
            $data = QuotationResource::collection($this->quotationRepository->getAllPaginate($this->load));
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
    public function store(QuotationRequest $request)
    {
        $data = $request->all();
        $save = $this->quotationRepository->create($data);

        if (!is_null($save) && $save['error']) {
            return $this->respondNotSaved($save['message']);
        } else {
            return $this->respondWithSuccess('Success !! Quotation has been created.');
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
        $quotation = $this->quotationRepository->getById($uuid);

        if (!$quotation) {
            return $this->respondNotFound('Quotation not found.');
        }
        return $this->respondWithData(new QuotationResource($quotation));
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
    public function update(QuotationRequest $request, $uuid)
    {
        $save = $this->quotationRepository->update(array_filter($request->all()), $uuid);

        if (!is_null($save) && $save['error']) {
            return $this->respondNotSaved($save['message']);
        } else {
            return $this->respondWithSuccess('Success !! Quotation has been updated.');
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
        if ($this->quotationRepository->delete($uuid)) {
            return $this->respondWithSuccess('Success !! Quotation has been deleted');
        }
        return $this->respondNotFound('Quotation not deleted');
    }
}
