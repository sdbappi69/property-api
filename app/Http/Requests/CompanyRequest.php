<?php

namespace App\Http\Requests;

use Illuminate\Validation\Rule;

class CompanyRequest extends BaseRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $rules = [];

        switch($this->method())
        {
            case 'GET':
            case 'DELETE':
                {
                    return [];
                    break;
                }
            case 'POST':
                {
                    $rules = [
                        'name'                      => 'required',
                        'logo'                      => '',
                        'phone'                     => 'required',
                        'postal_code'               => '',
                        'postal_address'            => '',
                        'physical_address'          => '',
                        'city'                      => 'required',
                        'country'                   => 'required',
                        'start_date'                => 'required',
                        'user_id'                   => 'required',
                        'currency_id'               => 'required',
                        'email'                     => 'required',
                    ];

                    break;
                }
            case 'PUT':
            case 'PATCH':
                {
                    $rules = [
                        'name'                      => 'required',
                        'logo'                      => '',
                        'phone'                     => 'required',
                        'postal_code'               => '',
                        'postal_address'            => '',
                        'physical_address'          => '',
                        'city'                      => 'required',
                        'country'                   => 'required',
                        'start_date'                => 'required',
                        'user_id'                   => 'required',
                        'currency_id'               => 'required',
                        'email'                     => 'required'
                    ];
                    break;
                }
            default:break;
        }
        return $rules;
    }
}
