@extends('admin.layout.app')
@section('title', 'Dashboard')
@section('content')

    <body>
        <div class="main-content">
            <section class="section">
                <div class="section-body">
                    <a class="btn btn-primary mb-3" href="{{ url()->previous() }}">Back</a>
                    {{-- <form id="add_student" action="{{ route('pharmacy.update', $data->id) }}" method="POST"
                        enctype="multipart/form-data"> --}}
                    <form id="add_student" action="{{ route('pharmacy.update', $data->id) }}" method="POST"
                        enctype="multipart/form-data">
                        @method('PATCH')
                        @csrf
                        <div class="row">
                            <div class="col-12 col-md-12 col-lg-12">
                                <div class="card">
                                    <h4 class="text-center my-4">Edit Pharmacy</h4>
                                    <div class="row mx-0 px-4">
                                        <div class="col-sm-6 pl-sm-0 pr-sm-3">
                                            <div class="form-group mb-2">
                                                <label>Pharmacy Name</label>
                                                <input type="text" placeholder="branch Name" name="branch_name"
                                                    id="branch_name" value="{{ $data->branch_name }}" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-sm-6 pl-sm-0 pr-sm-3">
                                            <div class="form-group mb-2">
                                                <label>Email</label>
                                                <input type="email" placeholder="email" name="email" id="email"
                                                    value="{{ $data->email }}" class="form-control" readonly>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mx-0 px-4">
                                        <div class="col-sm-6 pl-sm-0 pr-sm-3">
                                            <div class="form-group mb-2">
                                                <label>Branch no</label>
                                                <input type="number" placeholder="branch no" name="branch_no"
                                                    id="branch_no" value="{{ $data->branch_no }}" class="form-control">

                                            </div>
                                        </div>
                                        <div class="col-sm-6 pl-sm-0 pr-sm-3">
                                            <div class="form-group mb-2">
                                                <label>Address</label>
                                                <input type="text" placeholder="Address" name="address" id="autocomplete"
                                                    value="{{ $data->address }}" class="form-control">
                                                @error('address')
                                                    <div class="text-danger">{{ $message }}</div>
                                                @enderror

                                                <div class="form-group" id="latitudeArea">
                                                    <input type="text" id="latitude" name="latitude"
                                                        value="{{ $data['latitude'] }}"
                                                        class="form-control d-none">
                                                </div>

                                                <div class="form-group" id="longtitudeArea">
                                                    <input type="text" name="longitude" id="longitude"
                                                        value="{{ $data['longitude'] }}"
                                                        class="form-control d-none">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mx-0 px-4">
                                        <div class="col-sm-6 pl-sm-0 pr-sm-2">
                                            <div class="form-group mb-3">
                                                <label>License</label>
                                                <input type="text" placeholder="license" name="license" id="license"
                                                    value="{{ $data->license }}" class="form-control" />
                                            </div>

                                        </div>
                                        <div class="col-sm-6 pl-sm-0 pr-sm-2">
                                            <div class="form-group mb-3">
                                                <label>Phone no</label>
                                                <input type="number" placeholder="phone_no" name="phone_no" id="phone_no"
                                                    value="{{ $data->phone_no }}" class="form-control" />
                                            </div>

                                        </div>
                                    </div>
                                    <div class="row mx-0 px-4">
                                        <div class="col-sm-6 pl-sm-0 pr-sm-2">
                                            <div class="form-group mb-3">
                                                <label>Opening Time</label>
                                                <input type="time" name="opening_time"
                                                value="{{ \Carbon\Carbon::parse($data->opening_time)->format('H:i') }}"class="form-control">
                                                @error('opening_time')
                                                    <div class="text-danger">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="col-sm-6 pl-sm-0 pr-sm-2">
                                            <div class="form-group mb-3">
                                                <label>Closing Time</label>
                                                <input type="time" name="closing_time"
                                                value="{{ \Carbon\Carbon::parse($data->closing_time)->format('H:i') }}" class="form-control">
                                                @error('closing_time')
                                                    <div class="text-danger">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mx-0 px-4">
                                        <div class="col-sm-6 pl-sm-0 pr-sm-3">
                                            <div class="form-group mb-2">
                                                <label>Choose Image</label>
                                                <input type="file" name="image" class="form-control">
                                                @error('image')
                                                    <div class="text-danger">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer text-center row">
                                        <div class="col">
                                            <button type="submit" class="btn btn-success mr-1 btn-bg"
                                                id="submit">Update</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
        </div>
    </body>
@endsection

@section('js')
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
