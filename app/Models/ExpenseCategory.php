<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Traits\SearchableTrait;

class ExpenseCategory extends BaseModel
{
    use  SearchableTrait, HasFactory;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'expense_categories';

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
        'description',
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
            'expense_categories.name' => 1,
        ]
    ];
    public function expense()
    {
        return $this->hasMany('App\Models\Expense', 'expense_categories_id', 'id');
    }
    public function company()
    {
        return $this->belongsTo('App\Models\Company', 'company_id', 'id');
    }
}
