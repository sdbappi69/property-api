<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Traits\SearchableTrait;

class Product extends BaseModel
{
    use  SearchableTrait, HasFactory;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'products';

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
        'product_name',
        'product_code',
        'product_price',
        'product_description',
        'discount',
        'product_categories_id',
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
            'products.product_name' => 1,
            'products.product_code' => 1
        ]
    ];
    public function company()
    {
        return $this->belongsTo('App\Models\Company', 'company_id', 'id');
    }
    public function category()
    {
        return $this->belongsTo('App\Models\ProductCategory', 'product_categoies_id', 'id');
    }
    public function invoice()
    {
        return $this->belongsTo(Invoice::class);
    }
}
