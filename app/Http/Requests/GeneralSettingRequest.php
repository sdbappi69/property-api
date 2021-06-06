<?php
/**
 * Created by PhpStorm.
 * User: Kevin G. Mungai
 * WhatsApp: +254724475357
 * Date: 6/6/2021
 * Time: 7:28 AM
 */

namespace App\Http\Requests;

use Illuminate\Validation\Rule;

class GeneralSettingRequest extends BaseRequest
{

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {

        $rules = [];

        switch ($this->method()) {
            case 'GET':
            case 'DELETE':
            {
                return [];
                break;
            }
            case 'POST':
            {
                $rules = [
                    'business_name'         => 'required',
                    'business_type'         => '',
                    'contact_first_name'    => '',
                    'contact_last_name'     => '',
                    'currency'              => '',
                    'phone'                 => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|digits_between:9,12',
                    'email'                 => 'nullable|email',
                    'country'               => '',
                    'county'                => '',
                    'town'                  => '',
                    'physical_address'      => '',
                    'postal_address'        => '',
                    'postal_code'           => '',
                    'logo'                  => '',
                    'favicon'               => '',
                ];

                break;
            }
            case 'PUT':
            case 'PATCH':
            {
                $rules = [

                ];
                break;
            }
            default:
                break;
        }

        return $rules;

    }
}
