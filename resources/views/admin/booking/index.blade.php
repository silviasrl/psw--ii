@extends('admin.layouts.app')


@section('content')

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
  <div class="row">
     
    </div><br>
  <div class="row">
    <div class="col-md-12">
            <div class="panel panel-default">
              <div class="panel-body">
            @if(Session::has('alert-success'))
                <div class="alert alert-success">
                    <strong>{{ Session::get('alert-success') }}</strong>
                </div>
            @endif
            <hr>


<table class="table table-striped table-bordered data">
        <thead>
            <tr>
                <th>No</th>
                <th>Nama Lengkap</th>
                <th>Nomor Telepon</th>
                <th>Kota Tujuan</th>
                <th>Kelas Kereta</th>
                <th>Perjalanan</th>
                <th>Tanggal Berangkat</th>
                <th>Tiket Dewasa</th>
                <th>Tiket Anak-anak</th>
                <!-- <th>Aksi</th> -->
            </tr>
        </thead>
        <tbody>
          @foreach ($booking as $data)
            <tr>
                <td>{{$data->id_pesan}}</td>
                <td>{{$data->nama_lengkap}}</td>
                <td>{{$data->no_hp}}</td>
                <td>{{$data->kota_tujuan}}</td>
                <td>{{$data->kelas_kereta}}</td>
                <td>{{$data->perjalanan}}</td>
                <td>{{$data->tanggal_berangkat}}</td>
                <td>{{$data->dewasa}}</td>
                <td>{{$data->anak}}</td>



            </tr>
            @endforeach
        </tbody>
    </table>
</div>


@endsection
