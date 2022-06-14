<?php
/**
 * Created by PhpStorm.
 * User: bappi
 * Email: sdbappi69@gmail.com
 * WhatsApp: +8801763456950
 * Date: 23/05/2020
 * Time: 19:58
 */

namespace App\Http\Requests;

class LeaseRequest extends BaseRequest
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
                        'agent_id'      => 'nullable|exists:agents,id',
                        'property_id'   => 'required|exists:properties,id',
                        'unit_id'=> '',
                        'lease_type_id' => '',
                        'lease_mode_id'=> '',
                        'start_date'=> '',
                        'end_date'=> '',
                        'due_date'=> '',
                        'rent_amount'            => 'required|numeric|min:0|not_in:0',
                        'rent_deposit'=> '',
                        'billing_frequency'=> '',
                        'next_billing_date'=> '',
                        'due_on'=> '',
                        'agreement_doc'=> '',
                        'skip_starting_period'=> '',
                        'generate_invoice_on'=> '',
                        'next_period_billing'=> '',
                        'tenants'=> 'required'
                    ];

                    break;
                }
            case 'PUT':
            case 'PATCH':
                {
                    $rules = [
                        'lease_type_id'         => 'required||exists:lease_types,id',
                        'rent_amount'           => 'required|numeric|min:0|not_in:0',
                        'payment_frequency_id'  => '',
                        'due_on'                => '',
                        'generate_invoice_on'   => '',
                        'next_period_billing'   => '',
                        'waive_penalty'         => '',
                        'tenants'=> 'required'
                    ];
                    break;
                }
            default:
                break;
        }

        return $rules;

    }
}
