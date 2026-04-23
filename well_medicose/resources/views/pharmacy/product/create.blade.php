@extends('pharmacy.layout.app')
@section('title', 'Dashboard')
@section('content')

<body>
    <div class="main-content">
        <section class="section">
            <div class="section-body">
                <a class="btn btn-primary mb-3" href="{{ url()->previous() }}">Back</a>
                <form id="add_student" action="{{ route('pharmacy.pharmacyproduct.store') }}" method="POST"
                    enctype="multipart/form-data">
                    @csrf
                    <div class="">
                        <div class="row">
                            <div class="col-12 col-md-12 col-lg-12">
                                <div class="card">
                                    <h4 class="text-center my-4">Add Products</h4>

                                    <div class="container">
                                        <div class="row " style="width: 90%; margin:auto">
                                            <div class="col-sm-6 ">
                                                <div class="form-group mb-2">
                                                    <label>Product Name</label>
                                                    <input type="text" placeholder="Enter Product Name" name="name"
                                                        id="name" class="form-control">
                                                    @error('name')
                                                    <div class="text-danger">{{ $message }}</div>
                                                    @enderror
                                                </div>
                                            </div>

                                            <div class="col-sm-6 ">
                                                <div class="form-group mb-2">
                                                    <label>Category</label>
                                                    <select id="category-dropdown" class="form-control"
                                                        name="category_id">
                                                        <option value="" disabled selected>Select Category</option>
                                                        @foreach ($categories as $category)
                                                        <option value="{{ $category->id }}">
                                                            {{ $category->title }}</option>
                                                        @endforeach
                                                    </select>
                                                    @error('category_id')
                                                    <div class="text-danger">{{ $message }}</div>
                                                    @enderror
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container">
                                        <div class="row" style="width: 90%; margin:auto">
                                            <div class="col-sm-6 ">
                                                <div class="form-group mb-2">
                                                    <label>Sub Category</label>
                                                    <select class="form-control" name="sub_category_id"
                                                        id="subcategory-dropdown">
                                                    </select>
                                                    @error('sub_category_id')
                                                    <div class="text-danger">{{ $message }}</div>
                                                    @enderror
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group mb-2">
                                                    <label>Brand(Optional)</label>
                                                    <select class="form-control" name="brand_id">
                                                        <option value="" disabled selected>Select Brand</option>
                                                        @foreach ($brand as $brands)
                                                        <option value="{{ $brands->id }}">{{ $brands->title }}
                                                        </option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container">
                                        <div class="row" style="width: 90%; margin:auto">
                                            <div class="col-6">
                                                <div class="form-group mb-2">
                                                    <label>Type</label>
                                                    <select name="type" class="form-control">
                                                        <option value="" disabled selected>Select Type</option>
                                                        <option value="Tablets">Tablets</option>
                                                        <option value="Capsules">Capsules</option>
                                                        <option value="Injection">Injection</option>
                                                        <option value="Syrup">Syrup</option>
                                                        <option value="Suspension">Suspension</option>
                                                    </select>
                                                    @error('type')
                                                    <div class="text-danger">{{ $message }}</div>
                                                    @enderror
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group mb-2">
                                                    <label>Choose Image</label>
                                                    <input type="file" name="image" class="form-control">
                                                    @error('image')
                                                    <div class="text-danger">{{ $message }}</div>
                                                    @enderror
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container" id="fieldsContainers">
                                        <a class="btn btn-success mb-3" id="addFieldButtons"
                                            style="padding: 0 14px !important; margin:2px 0px 10px 64px">+
                                            Instruction</a>
                                        <div class="row" style="width: 90%; margin:auto">
                                            <div class="col-sm-6">
                                                <div class="form-group mb-3">
                                                    <label>Title</label>
                                                    <input type="text" placeholder="Enter title" name="title[]"
                                                        id="title" class="form-control" required>
                                                    @error('title')
                                                    <div class="text-danger">{{ $message }}</div>
                                                    @enderror
                                                </div>
                                            </div>
                                            <div class="col-sm-6 ">
                                                <div class="form-group mb-3">
                                                    <label>Description</label>
                                                    <input type="text" placeholder="Enter description"
                                                        name="description[]" id="description" class="form-control"
                                                        required>
                                                    @error('description')
                                                    <div class="text-danger">{{ $message }}</div>
                                                    @enderror
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container" id="fieldsContainer">
                                        <a class="btn btn-success mb-3" id="addFieldButton"
                                            style="padding: 0 14px !important; margin:10px 0px 10px 64px">+ Product
                                            Detail</a>
                                        <div class="row" style="width: 90%; margin:auto">
                                            <div class="col-sm-3">
                                                <div class="form-group mb-2">
                                                    <label>Units</label>
                                                    <select name="units[]" class="form-control" id="">
                                                        <option value="" disabled selected>Select Units
                                                        </option>
                                                        <option value="Grams">Grams</option>
                                                        <option value="Litters">Litters</option>
                                                        <option value="ml">ml</option>
                                                        <option value="mg">mg</option>
                                                        <option value="mg/ml">mg/ml</option>
                                                        <option value="mg/mg">mg/mg</option>
                                                        <option value="ml/mg">ml/mg</option>
                                                        <option value="ml/ml">ml/ml</option>
                                                        <option value="none">none</option>
                                                    </select>
                                                    @error('units')
                                                    <div class="text-danger">{{ $message }}</div>
                                                    @enderror
                                                </div>
                                            </div>
                                            <div class="col-sm-3">
                                                <div class="form-group mb-3">
                                                    <label>Quantity</label>
                                                    <input type="number" placeholder="Enter quantity" name="quantity[]"
                                                        id="quantity" class="form-control">
                                                    @error('quantity')
                                                    <div class="text-danger">{{ $message }}</div>
                                                    @enderror
                                                </div>
                                            </div>
                                            <div class="col-sm-3 ">
                                                <div class="form-group mb-3">
                                                    <label>Price</label>
                                                    <input type="number" placeholder="Enter price" name="price[]"
                                                        id="price" class="form-control">
                                                    @error('price')
                                                    <div class="text-danger">{{ $message }}</div>
                                                    @enderror
                                                </div>
                                            </div>
                                            <div class="col-sm-3 ">
                                                <div class="form-group mb-3">
                                                    <label>Dicount(Optional)</label>
                                                    <input type="number" placeholder="Enter discount" name="discount[]"
                                                        id="discount" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-sm-3 ">
                                                <div class="form-group mb-3">
                                                    <label>Total Stock</label>
                                                    <input type="number" placeholder="Enter stock" name="total_stock[]"
                                                        id="stock" class="form-control">
                                                    @error('total_stock')
                                                    <div class="text-danger">{{ $message }}</div>
                                                    @enderror
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer text-center row">
                                        <div class="col">
                                            <button type="submit" class="btn btn-success mr-1 btn-bg"
                                                id="submit">Add</button>
                                        </div>
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
{{-- <script>
    CKEDITOR.replace('description');
</script> --}}
<script>
    $(document).ready(function() {
            $('#category-dropdown').on('change', function() {
                var category_id = this.value;
                $("#subcategory-dropdown").html('');
                $.ajax({
                    url: "{{ url('pharmacy/get-subcategory-by-category') }}",
                    type: "POST",
                    data: {
                        category_id: category_id,
                        _token: '{{ csrf_token() }}'
                    },
                    dataType: 'json',
                    success: function(result) {
                        $('#subcategory-dropdown').html(
                            '<option value="" disabled selected>Select Sub Category</option>'
                        );
                        $.each(result.SubCategory, function(key, value) {
                            $("#subcategory-dropdown").append('<option value="' + value
                                .id + '">' + value.title + '</option>');
                        });
                    }
                });
            });

            // Counter to keep track of the number of fields
            var fieldCounter = 0;

            // Event handler for the add field button
            $(document).on('click', '#addFieldButton', function() {
                fieldCounter++; // Increment the field counter

                // Create the HTML for the new fields
                var newFields = `
              <div class="fieldsContainer${fieldCounter}" style="margin:10px 35px 10px 45px">
                <a class="btn btn-danger mb-3 mt-3 removeFieldButton" data-target="${fieldCounter}" style="padding: 0 14px !important;margin-left: 25px">-Remove</a>
                <div class="row mx-0 px-4">
                  <div class="col-sm-3 pl-sm-0 pr-sm-2">
                    <div class="form-group mb-3">
                      <label>Units</label>
                      <select name="units[]" id="units${fieldCounter}" class="form-control">
                        <option value="" disabled selected>Select Type</option>
                        <option value="Grams">Grams</option>
                                                            <option value="Litters">Litters</option>
                                                            <option value="ml">ml</option>
                                                            <option value="mg">mg</option>
                                                            <option value="mg/ml">mg/ml</option>
                                                            <option value="mg/mg">mg/mg</option>
                                                            <option value="ml/mg">ml/mg</option>
                                                            <option value="ml/ml">ml/ml</option>
                                                            <option value="none">none</option>
                                    <!-- Add more options as needed -->
                      </select>
                      <div class="text-danger">@error('units'){{ $message }}@enderror</div>
                    </div>
                  </div>
                  <div class="col-sm-3 pl-sm-0 pr-sm-2">
                    <div class="form-group mb-3">
                      <label>Quantity</label>
                      <input type="number" placeholder="Enter quantity" name="quantity[]" id="quantity${fieldCounter}" class="form-control" />
                      <div class="text-danger">@error('quantity'){{ $message }}@enderror</div>
                    </div>
                  </div>
                  <div class="col-sm-3 pl-sm-0 pr-sm-2">
                    <div class="form-group mb-3">
                      <label>Price</label>
                      <input type="number" placeholder="Enter price" name="price[]" id="price${fieldCounter}" class="form-control" />
                      <div class="text-danger">@error('price'){{ $message }}@enderror</div>
                    </div>
                  </div>
                  <div class="col-sm-3 pl-sm-0 pr-sm-2">
                            <div class="form-group mb-3">
                                <label>Dicount(Optional)</label>
                                <input type="number" placeholder="Enter discount" name="discount[]" id="discount${fieldCounter}"
                                    class="form-control" />
                                
                            </div>
                        </div>
                  <div class="col-sm-3 pl-sm-0 pr-sm-2">
                    <div class="form-group mb-3">
                      <label>Total Stock</label>
                      <input type="number" placeholder="Enter stock" name="total_stock[]" id="stock${fieldCounter}" class="form-control" />
                      <div class="text-danger">@error('total_stock'){{ $message }}@enderror</div>
                    </div>
                  </div>
                </div>
              </div>
            `;

                // Append the new fields to the container
                $('#fieldsContainer').append(newFields);
            });

            // Event handler for removing a field
            $(document).on('click', '.removeFieldButton', function() {
                var target = $(this).data('target');
                $('.fieldsContainer' + target).remove();
            });
        });

        // Event handler for removing a field
        $(document).on('click', '.removeFieldButton', function() {
            var target = $(this).data('target');
            $('.fieldsContainer' + target).remove();
        });

        // Counter to keep track of the number of fields
        var fieldCounter = 0;

        // Event handler for the add field button
        $(document).on('click', '#addFieldButtons', function() {
            fieldCounter++; // Increment the field counter

            // Create the HTML for the new fields
            var newFields = `
                <div class="fieldsContainer${fieldCounter}" style="margin:10px 35px 10px 45px">
                    <a class="btn btn-danger mb-3 mt-3 removeFieldButtons" data-target="${fieldCounter}"
                        style="padding: 0 14px !important;margin-left: 25px">Remove</a>
                    <div class="row mx-0 px-4">
                        <div class="col-sm-6 pl-sm-0 pr-sm-2">
                            <div class="form-group mb-3">
                                <label>Title</label>
                                <input type="text" placeholder="Enter title" name="title[]" id="title${fieldCounter}"
                                    class="form-control" />
                                <div class="text-danger">
                                    @error('title')
                                        {{ $message }}
                                    @enderror
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 pl-sm-0 pr-sm-2">
                            <div class="form-group mb-3">
                                <label>Description</label>
                                <input type="text" placeholder="Enter description" name="description[]" id="description${fieldCounter}"
                                    class="form-control" />
                                <div class="text-danger">
                                    @error('description')
                                        {{ $message }}
                                    @enderror
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                `;

            // Append the new fields to the container
            $('#fieldsContainers').append(newFields);
        });

        // Event handler for removing a field
        $(document).on('click', '.removeFieldButtons', function() {
            var target = $(this).data('target');
            $('.fieldsContainer' + target).remove();
        });
</script>

@endsection
