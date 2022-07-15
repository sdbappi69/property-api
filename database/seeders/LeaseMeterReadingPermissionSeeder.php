<?php

namespace Database\Seeders;

use App\Models\Permission;
use App\Models\Role;
use Illuminate\Database\Seeder;

class LeaseMeterReadingPermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $permissions = [
            [
                'name' => 'create-lease-meter-reading',
                'display_name' => 'CREATE-LEASE-METER-READING',
                'description' => 'CREATE-LEASE-METER-READING',
            ],
            [
                'name' => 'update-lease-meter-reading',
                'display_name' => 'UPDATE-LEASE-METER-READING',
                'description' => 'UPDATE-LEASE-METER-READING',
            ],
            [
                'name' => 'delete-lease-meter-reading',
                'display_name' => 'DELETE-LEASE-METER-READING',
                'description' => 'DELETE-LEASE-METER-READING',
            ]
        ];

        $role = Role::where('name', 'landlord')->firstOrFail();

        foreach ($permissions as $key => $value) {
            $permission = Permission::create($value);
            $role->permissions()->attach([$permission->id]);
        }
        dump($role->toArray());
        $this->command->line('Done');
    }
}
