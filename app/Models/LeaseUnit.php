<?php
/**
 * Created by PhpStorm.
 * User: SD Bappi
 * Email: sdbappi69@gmail.com
 * WhatsApp: +8801763456950
 * Date: 1/2/2021
 * Time: 9:56 AM
 */

namespace App\Models;

use App\Traits\SearchableTrait;
use Illuminate\Database\Eloquent\Model;

class LeaseUnit extends Model
{
    use SearchableTrait;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'lease_units';

    /**
     * Main table primary key
     * @var string
     */
    protected $primaryKey = 'id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'lease_id',
        'unit_id',
        'unit_name'
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
            'lease_units.id' => 2
        ]
    ];
}
