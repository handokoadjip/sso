<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateKategoriTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('kategori', function (Blueprint $table) {
            $table->uuid('kategori_id')->primary();
            $table->string('kategori_nama', 100);
            $table->timestamp('kategori_dibuat_pada', 0)->nullable();
            $table->timestamp('kategori_diubah_pada', 0)->nullable();
            $table->uuid('kategori_dibuat_pengguna_id');

            $table->foreign('kategori_dibuat_pengguna_id')->references('pengguna_id')
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
        Schema::dropIfExists('kategori');
    }
}
