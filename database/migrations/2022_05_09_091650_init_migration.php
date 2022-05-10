<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id()->autoIncrement();
            $table->string('name');
            $table->string('surname');
            $table->string('email');
            $table->string('phone');
            $table->string('password');
            $table->boolean('role');
            $table->timestamps();

        });

        Schema::create('shelters', function (Blueprint $table) {
            $table->id()->autoIncrement();
            $table->string('name');
            $table->string('address');
            $table->string('phone');
            $table->string('email');
            $table->timestamps();

        });
        Schema::create('animals', function (Blueprint $table) {
            $table->id()->autoIncrement();
            $table->string('name');
            $table->integer('age');
            $table->string('gender');
            $table->string('photo');
            $table->string('type');
            $table->double('weight');
            $table->timestamps();
        });
        Schema::create('announcements', function (Blueprint $table) {
            $table->id()->autoIncrement();
            $table->string('topic');
            $table->text('description');
            $table->timestamps();

        });


        Schema::table('shelters', function (Blueprint $table) {
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
        });
        Schema::table('animals', function (Blueprint $table) {
            $table->foreignId('shelter_id')->constrained('shelters')->onDelete('cascade');
        });
        Schema::table('announcements', function (Blueprint $table) {
            $table->foreignId('shelter_id')->constrained('shelters')->onDelete('cascade');
        });

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {

        Schema::dropIfExists('users');
        Schema::dropIfExists('shelters');
        Schema::dropIfExists('animals');
        Schema::dropIfExists('announcements');
    }
};
