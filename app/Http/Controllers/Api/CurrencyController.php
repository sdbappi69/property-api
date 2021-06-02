<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\Api\CurrencyResource;
use App\Invoicer\Repositories\Contracts\CurrencyInterface;
use Illuminate\Http\Request;
use App\Models\Currency;
use Illuminate\Support\Facades\DB;

class CurrencyController extends ApiController
{
    /**
    * @var CurrencyInterface
    */
    protected $currencyRepository, $load;

    /**
     * CustomerController constructor.
     * @param CurrencyInterface currencyInterface
     */
    public function __construct(CurrencyInterface $currencyInterface)
    {
        $this->currencyRepository = $currencyInterface;
        $this->load = [];
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
         $currency = DB::table('currencies')->select('id', 'country', 'currency', 'code', 'symbol')->get();
         return response()->json($currency);
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
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $currency = DB::table('currencies')->select('id', 'country', 'currency', 'code', 'symbol')->find($id);
        return response()->json($currency);
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
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
