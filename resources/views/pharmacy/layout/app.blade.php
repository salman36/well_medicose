<!DOCTYPE html>
<html lang="en">
<!-- index.html  21 Nov 2019 03:44:50 GMT -->
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
    <title>Pharmacy Dashboard</title>
    <!-- Developed By Ranglerz -->
    <link rel="stylesheet" href="https://www.ranglerz.com/cost-to-make-a-web-ios-or-android-app-and-how-long-does-it-take.php">
    <!-- General CSS Files -->
    <link rel="stylesheet" href="{{ asset('public/admin/assets/css/app.min.css') }}">
    <!-- Template CSS -->
    <link rel="stylesheet" href="{{ asset('public/admin/assets/css/style.css') }}">
    <link rel="stylesheet" href="{{ asset('public/admin/assets/css/components.css') }}">
    <!-- Custom style CSS -->
    <link rel="stylesheet" href="{{asset('public/admin/assets/toastr/css/toastr.css')}}">
    <link rel="stylesheet" href="{{ asset('public/admin/assets/css/custom.css') }}">
    {{-- <link rel='shortcut icon' type='image/x-icon' href='{{ asset('public/admin/assets/images/logo1.png') }}' /> --}}
    <link rel="stylesheet" href="{{ asset('public/admin/assets/css/datatables.css') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


</head>

<body>
<div class="loader"></div>

<div id="app">
    <div class="main-wrapper main-wrapper-1">
        @include('pharmacy.common.header')
        @include('pharmacy.common.side_menu')
        @yield('content')
        @include('pharmacy.common.footer')
    </div>
</div>
<!-- General JS Scripts -->
<script src="{{ asset('public/admin/assets/js/app.min.js')}}"></script>
<!-- JS Libraies -->
<script src="{{ asset('public/admin/assets/bundles/apexcharts/apexcharts.min.js')}}"></script>
<!-- Page Specific JS File -->
<script src="{{ asset('public/admin/assets/js/page/index.js')}}"></script>
<!-- Template JS File -->
<script src="{{ asset('public/admin/assets/js/scripts.js')}}"></script>
<script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
<!-- Custom JS File -->
<script src="{{ asset('public/admin/assets/js/custom.js')}}"></script>
<script src="{{asset('public/admin/assets/toastr/js/toastr.min.js')}}"></script>
<script src="{{ asset('public/admin/assets/js/datatables.js') }}"></script>
<script>
    /*toastr popup function*/
    function toastrPopUp() {
        toastr.options = {
            "closeButton": true,
            "newestOnTop": false,
            "progressBar": true,
            "positionClass": "toast-top-right",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "3000",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
    }

    /*toastr popup function*/
    toastrPopUp();


</script>
@yield('js')
</body>


<!-- index.html  21 Nov 2019 03:47:04 GMT -->
</html>
