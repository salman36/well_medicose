@extends('pharmacy.auth.layout.app')
@section('title', 'Login')
@section('content')
    <section class="section">
        <div class="container mt-5">
            <div class="row">
                <div class="col-12 col-sm-8 offset-sm-2 col-md-6 offset-md-3 col-lg-6 offset-lg-3 col-xl-4 offset-xl-4">
                    <div class="card card-primary">
                        <div class="card-header">
                            <h4>Login</h4>
                        </div>
                        <div class="card-body">
                            <form id="" action="confirmtoken" method="POST">
                                @csrf
                                <h3 class="text-center mb-4">OTP</h3>
                                <p class="d-block mb-4">Please enter 4 digit-verification code, we sent VIA Email or Phone Number, thank
                                    you</p>
                                <div class="form-group">
                                    <div class="row mx-0 mb-2 error-message-box">
                                        <div class="col-2 px-1">
                                            <input type="text" autocomplete="off" maxLength="1" name="digit_1" size="1" min="0"
                                                max="9" pattern="[0-9]{1}" class="form-control verify-field" required />
                                        </div>
                                        <div class="col-2 px-1">
                                            <input type="text" autocomplete="off" maxLength="1" name="digit_2" size="1" min="0"
                                                max="9" pattern="[0-9]{1}" class="form-control verify-field" required />
                                        </div>
                                        <div class="col-2 px-1">
                                            <input type="text" autocomplete="off" maxLength="1" name="digit_3" size="1" min="0"
                                                max="9" pattern="[0-9]{1}" class="form-control verify-field" required />
                                        </div>
                                        <div class="col-2 px-1">
                                            <input type="text" autocomplete="off" maxLength="1" name="digit_4" size="1" min="0"
                                                max="9" pattern="[0-9]{1}" class="form-control verify-field" required />
                                        </div>
                                    </div>
                                </div>
                                <div class="mt-5">
                                    <button type="submit" class="w-100 btn-bg">Submit</button>
                                </div>
                            </form>
                            <div class="mt-5 text-muted text-center">
                                Register Pharmacy? <a href="{{ route('registerpage') }}">Register</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
@section('script')
    @if (\Illuminate\Support\Facades\Session::has('message'))
        <script>
            toastr.success('{{ \Illuminate\Support\Facades\Session::get('message') }}');
        </script>
    @endif
@endsection
