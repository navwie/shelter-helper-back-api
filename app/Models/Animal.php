<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Animal extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'birthday',
        'gender',
        'photo',
        'type',
        'weight',
        'shelter_id',
        'sterilized',
        'is_archive',
        'description'
    ];

    public function shelter(): belongsTo
    {
        return $this->belongsTo(Shelter::class, 'shelter_id');
    }
}
