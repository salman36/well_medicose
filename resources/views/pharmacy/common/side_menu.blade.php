<div class="main-sidebar sidebar-style-2 hide-content">
    <aside id="sidebar-wrapper">
        <div class="sidebar-brand">
            {{-- <a href="index.html"> <img alt="image" src="{{ asset('public/admin/assets/images/logo1.png') }}"
                    class="header-logo" /> <span class="logo-name">Typing center</span>
            </a> --}}
            <h3>Well Medicose</h3>
        </div>
        <ul class="sidebar-menu">
            <li class="menu-header">Main</li>
            <li class="dropdown {{ request()->is('pharmacy/pharmacy-dashboard*') ? 'active' : '' }}">
                <a href="{{ url('pharmacy/pharmacy-dashboard') }}" class="nav-link"><i class="fas fa-th-large"></i><span>Dashboard</span></a>
            </li>
            <li class="dropdown {{ request()->is('pharmacy/pharmacyproduct*') ? 'active' : '' }}">
                <a href="{{ route('pharmacy.pharmacyproduct.index') }}" class="nav-link"><i class="fab fa-product-hunt"></i><span>Products</span></a>
            </li>
            <li class="dropdown {{ request()->is('pharmacy/order*') ? 'active' : '' }}">
                <a href="{{ route('pharmacy.order') }}" class="nav-link"><i class="fab fa-first-order"></i><span>Orders</span></a>
            </li>
            <li class="dropdown {{ request()->is('pharmacy/reports*') ? 'active' : '' }}">
                <a href="{{ route('pharmacy.reports') }}" class="nav-link"><i class="fas fa-file-alt"></i></i><span>Reports</span></a>
            </li>
             <li class="dropdown {{ request()->is('pharmacy/about*') ? 'active' : '' }}">
                <a href="{{ route('pharmacy.about.index') }}" class="nav-link"><i class="fa fa-info-circle"></i><span>About
                        Us</span></a>
            </li>
            <li class="dropdown {{ request()->is('pharmacy/policy*') ? 'active' : '' }}">
                <a href="{{ route('pharmacy.policy.index') }}" class="nav-link"><i class="fa fa-lock"></i><span>Privacy
                        Policies</span></a>
            </li>
            <li class="dropdown {{ request()->is('pharmacy/terms*') ? 'active' : '' }}">
                <a href="{{ route('pharmacy.terms.index') }}" class="nav-link"><i class="fa fa-key"></i></i><span>Term & Conditions</span></a>
           <li class="dropdown {{ request()->is('pharmacy/faq*') ? 'active' : '' }}">
                <a href="{{ route('pharmacy.faq.index') }}" class="nav-link"><i
                    class="fa fa-question-circle"></i><span>FAQ's</span></a>
            </li>
         {{-- </li> --}}
        </ul>
    </aside>
</div>
{{-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> --}}
