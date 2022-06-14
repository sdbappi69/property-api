<?php
/**
 * Created by PhpStorm.
 * User: bappi
 * Email: sdbappi69@gmail.com
 * Date: 31/12/2019
 * Time: 18:12
 */

namespace App\Http\Requests;

class InstallationRequest extends BaseRequest
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
                        'host'      => '',
                        'username'  => 'required',
                        'password'  => '',
                        'database'  => 'required'
                    ];
                    break;
                }
            case 'PUT':
            case 'PATCH':
                {
                    $rules = [
                        'host'      => '',
                        'username'  => 'required',
                        'password'  => '',
                        'database'  => 'required'
                    ];
                    break;
                }
            default:
                break;
        }
        return $rules;
    }
}