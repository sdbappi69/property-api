<?php

namespace App\Http\Requests;

use Illuminate\Validation\Rule;

class QuotationRequest extends BaseRequest
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
                        'quotation_number'              => 'required',
                        'date'                          => 'required',
                        'note'                          => '',
                        'product_id'                    => 'required',
                        'customer_id'                   => 'required',
                        'currency_id'                   => 'required'
                    ];
                    break;
                }
            case 'PUT':
            case 'PATCH':
                {
                    $rules = [
                        'quotation_number'              => 'required',
                        'date'                          => 'required',
                        'note'                          => '',
                        'product_id'                    => 'required',
                        'customer_id'                   => 'required',
                        'currency_id'                   => 'required'
                    ];
                    break;
                }
            default:break;
        }
        return $rules;
    }
}
