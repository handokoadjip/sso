<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAplikasiTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('aplikasi', function (Blueprint $table) {
            $table->uuid('aplikasi_id')->primary();
            $table->uuid('aplikasi_kategori_id');
            $table->string('aplikasi_nama', 100);
            $table->string('aplikasi_ikon');
            $table->string('aplikasi_ikon_normal');
            $table->string('aplikasi_tautan');
            $table->string('aplikasi_jenis')->comment('utama | lainnya');;
            $table->timestamp('aplikasi_dibuat_pada', 0)->nullable();
            $table->timestamp('aplikasi_diubah_pada', 0)->nullable();
            $table->uuid('aplikasi_dibuat_pengguna_id');

            $table->foreign('aplikasi_dibuat_pengguna_id')->references('pengguna_id')
                ->on('pengguna')
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
        Schema::dropIfExists('aplikasi');
    }
}
