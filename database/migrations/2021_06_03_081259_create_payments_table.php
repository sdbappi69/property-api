<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePaymentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('payments', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->uuid('id')->primary();

            $table->dateTime('date');
            $table->integer('amount');
            $table->string('note');
            $table->string('payment_method');
            $table->string('transaction_number')->nullable();

            $table->uuid('invoice_number_id')->nullable(false);
            $table->foreign('invoice_number_id')
            ->references('id')
            ->on('invoices')
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
        Schema::dropIfExists('payments');
    }
}
