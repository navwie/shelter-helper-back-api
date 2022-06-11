<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\AnimalRequest;
use App\Models\Animal;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class AnimalController extends Controller
{
    public function index(string $locale, int $id): JsonResponse
    {
        $shelter_id_from_front = $id;
        return response()->json([
            'animals' => Animal::whereHas('shelter', function ($q) use ($shelter_id_from_front) {
                $q->where('shelter_id', $shelter_id_from_front);
            })->get()
        ],
            Response::HTTP_OK
        );
    }

    public function showAnimals(): JsonResponse
    {
        return response()->json([
            'animals' => Animal::all()
        ],
            Response::HTTP_OK
        );
    }


    public function allAnimal(): JsonResponse
    {
        return response()->json([
            'animals' => Animal::where('is_archive', null)->get()
        ],
            Response::HTTP_OK
        );
    }

    public function booked(string $locale, Request $request, int $id): JsonResponse
    {
        $animal = Animal::FindOrFail($id);
        $animal->booked = $request->only('data')['data'];
        $animal->booked_user_id = Auth::id();
        $animal->save();

        return new JsonResponse([
            'booked' => true
        ], Response::HTTP_OK);
    }

    public function unbooked( string $locale, int $id): JsonResponse
    {
        $animal = Animal::FindOrFail($id);
        $animal->booked = null;
        $animal->booked_user_id = null;
        $animal->save();

        return new JsonResponse([
            'unbooked' => true
        ], Response::HTTP_OK);
    }

    public function show(string $locale, $id): JsonResponse
    {
        return response()->json([
            Animal::findOrFail($id)
        ],
            Response::HTTP_OK
        );
    }

    public function update(string $locale, AnimalRequest $request, $id): JsonResponse
    {
        $current = Animal::FindOrFail($id);

        $data = $request->all();

        $data = $request->except('photo');
        $photo = $request->only('photo');
        $current->fill($data)->save();

        if (isset($photo[0])) {
            [$imageName, $imageContent] = explode('\\', $photo[0]);
            $photo[0] = $imageName;
        }

        if (isset($photo[0])) {
            $imageContent = str_replace(
                [
                    'data:image/jpeg;base64,',
                    'data:image/png;base64,',
                    'data:image/jpg;base64,'
                ],
                '',
                $imageContent
            );
            $imageContent = str_replace(' ', '+', $imageContent);
            file_put_contents(storage_path() . '/app/public/images/' . $imageName, base64_decode($imageContent));
        }
        $current->shelter()->associate($data['shelter_id']);
        $current->fill($data)->save();
        $current->fill($photo)->save();


        return new JsonResponse([
            'update' => true
        ], Response::HTTP_OK);
    }

    public function makeAdminArchive(string $locale, int $id): JsonResponse
    {
        $animal = Animal::FindOrFail($id);
        $animal->is_archive = Carbon::now()->format('Y-m-d');
        $animal->save();

        return new JsonResponse([
            'archive' => true
        ], Response::HTTP_OK);
    }

    public function create(string $locale, AnimalRequest $request): JsonResponse
    {
        $data = $request->all();

        if (isset($data['photo'])) {
            [$imageName, $imageContent] = explode('\\', $data['photo']);
            $data['photo'] = $imageName;
        }
        $animal = Animal::create($data);

        if (isset($data['photo'])) {
            $imageContent = str_replace(
                [
                    'data:image/jpeg;base64,',
                    'data:image/png;base64,',
                    'data:image/jpg;base64,'
                ],
                '',
                $imageContent
            );
            $imageContent = str_replace(' ', '+', $imageContent);
            file_put_contents(storage_path() . '/app/public/images/' . $imageName, base64_decode($imageContent));
        }
        $animal->shelter()->associate($data['shelter_id']);
        $animal->save();

        return response()->json(['Ok'], Response::HTTP_OK);
    }
}
