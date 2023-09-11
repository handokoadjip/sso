<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateInformasiTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('informasi', function (Blueprint $table) {
            $table->uuid('informasi_id')->primary();
            $table->string('informasi_judul', 50);
            $table->text('informasi_deskripsi');
            $table->timestamp('informasi_dibuat_pada', 0)->nullable();
            $table->timestamp('informasi_diubah_pada', 0)->nullable();
            $table->uuid('informasi_dibuat_pengguna_id');

            $table->foreign('informasi_dibuat_pengguna_id')->references('pengguna_id')
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
        Schema::dropIfExists('informasi');
    }
}
