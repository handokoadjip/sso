<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGrupAplikasiTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('grup_aplikasi', function (Blueprint $table) {
            $table->uuid('grup_aplikasi_id')->primary();
            $table->uuid('grup_aplikasi_grup_id');
            $table->uuid('grup_aplikasi_aplikasi_id');

            $table->foreign('grup_aplikasi_grup_id')->references('grup_id')
                ->on('grup')
                ->onDelete('cascade')
                ->onUpdate('cascade');

            $table->foreign('grup_aplikasi_aplikasi_id')->references('aplikasi_id')
                ->on('aplikasi')
                ->onDelete('cascade')
                ->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('grup_aplikasi');
    }
}
