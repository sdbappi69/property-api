<?php
/**
 * Created by PhpStorm.
 * User: bappi
 * Email: sdbappi69@gmail.com
 * WhatsApp: +8801763456950
 * Date: 22/05/2020
 * Time: 13:01
 */

namespace App\Models;

use App\Traits\SearchableTrait;

class TenantType extends BaseModel
{
    use SearchableTrait;
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'tenant_types';

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
        'tenant_type_name',
        'tenant_type_display_name',
        'tenant_type_description'
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
			'tenant_types.tenant_type_name' => 1,
			'tenant_types.tenant_type_display_name' => 1,
			'tenant_types.tenant_type_description' => 1
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
