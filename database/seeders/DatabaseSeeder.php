<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    protected $tables = [
        'users'
    ];

    protected $seeders = [
        UsersTableSeeder::class
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
