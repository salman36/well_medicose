@component('mail::message')
<p>OTP: {{ $otp }}</p>
Thanks,<br>
{{ config('app.name') }}
@endcomponent
