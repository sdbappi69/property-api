<?php
/**
 * Created by PhpStorm.
 * User: bappi
 * Email: sdbappi69@gmail.com
 * WhatsApp: +8801763456950
 * Date: 15/05/2020
 * Time: 22:05
 */

namespace App\Models;

use App\Traits\SearchableTrait;
use App\Traits\StatusModelTrait;

class Utility extends BaseModel
{
    use SearchableTrait;
    use StatusModelTrait;
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'utilities';

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
        'utility_name',
        'utility_display_name',
        'utility_description'
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
            'utilities.id' => 2
        ]
    ];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function units()
    {
        return $this->belongsToMany(Unit::class, 'unit_utility', 'utility_id', 'unit_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function leases()
    {
        return $this->belongsToMany(Lease::class, 'lease_utility', 'utility_id', 'lease_id');
    }
}
