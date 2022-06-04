<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Announcement extends Model
{
    use HasFactory;

    protected $fillable = [
        'topic',
        'description',
        'shelter_id',
    ];

    public function shelters(): belongsTo
    {
        return $this->belongsTo(Shelter::class, 'shelter_id');
    }
}
