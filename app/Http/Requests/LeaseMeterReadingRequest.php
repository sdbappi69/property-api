<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;

class LeaseMeterReadingRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $rules = [
            'month' => 'required|in:01,02,03,04,05,06,07,08,09,10,11,12',
            'year' => 'required|digits:4|integer|min:1990|max:' . date('Y'),
            'lease_id' => 'required|string|exists:leases,id',
            'reading' => 'required|integer|min:1',
            'meter_reading_id' => [
                'nullable',
                'string',
                Rule::exists('lease_meter_readings', 'id')->where(function ($query) {
                    return $query->where('lease_id', $this->lease_id);
                })
            ]
        ];

        return $rules;
    }
}
