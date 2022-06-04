<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Animal;
use App\Models\Shelter;
use Symfony\Component\HttpFoundation\Response;

class AnalyticsController extends Controller
{
    public function getAllAnimalsCount()
    {
        $count = Animal::all()->count();
        return response()->json(['count' => $count], Response::HTTP_OK);
    }

    public function getAllShelterCount()
    {
        $count = Shelter::all()->count();
        return response()->json(['count' => $count], Response::HTTP_OK);
    }

}
