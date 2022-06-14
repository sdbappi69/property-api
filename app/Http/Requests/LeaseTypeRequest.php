<?php
/**
 * Created by PhpStorm.
 * User: bappi
 * Email: sdbappi69@gmail.com
 * WhatsApp: +8801763456950
 * Date: 22/05/2020
 * Time: 13:29
 */

namespace App\Http\Requests;

use Illuminate\Validation\Rule;

class LeaseTypeRequest extends BaseRequest
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
                        'lease_type_name'          => 'required|unique:lease_types,lease_type_name,NULL,id,deleted_at,NULL',
                        'lease_type_display_name'          => 'required|unique:lease_types,lease_type_display_name,NULL,id,deleted_at,NULL',
                        'lease_type_description' => 'nullable'
                    ];

                    break;
                }
            case 'PUT':
            case 'PATCH':
                {
                    $rules = [
                        'agent_id' => 'exists:agents,id',
                        'lease_type_name' => ['required', Rule::unique('lease_types')->ignore($this->lease_type, 'id')
                            ->where(function ($query) {
                                $query->where('deleted_at', NULL);
                            })],
                        'lease_type_display_name' => ['required', Rule::unique('lease_types')->ignore($this->lease_type, 'id')
                            ->where(function ($query) {
                                $query->where('deleted_at', NULL);
                            })],
                        'lease_type_description' => 'nullable'
                    ];
                    break;
                }
            default:
                break;
        }

        return $rules;

    }
}
