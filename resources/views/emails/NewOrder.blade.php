 @component('mail::message')
<div style="text-align: center;">
    <h1 style="margin: 0 auto 10px; width: 145px;">New Order</h1>
</div>

<p>Dear {{ $orderData['pharmacyName'] }},</p>

<p>You have received a new order from "{{ $orderData['userName'] }}" with the following details:</p>

<table style="font-size: 14px; border-collapse: collapse; margin: 0 auto; width: 100%;">
    <thead>
        <tr>
            <th style="border: 1px solid #ddd; padding: 8px; text-align: center;">Product</th>
            <th style="border: 1px solid #ddd; padding: 8px; text-align: center;">Quantity</th>
            <th style="border: 1px solid #ddd; padding: 8px; text-align: center;">Price</th>
            <th style="border: 1px solid #ddd; padding: 8px; text-align: center;">Discount</th>
            <th style="border: 1px solid #ddd; padding: 8px; text-align: center;">Subtotal</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($orderData['items'] as $order)
        <tr>
            <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">{{ $order['product'] }}</td>
            <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">{{ $order['quantity'] }}</td>
            <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">{{ $order['price'] }}</td>
            <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">{{ $order['discount'] }} %</td>
            <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">{{ $order['subTotal'] }}</td>
        </tr>
        @endforeach
        <tr>
            <td style="border: 1px solid #ddd; padding: 8px;" colspan="4"></td>
            <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">
                <strong>Total:</strong> {{ ceil($orderData['totalAmount']) }}</td>
        </tr>
    </tbody>
</table>

<p style="font-size: 16px; text-align: center;">The order code is <strong>{{ $orderData['code'] }}</strong>.</p>

Thanks,<br>
{{ config('app.name') }}
@endcomponent

