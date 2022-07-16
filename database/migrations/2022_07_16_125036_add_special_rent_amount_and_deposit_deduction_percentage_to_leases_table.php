<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddSpecialRentAmountAndDepositDeductionPercentageToLeasesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('leases', function (Blueprint $table) {
            //
            $table->string('special_rent_amount')->after('rent_amount')->nullable();
            $table->string('deposit_deduction_percentage')->after('rent_deposit')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('leases', function (Blueprint $table) {
            //
            $table->dropColumn(['special_rent_amount', 'deposit_deduction_percentage']);
        });
    }
}
