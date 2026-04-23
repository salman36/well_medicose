<div class="modal-content">
    <h1 class="border">Pharmacy Details</h1>
    <div class="d-flex justify-content-center tbl">
    </div>
    <div class="p-5">
        <table class="table table-striped ">
            <tbody class="text-center">
                    <tr>
                        <th scope="col">Pharmacy Name</th>
                        <th scope="col">Email</th>
                    </tr>
                    <tr>
                        <td scope="col">{{$pharmacy->branch_name}}</td>
                        <td scope="col">{{ $pharmacy->email }}</td>
                    </tr>
                    <tr>
                        <th scope="col">Branch No</th>
                        <th scope="col">Address</th>
                    </tr>
                    <tr>
                        <td scope="col">{{ $pharmacy->branch_no }} </td>
                        <td scope="col">{{ $pharmacy->address }}</td>
                    </tr>
                    <tr>
                        <th scope="col">License No</th>
                        <th scope="col">Phone number</th>
                    </tr>
                    <tr>
                        <td scope="col">{{ $pharmacy->license }}</td>
                        <td scope="col">{{ $pharmacy->phone_no }}</td>
                    </tr>
                    <tr>
                        <th scope="col">Opening Time</th>
                        <th scope="col">Closing Time</th>
                    </tr>
                    <tr>
                        <td scope="col">{{ $pharmacy->opening_time }}</td>
                        <td scope="col">{{ $pharmacy->closing_time }}</td>
                    </tr>
                    @if ($pharmacy->accountDetail)
                    <tr>
                        <th scope="col">Bank Name</th>
                        <th scope="col">Account Holder</th>
                    </tr>
                    <tr>
                        <td scope="col">{{ $pharmacy->accountDetail->bank_name }}</td>
                        <td scope="col">{{ $pharmacy->accountDetail->account_holder_name }}</td>
                    </tr>
                    <tr>
                        <th scope="col">Account No</th>
                    </tr>
                    <tr>
                        <td scope="col">{{ $pharmacy->accountDetail->account_no }}</td>
                    </tr>
                @endif
                    {{-- <tr>
                        <th scope="col">Bank Name</th>
                        <th scope="col">Account Holder</th>
                    </tr>
                    <tr>
                        <td scope="col">{{ $pharmacy->accountDetail->bank_name }}</td>
                        <td scope="col">{{ $pharmacy->accountDetail->account_holder_name }}</td>
                    </tr>
                    <tr>
                        <th scope="col">Account No</th>
                    </tr>
                    <tr>
                        <td scope="col">{{ $pharmacy->accountDetail->account_no }}</td>
                    </tr> --}}
            </tbody>
         </table>
    </div>
</div>
