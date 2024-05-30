<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class AccountDetail extends Model
{
    use HasFactory;
    protected $table = 'account_details';
    protected $fillable = [
        'pharmacy_id',
        'bank_name',
        'account_holder_name',
        'account_no',
    ];

    public function pharmacy(){
        return $this->belongsTo(Pharmacy::class ,'pharmacy_id','id');
    }
}
