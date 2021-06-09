<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\TrainStation;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */

    public function index()
    {
        
        $train_station = TrainStation::all();
        return view('index', compact( 'train_station'));
    }
}
