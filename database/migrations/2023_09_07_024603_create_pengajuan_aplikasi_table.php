<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePengajuanAplikasiTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pengajuan_aplikasi', function (Blueprint $table) {
            $table->uuid('pengajuan_aplikasi_id')->primary();
            $table->uuid('pengajuan_aplikasi_pengguna_id');
            $table->uuid('pengajuan_aplikasi_aplikasi_id');
            $table->text('pengajuan_aplikasi_catatan');
            $table->string('pengajuan_aplikasi_status', 20);
            $table->timestamp('pengajuan_aplikasi_dibuat_pada', 0)->nullable();
            $table->timestamp('pengajuan_aplikasi_diubah_pada', 0)->nullable();

            $table->foreign('pengajuan_aplikasi_pengguna_id')->references('pengguna_id')
                ->on('pengguna')
                ->onDelete('cascade')
                ->onUpdate('cascade');

            $table->foreign('pengajuan_aplikasi_aplikasi_id')->references('aplikasi_id')
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
        Schema::dropIfExists('pengajuan_aplikasi');
    }
}
