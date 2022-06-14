<?php
/**
 * Created by PhpStorm.
 * User: bappi
 * Email: sdbappi69@gmail.com
 * WhatsApp: +8801763456950
 * Date: 22/05/2020
 * Time: 12:48
 */

namespace App\Models;

use App\Traits\SearchableTrait;

class UnitType extends BaseModel
{
    use SearchableTrait;
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'unit_types';

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
        'agent_id',
        'unit_type_name',
        'unit_type_display_name',
        'unit_type_description'
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
            'unit_types.unit_type_name' => 1,
            'unit_types.unit_type_display_name' => 1
        ]
    ];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function agent()
    {
        return $this->belongsTo(Agent::class, 'agent_id');
    }
}
