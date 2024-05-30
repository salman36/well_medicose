@component('mail::message')
<h1 style="text-align: center;">Forgot Password</h1>
@component('mail::button', ['url' => $detail['url']])
Reset Password
@endcomponent

Thanks,<br>
{{ config('app.name') }}
@endcomponent
