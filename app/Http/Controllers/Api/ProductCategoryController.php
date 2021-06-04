<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\ProductCategoryRequest;
use App\Http\Resources\ProductCategoryResource;
use App\Invoicer\Repositories\Contracts\ProductCategoryInterface;
use Illuminate\Http\Request;

class ProductCategoryController extends ApiController
{
    protected $productCategoryRepository, $load;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function __construct(ProductCategoryInterface $productCategoryInterface)
    {
        $this->productCategoryRepository = $productCategoryInterface;
        $this->load = [
            'company',
            'product'
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
            return $this->productCategoryRepository->listAll($this->formatFields($select), []);
        } else
            $data = ProductCategoryResource::collection($this->productCategoryRepository->getAllPaginate($this->load));
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
    public function store(ProductCategoryRequest $request)
    {
        $data = $request->all();
        //dd($data);
        $save = $this->productCategoryRepository->create($data);

        //Log::info($save);

        if (!is_null($save) && $save['error']) {
            return $this->respondNotSaved($save['message']);
        } else {
            return $this->respondWithSuccess('Success !! Product Category has been created.');
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
        $product_category = $this->productCategoryRepository->getById($uuid);

        if (!$product_category) {
            return $this->respondNotFound('Product Category not found.');
        }
        return $this->respondWithData(new ProductCategoryResource($product_category));
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
    public function update(ProductCategoryRequest $request, $uuid)
    {
        $save = $this->productCategoryRepository->update(array_filter($request->all()), $uuid);

      //  Log::info($save);

        if (!is_null($save) && $save['error']) {
            return $this->respondNotSaved($save['message']);
        } else {
            return $this->respondWithSuccess('Success !! Product Category has been updated.');
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
        if ($this->productCategoryRepository->delete($uuid)) {
            return $this->respondWithSuccess('Success !! Product Category has been deleted');
        }
        return $this->respondNotFound('Product Category not deleted');
    }
}
