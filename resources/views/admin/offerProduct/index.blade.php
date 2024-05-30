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
                                     <h4>Featured Products</h4>
                                 </div>
                             </div>
                             <div class="card-body table-responsive">
                                 <a class="btn btn-success mb-3" href="{{ route('offerProduct.create') }}">Add Featured</a>
                                 <table class="table table-striped table-bordered text-center" id="table_id_events">
                                     <thead>
                                         <tr>
                                             <th>Sr.</th>
                                             <th>Product Name</th>
                                             <th>Pharmacy Name</th>
                                             <th>Category</th>
                                             <th>Sub Category</th>
                                             <th>Brand</th>
                                             <th>Type</th>
                                             <th>Due Date</th>
                                             <th>Actions</th>
                                         </tr>
                                     </thead>
                                     <tbody>
                                         @foreach ($products as $product)
                                             <tr>
                                                <td>{{ $loop->iteration }}</td>
                                                 <td>{{ $product->name }}</td>
                                                 <td>{{ $product->pharmacy->branch_name }}</td>
                                                 <td>{{ $product->category->title }}</td>
                                                 <td>{{ $product->subCategory->title }}</td>
                                                 {{-- <td>{{ $product->brand->title }}</td> --}}
                                                 <td>{{ optional($product->brand)->title }}</td>
                                                 <td>{{ $product->type }}</td>
                                                 <td>
                                                     @foreach ($product->offerProduct as $offerProduct)
                                                         {{ date('d-m-Y',strtotime ($offerProduct->date)) }}
                                                     @endforeach
                                                 </td>

                                                 <td
                                                     style="display: flex;align-items: center;justify-content: center;column-gap: 8px">

                                                     <button type="button" class="btn btn-primary featrue-dproduct-data"
                                                         id="{{ $product->id }}" data-toggle="modal"
                                                         data-target=".bd-example-modal-lg">view</button>
                                                     <form method="post"
                                                         action="{{ route('offerProduct.destroy', $product->id) }}">
                                                         @csrf
                                                         @method('DELETE')
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
     </div>
     </section>

     <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
         aria-hidden="true">
         <div class="modal-dialog modal-lg scrol" id="featuredProducr">
         </div>
     </div>

 @endsection

 @section('js')
     @if (\Illuminate\Support\Facades\Session::has('message'))
         <script>
             toastr.success('{{ \Illuminate\Support\Facades\Session::get('message') }}');
         </script>
     @endif

     <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>
     <script type="text/javascript">
         $(document).ready(function() {
             $('#table_id_events').DataTable();
         });

         $('.show_confirm').click(function(event) {
             var form = $(this).closest("form");
             event.preventDefault();
             swal({
                 title: 'Are you sure you want to delete this record?',
                 text: 'If you delete this, it will be gone forever.',
                 icon: 'warning',
                 buttons: true,
                 dangerMode: true,
             }).then((willDelete) => {
                 if (willDelete) {
                     form.submit();
                 }
             });
         });


         $(document).on('click', '.featrue-dproduct-data', function() {
             var id = $(this).attr('id');
             // alert('id');
             $.ajax({
                 type: "GET",
                 dataType: "json",
                 headers: {
                     'X-CSRF-Token': '{{ csrf_token() }}',
                 },
                 url: "{{ url('admin/offerProduct/show') }}",
                 data: {
                     'id': id,

                 },
                 success: function(response) {
                     $("#featuredProducr").html(response);
                 }
             });
         });
     </script>
 @endsection
