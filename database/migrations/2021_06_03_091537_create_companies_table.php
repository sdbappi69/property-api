<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCompaniesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('companies', function (Blueprint $table) {
            $table->engine = 'InnoDB';
            $table->uuid('id')->primary();

            $table->string('name');
            $table->string('logo')->nullable();
            $table->string('postal_code')->nullable();
            $table->string('postal_address')->nullable();
            $table->string('physical_address')->nullable();
            $table->string('phone')->nullable();
            $table->string('email');
            $table->integer('country');
            $table->string('city')->nullable();
            $table->dateTime('start_date');

            $table->uuid('user_id')->nullable(false);
            $table->foreign('user_id')
            ->references('id')
            ->on('users')
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
        Schema::dropIfExists('companies');
    }
}
