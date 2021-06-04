<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\CompanyRequest;
use App\Http\Resources\CompanyResource;
use App\Invoicer\Repositories\Contracts\CompanyInterface;
use App\Invoicer\Repositories\Eloquent\CompanyRepository;
use Illuminate\Http\Request;

class CompanyController extends ApiController
{
    protected $companyRepository, $load;

    public function __construct(CompanyInterface $companyInterface)
    {

        $this->companyRepository = $companyInterface;
        $this->load = [
            $this->companyRepository->getAll(['user'])
        ];
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if ($select = request()->query('list')) {
            return $this->companyRepository->listAll($this->formatFields($select), []);
        } else
            $data = CompanyResource::collection($this->companyRepository->getAllPaginate($this->load));
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
    public function store(CompanyRequest $request)
    {
        $data = $request->all();
        $save = $this->companyRepository->create($data);

        if (!is_null($save) && $save['error']) {
            return $this->respondNotSaved($save['message']);
        } else {
            return $this->respondWithSuccess('Success !! Company has been created.');
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
        $company = $this->companyRepository->getById($uuid);

        if (!$company) {
            return $this->respondNotFound('Campony not found.');
        }
        return $this->respondWithData(new CompanyResource($company));
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
    public function update(CompanyRequest $request, $uuid)
    {
        $save = $this->companyRepository->update(array_filter($request->all()), $uuid);

        if (!is_null($save) && $save['error']) {
            return $this->respondNotSaved($save['message']);
        } else {
            return $this->respondWithSuccess('Success !! Company has been updated.');
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
        if ($this->companyRepository->delete($uuid)) {
            return $this->respondWithSuccess('Success !! Company has been deleted');
        }
        return $this->respondNotFound('Company not deleted');
    }
}
