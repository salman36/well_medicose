<!DOCTYPE html>
<html lang="en">
<!-- auth-login.html  21 Nov 2019 03:49:32 GMT -->

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
    <title>Pharmacy - @yield('title')</title>
     <!-- Developed By Ranglerz -->
    <link rel="stylesheet" href="https://www.ranglerz.com/cost-to-make-a-web-ios-or-android-app-and-how-long-does-it-take.php">
    <!-- General CSS Files -->
    <link rel="stylesheet" href="{{ asset('public/admin/assets/css/app.min.css') }}">
    <link rel="stylesheet" href="{{ asset('public/admin/assets/bundles/bootstrap-social/bootstrap-social.css') }}">
    <!-- Custom style CSS -->
    <link rel="stylesheet" href="{{ asset('public/admin/assets/toastr/css/toastr.css') }}">
    <!-- Template CSS -->
    <link rel="stylesheet" href="{{ asset('public/admin/assets/css/style.css') }}">
    <link rel="stylesheet" href="{{ asset('public/admin/assets/css/components.css') }}">
    <!-- Custom style CSS -->
    <link rel="stylesheet" href="{{ asset('public/admin/assets/css/custom.css') }}">
    <link rel='shortcut icon' type='image/x-icon' href='public/admin/assets/images/favicon.ico' />
    @yield('style')
</head>

<body>
    <div class="loader"></div>
    <div id="app">
        @yield('content')
    </div>
    <!-- General JS Scripts -->
    <script src="{{ asset('public/admin/assets/js/app.min.js') }}"></script>
    <script src="{{ asset('public/admin/assets/toastr/js/toastr.min.js') }}"></script>
    <!-- Template JS File -->
    <script src="{{ asset('public/admin/assets/js/scripts.js') }}"></script>
    <!-- Custom JS File -->

    <script src="{{ asset('public/admin/assets/js/custom.js') }}"></script>
    <!-- Sweet Alert -->
    <script src="{{ asset('//cdn.jsdelivr.net/npm/sweetalert2@11') }}"></script>
</body>
<!-- auth-login.html  21 Nov 2019 03:49:32 GMT -->
@yield('script')

<script>
    const Toast = Swal.mixin({
        toast: true,
        position: 'top-end',
        showConfirmButton: false,
        timer: 3000,
        width: '27rem',
        timerProgressBar: true,
        didOpen: (toast) => {
            toast.addEventListener('mouseenter', Swal.stopTimer)
            toast.addEventListener('mouseleave', Swal.resumeTimer)
        }
    })
    @if (Session()->has('message'))
        var type = "{{ Session::get('alert') }}";
        switch (type) {
            case 'info':
                Toast.fire({
                    icon: 'info',
                    title: '{{ Session::get('message') }}'
                })
                break;
            case 'success':
                Toast.fire({
                    icon: 'success',
                    title: '{{ Session::get('message') }}'
                })
                break;
            case 'warning':
                Toast.fire({
                    icon: 'warning',
                    title: '{{ Session::get('message') }}'
                })
                break;
            case 'error':
                Toast.fire({
                    icon: 'error',
                    title: '{{ Session::get('message') }}'
                })
                break;
        }
    @endif
</script>

</html>
