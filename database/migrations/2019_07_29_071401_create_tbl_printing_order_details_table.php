<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTblPrintingOrderDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_printing_order_details', function (Blueprint $table) {
            $table->increments('printing_order_details_id');
            $table->integer('printing_order_id');
            $table->string('file');
            $table->integer('file_path');
            $table->integer('description');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('tbl_printing_order_details');
    }
}
