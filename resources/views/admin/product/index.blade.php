@extends('admin.layout.app')
@section('title', 'index')
@section('content')
    <div class="main-content" style="min-height: 562px;">
        <section class="section">
            <div class="section-body">
                <div class="row">
                    <div class="col-12 col-md-12 col-lg-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="col-12">
                                    <h4>Products</h4>
                                </div>
                            </div>
                            <div class="card-body table-striped table-bordered table-responsive">
                                <a class="btn btn-success mb-3" href="{{ route('product.create') }}">Add Product</a>
                                <table class="table text-center" id="table_id_events">
                                    <thead>
                                        <tr>
                                            <th>Sr.</th>
                                            <th>Product Name</th>
                                            <th>image</th>
                                            <th>Pharmacy Name</th>
                                            <th>Category</th>
                                            <th>Sub Category</th>
                                            <th>Brand</th>
                                            {{-- <th>Description</th> --}}
                                            <th>Type</th>
                                            <th>Status</th>
                                            <th scope="col">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($product as $products)
                                            <tr>
                                                <td>{{ $loop->iteration }}</td>
                                                <td>{{ $products->name }}</td>
                                                <td>
                                                    <img src="{{ asset($products->image) }}" alt="" height="50"
                                                        width="50" class="image">
                                                </td>
                                                {{-- <td>{{ $products->pharmacy->branch_name }}</td> --}}
                                                <td>
                                                    @if ($products->pharmacy)
                                                        {{ $products->pharmacy->branch_name }}
                                                    @else
                                                        N/A
                                                    @endif
                                                </td>
                                                <td>{{ $products->category->title }}</td>
                                                <td>{{ $products->subCategory->title }}</td>
                                                <td>
                                                    @if ($products->brand)
                                                        {{ $products->brand->title }}
                                                    @else
                                                        N/A
                                                    @endif
                                                </td>
                                                {{-- <td>{{ $products->description }}</td> --}}
                                                <td>{{ $products->type }}</td>
                                                <td>
                                                    @if ($products->is_active == 1)
                                                        <div class="badge badge-success badge-shadow">Active</div>
                                                    @else
                                                        <div class="badge badge-danger badge-shadow">DeActive</div>
                                                    @endif
                                                </td>
                                                <td
                                                    style="display: flex;align-items: center;justify-content: center;column-gap: 8px">
                                                    @if ($products->is_active == 1)
                                                        <a href="{{ route('products.status', ['id' => $products->id]) }}"
                                                            class="btn btn-success"><svg xmlns="http://www.w3.org/2000/svg"
                                                                width="24" height="24" viewBox="0 0 24 24"
                                                                fill="none" stroke="currentColor"
                                                                stroke-width="2"stroke-linecap="round"
                                                                stroke-linejoin="round"class="feather feather-toggle-left">
                                                                <rect x="1" y="5" width="22"
                                                                    height="14" rx="7" ry="7"></rect>
                                                                <circle cx="16" cy="12" r="3">
                                                                </circle>
                                                            </svg></a>
                                                    @else
                                                        <a href="{{ route('products.status', ['id' => $products->id]) }}"
                                                            class="btn btn-danger"><svg xmlns="http://www.w3.org/2000/svg"
                                                                width="24" height="24" viewBox="0 0 24 24"
                                                                fill="none" stroke="currentColor" stroke-width="2"
                                                                stroke-linecap="round" stroke-linejoin="round"
                                                                class="feather feather-toggle-right">
                                                                <rect x="1" y="5" width="22"
                                                                    height="14" rx="7" ry="7"></rect>
                                                                <circle cx="8" cy="12" r="3">
                                                                </circle>
                                                            </svg></a>
                                                    @endif

                                                    <button type="button" class="btn btn-primary product-data"
                                                        id="{{ $products->id }}" data-toggle="modal"
                                                        data-target=".bd-example-modal-lg">view</button>

                                                    <a class="btn btn-info"
                                                        href="{{ route('product.edit', $products->id) }}">Edit</a>
                                                    <form method="post"
                                                        action="{{ route('product.destroy', $products->id) }}">
                                                        @csrf
                                                        <input name="_method" type="hidden" value="DELETE">
                                                        <button type="submit" class="btn btn-danger btn-flat show_confirm"
                                                            data-toggle="tooltip">Delete</button>
                                                    </form>
                                                </td>
                                            </tr>
                                        @endforeach

                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-lg scrol" id="mymodal">
            </div>

        </div>
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
            $('#table_id_events').DataTable()

        })
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>
    <script type="text/javascript">
        $('.show_confirm').click(function(event) {
            var form = $(this).closest("form");
            var name = $(this).data("name");
            event.preventDefault();
            swal({
                    title: `Are you sure you want to delete this record?`,
                    text: "If you delete this, it will be gone forever.",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
                .then((willDelete) => {
                    if (willDelete) {
                        form.submit();
                    }
                });
        });

        $(document).on('click', '.product-data', function() {
            var id = $(this).attr('id');
            $.ajax({
                type: "GET",
                dataType: "json",
                headers: {
                    'X-CSRF-Token': '{{ csrf_token() }}',
                },
                url: "{{ url('admin/product/show') }}",
                data: {
                    'id': id,

                },
                success: function(response) {
                    $("#mymodal").html(response);

                }
            });
        });
    </script>

@endsection
