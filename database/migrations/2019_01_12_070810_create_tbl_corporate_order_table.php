<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTblCorporateOrderTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_corporate_order', function (Blueprint $table) {
            $table->increments('corporate_order_id');
            $table->integer('corporate_customer_id')->unsigned();
            $table->integer('corporate_shipping_id')->unsigned();
            $table->integer('corporate_payment_id')->unsigned();
            $table->string('corporate_order_total');
            $table->tinyInteger('corporate_order_status');
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
        Schema::dropIfExists('tbl_corporate_order');
    }
}
