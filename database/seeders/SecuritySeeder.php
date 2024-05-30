<?php

namespace Database\Seeders;

use App\Models\About;
use App\Models\PrivacyPolicy;
use App\Models\TermCondition;
use Illuminate\Database\Seeder;

class SecuritySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        About::create([
            "description"=>"Morbi dignissim dignissim ipsum, eget lacinia odio efficitur ac."
        ]);

        TermCondition::create([
            "description"=>"Morbi dignissim dignissim ipsum, eget lacinia odio efficitur ac."
        ]);

        PrivacyPolicy::create([
            "description"=>"Morbi dignissim dignissim ipsum, eget lacinia odio efficitur ac."
        ]);
    }
}
