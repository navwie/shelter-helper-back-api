<?php

namespace Tests\Feature;

use App\Constants\UserRoles;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Support\Facades\Artisan;
use Laravel\Passport\Passport;
use Tests\TestCase;

class ShelterTest extends TestCase
{
//
//    public function testCreateShelterAdminSuccess(): void
//    {
//        Artisan::call('passport:install');
//
//        $user = User::factory()->create();
//        Passport::actingAs($user, ['admin']);
//
//        $token = $user->token();
//
//        $headers = ['Authorization' => 'Bearer ' . $token];
//        $payload = [
//            'name' => 'Gamwefs',
//            'address' => 'sdfwe',
//            'phone' => '+380958305592',
//            'email' => 'friendsw@gmail.com',
//            'city'=>'wef',
//            'photo'=> '9.jpeg\\data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhUTExMWFhUXGBgaFxgYGB0YGxgYGhgXGhoY'
//        ];
//        $response = $this->json('POST', '/api/en/shelter', $payload, $headers);
//        $response
//            ->assertStatus(200);
//        print_r( "\n" . $response->content());
//
////    }
//    public function testCreateShelterUser(): void
//    {
//        Artisan::call('passport:install');
//
//        $user = User::factory()->create();
//        Passport::actingAs($user, ['user']);
//
//        $token = $user->token();
//
//        $headers = ['Authorization' => 'Bearer ' . $token];
//        $payload = [
//            'name' => 'Gamwefs',
//            'address' => 'sdfwe',
//            'phone' => '+380958305592',
//            'email' => 'friendsw@gmail.com',
//            'city'=>'wef',
//            'photo'=> '9.jpeg\\data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhUTExMWFhUXGBgaFxgYGB0YGxgYGhgXGhoY'
//        ];
//        $response = $this->json('POST', '/api/en/shelter', $payload, $headers);
//        print_r( "\n" . "Ви не маєтее право створювати притулок, ви не адміністратор");
//        $response
//            ->assertStatus(403);
//
//    }
//    public function testShelterUpdateSuccess(): void
//    {
//        Artisan::call('passport:install');
//
//        $user = User::factory()->create();
//        Passport::actingAs($user, ['admin']);
//
//        $token = $user->token();
//
//        $headers = ['Authorization' => 'Bearer ' . $token];
//        $payload = [
//            'name' => 'Gamwefs',
//            'address' => 'wef',
//            'phone' => '+380958305322',
//            'email' => 'friends@gmail.com',
//            'city'=>'wef',
//            'photo'=> '9.jpeg\\data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhUTExMWFhUXGBgaFxgYGB0YGxgYGhgXGhoY'
//        ];
//        $response = $this->json('PUT', '/api/en/shelter/71', $payload, $headers);
//        $response
//            ->assertStatus(200)
//            ->assertJson([
//                'updated' => true,
//            ]);
//        print_r( "\n" . $response->content());
//
//    }
//
//    public function testShelterUpdateFail(): void
//    {
//        Artisan::call('passport:install');
//
//        $user = User::factory()->create();
//        Passport::actingAs($user, ['user']);
//
//        $token = $user->token();
//
//        $headers = ['Authorization' => 'Bearer ' . $token];
//        $payload = [
//            'name' => 'Gamwefs',
//            'address' => 'wef',
//            'phone' => '+380958305322',
//            'email' => 'friends@gmail.com',
//            'city' => 'wef',
//            'photo' => '9.jpeg\\data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhUTExMWFhUXGBgaFxgYGB0YGxgYGhgXGhoY'
//        ];
//        $response = $this->json('PUT', '/api/en/shelter/71', $payload, $headers);
//        $response
//            ->assertStatus(403);
//        print_r("\n" . "Ви не маєтее право змінювати притулок, ви не адміністратор");
//
//    }
//
//    public function testShowShelter(): void
//    {
//        $response = $this->getJson('/api/en/shelter/30');
//        $response
//            ->assertStatus(200);
//        print_r("\n" . $response->content());
//
//    }
//    public function testShowShelterFail(): void
//    {
//        $response = $this->getJson('/api/en/shelter/1');
//        $response
//            ->assertStatus(404);
//        print_r("\n" . 'Притулок не знайдено');
//
//    }
//    public function testShowAllShelter(): void
//    {
//        $response = $this->getJson('/api/en/shelter');
//        $response
//            ->assertStatus(200);
//        print_r("\n" . $response->content());
//
//    }
//

}
