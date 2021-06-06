<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    protected $tables = [
        'users',
        'currencies',
        'roles',
        'permissions'
    ];

    protected $seeders = [
        PermissionSeeder::class,
        RoleSeeder::class,
        UsersTableSeeder::class,
        CurrencySeeder::class
    ];
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
       // $this->cleanDatabase();

        foreach ($this->seeders as $seedClass) {
            $this->call($seedClass);
        }
    }

    /**
     * Clean out the database for a new seed generation
     */
    private function cleanDatabase()
    {
        foreach ($this->tables as $table) {
            DB::statement('TRUNCATE TABLE ' . $table . ' CASCADE;');
        }
    }
}
