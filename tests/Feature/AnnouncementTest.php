<?php

namespace Tests\Feature;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Support\Facades\Artisan;
use Laravel\Passport\Passport;
use Tests\TestCase;

class AnnouncementTest extends TestCase
{

//    public function testCreateAnnouncementAdminSuccess(): void
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
//            'topic' => 'Gamwefs',
//            'description' => 'wfwefw',
//            'shelter_id' => '44',
//        ];
//        $response = $this->json('POST', '/api/en/announcements', $payload, $headers);
//        $response
//            ->assertStatus(201);
//        print_r( "\n" . "Об'ява створена");
//        print_r( "\n" . $response->content());
//
//    }
//    public function testCreateAnnouncementUser(): void
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
//            'topic' => 'Gamwefs',
//            'description' => 'wfwefw',
//            'shelter_id' => '44',
//        ];
//        $response = $this->json('POST', '/api/en/announcements', $payload, $headers);
//        print_r( "\n" . "Ви не маєтее право створювати об'яви, ви не адміністратор");
//        $response
//            ->assertStatus(403);
//
//    }
//    public function testCreateAnnouncementFail(): void
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
//            'topic' => '',
//            'description' => '',
//            'shelter_id' => '',
//        ];
//        $response = $this->json('POST', '/api/en/announcements', $payload, $headers);
//        $response
//            ->assertStatus(422);
//        print_r( "\n" . $response->content());
//
//    }
//
//    public function testShowAnnouncement(): void
//    {
//        $response = $this->getJson('/api/en/announcements');
//        $response
//            ->assertStatus(201);
//        print_r("\n" . $response->content());
//
//    }
//    public function testAnnouncementDoneFail(): void
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
//        $response = $this->json('PUT', '/api/en/announcements/done/66', $headers);
//        $response
//            ->assertStatus(403);
//        print_r("\n" . 'Ви не маєте права видаляти обяву');
//
//    }
//    public function testAnnouncementDoneSuccess(): void
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
//        $response = $this->json('PUT', '/api/en/announcements/done/3', $headers);
//        $response
//            ->assertStatus(200);
//        print_r( "\n" . $response->content());
//        print_r("\n" . "Об'ява виконана");
//
//    }
//    public function testAnnouncementDoneFailByUncorrectData(): void
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
//        $response = $this->json('PUT', '/api/en/announcements/done/4346', $headers);
//        $response
//            ->assertStatus(404);
//        print_r("\n" . "Об'ява не знайдена");
//
//    }
}
