<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTblCorporateCustomerTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_corporate_customer', function (Blueprint $table) {
            $table->increments('corporate_customer_id');
            $table->string('corporate_customer_name');
            $table->string('corporate_customer_email');
            $table->string('corporate_customer_password');
            $table->string('corporate_customer_mobile');
            $table->tinyInteger('corporate_customer_status');
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
        Schema::dropIfExists('tbl_corporate_customer');
    }
}
