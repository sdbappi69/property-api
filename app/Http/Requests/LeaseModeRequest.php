<?php
/**
 * Created by PhpStorm.
 * User: bappi
 * Email: sdbappi69@gmail.com
 * WhatsApp: +8801763456950
 * Date: 22/05/2020
 * Time: 13:34
 */

namespace App\Http\Requests;

class LeaseModeRequest extends BaseRequest
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
                        'lease_mode_name' => '',
                        'lease_mode_display_name' => '',
                        'lease_mode_description' => ''
                    ];

                    break;
                }
            case 'PUT':
            case 'PATCH':
                {
                    $rules = [
                        'agent_id' => 'exists:agents,id',
                        'lease_mode_name' => '',
                        'lease_mode_display_name' => '',
                        'lease_mode_description' => ''
                    ];
                    break;
                }
            default:
                break;
        }

        return $rules;

    }
}
