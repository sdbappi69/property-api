<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Traits\SearchableTrait;

class Quotation extends BaseModel
{
    use  SearchableTrait, HasFactory;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'quotations';

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
        'quotation_number',
        'date',
        'note',
        'product_id',
        'customer_id',
        'currency_id',

        'created_by',
        'updated_by',
        'deleted_by'
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
            'quotations.quotation_number'       => 1,
            'quotations.date'                   => 1
        ]
    ];


}
