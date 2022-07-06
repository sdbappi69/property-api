<?php

namespace Database\Factories;

use App\Models\Tenant;
use App\Models\TenantType;
use Illuminate\Database\Eloquent\Factories\Factory;

class TenantFactory extends Factory
{
    protected $model = Tenant::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $gender = $this->faker->randomElement(['MALE', 'FEMALE']);
        return [
            'tenant_type_id' => TenantType::inRandomOrder()->first(),
            'first_name' => $this->faker->{'firstName'.ucfirst($gender)}(),
            'middle_name' => $this->faker->{'firstName'.ucfirst($gender)}(),
            'last_name' => $this->faker->lastName(),
            'gender' => $this->faker->randomElement(['MALE', 'FEMALE']),
            'date_of_birth' => $this->faker->date(),
            'id_passport_number' => rand(100000,999999),
            'marital_status' => $this->faker->randomElement(['Single', 'Divorced','Married']),
            'phone' => '01'.rand(3,9).rand(00000000,99999999),
            'email' => $this->faker->unique()->email(),
            'city' => $this->faker->city(),
            'state' => $this->faker->citySuffix(),
            'country' => $this->faker->country(),
            'postal_address' => $this->faker->postcode(),
            'physical_address' => $this->faker->address(),
            'password' => '123456',
            'confirmed' => 0,
            'created_at' => date('Y-m-'.rand(01,30).' '.rand(00,23).':'.rand(00,59).':'.rand(00,59))
        ];
    }
}
