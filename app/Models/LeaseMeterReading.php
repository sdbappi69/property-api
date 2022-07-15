<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LeaseMeterReading extends BaseModel
{
    use HasFactory;

    protected $table = 'lease_meter_readings';

    protected $primaryKey = 'id';

    protected $guarded = ['id', 'created_at', 'updated_at'];

    protected $hidden = ['created_by', 'updated_by','deleted_by','deleted_at'];

    public function created_by_details()
    {
        return $this->belongsTo(Landlord::class, 'created_by', 'id');
    }

    public function updated_by_details()
    {
        return $this->belongsTo(Landlord::class, 'updated_by', 'id');
    }

    public function deleted_by_details()
    {
        return $this->belongsTo(Landlord::class, 'deleted_by', 'id');
    }
}
