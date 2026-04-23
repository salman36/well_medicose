@extends('admin.layout.app')
@section('title', 'Dashboard')
@section('content')

    <body>
        <div class="main-content">
            <section class="section">
                <div class="section-body">
                    <a class="btn btn-primary mb-3" href="{{ url()->previous() }}">Back</a>
                    <form id="add_student" action="{{ route('product.update', $product->id) }}" method="POST"
                        enctype="multipart/form-data">
                        @csrf
                        @method('PATCH')
                        <div class="row">
                            <div class="col-12 col-md-12 col-lg-12">
                                <div class="card">
                                    <h4 class="text-center my-4">Update Products</h4>
                                    <div class="container">
                                        <div class="row ">
                                            <div class="col-12">
                                                <div class="form-group mb-2">
                                                    <label>Pharmacy</label>
                                                    <select class="form-control" name="pharmacy_id">
                                                        <option value=""disabled selected>Select Pharmacy</option>
                                                        @foreach ($pharmacies as $pharmacy)
                                                            <option value="{{ $pharmacy->id }}"
                                                                {{ $pharmacy->id == $product->pharmacy->id ? 'selected' : '' }}>
                                                                {{ $pharmacy->branch_name }}</option>
                                                        @endforeach
                                                    </select>
                                                    @error('pharmacy_id')
                                                        <div class="text-danger">{{ $message }}</div>
                                                    @enderror
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container">
                                        <div class="row ">
                                            <div class="col-sm-6 pr-sm-3">
                                                <div class="form-group mb-2">
                                                    <label>Product Name</label>
                                                    <input type="text" placeholder="Enter Product Name" name="name"
                                                        value="{{ $product->name }}" id="name" class="form-control">
                                                    @error('name')
                                                        <div class="text-danger">{{ $message }}</div>
                                                    @enderror
                                                </div>
                                            </div>

                                            <div class="col-sm-6 pr-sm-3">
                                                <div class="form-group mb-2">
                                                    <label>Category</label>
                                                    <select name="category_id" id="category-dropdown" class="form-control">
                                                        @foreach ($categories as $category)
                                                            <option value="{{ $category->id }}"
                                                                {{ $category->id == $product->category_id ? 'selected' : '' }}>
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
                                        <div class="row ">
                                            <div class="col-sm-6 pr-sm-3">
                                                <div class="form-group mb-2">
                                                    <label>Sub Category</label>
                                                    <select name="sub_category_id" id="subcategory-dropdown"
                                                        class="form-control">
                                                        @foreach ($subCategories as $subCategory)
                                                            <option value="{{ $subCategory->id }}"
                                                                {{ $subCategory->id == $product->sub_category_id ? 'selected' : '' }}>
                                                                {{ $subCategory->title }}</option>
                                                        @endforeach
                                                    </select>
                                                    @error('sub_category_id')
                                                        <div class="text-danger">{{ $message }}</div>
                                                    @enderror
                                                </div>
                                            </div>
                                            <div class="col-sm-6 pr-sm-3">
                                                <div class="form-group mb-2">
                                                    <label>Brand(Optional)</label>
                                                    <select class="form-control" name="brand_id">
                                                        @foreach ($brands as $brand)
                                                            <option value="{{ $brand->id }}"
                                                                {{ $brand->id == $product->brand_id ? 'selected' : '' }}>
                                                                {{ $brand->title }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-6">
                                                <div class="form-group mb-2">
                                                    <label>Type</label>
                                                    <select name="type" class="form-control">
                                                        <option value="" disabled>Select Type</option>
                                                        <option value="Tablets"
                                                            {{ $product->type == 'Tablets' ? 'selected' : '' }}>Tablets
                                                        </option>
                                                        <option value="Capsules"
                                                            {{ $product->type == 'Capsules' ? 'selected' : '' }}>Capsules
                                                        </option>
                                                        <option value="Injection"
                                                            {{ $product->type == 'Injection' ? 'selected' : '' }}>Injection
                                                        </option>
                                                        <option value="Syrup"
                                                            {{ $product->type == 'Syrup' ? 'selected' : '' }}>Syrup
                                                        </option>
                                                        <option value="Suspension"
                                                            {{ $product->type == 'Suspension' ? 'selected' : '' }}>
                                                            Suspension</option>
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
                                        {{-- <div class="">
                                            <div class="form-group mb-2">
                                                <label>Description</label>
                                                <textarea placeholder="Enter description" name="description" class="form-control">{{ $product->description }}</textarea>
                                                @error('description')
                                                    <div class="text-danger">{{ $message }}</div>
                                                @enderror
                                            </div>
                                        </div> --}}

                                    </div>
                                    <div class="container">
                                        <div class="section" id="fieldsContainers">
                                            <div class="d-flex">
                                                <a class="btn btn-success mb-3 mt-3" id="addFieldButtons"
                                                    style="padding: 0 14px !important;margin-left: 0px;">+
                                                    Instruction</a>
                                            </div>
                                            @foreach ($product->productInstruction as $productInstruction)
                                                <div class="row ">
                                                    <div class="col-sm-6">
                                                        <div class="form-group mb-3">
                                                            <label>Title</label>
                                                            <input type="text" placeholder="Enter title" name="title[]"
                                                                value="{{ $productInstruction->title }}" id="title"
                                                                class="form-control" required>
                                                            @error('title')
                                                                <div class="text-danger">{{ $message }}</div>
                                                            @enderror
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-6 ">
                                                        <div class="form-group mb-3">
                                                            <label>Description</label>
                                                            <input type="text" placeholder="Enter description"
                                                                name="description[]"
                                                                value="{{ $productInstruction->description }}"
                                                                id="description" class="form-control" required>
                                                            @error('description')
                                                                <div class="text-danger">{{ $message }}</div>
                                                            @enderror
                                                        </div>
                                                    </div>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                    <div class="container">
                                        <div class="section" id="fieldsContainer">
                                            <div class="d-flex">
                                                <a class="btn btn-success mb-3 mt-3" id="addFieldButton"
                                                    style="padding: 0 14px !important;margin-left: 0px;">+ Product
                                                    Detail</a>

                                            </div>
                                            @foreach ($product->productDetail as $productDetailitem)
                                                <div class="fields-container">
                                                    {{-- <a class="btn btn-danger mb-3 mt-3 removeFieldButton"
                                                        style="padding: 0 14px !important;margin-left: 0px;">-</a> --}}
                                                    <div class="row ">
                                                        <div class="col-sm-3 pr-sm-2">
                                                            <div class="form-group mb-3 ">
                                                                <label>Units</label>
                                                                <select name="units[]" class="form-control">
                                                                    <option value="" disabled>Select Type</option>
                                                                    <option value="ml"
                                                                        {{ $productDetailitem->units == 'ml' ? 'selected' : '' }}>
                                                                        ml</option>
                                                                    <option value="mg"
                                                                        {{ $productDetailitem->units == 'mg' ? 'selected' : '' }}>
                                                                        mg</option>
                                                                    <option value="mg/ml"
                                                                        {{ $productDetailitem->units == 'mg/ml' ? 'selected' : '' }}>
                                                                        mg/ml</option>
                                                                    <option value="mg/mg"
                                                                        {{ $productDetailitem->units == 'mg/mg' ? 'selected' : '' }}>
                                                                        mg/mg</option>
                                                                    <option value="ml/mg"
                                                                        {{ $productDetailitem->units == 'ml/mg' ? 'selected' : '' }}>
                                                                        ml/mg</option>
                                                                    <option value="ml/ml"
                                                                        {{ $productDetailitem->units == 'ml/m' ? 'selected' : '' }}>
                                                                        ml/m</option>
                                                                    <option value="Grams"
                                                                        {{ $productDetailitem->units == 'Grams' ? 'selected' : '' }}>
                                                                        Grams</option>
                                                                    <option value="Litters"
                                                                        {{ $productDetailitem->units == 'Litters' ? 'selected' : '' }}>
                                                                        Litters</option>
                                                                    <option value="none"
                                                                        {{ $productDetailitem->units == 'none' ? 'selected' : '' }}>
                                                                        none</option>
                                                                </select>
                                                                @error('units')
                                                                    <div class="text-danger">{{ $message }}</div>
                                                                @enderror
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-3 pr-sm-2">
                                                            <div class="form-group mb-3">
                                                                <label>Quantity</label>
                                                                <input type="number" placeholder="Enter quantity"
                                                                    name="quantity[]"
                                                                    value="{{ $productDetailitem->quantity }}"
                                                                    id="quantity" class="form-control" />

                                                                @error('quantity')
                                                                    <div class="text-danger">{{ $message }}</div>
                                                                @enderror
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-3 pr-sm-2">
                                                            <div class="form-group mb-3">
                                                                <label>Price</label>
                                                                <input type="number" placeholder="Enter price"
                                                                    name="price[]" id="price"
                                                                    value="{{ $productDetailitem->price }}"
                                                                    class="form-control" />

                                                                @error('price')
                                                                    <div class="text-danger">{{ $message }}</div>
                                                                @enderror
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-3 pr-sm-2">
                                                            <div class="form-group mb-3">
                                                                <label>Discount(optional)</label>
                                                                <input type="number" placeholder="Enter discount"
                                                                    name="discount[]" id="discount"
                                                                    value="{{ $productDetailitem->discount }}"
                                                                    class="form-control" />

                                                                {{-- @error('discount')
                                                                    <div class="text-danger">{{ $message }}</div>
                                                                @enderror --}}
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-3 pr-sm-2">
                                                            <div class="form-group mb-3">
                                                                <label>Total Stock</label>
                                                                <input type="number" placeholder="Enter stock"
                                                                    name="total_stock[]"
                                                                    value="{{ $productDetailitem->total_stock }}"
                                                                    id="stock" class="form-control" />

                                                                @error('total_stock')
                                                                    <div class="text-danger">{{ $message }}</div>
                                                                @enderror
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>

                                    <div class="card-footer text-center row">
                                        <div class="col">
                                            <button type="submit" class="btn btn-success mr-1 btn-bg"
                                                id="submit">update</button>
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
                // debugger;
                var category_id = this.value;
                $("#subcategory-dropdown").html('');
                $.ajax({
                    // url: "{{ url('admin/get-subcategories/') }}"+   "/" + category_id
                    url: "{{ url('admin/get-subcategories/{id}') }}",
                    type: "GET",
                    data: {
                        category_id: category_id,
                        _token: '{{ csrf_token() }}'
                    },
                    dataType: 'json',
                    success: function(result) {
                        $('#subcategory-dropdown').html(
                            '<option value="" disabled selected>Select Sub Category</option>'
                        );
                        $.each(result, function(key, value) {
                            $("#subcategory-dropdown").append('<option value="' + value
                                .id +
                                '">' + value.title + '</option>');
                        });
                    }
                });
            });
        });

        $(document).ready(function() {
            // Counter to keep track of the number of fields
            var fieldCounter = 0;

            // Event handler for the add field button
            $(document).on('click', '#addFieldButton', function() {
                fieldCounter++; // Increment the field counter

                // Create the HTML for the new fields
                var newFields = `
            <div class="fieldsContainer${fieldCounter}">
                <a class="btn btn-danger mb-3 mt-3 removeFieldButton" style="padding: 0 14px !important;margin-left: 0px;" data-target="${fieldCounter}">Remove</a>
                <div class = "container">
                    <div class="row">
                        <div class="col-sm-3 pl-sm-0 pr-sm-2">
                            <div class="form-group mb-3">
                                <label>Units</label>
                                <select name="units[]" id="units${fieldCounter}" class="form-control">
                                    <option value="" disabled>Select Type</option>
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
                        <div class="col-sm-3 pl-sm-0 pr-sm-2">
                            <div class="form-group mb-3">
                                <label>Quantity</label>
                                <input type="number" placeholder="Enter quantity" name="quantity[]" id="quantity${fieldCounter}" class="form-control" />
                                @error('quantity')
                                    <div class="text-danger">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>
                        <div class="col-sm-3 pl-sm-0 pr-sm-2">
                            <div class="form-group mb-3">
                                <label>Price</label>
                                <input type="number" placeholder="Enter price" name="price[]" id="price${fieldCounter}" class="form-control" />
                                @error('price')
                                    <div class="text-danger">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>
                        <div class="col-sm-3 pl-sm-0 pr-sm-2">
                            <div class="form-group mb-3">
                                <label>Discount(optional)</label>
                                <input type="number" placeholder="Enter discount" name="discount[]" id="discount${fieldCounter}" class="form-control" />
                                @error('discount')
                                    <div class="text-danger">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>
                        <div class="col-sm-3 pl-sm-0 pr-sm-2">
                            <div class="form-group mb-3">
                                <label>Total Stock</label>
                                <input type="number" placeholder="Enter stock" name="total_stock[]" id="stock${fieldCounter}" class="form-control" />
                                @error('total_stock')
                                    <div class="text-danger">{{ $message }}</div>
                                @enderror
                            </div>
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
        $(document).on('click', '.removeFieldButton', function() {
            $(this).closest('.fields-container').remove();
        });

        // Counter to keep track of the number of fields
        var fieldCounter = 0;

        // Event handler for the add field button
        $(document).on('click', '#addFieldButtons', function() {
            fieldCounter++; // Increment the field counter

            // Create the HTML for the new fields
            var newFields = `
    <div class="fieldsContainer${fieldCounter}" style="padding: 0 14px !important;margin-left: 0px;">
        <a class="btn btn-danger mb-3 mt-3 removeFieldButtons" data-target="${fieldCounter}"
            style="padding: 0 14px !important;margin-left: -13px">Remove</a>
        <div class = "container" style = "margin-left:-14px; margin-right: 10px;">
            <div class="row ">
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
