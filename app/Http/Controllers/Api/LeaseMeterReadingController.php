<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\LeaseMeterReadingRequest;
use App\Models\LeaseMeterReading;
use Illuminate\Http\Request;

class LeaseMeterReadingController extends ApiController
{
    //
    public function store(LeaseMeterReadingRequest $request)
    {
        if (!$this->monthLessOrEqualCurrent($request->month)) {
            return $this->respondNotSaved('Month should be less or equal current month not more than that');
        }
        $data = $request->all();
        $data += ['created_by' => auth()->user()->id];
        if ($this->checkDataAlreadyExistsOrNot($request)) {
            return $this->respondNotSaved('Data already exists');
        }
        LeaseMeterReading::create($data);
        return $this->respondWithSuccess('Success !! Lease Meter Reading Request has been created.');
    }

    public function update(LeaseMeterReadingRequest $request)
    {
        if (!$this->monthLessOrEqualCurrent($request->month)) {
            return $this->respondNotSaved('Month should be less or equal current month not more than that');
        }
        $data = $request->all();
        if ($this->checkDataAlreadyExistsOrNot($request)) {
            return $this->respondNotSaved('Data already exists');
        }
        $lease = LeaseMeterReading::orderBy('created_at', 'desc')->first();
        if (!$lease) {
            return $this->respondNotSaved('No Lease Meter Reading data found');
        }
        if ($lease->lease_id != $data['lease_id'] or $lease->id != $data['meter_reading_id']) {
            return $this->respondNotSaved('No Lease Meter Reading data found. Previous data modification forbidden');
        }
        $data += ['updated_by' => auth()->user()->id];

        $lease->update($data);
        return $this->respondWithSuccess('Success !! Lease Meter Reading Request has been updated.');
    }

    public function destroy(Request $request)
    {
        $data = $request->only('lease_id', 'meter_reading_id');
        $data += ['deleted_by' => auth()->user()->id];
        $lease = LeaseMeterReading::orderBy('created_at', 'desc')->first();
        if (!$lease) {
            return $this->respondNotSaved('No Lease Meter Reading data found');
        }
        if ($lease->lease_id != $data['lease_id'] or $lease->id != $data['meter_reading_id']) {
            return $this->respondNotSaved('No Lease Meter Reading data found. Previous data modification forbidden');
        }
        $lease->update(['deleted_by' => $data['deleted_by']]);
        $lease->delete();
        return $this->respondWithSuccess('Success !! Lease Meter Reading Request has been deleted.');
    }

    private function checkDataAlreadyExistsOrNot($request): bool
    {
        return LeaseMeterReading::where($request->only('lease_id', 'month', 'year'))->exists();
    }

    private function monthLessOrEqualCurrent($month)
    {
        return ((int)$month <= (int)date('m'));
    }
}
