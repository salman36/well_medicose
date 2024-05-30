<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Package;

class PackageSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $packages = [
            [
                'title' => 'Silver',
                'price' => '20',
                'validity' => '20',
            ],
            [
                'title' => 'Gold',
                'price' => '30',
                'validity' => '25',
            ],
            [
                'title' => 'Premium',
                'price' => '50',
                'validity' => '30',
            ],
        ];

        foreach ($packages as $package) {
            Package::create($package);
        }
    }
}
