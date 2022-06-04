<?php

namespace App\Models;

use Illuminate\Auth\Authenticatable as AuthenticableTrait;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Contracts\Auth\Authenticatable;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Laravel\Passport\HasApiTokens;

class User extends Model implements Authenticatable
{
    use HasApiTokens;
    use HasFactory;
    use AuthenticableTrait;

    protected $fillable = [
        'name',
        'surname',
        'email',
        'phone',
        'password',
    ];

    //false - user

    protected $attributes = [
        'role' => 'false',
    ];

    protected $hidden = [
        'password',
    ];

    public function shelters(): BelongsToMany
    {
        return $this->belongsToMany(Shelter::class, 'users_shelters');
    }
}

