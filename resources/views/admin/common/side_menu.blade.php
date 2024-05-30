<div class="main-sidebar sidebar-style-2">
    <aside id="sidebar-wrapper">
        <div class="sidebar-brand">
            {{-- <a href="index.html"> <img alt="image" src="{{ asset('public/admin/assets/images/logo1.png') }}"
                    class="header-logo" /> <span class="logo-name">Typing center</span>
            </a> --}}
            <h3>Well Medicose</h3>
        </div>
        <ul class="sidebar-menu">
            <li class="menu-header">Main</li>
            <li class="dropdown {{ request()->is('admin/dashboard') ? 'active' : '' }}">
                <a href="{{ url('/admin/dashboard') }}" class="nav-link"><i
                    class="fas fa-th-large"></i><span>Dashboard</span></a>
            </li>
            <li class="dropdown {{ request()->is('admin/pharmacy*') ? 'active' : '' }}">
                <a href="{{ route('pharmacy.index') }}" class="nav-link"><i
                        class='fas fa-clinic-medical'></i><span>Pharmacies</span></a>
            </li>
            <li class="dropdown {{ request()->is('admin/user*') ? 'active' : '' }}">
                <a href="{{ route('user.index') }}" class="nav-link"><i class="fa fa-users"></i><span>Users</span></a>
            </li>
            <li class="dropdown {{ request()->is('admin/category*') ? 'active' : '' }}">
                <a href="{{ route('category.index') }}" class="nav-link"><i
                        class="fa fa-list-alt"></i><span>Categories</span></a>
            </li>
            <li class="dropdown {{ request()->is('admin/subCategory*') ? 'active' : '' }}">
                <a href="{{ route('subCategory.index') }}" class="nav-link"><i
                        class="fa fa-list-alt"></i><span>Sub Categories</span></a>
            </li>
            <li class="dropdown {{ request()->is('admin/brand*') ? 'active' : '' }}">
                <a href="{{ route('brand.index') }}" class="nav-link"><i class="fas fa-globe"></i><span>Brands</span></a>
            </li>
            <li class="dropdown {{ request()->is('admin/product*') ? 'active' : '' }}">
                <a href="{{ route('product.index') }}" class="nav-link"><i
                        class="fab fa-product-hunt"></i><span>Products</span></a>
            </li>
            <li class="dropdown {{ request()->is('admin/package*') ? 'active' : '' }}">
                <a href="{{ route('package.index') }}" class="nav-link"><i class="fas fa-box"></i>
                    <span>Packages</span></a>
            </li>
            <li class="dropdown {{ request()->is('admin/offerProduct*') ? 'active' : '' }}">
                <a href="{{ route('offerProduct.index') }}" class="nav-link"><i class="fas fa-star"></i>
                    <span>Featured
                        Products</span></a>
            </li>
            <li class="dropdown {{ request()->is('admin/index*') ? 'active' : '' }}">
                <a href="{{ route('index') }}" class="nav-link"><i class="fas fa-file-alt"></i></i><span>Reports</span></a>
            </li>
            <li class="dropdown {{ request()->is('admin/about*') ? 'active' : '' }}">
                <a href="{{ route('about.index') }}" class="nav-link"><i class="fa fa-info-circle"></i><span>About
                        Us</span></a>
            </li>
            <li class="dropdown {{ request()->is('admin/policy*') ? 'active' : '' }}">
                <a href="{{ route('policy.index') }}" class="nav-link"><i class="fa fa-lock"></i><span>Privacy
                        Policies</span></a>
            </li>
            <li class="dropdown {{ request()->is('admin/terms*') ? 'active' : '' }}">
                <a href="{{ route('terms.index') }}" class="nav-link"><i class="fa fa-key"></i><span>Terms &
                        Conditions</span></a>
            <li class="dropdown {{ request()->is('admin/faq*') ? 'active' : '' }}">
                <a href="{{ route('faq.index') }}" class="nav-link"><i
                        class="fa fa-question-circle"></i><span>FAQ's</span></a>
            </li>
            </li>
        </ul>
    </aside>
</div>
