<?php

namespace App\Console\Commands;

use App\Constants\UserRoles;
use App\Models\User;
use Illuminate\Console\Command;

class MakeAdminFormUser extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'make:admin {email}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Change role to admin';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $user = User::where('email',$this->argument('email'))->first();
        $role = 'true';
        if ($role === UserRoles::ADMIN->value) {
            $user->role = $role;
            $user->save();
        }
    }
}
