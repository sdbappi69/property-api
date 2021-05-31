<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Traits\SearchableTrait;

class Product_Category extends BaseModel
{
    use  SearchableTrait, HasFactory;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'product__categories';

    /**
     * Main table primary key
     * @var string
     */
    protected $primaryKey = 'id';

    protected $dates = [];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name'
    ];

    /**
     * Searchable rules.
     *
     * @var array
     */
    protected $searchable = [
        /**
         * Columns and their priority in search results.
         * Columns with higher values are more important.
         * Columns with equal values have equal importance.
         *
         * @var array
         */
        'columns' => [
            'product__categories.name' => 1,
        ]
    ];


}
