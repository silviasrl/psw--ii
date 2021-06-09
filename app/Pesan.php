<?php

namespace App;


use Illuminate\Database\Eloquent\Model;

class Pesan extends Model
{
   
    protected $table = 'pesan';
    protected $primaryKey = 'id_pesan';
    
    protected $fillable = ['nama_lengkap','tanggal_berangkat','no_hp','dewasa','anak','kota_asal','kelas_kereta','perjalanan','kota_tujuan'];
}
