<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\ShelterRequest;
use App\Models\Animal;
use App\Models\Shelter;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Symfony\Component\HttpFoundation\Response;


class ShelterController extends Controller
{
    public function index()
    {
        return response()->json([
            'shelters' => Shelter::all()
        ],
            Response::HTTP_OK
        );
    }

    public function create(string $locale, ShelterRequest $request): JsonResponse
    {
        $shelterData = $request->except('user_id');

        if (isset($shelterData['photo'])) {
            [$imageName, $imageContent] = explode('\\', $shelterData['photo']);
            $shelterData['photo'] = $imageName;
        }
        $shelter = Shelter::create($shelterData);
        $shelter->users()->attach($request->only('user_id'));


        if (isset($shelterData['photo'])) {
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
        $shelter->save();


        return response()->json([
            'created' => true,
            'shelter_id' => $shelter->id,
        ], Response::HTTP_OK);
    }


    public function show(string $locale, $id)
    {
        return response()->json([
            Shelter::with("announcements")->findOrFail($id)
        ],
            Response::HTTP_OK
        );
    }


    public function update(string $locale, ShelterRequest $request, $id): JsonResponse
    {
        $current = Shelter::findOrFail($id);

        $data = $request->all();
        $current->fill($data)->save();
        return new JsonResponse([
            'updated' => true
        ], Response::HTTP_OK);
    }

}
