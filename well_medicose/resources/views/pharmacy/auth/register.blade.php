@extends('pharmacy.auth.layout.app')
@section('title', 'Register')
@section('style')
<style>
    /* Chrome, Safari, Edge, Opera */
    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
    }

    /* Firefox */
    input[type=number] {
        -moz-appearance: textfield;
    }
</style>
@endsection
@section('content')
<section class="section">
    <div class="container mt-5">
        <div class="row">
            <div class="col-12 col-sm-10 offset-sm-1 col-md-8 offset-md-2 col-lg-8 offset-lg-2 col-xl-8 offset-xl-2">
                <div class="card card-primary">
                    <div class="card-header d-flex justify-content-center">
                        <h4>Register</h4>
                    </div>
                    <div class="card-body">
                        <form method="POST" action="{{route('register')}}" class="needs-validation" novalidate=""
                            enctype="multipart/form-data">
                            @csrf
                            <div class="row">
                                <div class="form-group col-6">
                                    <label for="name">Name</label>
                                    <input id="name" type="text" class="form-control" name="branch_name" tabindex="1"
                                        autofocus>
                                    @error('branch_name')
                                    <span class="text-danger">{{ $message }}</span>
                                    @enderror
                                </div>
                                <div class="form-group col-6">
                                    <label for="email">Email</label>
                                    <input id="email" type="email" class="form-control" name="email" tabindex="1"
                                        autofocus>
                                    @error('email')
                                    <span class="text-danger">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-6">
                                    <label for="phone">Phone</label>
                                    <input id="phone" type="number" class="form-control" name="phone_no" tabindex="1"
                                        autofocus>
                                    @error('phone_no')
                                    <span class="text-danger">{{ $message }}</span>
                                    @enderror
                                </div>
                                <div class="form-group col-6">
                                    <label for="barnch" class="control-label">Branch_no</label>
                                    <input id="branch_no" type="number" class="form-control" name="branch_no"
                                        tabindex="2">
                                    @error('branch_no')
                                    <span class="text-danger">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-6">
                                    <label>Address</label>
                                    <input type="text" placeholder="Address" name="address" id="autocomplete"
                                        value="{{ old('address') }}" class="form-control">
                                    @error('address')
                                    <div class="text-danger">{{ $message }}</div>
                                    @enderror

                                    <div class="form-group" id="latitudeArea">
                                        <input type="text" id="latitude" name="latitude" class="form-control d-none">
                                    </div>

                                    <div class="form-group" id="longtitudeArea">
                                        <input type="text" name="longitude" id="longitude" class="form-control d-none">
                                    </div>
                                </div>
                                <div class="form-group col-6">
                                    <label for="license" class="control-label">License</label>
                                    <input id="branch_no" type="text" class="form-control" name="license" tabindex="2">
                                    @error('license')
                                    <span class="text-danger">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-6">
                                    <label for="opening_time">Opening Time</label>
                                    <input id="opening_time" type="time" class="form-control" name="opening_time"
                                        tabindex="1" autofocus>
                                    @error('opening_time')
                                    <span class="text-danger">{{ $message }}</span>
                                    @enderror
                                </div>
                                <div class="form-group col-6">
                                    <label for="closing_time" class="control-label">Closing Time</label>
                                    <input id="closing_time" type="time" class="form-control" name="closing_time"
                                        tabindex="2">
                                    @error('closing_time')
                                    <span class="text-danger">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-6">
                                    <label for="password" class="control-label">Password</label>
                                    <input id="password" type="password" class="form-control" name="password"
                                        tabindex="2">
                                    @error('password')
                                    <span class="text-danger">{{ $message }}</span>
                                    @enderror
                                </div>
                                <div class="form-group col-6">
                                    <label for="password" class="control-label">Password Confirmation</label>
                                    <input id="password" type="password" class="form-control"
                                        name="password_confirmation" tabindex="2">
                                    @error('password_confirmation')
                                    <span class="text-danger">{{ $message }}</span>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-sm-6 pl-sm-0 pr-sm-3">
                                <div class="form-group mb-2">
                                    <label>Pharmacy Image</label>
                                    <input type="file" name="image" class="form-control">
                                    @error('image')
                                    <div class="text-danger">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-primary btn-lg btn-block" tabindex="4">
                                    Register
                                </button>
                            </div>
                        </form>
                        {{--<div class="text-center mt-4 mb-3">
                            <div class="text-job text-muted">Login With Social</div>
                        </div>
                        <div class="row sm-gutters">
                            <div class="col-6">
                                <a class="btn btn-block btn-social btn-facebook">
                                    <span class="fab fa-facebook"></span> Facebook
                                </a>
                            </div>
                            <div class="col-6">
                                <a class="btn btn-block btn-social btn-twitter">
                                    <span class="fab fa-twitter"></span> Twitter
                                </a>
                            </div>
                        </div>--}}
                    </div>
                </div>
                {{--<div class="mt-5 text-muted text-center">
                    Don't have an account? <a href="{{ route('admin.register') }}">Create One</a>
                </div>--}}
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

<script type="text/javascript"
    src="https://maps.google.com/maps/api/js?key={{ env('GOOGLE_MAP_KEY') }}&libraries=places"></script>
<script>
    $(document).ready(function() {
        $("#latitudeArea").addClass("d-none");
        $("#longtitudeArea").addClass("d-none");
    });
</script>
<script>
    google.maps.event.addDomListener(window, 'load', initialize);

    function initialize() {
        var input = document.getElementById('autocomplete');
        var autocomplete = new google.maps.places.Autocomplete(input);

        autocomplete.addListener('place_changed', function() {
            var place = autocomplete.getPlace();
            $('#latitude').val(place.geometry['location'].lat());
            $('#longitude').val(place.geometry['location'].lng());

            $("#latitudeArea").removeClass("d-none");
            $("#longtitudeArea").removeClass("d-none");
        });
    }
</script>
@endsection
