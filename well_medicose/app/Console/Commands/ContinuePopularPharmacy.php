<?php

namespace App\Console\Commands;

use App\Models\Pharmacy;
use Illuminate\Support\Carbon;
use Illuminate\Console\Command;

class ContinuePopularPharmacy extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'continuePopular:pharmacy';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $startDate = now()->subDays(30);
        $endDate = now();

        // Retrieve pharmacies with status 1 or 2 updated within the last 60 days
        $popularPharmacies = Pharmacy::whereIn('status', [1, 2])
            ->whereHas('orders', function ($query) use ($startDate, $endDate) {
                $query->whereBetween('created_at', [$startDate, $endDate]);
            })
            ->withCount(['orders' => function ($query) use ($startDate, $endDate) {
                $query->whereBetween('created_at', [$startDate, $endDate]);
            }])
            ->get();
            // $this->info($popularPharmacies);
        foreach ($popularPharmacies as $pharmacy) {
            $ordersCount = $pharmacy->orders_count;
            if ($ordersCount >= 5) {
                $pharmacy->status = 1;
            } else {
                $pharmacy->status = 2;
            }
            $pharmacy->save();
        }

        $this->info('Status updated for popular pharmacies.');
    }
}
