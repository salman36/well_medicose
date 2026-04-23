<?php

namespace App\Console\Commands;

use App\Models\OfferProduct;
use Illuminate\Console\Command;

class DeleteFeaturedProduct extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'deleteFeatured:product';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'expired due date';

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
       return OfferProduct::where('date', '<', now())->delete();
        // return 0;
    }
}
