<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTblPrintingOrderTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_printing_order', function (Blueprint $table) {
            $table->increments('printing_order_id');
            $table->string('project_name');
            $table->string('quantity');
            $table->string('project_description');
            $table->string('company_name');
            $table->string('contact_person_name');
            $table->string('company_mobile');
            $table->string('company_email');
            $table->string('district');
            $table->string('postal_code');
            $table->string('file_attach');
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
        Schema::dropIfExists('tbl_printing_order');
    }
}
