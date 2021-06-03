<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateExpensesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('expenses', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->uuid('id')->primary();

            $table->string('name');
            $table->integer('amount');
            $table->string('note')->nullable();
            $table->dateTime('date');

            $table->foreignId('currency_id')->constrained();
            $table->uuid('expense_categories_id')->nullable(false);
            $table->foreign('expense_categories_id')
            ->references('id')
            ->on('expense_categories')
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
        Schema::dropIfExists('expenses');
    }
}
