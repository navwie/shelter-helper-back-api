<?php

namespace App\Http\Controllers\Api;

use App\Constants\UserRoles;
use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Auth\RegisterFormRequest;
use App\Models\Shelter;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class AuthController extends Controller
{
    /**
     * Handle the incoming request.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function register(RegisterFormRequest $request)
    {
        $user = User::create(array_merge(
            $request->only('name', 'surname', 'email', 'phone'),
            ['password' => bcrypt($request->password)],
        ));

        return response()->json([
            'message' => 'You were successfully registered. Use your email and password to sign in.'
        ], Response::HTTP_OK);
    }

    public function login(Request $request)
    {
        $user = $request->all();
        $credentials = $request->only('email', 'password');
        if (!Auth::attempt($credentials)) {
            return response()->json([
                'message' => 'You cannot sign with those credentials',
                'errors' => 'Unauthorised'
            ], 401);
        }

        if (Auth::user()->role === UserRoles::ADMIN->value) {
            $token = Auth::user()->createToken(config('app.name'), ['admin']);
        } else {
            $token = Auth::user()->createToken(config('app.name'), ['user']);
        }
        $token->token->expires_at = Carbon::now()->addDay();
        $token->token->save();

        $user = Auth::user();

        return response()->json([
            'userId' => Auth::id(),
            'token_type' => 'Bearer',
            'role' => $user->role,
            'shelter_id' => Shelter::whereHas('users', function($q) use($user) {
                $q->where('user_id', $user['id']);
            })->get(),
            'token' => $token->accessToken,
            'expires_at' => Carbon::parse($token->token->expires_at)->toDateTimeString()
        ], 200);
    }

    public function logout(Request $request)
    {
        $request->user()->token()->revoke();

        return response()->json([
            'message' => 'You are successfully logged out',
        ]);
    }
}
