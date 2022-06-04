<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Announcement;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Symfony\Component\HttpFoundation\Response;

class AnnouncementController extends Controller
{
    public function create(Request $request): JsonResponse
    {
        $data = $request->all();

        $announcement = Announcement::create($data['announcement']);

        return new JsonResponse([
            'created' => true,
        ], Response::HTTP_CREATED);
    }

    public function index()
    {
        $announcements = Announcement::where('done', null)->with("shelters")->get();
        return new JsonResponse([
            'announcements' => $announcements,
        ], Response::HTTP_CREATED);
    }

    public function makeAnnouncementDone(int $id): JsonResponse
    {
        $announcement = Announcement::FindOrFail($id);
        $announcement->done = Carbon::now()->format('Y-m-d');;
        $announcement->save();

        return new JsonResponse([
            'done' => true
        ], Response::HTTP_OK);
    }

    public function show()
    {
        $announcements = Announcement::with("shelters")->get();
        return new JsonResponse([
            'announcements' => $announcements,
        ], Response::HTTP_CREATED);
    }


}
