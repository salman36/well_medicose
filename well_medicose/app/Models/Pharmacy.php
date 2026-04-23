<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Pharmacy extends Authenticatable
{
    use HasFactory;
    protected $table = 'pharmacies';
    protected $fillable = [
        'branch_name',
        'email',
        'password',
        'branch_no',
        'address',
        'license',
        'phone_no',
        'image',
        'subscribe',
        'opening_time',
        'closing_time',
        'is_active',
        'latitude',
        'longitude',
        'status',

    ];
     /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];
    public function product(){

        return $this->hasMany(Product::class, 'pharmacy_id');

     }

    public function accountDetail(){
        return $this->hasOne(AccountDetail::class, 'pharmacy_id');
    }
    public function package(){
        return $this->belongsTo(Package::class);
    }

    public function orders(){

        return $this->hasMany(Order::class, 'pharmacy_id');

    }
    public function notification()
    {
        return $this->hasMany(Notification::class, 'pharmacy_id');
    }


}
