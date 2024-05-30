<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Package extends Model
{
    use HasFactory;
    protected $table = 'packages';
    protected $fillable = [
        'title',
        'price',
        'validity',
    ];

    public function pharmacy(){

        return $this->hasOne(Pharmacy::class,'package_id');

    }
}
