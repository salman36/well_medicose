@extends('pharmacy.layout.app')
@section('title', 'Profile')
@section('content')
<!-- Main Content -->
<div class="main-content">
    <section class="section">
        <div class="section-body">
            <div class="row mt-sm-4">
                <div class="col-12 col-md-12 col-lg-12">
                    <div class="card">
                        <div class="padding-20">
                            <ul class="nav nav-tabs" id="myTab2" role="tablist">
                                <a class="nav-item nav-link" id="category-1-nav" data-toggle="tab" href="#category-1"
                                    role="tab" data-analytics-track="click" data-analytics-key="seoTabClick"
                                    data-analytics-set-group="click,#nav-tabContent,seoTabContent-Top Vendors"
                                    aria-controls="category-1" aria-selected="false">About
                                </a>
                                <a class="nav-item nav-link active" id="category-2-nav" data-toggle="tab"
                                    href="#category-2" role="tab" data-analytics-track="click"
                                    data-analytics-key="seoTabClick"
                                    data-analytics-set-group="click,#nav-tabContent,seoTabContent-Top Vendors"
                                    aria-controls="category-2" aria-selected="false">Profile
                                </a>
                                <a class="nav-item nav-link" id="category-3-nav" data-toggle="tab" href="#category-3"
                                    role="tab" data-analytics-track="click" data-analytics-key="seoTabClick"
                                    data-analytics-set-group="click,#nav-tabContent,seoTabContent-Top Vendors"
                                    aria-controls="category-3" aria-selected="false">Account Details
                                </a>
                                <a class="nav-item nav-link" id="category-4-nav" data-toggle="tab" href="#category-4"
                                    role="tab" data-analytics-track="click" data-analytics-key="seoTabClick"
                                    data-analytics-set-group="click,#nav-tabContent,seoTabContent-Top Vendors"
                                    aria-controls="category-4" aria-selected="false">Packages
                                </a>
                            </ul>
                            <div class="tab-content tab-bordered" id="myTab3Content">
                                <div class="tab-pane fade unauth-job-list" id="category-1" role="tabpanel"
                                    aria-labelledby="category-1-nav" data-an-category="seoTabContent-Top Clients">
                                    <div class="row">
                                        <div class="col-md-3 col-6 b-r">
                                            <strong>Pharmacy Name</strong>
                                            <br>
                                            <p class="text-muted">{{ $data->branch_name }}</p>
                                        </div>
                                        <div class="col-md-3 col-6 b-r">
                                            <strong>Email</strong>
                                            <br>
                                            <p class="text-muted">{{ $data->email }}</p>
                                        </div>
                                        <div class="col-md-3 col-6 b-r">
                                            <strong>Branch no</strong>
                                            <br>
                                            <p class="text-muted">{{ $data->branch_no }}</p>
                                        </div>
                                        <div class="col-md-3 col-6 b-r">
                                            <strong>Address</strong>
                                            <br>
                                            <p class="text-muted">{{ $data->address }}</p>
                                        </div>
                                        <div class="col-md-3 col-6 b-r">
                                            <strong>License</strong>
                                            <br>
                                            <p class="text-muted">{{ $data->license }}</p>
                                        </div>
                                        <div class="col-md-3 col-6 b-r">
                                            <strong>Mobile</strong>
                                            <br>
                                            <p class="text-muted">{{ $data->phone_no }}</p>
                                        </div>
                                        <div class="col-md-3 col-6 b-r">
                                            <strong>Email</strong>
                                            <br>
                                            <p class="text-muted">{{ $data->email }}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade unauth-job-list  active show" id="category-2" role="tabpanel"
                                    aria-labelledby="category-2-nav" data-an-category="seoTabContent-Top Clients">
                                    <form method="post" action="{{ url('pharmacy/pharmacy-update-profile') }}"
                                        enctype="multipart/form-data">
                                        @csrf
                                        <div class="card-header">
                                            <h4>Edit Profile</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="form-group col-md-6 col-12">
                                                    <label>Name</label>
                                                    <input type="text" name="branch_name"
                                                        value="{{ $data->branch_name }}" class="form-control">
                                                    @error('branch_name')
                                                    <div class="text-danger">
                                                        Please fill in the Name
                                                    </div>
                                                    @enderror
                                                </div>
                                                <div class="form-group col-md-6 col-12">
                                                    <label>Email</label>
                                                    <input type="email" name="email" value="{{ $data->email }}"
                                                        class="form-control" readonly>
                                                    @error('email')
                                                    <div class="text-danger">
                                                        Please fill in the email
                                                    </div>
                                                    @enderror
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-6 col-12">
                                                    <label>Branch no</label>
                                                    <input type="text" name="branch_no" value="{{ $data->branch_no }}"
                                                        class="form-control">
                                                    @error('branch_no')
                                                    <div class="text-danger">
                                                        Please fill in the Name
                                                    </div>
                                                    @enderror
                                                </div>
                                                <div class="form-group col-md-6 col-12">
                                                    <label>Address</label>
                                                    <input type="text" placeholder="Address" name="address"
                                                        id="autocomplete" value="{{ $data->address }}"
                                                        class="form-control">
                                                    @error('address')
                                                    <div class="text-danger">{{ $message }}</div>
                                                    @enderror

                                                    <div class="form-group" id="latitudeArea">
                                                        <input type="text" id="latitude" name="latitude"
                                                            class="form-control d-none">
                                                    </div>

                                                    <div class="form-group" id="longtitudeArea">
                                                        <input type="text" name="longitude" id="longitude"
                                                            class="form-control d-none">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-6 col-12">
                                                    <label>License</label>
                                                    <input type="text" name="license" value="{{ $data->license }}"
                                                        class="form-control">
                                                    @error('license')
                                                    <div class="text-danger">
                                                        Please fill in the Name
                                                    </div>
                                                    @enderror
                                                </div>
                                                <div class="form-group col-md-6 col-12">
                                                    <label>Phone</label>
                                                    <input type="text" name="phone_no" value="{{ $data->phone_no }}"
                                                        class="form-control">
                                                    @error('phone_no')
                                                    <div class="text-danger">
                                                        Please fill in the Name
                                                    </div>
                                                    @enderror
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-6 col-12">
                                                    <label>Opening Time</label>
                                                    <input type="time" name="opening_time"
                                                        value="{{ $data->opening_time }}" class="form-control">
                                                    @error('opening_time')
                                                    <div class="text-danger">
                                                        Please fill in the Opening Time
                                                    </div>
                                                    @enderror
                                                </div>
                                                <!-- Add the closing_time field -->
                                                <div class="form-group col-md-6 col-12">
                                                    <label>Closing Time</label>
                                                    <input type="time" name="closing_time"
                                                        value="{{ $data->closing_time }}" class="form-control">
                                                    @error('closing_time')
                                                    <div class="text-danger">
                                                        Please fill in the Closing Time
                                                    </div>
                                                    @enderror
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-sm-6 pl-sm-0 pr-sm-3">
                                                    <div class="form-group mb-2">
                                                        <label>Pharmacy Image</label>
                                                        <input type="file" name="image" class="form-control">
                                                        @error('image')
                                                        <div class="text-danger">{{ $message }}</div>
                                                        @enderror
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="card-footer text-right">
                                                <button type="submit" class="btn btn-primary">Update</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="tab-pane fade unauth-job-list" id="category-3" role="tabpanel"
                                    aria-labelledby="category-3-nav" data-an-category="seoTabContent-Top Clients">
                                    <form method="POST" enctype="multipart/form-data"
                                        action="{{ isset($account) ? route('pharmacy.account_detail.update', $account->id) : route('pharmacy.account_detail.store') }}">
                                        @csrf
                                        @if (isset($account))
                                        @method('post')
                                        @endif
                                        <div class="card-header">
                                            <h4>{{ isset($account) ? 'Edit' : 'Add' }} Account Detail</h4>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="form-group col-md-6 col-12">
                                                    <label>Bank Name</label>
                                                    <input type="text" name="bank_name"
                                                        value="{{ isset($account) ? $account->bank_name : old('bank_name') }}"
                                                        class="form-control">
                                                    @error('bankName')
                                                    <div class="text-danger">
                                                        {{ $message }}
                                                    </div>
                                                    @enderror
                                                </div>
                                                <div class="form-group col-md-6 col-12">
                                                    <label>Account Holder Name</label>
                                                    <input type="text" name="account_holder_name"
                                                        value="{{ isset($account) ? $account->account_holder_name : old('account_holder_name') }}"
                                                        class="form-control">
                                                    @error('account_holder_name')
                                                    <div class="text-danger">
                                                        {{ $message }}
                                                    </div>
                                                    @enderror
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="form-group col-md-6 col-12">
                                                    <label>Account Number</label>
                                                    <input type="number" name="account_no"
                                                        value="{{ isset($account) ? $account->account_no : old('account_no') }}"
                                                        class="form-control">
                                                    @error('account_no')
                                                    <div class="text-danger">
                                                        {{ $message }}
                                                    </div>
                                                    @enderror
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-footer text-center">
                                            <button type="submit" class="btn btn-primary">{{ isset($account) ? 'Update'
                                                : 'Create' }}</button>
                                        </div>
                                    </form>
                                </div>
                                <div class="tab-pane fade unauth-job-list" id="category-4" role="tabpanel"
                                    aria-labelledby="category-4-nav" data-an-category="seoTabContent-Top Clients">
                                    <div class="row">
                                        <div class="col-md-3 col-6 b-r">
                                            <strong>Remaining days</strong>
                                            <br>
                                            <p class="text-muted">
                                                @if ($daysDifference)
                                                {{ $daysDifference }}
                                                @endif
                                            </p>
                                        </div>
                                        <div class="col-md-3 col-6 b-r">
                                            <strong>Validity</strong>
                                            <br>
                                            <p class="text-muted">
                                                @if ($pharmacies->subscription)
                                                {{ date('d M Y', strtotime($pharmacies->subscription)) }}
                                                @endif
                                            </p>
                                        </div>
                                        <div class="card-footer text-center">
                                            <a class="btn btn-success mb-3"
                                                href="{{ route('pharmacy.package') }}">purchase</a>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>
</div>

@endsection
@section('js')
@if (\Illuminate\Support\Facades\Session::has('message'))
<script>
    toastr.success('{{ \Illuminate\Support\Facades\Session::get('message') }}');
</script>
@endif
<script>
        $(document).ready(function() {
    // Add click event handler to the tab links
    $('.nav-link').click(function(e) {
        // Check if the clicked link is a tab link
        if ($(this).attr('data-toggle') === 'tab') {
            e.preventDefault(); // Prevent default link behavior

            // Get the target tab content ID from the href attribute
            var target = $(this).attr('href');

            // Show the target tab content and hide others
            $(target).addClass('active show').siblings().removeClass('active show');

            // Update the active class for the clicked tab link
            $(this).addClass('active').siblings().removeClass('active');
        }
    });
});
</script>

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
