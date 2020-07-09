<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- CSRF Token -->
  <meta name="csrf-token" content="{{ csrf_token() }}">
  <title>{{ config('app.name', 'Laravel') }}</title>
  <!-- Scripts -->
  <script src="{{ asset('js/app.js') }}" defer></script>
  <link rel="shortcut icon" type="image/png" href="assets/images/icon/favicon.ico">
    <link rel="stylesheet" href="{{ asset('assets/css/font-awesome.min.css')}}">
    <link rel="stylesheet" href="{{ asset('assets/css/themify-icons.css')}}">
    <link rel="stylesheet" href="{{ asset('assets/css/metisMenu.css')}}">
    <link rel="stylesheet" href="{{ asset('assets/css/owl.carousel.min.css')}}">
    <link rel="stylesheet" href="{{ asset('assets/css/slicknav.min.css')}}">
    <!-- amchart css -->
    {{-- <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" /> --}}
    <!-- others css -->
    <link rel="stylesheet" href="{{ asset('assets/css/typography.css')}}">
    <link rel="stylesheet" href="{{ asset('assets/css/default-css.css')}}">
    <link rel="stylesheet" href="{{ asset('assets/css/styles.css')}}">
    <link rel="stylesheet" href="{{ asset('assets/css/responsive.css')}}">
    <!-- modernizr css -->
    <script src="{{ asset('assets/js/vendor/modernizr-2.8.3.min.js')}}" defer></script>
  <!-- Fonts -->
  {{-- <link rel="dns-prefetch" href="https://fonts.gstatic.com"> --}}
  {{-- <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css"> --}}
  <!-- Styles -->
  <link href="{{ asset('css/app.css') }}" rel="stylesheet">
</head>
<body>
  <div id="app">
    @yield('content')
  </div>
    <!-- bootstrap 4 js -->
    {{-- <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script> --}}
    <script src="{{ asset('assets/js/owl.carousel.min.js')}}" defer></script>
    <script src="{{ asset('assets/js/metisMenu.min.js')}}" defer></script>
    <script src="{{ asset('assets/js/jquery.slimscroll.min.js')}}" defer></script>
    <script src="{{ asset('assets/js/jquery.slicknav.min.js')}}" defer></script>
    
    <!-- others plugins -->
    <script src="{{ asset('assets/js/plugins.js')}}" defer></script>
    <script src="{{ asset('assets/js/scripts.js')}}" defer></script>
</body>
</html>