<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Traits\SearchableTrait;

class Invoice extends BaseModel
{
    use  SearchableTrait, HasFactory;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'invoices';

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
        'invoice_number',
        'invoice_date',
        'due_date',
        'status',
        'note',
        'product_id',
        'customer_id',
        'currency_id',
        'company_id'
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
            'invoices.invoice_number'    => 1,
            'invoices.invoice_date'      => 1,
            'invoices.due_date'          => 1,
            'invoices.status'           => 1
        ]
    ];
    public function payment()
    {
        return $this->hasMany(Payment::class, 'company_id', 'id');
    }
    public function company()
    {
        return $this->belongsTo('App\Models\Company', 'company_id', 'id');
    }
    public function customer()
    {
        return $this->belongsTo('App\Models\Customer', 'company_id', 'id');
    }
}
