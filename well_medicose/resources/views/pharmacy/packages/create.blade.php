@extends('pharmacy.layout.app')
@section('title', 'Dashboard')
@section('content')
    <!-- Main Content -->
    <div class="main-content">
        <section class="section">
                @csrf
                <div class="row mb-3">
                    <div class="container">
                        <div class="row">
                            @foreach ($packages as $package)
                                <div class="col-lg-4">
                                    <div class="card">
                                        <div class="card-body">
                                            <h5 class="card-title">{{ $package->title }}</h5>
                                            <h3 class="card-text">Validity: {{ $package->validity }}</h3>
                                            <h3 class="card-text">Price: {{ $package->price }}</h3>
                                            <form action="{{route('pharmacy.purchase.package')}}" method="POST">
                                                @csrf
                                                <input type="hidden" name="id" value="{{ $package->id }}">
                                                <button type="submit" class="btn btn-primary">Buy Now</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
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
@endsection

