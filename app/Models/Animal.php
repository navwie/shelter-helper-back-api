<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Animal extends Model
{
    use HasFactory;

    private $ID_shelter;
    private $Name;
    private $Age;
    private $Sex;
    private $Img_URL;
    private $Type;
    private $Weight;


    protected $table = 'Animal';
}
