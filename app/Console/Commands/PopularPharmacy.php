<?php

namespace App\Console\Commands;

use App\Models\Pharmacy;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;

class PopularPharmacy extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'popular:pharmacy';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Popular Pharmacy';

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
        // Retrieve pharmacies with at least 5 orders
        $popularPharmacies = Pharmacy::where('status',0)->withCount('orders')
        ->having('orders_count', '>=', 5)
            ->orderByDesc('orders_count')
            ->get();
            // Update status of popular pharmacies
            foreach ($popularPharmacies as $pharmacy) {
            // $this->info($pharmacy);
            $pharmacy->update(['status' => 1]);
        }

        $this->info('Status updated for popular pharmacies.');
    }
}
