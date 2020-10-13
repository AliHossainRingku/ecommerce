<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTblCorporateShippingTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_corporate_shipping', function (Blueprint $table) {
            $table->increments('corporate_shipping_id');
            $table->string('corporate_shipping_name');
            $table->string('corporate_shipping_address');
            $table->string('corporate_shipping_mobile');
            $table->string('corporate_shipping_email');
            $table->tinyInteger('corporate_shipping_status');
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
        Schema::dropIfExists('tbl_corporate_shipping');
    }
}
