<?php
/**
 * Created by PhpStorm.
 * User: Kevin G. Mungai
 * WhatsApp: +254724475357
 * Date: 5/28/2021
 * Time: 8:26 AM
 */

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class InvoicerServiceProvider extends ServiceProvider
{

    /**
     * System repositories
     * @var array
     */
    protected $repositories = [
        'User',
        'Customer',
        'Product_Category',
        'Product'
    ];

    /**
     *  Loops through all repositories and binds them with their Eloquent implementation
     */
    public function register()
    {
        array_walk($this->repositories, function ($repository) {
            $this->app->bind(
                'App\Invoicer\Repositories\Contracts\\' . $repository . 'Interface',
                'App\Invoicer\Repositories\Eloquent\\' . $repository . 'Repository'
            );
        });

    }
}
