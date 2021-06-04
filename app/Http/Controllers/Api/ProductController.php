<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\ProductRequest;
use App\Http\Resources\ProductResource;
use App\Invoicer\Repositories\Contracts\ProductInterface;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class ProductController extends ApiController
{
    protected $productRepository, $load;

    public function __construct(ProductInterface $productInterface)
    {
        $this->productRepository = $productInterface;
        $this->load = [
            'company',
            'category',
            'invoice'
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
            return $this->productRepository->listAll($this->formatFields($select), []);
        } else
            $data = ProductResource::collection($this->productRepository->getAllPaginate($this->load));
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
    public function store(ProductRequest $request)
    {
        $data = $request->all();
        //dd($data);
        $save = $this->productRepository->create($data);

        Log::info($save);

        if (!is_null($save) && $save['error']) {
            return $this->respondNotSaved($save['message']);
        } else {
            return $this->respondWithSuccess('Success !! Product has been created.');
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
        $product = $this->productRepository->getById($uuid);

        if (!$product) {
            return $this->respondNotFound('Product not found.');
        }
        return $this->respondWithData(new ProductResource($product));
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
    public function update(ProductRequest $request, $uuid)
    {
        $save = $this->productRepository->update(array_filter($request->all()), $uuid);

      //  Log::info($save);

        if (!is_null($save) && $save['error']) {
            return $this->respondNotSaved($save['message']);
        } else {
            return $this->respondWithSuccess('Success !! Product has been updated.');
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
        if ($this->productRepository->delete($uuid)) {
            return $this->respondWithSuccess('Success !! Product has been deleted');
        }
        return $this->respondNotFound('Product Category not deleted');
    }
}
