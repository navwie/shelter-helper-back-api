<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\UpdateUserRequest;
use App\Http\Requests\Api\UserRequest;
use App\Http\Resources\UserResource;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\App;

class UserController extends Controller
{
    public function show(string $locale, $id)
    {
        return response()->json([
            User::with("shelters")->findOrFail($id)
        ],
            Response::HTTP_OK
        );
    }

    public function update(string $locale, UpdateUserRequest $request, $id): JsonResponse
    {
        $current = User::FindOrFail($id);

        $data = $request->only('name', 'surname', 'email', 'phone');
        $password = $request->only(['password' => bcrypt($request->password)]);
        $current->fill($data)->save();
        $current->fill($password)->save();
        return new JsonResponse([
            'updated' => true
        ], Response::HTTP_OK);
    }
}
