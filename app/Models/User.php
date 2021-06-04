<?php

namespace App\Models;

use App\Traits\SearchableTrait;
use Illuminate\Notifications\Notifiable;

use Illuminate\Auth\Authenticatable;
use Illuminate\Auth\Passwords\CanResetPassword;
use Illuminate\Foundation\Auth\Access\Authorizable;
use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Contracts\Auth\Access\Authorizable as AuthorizableContract;
use Illuminate\Contracts\Auth\CanResetPassword as CanResetPasswordContract;

class User extends BaseModel implements
    AuthenticatableContract,
    AuthorizableContract,
    CanResetPasswordContract

{
    use Notifiable,  Authenticatable, Authorizable, CanResetPassword, SearchableTrait;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'users';

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
        'first_name',
        'middle_name',
        'last_name',
        'phone',
        'email',
        'password',
        'confirmed',
        'confirmation_code',

        'photo',
        'postal_code',
        'postal_address',
        'physical_address',
        'city',
        'country',

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
            'users.first_name' => 1,
            'users.last_name' => 1,
            'users.email' => 1,
        ]
    ];

    protected $hidden = [
        'password', 'remember_token', 'confirmation_code'
    ];
    public function company()
    {
        return $this->hasMany(Company::class);
    }
}
