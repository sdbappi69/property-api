<?php
/**
 * Created by PhpStorm.
 * User: bappi
 * Email: sdbappi69@gmail.com
 * WhatsApp: +8801763456950
 * Date: 13/05/2020
 * Time: 15:03
 */

namespace App\Http\Requests;

use Illuminate\Validation\Rule;

class PropertyTypeRequest extends BaseRequest
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
                        'name'          => 'required|unique:property_types,name,NULL,id,deleted_at,NULL',
                        'display_name'  => 'required|unique:property_types,display_name,NULL,id,deleted_at,NULL',
                        'description'   => 'nullable'
                    ];
                    break;
                }
            case 'PUT':
            case 'PATCH':
                {
                    $rules = [
                        'name' => ['required', Rule::unique('property_types')->ignore($this->property_type, 'id')
                            ->where(function ($query) {
                                $query->where('deleted_at', NULL);
                            })],
                        'display_name' => ['required', Rule::unique('property_types')->ignore($this->property_type, 'id')
                            ->where(function ($query) {
                                $query->where('deleted_at', NULL);
                            })],
                        'description'   => 'nullable'
                    ];
                    break;
                }
            default:
                break;
        }

        return $rules;

    }
}
