<?php

namespace Tests\Feature;

use App\Constants\UserRoles;
use App\Models\User;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Testing\Fluent\AssertableJson;
use Laravel\Passport\Passport;
use Tests\TestCase;


class UserTest extends TestCase
{
//    public function testLoginSuccess(): void
//    {
//        Artisan::call('passport:install');
//
//        $response = $this->postJson('/api/en/login', [
//            'email' => 'navwie@gmail.com',
//            'password' => '111111',
//        ]);
//        print_r($response->content());
//        $response
//            ->assertJson([
//                'userId' => 2,
//                'token_type' => 'Bearer'
//            ])
//            ->assertStatus(200);
//    }
//
//    public function testLoginFailed(): void
//    {
//        Artisan::call('passport:install');
//
//        $response = $this->postJson('/api/en/login', [
//            'email' => 'navwie@gmail.com',
//            'password' => '32erfe2f23r',
//        ]);
//        print_r( "\n" . $response->content());
//        $response
//            ->assertStatus(401);
//
//    }
//
//    public function testRegisterSuccess(): void
//    {
//        Artisan::call('passport:install');
//
//        $response = $this->postJson('/api/en/register', [
//            'name' => 'Вероника',
//            'surname' => "Лукянко",
//            'email' => 'Dnцwefwefуаw@gmail.com',
//            'password' => '002222103',
//            'phone' => '+3832953204',
//            'role' => false
//        ]);
//        print_r( "\n" . $response->content());
//        $response->assertStatus(200);
//    }
//
//    public function testRegisterFail(): void
//    {
//        Artisan::call('passport:install');
//
//        $response = $this->postJson('/api/en/register', [
//            'name' => '',
//            'surname' => "",
//            'email' => '',
//            'password' => '',
//            'phone' => '',
//            'role' => false
//        ]);
//        print_r( "\n" . 'Некоректные данные');
//        print_r( "\n" . $response->content());
//        $response->assertStatus(422);
//    }
//    public function testUserShowSuccess()
//    {
//        $user = User::factory()->create();
//        Passport::actingAs($user, [UserRoles::ADMIN->value]);
//
//        $token = $user->token();
//        $headers = ['Authorization' => 'Bearer ' . $token];
//
//        $response = $this->get('/api/en/user/'. $user->id, $headers);
//        print_r( "\n" . $response->content());
//        $response->assertStatus(200);
//    }
//    public function testUserShowFail()
//    {
//        $user = User::factory()->create();
//        Passport::actingAs($user, [UserRoles::ADMIN->value]);
//
//        $token = $user->token();
//        $headers = ['Authorization' => 'Bearer ' . $token];
//
//        $response = $this->get('/api/en/user/100000', $headers);
//        print_r( "\n" . "Пользователь не найден");
//        $response->assertStatus(404);
//    }

//
//    public function testUserUpdateSuccess(): void
//    {
//        Artisan::call('passport:install');
//
//        $user = User::factory()->create();
//        Passport::actingAs($user, [UserRoles::ADMIN->value]);
//
//        $token = $user->token();
//
//        $headers = ['Authorization' => 'Bearer ' . $token];
//        $payload = [
//            'name' => 'efwijefw',
//            'surname' => 'wefwjeif',
//            'phone' => '+380958305593',
//            'email' => 'ardadwe@gmail.com',
//            'password' => 'e32323w',
//            'role' => $user->role
//        ];
//        $response = $this->json('PUT', '/api/en/user/' . $user->id, $payload, $headers);
//        $response
//            ->assertStatus(200)
//            ->assertJson([
//                'updated' => true,
//            ]);
//        print_r( "\n" . $response->content());
//
//    }
//    public function testUserUpdateFail(): void
//    {
//        Artisan::call('passport:install');
//
//        $user = User::factory()->create();
//        Passport::actingAs($user, [UserRoles::ADMIN->value]);
//
//        $token = $user->token();
//
//        $headers = ['Authorization' => 'Bearer ' . $token];
//        $payload = [
//            'name' => '',
//            'surname' => '',
//            'phone' => '',
//            'email' => '',
//            'password' => '',
//            'role' => $user->role
//        ];
//        $response = $this->json('PUT', '/api/en/user/' . $user->id, $payload, $headers);
//        $response
//            ->assertStatus(422);
//        print_r( "\n" . $response->content());
//
//    }

//    public function testLogout(): void
//    {
//        Artisan::call('passport:install');
//
//        $user = User::factory()->create();
//        Passport::actingAs($user, ['admin']);
//
//        $token = $user->token();
//
//        $headers = ['Authorization' => 'Bearer ' . $token];
//
//        $response = $this->json('POST', '/api/en/logout', $headers);
//        $response
//            ->assertStatus(200);
//        print_r("\n" . $response->content());
//    }
//    public function testLogout(): void
//    {
//        $response = $this->json('POST', '/api/en/logout');
//        $response
//            ->assertStatus(401);
//        print_r("\n" . $response->content());
//    }
}
