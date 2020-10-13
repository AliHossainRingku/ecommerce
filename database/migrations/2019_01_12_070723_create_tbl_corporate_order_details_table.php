<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTblCorporateOrderDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tbl_corporate_order_details', function (Blueprint $table) {
            $table->increments('corporate_order_details_id');
            $table->integer('corporate_order_id')->unsigned();
            $table->integer('corporate_product_id');
            $table->string('corporate_product_name');
            $table->float('corporate_product_price');
            $table->integer('corporate_product_sales_quantity');
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
        Schema::dropIfExists('tbl_corporate_order_details');
    }
}
