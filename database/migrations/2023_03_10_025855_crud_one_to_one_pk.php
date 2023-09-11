<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CrudOneToOnePk extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('crud_one_to_one_pk', function (Blueprint $table) {
            $table->uuid('crud_one_to_one_pk_id')->primary();
            $table->string('crud_one_to_one_pk_nama', 100);
            $table->timestamp('crud_one_to_one_pk_dibuat_pada', 0)->nullable();
            $table->timestamp('crud_one_to_one_pk_diubah_pada', 0)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('crud_one_to_one_pk');
    }
}
