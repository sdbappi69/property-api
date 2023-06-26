<?php
/**
 * Created by PhpStorm.
 * User: bappi
 * Email: sdbappi69@gmail.com
 * WhatsApp: +8801763456950
 * Date: 06/05/2020
 * Time: 12:47
 */

namespace App\Models;

use App\Traits\SearchableTrait;
use App\Traits\StatusModelTrait;
use Illuminate\Auth\Authenticatable;
use Illuminate\Auth\Passwords\CanResetPassword;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\Access\Authorizable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;

use Illuminate\Contracts\Auth\Authenticatable as AuthenticatableContract;
use Illuminate\Contracts\Auth\Access\Authorizable as AuthorizableContract;
use Illuminate\Contracts\Auth\CanResetPassword as CanResetPasswordContract;

class Landlord extends BaseModel implements
    AuthenticatableContract,
    AuthorizableContract,
    CanResetPasswordContract

{
    use HasApiTokens, Notifiable, Authenticatable, Authorizable, CanResetPassword, SearchableTrait;
    use HasFactory;
    use StatusModelTrait;

    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'landlords';

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
        'agent_id',
        'first_name',
        'middle_name',
        'last_name',
        'phone',
        'email',
        'registration_date',
        'id_number',
        'country',
        'state',
        'city',
        'postal_address',
        'physical_address',
        'residential_address',

        'password',
        'confirmed',
        'confirmation_code',

        'created_by',
        'updated_by',
        'deleted_by',
        'logo',
        'digital_signature'
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
            'landlords.first_name' => 1,
            'landlords.middle_name' => 1,
            'landlords.last_name' => 1,
            'landlords.id_number' => 1,
            'landlords.email' => 1,
            'landlords.phone' => 1,
            'landlords.residential_address' => 2,
            'landlords.physical_address' => 2,
            'landlords.postal_address' => 2,
        ]
    ];

    protected $hidden = [
        'password', 'confirmation_code'
    ];

    /**
     * @param $registration_date
     */
    /*  public function setRegistrationDateAttribute($registration_date)
      {
          $this->attributes['registration_date'] = date('Y-m-d', strtotime($registration_date));
      }*/

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function getLogoAttribute($value)
    {
        if (is_null($value)) {
            return config('app.url').('/storage/logos/no_logo.png');
        } else {
            return config('app.url').('/storage/logos/' . $value);
        }
    }
    public function getFullNameAttribute()
    {
        return $this->first_name . (!empty($this->middle_name) ?
                " $this->middle_name" : '') . (!empty($this->last_name) ?
                " $this->last_name" : '');
    }

    public function getDigitalSignatureAttribute($value)
    {
        if (is_null($value)) {
            return config('app.url').('/storage/digital_signatures/no_digital_signature.png');
        } else {
            return config('app.url').('/storage/digital_signatures/' . $value);
        }
    }

    public function agent()
    {
        return $this->belongsTo(Agent::class, 'agent_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function properties()
    {
        return $this->hasMany(Property::class, 'landlord_id');
    }

    public function tenants()
    {
        return $this->hasMany(Tenant::class, 'landlord_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasManyThrough
     */
    public function units()
    {
        return $this->hasManyThrough(Unit::class, Property::class);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasManyThrough
     */
    public function leases()
    {
        return $this->hasManyThrough(Lease::class, Property::class)->orderBy('lease_number')
            ->where('terminated_on', null);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasManyThrough
     */
    public function invoices()
    {
        return $this->hasManyThrough(Invoice::class, Property::class);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasManyThrough
     */
    public function payments()
    {
        return $this->hasManyThrough(Payment::class, Property::class);
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasManyThrough
     */
    public function notices()
    {
        return $this->hasManyThrough(VacationNotice::class, Property::class);
    }

    /**
     * @return int
     */
    public function getUnitTotalAttribute()
    {
        return $this->units()->count();
    }

    /**
     * @return int
     */
    public function getPropertyTotalAttribute()
    {
        return $this->properties()->count();
    }
}
