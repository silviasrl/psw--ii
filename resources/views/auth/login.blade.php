@extends('layouts.app')

@section('content')

@push('scripts')
<script type="text/javascript">
  $(document).ready(function(){
    $('#eye').hover(function(){
      $('#password').attr('type', 'text');
    }, function(){
      $('#password').attr('type', 'password');
    });
  });
</script>
@endpush

<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Silahkan Login</a>
                </div>

                <div class="panel-body">
                    @if(Session::has('alert'))
                      <div class="alert alert-danger">
                          {{ Session::get('alert') }}
                          @php
                          Session::forget('alert');
                          @endphp
                      </div>
                    @endif
                    <form class="form-horizontal" method="POST" action="{{ route('login') }}">
                        {{ csrf_field() }}

                        <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                            <label for="email" class="col-md-4 control-label">Masukkan E-mail</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control" name="email" value="{{ old('email') }}" required autofocus>

                                @if ($errors->has('email'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
                            <label for="password" class="col-md-4 control-label">Masukkan Password</label>

                            <div class="col-md-6">
                              <div class="input-group">
                                <input id="password" type="password" class="form-control" name="password" required>
                                @if ($errors->has('password'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                              </div>
                            </div>
                        </div>

                     

                        <div class="form-group">
                            <div class="col-md-8 col-md-offset-4">
                                <button type="submit" class="btn btn-primary">
                                    Login
                                </button>

                               
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<hr class="half-rule">
@endsection
