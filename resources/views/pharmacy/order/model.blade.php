<div class="modal-content">
    <h1 class="border hide-content">Orders</h1>
    <div class="d-flex justify-content-center tbl">
    </div>
    <div class="p-5">
        <table class="table table-striped ">
            <tbody class="text-center">
                <tr>
                    <th scope="col">Order Id</th>
                    <th scope="col">User Name</th>
                </tr>
                <tr>
                    <td scope="col">{{ $data->code }}</td>
                    <td scope="col">{{ $data->user->name }} </td>
                </tr>
                <tr>
                    <th scope="col">Pharmacy Name</th>
                    <th scope="col">Payment</th>
                </tr>
                <tr>
                    <td scope="col">{{ $data->pharmacy->branch_name }}</td>
                    <td scope="col">{{ $data->payment }}</td>
                </tr>
                <tr>
                    <th scope="col">Total Amount</th>
                    <th scope="col">Status</th>
                </tr>
                <tr>
                    <td scope="col">{{ $data->total_amount }}</td>
                    <td scope="col">{{ $data->status }}</td>
                </tr>
                <tr>
                    <th scope="col">Order Date</th>
                </tr>
                <tr>
                    <td scope="col">{{ $data->created_at }}</td>
                </tr>
                @foreach ($data->orderItem as $orderItem)
                <tr>
                    <th scope="col">Product Name</th>
                    <th scope="col">Price</th>
                </tr>
                <tr>
                    <td scope="col">{{ $orderItem->product->name }} </td>
                    <td scope="col">{{ $orderItem->price }}</td>
                </tr>
                <tr>
                    <th scope="col">Quantity</th>
                    <th scope="col">Sub Total</th>
                </tr>
                <tr>
                    <td scope="col">{{ $orderItem->quantity }}</td>
                    <td scope="col">{{ $orderItem->sub_total }}</td>
                </tr>
                <tr>
                    <th scope="col">Discount</th>
                </tr>
                <tr>
                    <td scope="col">{{ $orderItem->discount_price }}</td>
                </tr>
                @endforeach
            </tbody>
        </table>
        <div>
            <button id="printButton">Print</button>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.0/sweetalert.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
            $("#printButton").click(function() {
                $(".colorlib-nav, footer,#printButton, .hide-content").hide();
                window.print();
                $("#printButton, .modal-content").show();
            });
        });
</script>
