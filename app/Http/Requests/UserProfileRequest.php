<?php
/**
 * Created by PhpStorm.
 * User: SD Bappi
 * WhatsApp: +8801763456950
 * Date: 6/28/2021
 * Time: 8:32 AM
 */

namespace App\Http\Requests;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;

class UserProfileRequest extends BaseRequest
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
                    'first_name' => 'required',
                    'middle_name' => '',
                    'last_name' => '',
                    'user_photo' => '',
                    'photo' => '',
                    'postal_code' => '',
                    'postal_address' => '',
                    'physical_address' => '',
                    'city' => '',
                    'country' => '',
                    'phone' => 'nullable|unique:users,phone,NULL,id,deleted_at,NULL',
                    'email' => 'email|nullable|unique:users,email,NULL,id,deleted_at,NULL',

                    'password' => 'nullable|min:3|confirmed',
                    'password_confirmation' => 'required_with:password'
                ];
                break;
            }
            case 'PUT':
            case 'PATCH':
            {
                $rules = [
                    'first_name'        => 'required',
                    'middle_name'       => '',
                    'last_name'         => '',
                    'photo'             => '',
                    'postal_code'       => '',
                    'postal_address'    => '',
                    'physical_address'  => '',
                    'city'              => '',
                    'country'           => '',
                    'phone' => ['nullable', 'regex:/^([0-9\s\-\+\(\)]*)$/',
                        Rule::unique('users')->ignore($this->user_profile, 'id')
                            ->where(function ($query) {
                                $query->where('deleted_at', NULL);
                            })],
                    'email' => ['required', 'email', Rule::unique('users')->ignore($this->user_profile, 'id')
                        ->where(function ($query) {
                            $query->where('deleted_at', NULL);
                        })],
                    'current_password' => ['nullable', 'required_with:password', function ($attribute, $value, $fail) {
                        if (!Hash::check($value, Auth::user()->password)) {
                            return $fail(__('The current password is incorrect.'));
                        }
                    }],
                    'password'              => 'nullable|min:3|confirmed',
                    'password_confirmation' => 'required_with:password'
                ];
                break;
            }
            default:
                break;
        }

        return $rules;

    }
}
