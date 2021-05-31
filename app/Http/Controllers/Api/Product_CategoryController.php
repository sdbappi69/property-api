<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Product_CategoryRequest;
use App\Http\Resources\Product_CategoryResource;
use App\Invoicer\Repositories\Contracts\Product_CategoryInterface;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class Product_CategoryController extends ApiController
{
    protected $product_categoryRepository, $load;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function __construct(Product_CategoryInterface $product_categoryInterface)
    {
        $this->product_categoryRepository = $product_categoryInterface;
        $this->load = [];
    }

    public function index(Request $request)
    {
        if ($select = request()->query('list')) {
            return $this->product_categoryRepository->listAll($this->formatFields($select), []);
        } else
            $data = Product_CategoryResource::collection($this->product_categoryRepository->getAllPaginate($this->load));
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
    public function store(Product_CategoryRequest $request)
    {
        $data = $request->all();
        //dd($data);
        $save = $this->product_categoryRepository->create($data);

        //Log::info($save);

        if (!is_null($save) && $save['error']) {
            return $this->respondNotSaved($save['message']);
        } else {
            return $this->respondWithSuccess('Success !! Product_Category has been created.');
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
        $product_category = $this->product_categoryRepository->getById($uuid);

        if (!$product_category) {
            return $this->respondNotFound('Product_Category not found.');
        }
        return $this->respondWithData(new Product_CategoryResource($product_category));
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
    public function update(Product_CategoryRequest $request, $uuid)
    {
        $save = $this->product_categoryRepository->update(array_filter($request->all()), $uuid);

        Log::info($save);

        if (!is_null($save) && $save['error']) {
            return $this->respondNotSaved($save['message']);
        } else {
            return $this->respondWithSuccess('Success !! Product_Category has been updated.');
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
        if ($this->product_categoryRepository->delete($uuid)) {
            return $this->respondWithSuccess('Success !! Product_Category has been deleted');
        }
        return $this->respondNotFound('Product_Category not deleted');
    }
}
