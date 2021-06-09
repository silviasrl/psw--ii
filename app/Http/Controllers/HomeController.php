<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Pesan;
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

    public function store(Request $request)
    {
        Pesan::create([
            'nama_lengkap' => $request->nama_lengkap,
            'no_hp' => $request->no_hp,
            'perjalanan' => $request->perjalanan,
            'kota_asal' => $request->kota_asal,
            'kota_tujuan' => $request->kota_tujuan,
            'dewasa' => $request->dewasa,
            'anak' => $request->anak,
            'tanggal_berangkat' => $request->tanggal_berangkat,
            'kelas_kereta' => $request->kelas_kereta,   
        ]);
        return redirect('/');
    }
}
