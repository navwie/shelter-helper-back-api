<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\UserRequest;
use App\Http\Resources\UserResource;
use App\Models\User;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Response;

class UserController extends Controller
{
    public function show($id)
    {
        return response()->json([
            User::with("shelters")->findOrFail($id)
        ],
            Response::HTTP_OK
        );
    }

    public function update(UserRequest $request, $id): JsonResponse
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
