<?php

namespace Database\Factories;

use App\Models\Landlord;
use Illuminate\Database\Eloquent\Factories\Factory;

class LandlordFactory extends Factory
{
    protected $model = Landlord::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            //
            'first_name' => $this->faker->firstName(),
            'middle_name' => $this->faker->firstName(),
            'last_name' => $this->faker->lastName(),
            'phone' => $this->faker->phoneNumber(),
            'email' => $this->faker->email(),
            'registration_date' => $this->faker->date(),
            'id_number' => random_int(1000000,9999999),
            'city' => $this->faker->city(),
            'state' => $this->faker->citySuffix(),
            'country' => $this->faker->country(),
            'postal_address' => $this->faker->postcode(),
            'physical_address' => $this->faker->address(),
            'residential_address' => $this->faker->streetAddress(),
            'password' => bcrypt('123456'),
            'confirmed' => 0,
            'confirmation_code' => null,
            'created_at' => $this->faker->dateTime()

        ];
    }
}
