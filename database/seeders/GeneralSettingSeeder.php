<?php
/**
 * Created by PhpStorm.
 * User: Kevin G. Mungai
 * WhatsApp: +254724475357
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
        ]);
    }

}
