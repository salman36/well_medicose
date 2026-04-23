<?php

namespace App\Console;

use App\Console\Commands\PopularPharmacy;
use Illuminate\Console\Scheduling\Schedule;
use App\Console\Commands\DeleteFeaturedProduct;
use App\Console\Commands\ContinuePopularPharmacy;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
        DeleteFeaturedProduct::class,
        PopularPharmacy::class,
        ContinuePopularPharmacy::class,
    ];

    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        $schedule->command('deleteFeatured:product')->daily();
        $schedule->command('popular:pharmacy')->daily();
        $schedule->command('continuePopular:pharmacy')->monthly();
    }

    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}
