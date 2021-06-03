<?php

namespace App\Http\Requests;

use Illuminate\Validation\Rule;

class ExpenseRequest extends BaseRequest
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
                        'name'                                  => 'required',
                        'amount'                                => 'required',
                        'note'                                  => '',
                        'date'                                  => 'required',
                        'currency_id'                           => 'required',
                        'expense_categories_id'                 => 'required',
                        'company_id'                            => 'required'
                    ];
                    break;
                }
            case 'PUT':
            case 'PATCH':
                {
                    $rules = [
                        'name'                                  => 'required',
                        'amount'                                => 'required',
                        'note'                                  => '',
                        'date'                                  => 'required',
                        'currency_id'                           => 'required',
                        'expense_categories_id'                 => 'required',
                        'company_id'                            => 'required'
                    ];
                    break;
                }
            default:break;
        }
        return $rules;
    }
}
