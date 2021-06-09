@extends('layouts.app')

<!--slide-->
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Indikator -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>

  <!-- Slide Foto -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <center><img src="images/keretaapi1.jpg" alt="..." width="60%"></center>
      <div class="carousel-caption">
       <h1>Aman, Nyaman, Terpercaya</h1>
      </div>
    </div>
    <div class="item">
      <center><img src="images/ptka.jpeg" alt="..." width="60%"></center>
      <div class="carousel-caption">
       <h1>Pesan Tiket Anda!</h1>
      </div>
    </div>

    <div class="item">
      <center><img src="images/keretaapi3.jpg" alt="..." width="60%"></center>
      <div class="carousel-caption">
        <h1>Ingat daftar akun ya!</h1>
      </div>
    </div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<!-- tab -->
  <div class="container">
    <div class="row">
      <div role="tabpanel">
          <div class="panel-body">
            <ul class="nav nav-tabs">
          
              <li> <a href="#kereta">Kereta</a></li>
            </ul>
            
     <!-- Kereta -->
            <div class="tab-pane" id="kereta">
                <form action="{{ url('pesan/store') }}" method="post" ><br>
                  {{ csrf_field() }}
                  <center><div class="col-md-6">
                   <label for="nama" id="nama">Nama Lengkap</label>
                    <input type="text" name="nama_lengkap" id="nama" width="80%">
                  </div>
                  <div class="col-md-6">
                    <label for="nama" id="nama">Nomor Telepon</label>
                    <input type="number" name="no_hp" id="nomor">
                  </div><br></center><br>
                  <div class="col-md-4">
                    <label for="from">Kota Asal</label>
                      <select class='select2' id="select2" name="kota_asal" >
                        <option value="">Pilih</option>
                        @foreach ($train_station as $ts)
                          <option value="{{$ts->code}}">{{"$ts->city - $ts->station_name ($ts->code)"}}</option>
                        @endforeach
                      </select>
                  </div>

                  <div class="col-md-4">
                    <label for="kotatujuan">Kota Tujuan</label>
                      <select class="select2" id="select2" name="kota_tujuan" >
                        <option value="">Pilih</option>
                        @foreach ($train_station as $ts)
                          <option value="{{$ts->code}}">{{$ts->city}} - {{$ts->station_name}} ({{$ts->code}})</option>
                        @endforeach
                      </select>
                  </div>

                  <div class="col-md-4">
                      <label for="kelas kereta">Kelas Kereta</label>
                        <select class="form-control" name="kelas_kereta">
                            <option value="Ekonomi">Ekonomi</option>
                            <option value="Bisnis">Bisnis</option>
                            <option value="Eksekutif">Eksekutif</option>
                          </select>
                  </div>

                  <div class="col-md-4">
                    <label for="Perjalanan">Perjalanan</label>
                        <select class='form-control type' name="perjalanan" >
                            <option value="Sekali Jalan">Sekali Jalan</option>
                            
                          </select>
                  </div>


                  <div class="col-md-4">
                      <label for="berangkat">Tanggal Berangkat</label>
                      <input type="text" class="form-control datepicker" placeholder="30/01/2018" name='tanggal_berangkat' >
                  </div>

                
                  <div class="col-md-2">
                    <label for="dewasa">Dewasa</label>
                      <select class="form-control"  name="dewasa" >
                          <option value="1">1</option>
                          <option value="2">2</option>
                          <option value="3">3</option>
                          <option value="4">4</option>
                      </select>
                  </div>

                  <div class="col-md-2">
                    <label for="anak">Anak-Anak</label>
                      <select class="form-control"  id="child" name="anak" >
                          <option value="0">0</option>
                          <option value="1">1</option>
                          <option value="2">2</option>
                          <option value="3">3</option>
                          <option value="4">4</option>
                      </select>
                  </div>

                  <div class="col-md-4"><br>
                      <button type="submit" class="btn btn-primary">Pesan Tiket</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
      </div>
    </div>
  </div>

<hr class="half-rule">
 <!-- Services -->
<section id="services">
  <div class="container">
    <div class="row">
        <div class="col-lg-12 text-center">
          <h2 class="section-heading text-uppercase" id="beranda">Beranda</h2>
        </div>
    </div>

    <div class="row text-center">
      <div class="col-md-4">
          <img src="images/1.jpeg" alt="" width="225">
          <h4 class="service-heading">Promo Keluarga</h4>
          <p class="text-muted">Diskon 20 %</p>
      </div>

      <div class="col-md-4">
          <img src="images/2.jpeg" alt="" width="225" height="150">
          <h4 class="service-heading">Promo Libur Nasional</h4>
          <p class="text-muted">Diskon 25%</p>
      </div>

      <div class="col-md-4">
          <img src="images/3.jpeg" alt="" width="225" height="150">
          <h4 class="service-heading">Promo Lebaran</h4>
          <p class="text-muted">Diskon 30%</p>
      </div>
      <div class="row">
        <div class="col-md-4"></div>
        <div class="col-md-4">
        <img src="images/4.jpeg" alt="" width="225">
        <h4 class="service-heading">Promo Ulang Tahun</h4>
          <p class="text-muted">Diskon 15%</p>
        </div>
      </div>

    </div>
  </div>
</section>
<hr class="half-rule">

     <!-- Partners -->
<section id="partners">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 text-center">
        <h2 class="section-heading text-uppercase" id="layanan">Layanan</h2>
      </div>
    </div>
    <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-4">
                            <img src="images/toilet.jpg" alt=""  width="300">
                            <h5 class="service-heading">Tersedia Toilet Bersih</h5>
                        </div>
                        <br>
                        <div class="col-md-4">
                            <img src="images/wifi.jpg" alt=""  width="300">
                            <h5 class="service-heading">Tersedia WiFi</h5>
                        </div>
                        <br>
                        <div class="col-md-4">
                            <img src="images/restoran.jpg" alt="" width="300" height="130">
                            <h5 class="service-heading">Tersedia Restoran Halal</h5>
                        </div>
                        <br>
                        <div class="col-md-2"></div>
                        <div class="col-md-4">
                            <img src="images/mushola.jpeg" alt="" width="300" height="140">
                            <h5 class="service-heading">Tersedia Mushola</h5>
                        </div>
                        <div class="col-md-4">
                            <img src="images/keamanan.png" alt="" width="300">
                            <h5 class="service-heading">Keamanan yang tinggi</h5>
                        </div>
                        
                    </div>
  </div>

<hr class="half-rule">
</section>



    <hr class="half-rule">