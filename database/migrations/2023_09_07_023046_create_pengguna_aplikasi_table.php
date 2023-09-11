<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePenggunaAplikasiTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pengguna_aplikasi', function (Blueprint $table) {
            $table->uuid('pengguna_aplikasi_id')->primary();
            $table->uuid('pengguna_aplikasi_pengguna_id');
            $table->uuid('pengguna_aplikasi_aplikasi_id');

            $table->foreign('pengguna_aplikasi_pengguna_id')->references('pengguna_id')
                ->on('pengguna')
                ->onDelete('cascade')
                ->onUpdate('cascade');

            $table->foreign('pengguna_aplikasi_aplikasi_id')->references('aplikasi_id')
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
        Schema::dropIfExists('pengguna_aplikasi');
    }
}
