<?php

use App\Http\Controllers\Api\AnalyticsController;
use App\Http\Controllers\Api\AnimalController;
use App\Http\Controllers\Api\AnnouncementController;
use App\Http\Controllers\Api\ShelterController;
use App\Http\Controllers\Api\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
Route::group(['middleware' => ['cors', 'locale']], function () {
    Route::post('/register', [AuthController::class, 'register']);
    Route::post('/login', [AuthController::class, 'login'])->name('login');
    Route::post('/logout', [AuthController::class, 'logout'])->middleware('auth:api');

    Route::get('/user/{id}', [UserController::class, 'show']);
    Route::put('/user/{id}', [UserController::class, 'update']);

    Route::post('/shelter', [ShelterController::class, 'create'])->middleware('auth:api');
    Route::put('/shelter/{id}', [ShelterController::class, 'update'])->middleware('auth:api');
    Route::get('/shelter/{id}', [ShelterController::class, 'show']);
    Route::get('/shelter', [ShelterController::class, 'index']);

    Route::put('/animal/archive/{id}', [AnimalController::class, 'makeAdminArchive'])->middleware('auth:api');
    Route::put('/announcements/done/{id}', [AnnouncementController::class, 'makeAnnouncementDone'])->middleware('auth:api');
    Route::get('/animalOne/{id}', [AnimalController::class, 'show']);
    Route::get('/animal/{id}', [AnimalController::class, 'index']);
    Route::put('/animal/unbooked/{id}', [AnimalController::class, 'unbooked']);
    Route::put('/animal/booked/{id}', [AnimalController::class, 'booked'])->middleware('auth:api');
    Route::get('/animal', [AnimalController::class, 'allAnimal']);
    Route::get('/animals/all', [AnimalController::class, 'showAnimals']);
    Route::put('/animal/{id}', [AnimalController::class, 'update'])->middleware('auth:api');
    Route::post('/animal', [AnimalController::class, 'create'])->middleware('auth:api');

    Route::post('/announcements', [AnnouncementController::class, 'create'])->middleware('auth:api');
    Route::get('/announcements', [AnnouncementController::class, 'index']);
    Route::get('/announcements/all', [AnnouncementController::class, 'show']);


    Route::group(['prefix' => 'analytics'], function () {
        Route::get('/allAnimalsCount', [AnalyticsController::class, 'getAllAnimalsCount']);
        Route::get('/allShelterCount', [AnalyticsController::class, 'getAllShelterCount']);
    });

});


