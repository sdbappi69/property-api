<?php
/**
 * Created by PhpStorm.
 * User: bappi
 * Email: sdbappi69@gmail.com
 * WhatsApp: +8801763456950
 * Date: 13/05/2020
 * Time: 14:44
 */

namespace App\Http\Requests;

class UnitRequest extends BaseRequest
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
                        'agent_id'      => 'nullable',
                        'property_id'   => 'nullable',
                        'unit_name'     => 'required',
                        'rent_amount'   => 'nullable',
                        'unit_floor'    => 'nullable',
                        'unit_status'   => 'nullable',
                        'description'   => 'nullable',
                        'unit_mode'     => 'nullable',
                        'unit_type_id'  => 'required',
                        'bath_rooms'    => 'nullable',
                        'bed_rooms'     => 'nullable',
                        'total_rooms'   => 'nullable',
                        'square_foot'   => 'nullable'
                    ];

                    break;
                }
            case 'PUT':
            case 'PATCH':
                {
                    $rules = [
                        'agent_id'      => 'nullable',
                        'property_id'      => '',
                      //  'property_id'   => 'required|exists:properties,id',
                        'unit_name'     => 'required',
                        'rent_amount'   => 'nullable',
                        'unit_floor'    => 'nullable',
                        'unit_status'   => 'nullable',
                        'description'   => 'nullable',
                        'unit_mode'     => 'nullable',
                        'unit_type_id'  => 'required',
                        'bath_rooms'    => 'nullable',
                        'bed_rooms'     => 'nullable',
                        'total_rooms'   => 'nullable',
                        'square_foot'   => 'nullable'
                    ];
                    break;
                }
            default:
                break;
        }

        return $rules;

    }
}
