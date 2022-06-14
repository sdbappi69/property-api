<?php
/**
 * Created by PhpStorm.
 * User: SD Bappi
 * Email: sdbappi69@gmail.com
 * WhatsApp: +8801763456950
 * Date: 12/31/2020
 * Time: 10:25 AM
 */

namespace App\Http\Requests;

class LedgerRequest extends BaseRequest
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
                    'agent_id' => 'exists:agents,id'

                ];

                break;
            }
            case 'PUT':
            case 'PATCH':
            {
                $rules = [
                    'agent_id' => 'exists:agents,id'
                ];
                break;
            }
            default:
                break;
        }

        return $rules;

    }
}
