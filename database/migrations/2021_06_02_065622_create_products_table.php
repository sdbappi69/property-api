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
            $table->integer('discount')->nullable();
            $table->string('product_description')->nullable();

            $table->uuid('product_categories_id')->nullable(false);
            $table->foreign('product_categories_id')
            ->references('id')
            ->on('product_categories')
            ->onDelete('cascade');

            $table->uuid('company_id')->nullable(false);
            $table->foreign('company_id')
            ->references('id')
            ->on('companies')
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
