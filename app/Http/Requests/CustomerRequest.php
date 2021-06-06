<?php

namespace App\Http\Requests;

use Illuminate\Validation\Rule;

class CustomerRequest extends BaseRequest
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
                        'first_name'            => 'required',
                        'middle_name'           => '',
                        'last_name'             => 'required',
                        'email'                 => 'required',
                        'phone'                 => 'required',
                        'city'                  => '',
                        'country'               => 'required',
                        'company_id'            => 'required',
                    ];
                    break;
                }
            case 'PUT':
            case 'PATCH':
                {
                    $rules = [
                        'first_name'            => 'required',
                        'middle_name'           => '',
                        'last_name'             => 'required',
                        'email'                 => 'required',
                        'phone'                 => 'required',
                        'city'                  => '',
                        'country'               => 'required',
                        'company_id'            => 'required',
                    ];
                    break;
                }
            default:break;
        }
        return $rules;
    }
}
