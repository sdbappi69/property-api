<?php
/**
 * Created by PhpStorm.
 * User: SD Bappi
 * WhatsApp: +8801763456950
 * Date: 6/6/2021
 * Time: 8:44 AM
 */

namespace Database\Seeders;

use App\Models\GeneralSetting;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class GeneralSettingSeeder extends Seeder
{
    public function run()
    {
         DB::table('general_settings')->delete();

        GeneralSetting::create([
            'company_name' => 'Property Management Application',
            'company_type' => 'Property Management',
            'email' => "sdbappi69@gmail.com",
            'phone' => "+8801763456950",
            'currency' => 'BDT',
            'physical_address'=> 'Rampura, Dhaka',
            'postal_address'=> 'Rampura, Dhaka, Bangladesh',
            'website_url'=> 'www.planet0088.com',
            'postal_code'=> '1000',
            'date_format' => "d-m-Y",
            'amount_thousand_separator' => ",",
            'amount_decimal_separator' => ".",
            'amount_decimal' => "2",
        ]);
    }

}
