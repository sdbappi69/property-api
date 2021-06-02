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

            $table->string('productName');
            $table->string('productCode');
            $table->integer('productPrice');
            $table->string('productDescription')->nullable();

            $table->uuid('product_categoriesId')->nullable(false);
            $table->foreign('product_categoriesId')
            ->references('id')
            ->on('product_categories')
            ->onDelete('cascade');

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
