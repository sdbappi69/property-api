<?php

namespace App\Models;

use App\Traits\SearchableTrait;
use Illuminate\Notifications\Notifiable;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Company extends BaseModel
{
    use Notifiable, SearchableTrait, HasFactory;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'companies';

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
        'name',
        'phone',
        'email',
        'logo',
        'city',
        'country',
        'postal_code',
        'postal_address',
        'physical_address',
        'user_id',
        'currency_id',
        'start_date',

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
            'companies.name'    => 1,
            'companies.user_id'       => 1
        ]
    ];

    public function customer()
    {
        return $this->hasMany('App\Models\Customer', 'company_id', 'id');
    }
    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function expense()
    {
        return $this->hasMany('App\Models\Expense', 'company_id', 'id');
    }
    public function expenceCategory()
    {
        return $this->hasMany('App\Models\ExpenseCategory', 'company_id', 'id');
    }
    public function invoice()
    {
        return $this->hasMany('App\Models\Invoice', 'company_id', 'id');
    }
    public function payment()
    {
        return $this->hasMany('App\Models\Payment', 'company_id', 'id');
    }
    public function product()
    {
        return $this->hasMany('App\Models\Product', 'company_id', 'id');
    }
    public function productCategory()
    {
        return $this->hasMany('App\Models\ProductCategory', 'company_id', 'id');
    }
    public function quotaion()
    {
        return $this->hasMany('App\Models\Quotation', 'company_id', 'id');
    }
}
