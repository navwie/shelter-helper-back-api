<?php

namespace Tests\Feature;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Support\Facades\Artisan;
use Laravel\Passport\Passport;
use Tests\TestCase;

class AnimalTest extends TestCase
{
//    public function testShowAnimal(): void
//    {
//        $response = $this->getJson('/api/en/animalOne/57');
//        $response
//            ->assertStatus(200);
//        print_r("\n" . $response->content());
//
//    }
//
//    public function testShowAnimalFail(): void
//    {
//        $response = $this->getJson('/api/en/animalOne/1');
//        $response
//            ->assertStatus(404);
//        print_r("\n" . 'Тварину не знайдено');
//
//    }
//
//    public function testShowAllShelter(): void
//    {
//        $response = $this->getJson('/api/en/animal');
//        $response
//            ->assertStatus(200);
//        print_r("\n" . $response->content());
//
//    }
//
//    public function testShowAllShelterByAdminSuccess(): void
//    {
//        $response = $this->getJson('/api/en/animal/29');
//        $response
//            ->assertStatus(200);
//        print_r("\n" . $response->content());
//
//    }
//    public function testShowAllShelterByAdminFail(): void
//    {
//        $response = $this->getJson('/api/en/animal/434');
//        $response
//            ->assertStatus(200);
//        print_r("\n" . $response->content());
//
//    }
//    public function testCreateAnimalAdminSuccess(): void
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
//            'gender' => 'Хлопчик',
//            'type' => 'Пес',
//            'weight' => '4',
//            'shelter_id' => '44',
//            'sterilized' => true,
//            'description' => "wefwefwef",
//            'birthday'=> "2018-01-25",
//            'photo'=> '9.jpeg\\data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhUTExMWFhUXGBgaFxgYGB0YGxgYGhgXGhoY'
//        ];
//        $response = $this->json('POST', '/api/en/animal', $payload, $headers);
//        $response
//            ->assertStatus(200);
//        print_r( "\n" . $response->content());
//        print_r( "\n" . "Тварина створена");
//    }
//    public function testCreateUserAnimalFail(): void
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
//            'gender' => 'Хлопчик',
//            'type' => 'Пес',
//            'weight' => '4',
//            'shelter_id' => '44',
//            'sterilized' => true,
//            'description' => "wefwefwef",
//            'birthday'=> "2018-01-25",
//            'photo'=> '9.jpeg\\data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhUTExMWFhUXGBgaFxgYGB0YGxgYGhgXGhoY'
//        ];
//        $response = $this->json('POST', '/api/en/animal', $payload, $headers);
//        print_r( "\n" . "Ви не маєтее право створювати притулок, ви не адміністратор");
//        $response
//            ->assertStatus(403);
//
//    }
//    public function testCreateAdminAnimalFailByShelter(): void
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
//            'gender' => 'Хлопчик',
//            'type' => 'Пес',
//            'weight' => '4',
//            'shelter_id' => '343434',
//            'sterilized' => true,
//            'description' => "wefwefwef",
//            'birthday'=> "2018-01-25",
//            'photo'=> '9.jpeg\\data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhUTExMWFhUXGBgaFxgYGB0YGxgYGhgXGhoY'
//        ];
//        $response = $this->json('POST', '/api/en/animal', $payload, $headers);
//        $response
//            ->assertStatus(422);
//        print_r( "\n" . "Перед тим як додати тварину, ви повинні мати притулок");
//
//    }
//    public function testAnimalUpdateSuccess(): void
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
//            'name' => 'wefwefs',
//            'gender' => 'Хлопчик',
//            'type' => 'Пес',
//            'weight' => '4',
//            'shelter_id' => '44',
//            'sterilized' => true,
//            'description' => "wefwefwef",
//            'birthday'=> "2018-01-25",
//            'photo'=> '9.jpeg\\data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhUTExMWFhUXGBgaFxgYGB0YGxgYGhgXGhoY'
//        ];
//        $response = $this->json('PUT', '/api/en/animal/79', $payload, $headers);
//        $response
//            ->assertStatus(200)
//            ->assertJson([
//                'update' => true,
//            ]);
//        print_r( "\n" . $response->content());
//        print_r( "\n" . "Дані успішно змінені");
//
//    }
//
//    public function testAnimalUpdateFail(): void
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
//            'name' => 'wefwefs',
//            'gender' => 'Хлопчик',
//            'type' => 'Пес',
//            'weight' => '4',
//            'shelter_id' => '44',
//            'sterilized' => true,
//            'description' => "wefwefwef",
//            'birthday'=> "2018-01-25",
//            'photo'=> '9.jpeg\\data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhUTExMWFhUXGBgaFxgYGB0YGxgYGhgXGhoY'
//        ];
//        $response = $this->json('PUT', '/api/en/animal/71', $payload, $headers);
//        $response
//            ->assertStatus(403);
//        print_r("\n" . "Ви не маєтее право змінювати дані про тварин, ви не адміністратор");
//
//    }
//    public function testUpdateAdminAnimalFailByShelter(): void
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
//            'gender' => 'Хлопчик',
//            'type' => 'Пес',
//            'weight' => '4',
//            'shelter_id' => '343434',
//            'sterilized' => true,
//            'description' => "wefwefwef",
//            'birthday'=> "2018-01-25",
//            'photo'=> '9.jpeg\\data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxMTEhUTExMWFhUXGBgaFxgYGB0YGxgYGhgXGhoY'
//        ];
//        $response = $this->json('POST', '/api/en/animal', $payload, $headers);
//        $response
//            ->assertStatus(422);
//        print_r( "\n" . "Для початку ви повинні створити притулок, та додати тварин");
//
//    }
//
//    public function testBookAnimal(): void
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
//            "data" => "2022-06-27T00:51"
//        ];
//        $response = $this->json('PUT', '/api/en/animal/booked/66', $payload, $headers);
//        $response
//            ->assertStatus(200);
//        print_r("\n" . "Тварина заброньована");
//        print_r("\n" . $response->content());
//
//
//    }
//    public function testBookAnimalFail(): void
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
//            "data" => "sdsef"
//        ];
//        $response = $this->json('PUT', '/api/en/animal/booked/43', $payload, $headers);
//        $response
//            ->assertStatus(500);
//        print_r("\n" . "Некоректні дані");
//    }
//    public function testBookAnimalFailByUncorrectData(): void
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
//            "data" => "2022-09-23"
//        ];
//        $response = $this->json('PUT', '/api/en/animal/booked/000', $payload, $headers);
//        $response
//            ->assertStatus(404);
//        print_r("\n" . "Тварина не знайдена");
//    }
//    public function testBookAnimalFailByAdmin(): void
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
//            "data" => "sdsef"
//        ];
//        $response = $this->json('PUT', '/api/en/animal/booked/43', $payload, $headers);
//        $response
//            ->assertStatus(403);
//        print_r("\n" . "Ви не маєте право бронювати тварину");
//    }
//    public function testUnbookAnimal(): void
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
//        $response = $this->json('PUT', '/api/en/animal/unbooked/66', $headers);
//        $response
//            ->assertStatus(200);
//        print_r("\n" . "Бронь скасована");
//    }
//    public function testUnbookAnimalFail(): void
//    {
//        Artisan::call('passport:install');
//
//        $user = User::factory()->create();
//        Passport::actingAs($user, ['user']);
//
//        $token = $user->token();
//
//        $headers = ['Authorization' => 'Bearer ' . $token];
//
//        $response = $this->json('PUT', '/api/en/animal/unbooked/66', $headers);
//        $response
//            ->assertStatus(403);
//        print_r("\n" . "Ви не маєте права скасовувати бронь");
//    }
//    public function testUnbookAnimalFailUncorrectData(): void
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
//        $response = $this->json('PUT', '/api/en/animal/unbooked/000', $headers);
//        $response
//            ->assertStatus(404);
//        print_r("\n" . "Тварина не знайдена");
//    }
//    public function testDeleteAnimalSuccess(): void
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
//        $response = $this->json('PUT', '/api/en/animal/archive/66', $headers);
//        $response
//            ->assertStatus(200);
//        print_r("\n" . $response->content());
//        print_r("\n" . 'Тварина додана до архів');
//
//    }
//    public function testDeleteAnimalFail(): void
//    {
//        Artisan::call('passport:install');
//
//        $user = User::factory()->create();
//        Passport::actingAs($user, ['user']);
//
//        $token = $user->token();
//
//        $headers = ['Authorization' => 'Bearer ' . $token];
//
//        $response = $this->json('PUT', '/api/en/animal/archive/66', $headers);
//        $response
//            ->assertStatus(403);
//        print_r("\n" . 'Ви не маєте права видаляти тварину');
//
//    }
//    public function testDeleteAnimalFailByUncorrectData(): void
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
//        $response = $this->json('PUT', '/api/en/animal/archive/000', $headers);
//        $response
//            ->assertStatus(404);
//        print_r("\n" . "Тварина не знайдена");
//
//    }
}
