@extends('layouts.app')

@section('content')
    <div class="login-area">
        <div class="container">
            <div class="login-box ptb--100">
                <form autocomplete="on" action="{{route('login')}}" method="post">
                    @csrf
                    <div class="login-form-head">
                        <h4>Sign In</h4>
                    </div>
                    <div class="login-form-body">
                        <div class="form-gp">
                            <label for="email">Email address</label>
                            <input id="email" type="email" name="email" class="@error('email') is-invalid @enderror" required>
                            @error('email')
                                <div class="text-danger">{{ $message }}</div>
                            @enderror
                            <i class="ti-email"></i>
                            <div class="text-danger"></div>
                        </div>
                        <div class="form-gp">
                            <label for="password">Password</label>
                            <input type="password" id="password" name="password" class="@error('password') is-invalid @enderror" required >
                            <i class="ti-lock"></i>
                            @error('password')
                                <div class="text-danger">{{ $message }}</div>
                            @enderror
                        </div>
                        <div class="submit-btn-area">
                            <button id="form_submit" type="submit">Submit <i class="ti-arrow-right"></i></button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
