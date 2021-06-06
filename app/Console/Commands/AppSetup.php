<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class AppSetup extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:set';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Migrate and seed all tables..';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     */
    public function handle()
    {
        /**--------------- running migrations - drop all tables and migrate afresh -----------------**/
        $this->call('migrate:fresh', [
            '--force' => 'force',
        ]);

        /**--------------- running seeders -----------------**/
          $this->call('db:seed', [
              '--force' => 'force',
          ]);

        /**--------------- setup passport -----------------**/
        $this->call('passport:keys', [
            '--force' => true,
            '--length' => '4096',
        ]);

        /**--------------- setup admin client passport -----------------**/
        $this->call('passport:client', [
            '--password' => true,
            '--name' => config('app.name') . ' Users Client',
            '--provider' => 'users',
        ]);

     /*   $this->call('passport:client', [
            '--password' => false,
            '--name' => config('app.name') . ' xxx xxx',
            '--provider' => 'users',
        ]);*/

        /**--------------- setup customer client passport -----------------**/
        $this->call('passport:client', [
            '--password' => true,
            '--name' => config('app.name') . ' Customer Client',
            '--provider' => 'customers',
        ]);
    }
}
