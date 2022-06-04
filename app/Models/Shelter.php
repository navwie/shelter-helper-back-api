<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Shelter extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'address',
        'phone',
        'email',
        'city',
        'photo'
    ];

    public function users(): BelongsToMany
    {
        return $this->belongsToMany(User::class, 'users_shelters');
    }

    protected $table = 'shelters';

    public function animals(): HasMany
    {
        return $this->hasMany(Animal::class, 'shelter_id');
    }

    public function announcements(): HasMany
    {
        return $this->hasMany(Announcement::class, 'shelter_id');
    }
}
