<?php
/**
 * Created by PhpStorm.
 * User: SD Bappi
 * Email: sdbappi69@gmail.com
 * WhatsApp: +8801763456950
 * Date: 12/31/2020
 * Time: 10:19 AM
 */

namespace App\Models;

use App\Traits\SearchableTrait;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

/**
 * @mixin Builder
 */
class Ledger extends Model
{
    use SearchableTrait;

    public $timestamps = false;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'ledgers';

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
        'account_id',
        'journal_id',
        'created_at',
        'amount',
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
            'ledgers.amount' => 2
        ]
    ];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function account()
    {
        return $this->belongsTo(Account::class, 'account_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function journal()
    {
        return $this->belongsTo(Journal::class, 'journal_id');
    }
}
