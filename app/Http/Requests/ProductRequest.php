<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ProductRequest extends BaseRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
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
                        'product_name'                   => 'required',
                        'product_code'                   => 'required',
                        'product_price'                  => 'required',
                        'product_description'            => 'required',
                        'product_categories_id'          => 'required'
                    ];
                    break;
                }
            case 'PUT':
            case 'PATCH':
                {
                    $rules = [
                        'product_name'                   => 'required',
                        'product_code'                   => 'required',
                        'product_price'                  => 'required',
                        'product_description'            => 'required',
                        'product_categories_id'          => 'required'
                    ];
                    break;
                }
            default:break;
        }
        return $rules;
    }
}
