<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateQuotationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('quotations', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->uuid('id')->primary();

            $table->string('quotationNumber');
            $table->dateTime('date');
            $table->string('note');

            $table->uuid('product_id')->nullable(false);
            $table->foreign('product_id')
            ->references('id')
            ->on('products')
            ->onDelete('cascade');

            $table->uuid('customer_id')->nullable(false);
            $table->foreign('customer_id')
            ->references('id')
            ->on('customers')
            ->onDelete('cascade');

            $table->foreignId('currency_id')->constrained();


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
        Schema::dropIfExists('quotations');
    }
}
