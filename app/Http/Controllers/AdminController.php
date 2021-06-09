<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
Use App\User;
Use App\Models\Booking;

use DB;
use Carbon\Carbon;

class AdminController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
     
      $train = Booking::select('vehicle');
      return view('admin.index');
    }
    public function showUsers()
    {
      $users = User::all();
      return view('admin.users', compact('users'));
    }

   


  
   
}
