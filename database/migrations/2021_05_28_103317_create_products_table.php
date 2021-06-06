<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->uuid('id')->primary();
            //$table->string('id', 36)->primary()->unique();

            $table->string('product_name');
            $table->string('product_code');
            $table->integer('product_price');
            $table->string('product_description')->nullable();

            //$table->unsignedBigInteger('product__categoriesId');
            $table->uuid('product__categoriesId')->nullable(false);
            $table->foreign('product__categoriesId')
            ->references('id')
            ->on('users')
            ->onDelete('cascade');

            //  $table->unsignedBigInteger('product_categories_id')->unsigned()->nullable();
            //  $table->foreign('product_categories_id')->references('id')->on('product_categories')->onDelete('cascade');



            $table->softDeletes();
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
        Schema::dropIfExists('products');
    }
}
