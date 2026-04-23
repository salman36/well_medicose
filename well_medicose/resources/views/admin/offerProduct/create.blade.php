@extends('admin.layout.app')
@section('title', 'Dashboard')
@section('content')

    <body>
        <div class="main-content" style="min-height: 562px;">
            <section class="section">
                <div class="section-body">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4>Add Offer Product</h4>
                                </div>
                                <form action="{{route('offerProduct.store')}}" method="POST" enctype="multipart/form-data">
                                    @csrf
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label>Pharmacy</label>
                                            <select class="form-control" name="pharmacy_id" id="pharmacy-dropdown">
                                                <option value="" disabled selected>Select Pharmacy</option>
                                                @foreach ($pharmacies as $pharmacy)
                                                    <option value="{{ $pharmacy->id }}">{{ $pharmacy->branch_name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                            @error('pharmacy_id')
                                                <div class="text-danger">{{ $message }}</div>
                                            @enderror
                                        </div>
                                        <div class="form-group">
                                            <label>Product</label>
                                            <select class="form-control" name="product_id" id="product-dropdown">
                                                <option value="" disabled selected>Select Product</option>
                                            </select>
                                            @error('product_id')
                                                <div class="text-danger">{{ $message }}</div>
                                            @enderror
                                        </div>
                                        <div class="form-group">
                                            <label>DueDate</label>
                                            <input type="date" placeholder="enter date" name="date"
                                            id="date" class="form-control" required>
                                            @error('date')
                                                <div class="text-danger">{{ $message }}</div>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="card-footer text-right">
                                        <button class="btn btn-primary mr-1" type="submit">Add</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
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
    <script>
        $(document).ready(function() {
            $('#table_id_events').DataTable()
        });

        $(document).ready(function() {
            $('#pharmacy-dropdown').on('change', function() {
                var pharmacy_id = this.value;
                $("#product-dropdown").html('');
                $.ajax({
                    url: "{{ url('admin/get-Products-by-Pharmacy') }}",
                    type: "POST",
                    data: {
                        pharmacy_id: pharmacy_id,
                        _token: '{{ csrf_token() }}'
                    },
                    dataType: 'json',
                    success: function(result) {
                        $('#product-dropdown').html(
                            '<option value="" disabled selected>Select Product</option>'
                        );
                        $.each(result, function(key, value) {
                            $("#product-dropdown").append('<option value="' + value.id +
                                '">' + value.name + '</option>');
                        });
                    }
                });
            });
        });
    </script>
@endsection
