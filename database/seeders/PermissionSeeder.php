<?php

namespace Database\Seeders;

use App\Models\Permission;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class PermissionSeeder extends Seeder
{

    public function run()
    {
        DB::table('permissions')->delete();

        $permissions = [
            [
                'name'           => 'test1',
                'display_name'   => 'test1',
                'description'    => 'test1'
            ],
            [
                'name'           => 'test2',
                'display_name'   => 'test2',
                'description'    => 'test2'
            ],
            [
                'name'           => 'test3',
                'display_name'   => 'test3',
                'description'    => 'test3'
            ]
        ];

        foreach ($permissions as $key => $value){
            Permission::create($value);
        }
    }

}
