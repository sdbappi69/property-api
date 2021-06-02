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
                        'productName'                   => 'required',
                        'productCode'                   => 'required',
                        'productPrice'                  => 'required',
                        'productDescription'            => 'required',
                        'product_categoriesId'          => 'required'
                    ];
                    break;
                }
            case 'PUT':
            case 'PATCH':
                {
                    $rules = [
                        'productName'                   => 'required',
                        'productCode'                   => 'required',
                        'productPrice'                  => 'required',
                        'productDescription'            => 'required',
                        'product_categoriesId'          => 'required'
                    ];
                    break;
                }
            default:break;
        }
        return $rules;
    }
}
