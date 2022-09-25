<!DOCTYPE html>
<?php if (\Illuminate\Support\Facades\Blade::check('langrtl')): ?>
<html lang="<?php echo e(str_replace('_', '-', app()->getLocale())); ?>" dir="rtl">
<?php else: ?>
    <html lang="<?php echo e(str_replace('_', '-', app()->getLocale())); ?>">
    <?php endif; ?>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="csrf-token" content="<?php echo e(csrf_token()); ?>">
        <?php if(config('favicon_image') != ""): ?>
            <link rel="shortcut icon" type="image/x-icon" href="<?php echo e(asset('storage/logos/'.config('favicon_image'))); ?>"/>
        <?php endif; ?>
        <title><?php echo $__env->yieldContent('title', app_name()); ?></title>
        <meta name="description" content="<?php echo $__env->yieldContent('meta_description', ''); ?>">
        <meta name="keywords" content="<?php echo $__env->yieldContent('meta_keywords', ''); ?>">

        
        <?php echo $__env->yieldPushContent('before-styles'); ?>

    <!-- Check if the language is set to RTL, so apply the RTL layouts -->
        <!-- Otherwise apply the normal LTR layouts -->

        <link rel="stylesheet" href="<?php echo e(asset('assets/css/owl.carousel.css')); ?>">
        <link rel="stylesheet" href="<?php echo e(asset('assets/css/flaticon.css')); ?>">
        <link rel="stylesheet" type="text/css" href="<?php echo e(asset('assets/css/meanmenu.css')); ?>">
        <link rel="stylesheet" href="<?php echo e(asset('assets/css/bootstrap.min.css')); ?>">
        <link rel="stylesheet" href="<?php echo e(asset('assets/css/video.min.css')); ?>">
        <link rel="stylesheet" href="<?php echo e(asset('assets/css/lightbox.css')); ?>">
        <link rel="stylesheet" href="<?php echo e(asset('assets/css/progess.css')); ?>">
        <link rel="stylesheet" href="<?php echo e(asset('assets/css/animate.min.css')); ?>">
        
        <link rel="stylesheet" href="<?php echo e(asset('css/frontend.css')); ?>">
        <link rel="stylesheet" href="<?php echo e(asset('assets/css/fontawesome-all.css')); ?>">

        <link rel="stylesheet" href="<?php echo e(asset('assets/css/responsive.css')); ?>">

        <link rel="stylesheet" href="<?php echo e(asset('assets/css/colors/switch.css')); ?>">
        <link href="<?php echo e(asset('assets/css/colors/color-2.css')); ?>" rel="alternate stylesheet" type="text/css"
              title="color-2">
        <link href="<?php echo e(asset('assets/css/colors/color-3.css')); ?>" rel="alternate stylesheet" type="text/css"
              title="color-3">
        <link href="<?php echo e(asset('assets/css/colors/color-4.css')); ?>" rel="alternate stylesheet" type="text/css"
              title="color-4">
        <link href="<?php echo e(asset('assets/css/colors/color-5.css')); ?>" rel="alternate stylesheet" type="text/css"
              title="color-5">
        <link href="<?php echo e(asset('assets/css/colors/color-6.css')); ?>" rel="alternate stylesheet" type="text/css"
              title="color-6">
        <link href="<?php echo e(asset('assets/css/colors/color-7.css')); ?>" rel="alternate stylesheet" type="text/css"
              title="color-7">
        <link href="<?php echo e(asset('assets/css/colors/color-8.css')); ?>" rel="alternate stylesheet" type="text/css"
              title="color-8">
        <link href="<?php echo e(asset('assets/css/colors/color-9.css')); ?>" rel="alternate stylesheet" type="text/css"
              title="color-9">

        
        <link href="<?php echo e(asset('assets/metronic_assets/global/css/components.css')); ?>" id="style_components" rel="stylesheet" type="text/css"/>
        
           
      

        <link href="<?php echo e(asset('/vendor/unisharp/laravel-ckeditor/plugins/codesnippet/lib/highlight/styles/monokai.css')); ?>" rel="stylesheet">
        <script src="<?php echo e(asset('/vendor/unisharp/laravel-ckeditor/plugins/codesnippet/lib/highlight/highlight.pack.js')); ?>"></script>
        <script>hljs.initHighlightingOnLoad();</script>

        <?php echo $__env->yieldContent('css'); ?>
        <?php echo $__env->yieldPushContent('after-styles'); ?>

        <?php if(config('onesignal_status') == 1): ?>
            <?php echo config('onesignal_data'); ?>

        <?php endif; ?>

        <?php if(config('google_analytics_id') != ""): ?>
    <!-- Global site tag (gtag.js) - Google Analytics -->
        <script async src="https://www.googletagmanager.com/gtag/js?id=<?php echo e(config('google_analytics_id')); ?>"></script>
        <script>
            window.dataLayer = window.dataLayer || [];
            function gtag(){dataLayer.push(arguments);}
            gtag('js', new Date());

            gtag('config', '<?php echo e(config('google_analytics_id')); ?>');
        </script>
            <?php endif; ?>
        <?php if(!empty(config('custom_css'))): ?>
            <style>
                <?php echo config('custom_css'); ?>

            </style>
        <?php endif; ?>

    </head>
    <body class="<?php echo e(config('layout_type')); ?>">

    <div id="app">
    
    <?php echo $__env->make('frontend.layouts.modals.loginModal', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>


    <!-- Start of Header section
        ============================================= -->
        <header>
            <div id="main-menu" class="main-menu-container">
                <div class="main-menu">
                    <div class="container">
                        <div class="navbar-default">
                            <div class="navbar-header float-left">
                                <a class="navbar-brand text-uppercase" href="<?php echo e(url('/')); ?>">
                                    
                                    <img src="<?php echo e(asset("storage/logos/".config('logo_w_image'))); ?>" alt="logo">
                                </a>
                            </div><!-- /.navbar-header -->

                            <div class="cart-search float-right ul-li">
                                <ul>
                                    <li>
                                        <a href="<?php echo e(route('cart.index')); ?>"><i class="fas fa-shopping-bag"></i>
                                            <?php if(auth()->check() && Cart::session(auth()->user()->id)->getTotalQuantity() != 0): ?>
                                                <span class="badge badge-danger position-absolute"><?php echo e(Cart::session(auth()->user()->id)->getTotalQuantity()); ?></span>
                                            <?php endif; ?>
                                        </a>
                                    </li>
                                </ul>
                            </div>


                            <!-- Collect the nav links, forms, and other content for toggling -->
                            <nav class="navbar-menu float-right">
                                <div class="nav-menu ul-li">
                                    <ul>
                                        <?php if(count($custom_menus) > 0 ): ?>
                                            <?php $__currentLoopData = $custom_menus; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $menu): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                
                                                    
                                                <?php if($menu['id'] == $menu['parent']): ?>
                                                    <?php if(count($menu->subs) == 0): ?>
                                                        <li class="">
                                                            <a href="<?php echo e(asset($menu->link)); ?>"
                                                               class="nav-link <?php echo e(active_class(Active::checkRoute('frontend.user.dashboard'))); ?>"
                                                               id="menu-<?php echo e($menu->id); ?>"><?php echo e(trans('custom-menu.'.$menu_name.'.'.str_slug($menu->label))); ?></a>
                                                        </li>

                                                    <?php else: ?>
                                                        <li class="menu-item-has-children ul-li-block">
                                                            <a href="#!"><?php echo e(trans('custom-menu.'.$menu_name.'.'.str_slug($menu->label))); ?></a>
                                                            <ul class="sub-menu">
                                                                <?php $__currentLoopData = $menu->subs; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                    <?php echo $__env->make('frontend.layouts.partials.dropdown', $item, \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                            </ul>
                                                        </li>
                                                    <?php endif; ?>
                                                <?php endif; ?>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        <?php endif; ?>

                                        <?php if(auth()->check()): ?>
                                            <?php if($logged_in_user->hasRole('student')): ?>
                                            <li>
                                                <a href="<?php echo e(route('admin.dashboard')); ?>"><?php echo app('translator')->get('navs.frontend.dashboard'); ?></a>
                                            </li>
                                            <li>
                                                <a href="<?php echo e(route('frontend.auth.logout')); ?>"><i class="fas fa-sign-out-alt"></i></a>
                                            </li>
                                            <?php else: ?>
                                            <li class="menu-item-has-children ul-li-block">
                                                <a href="#!"><?php echo e($logged_in_user->name); ?></a>
                                                <ul class="sub-menu">
                                                    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('view backend')): ?>
                                                        <li>
                                                            <a href="<?php echo e(route('admin.dashboard')); ?>"><?php echo app('translator')->get('navs.frontend.dashboard'); ?></a>
                                                        </li>
                                                    <?php endif; ?>

                                                    <li>
                                                        <a href="<?php echo e(route('frontend.auth.logout')); ?>"><?php echo app('translator')->get('navs.general.logout'); ?></a>
                                                    </li>
                                                </ul>
                                            </li>
                                            <?php endif; ?>
                                        <?php else: ?>
                                            <li>
                                                <div class="log-in mt-0">
                                                    <a id="openLoginModal" data-target="#myModal"
                                                       href="#"><?php echo app('translator')->get('navs.general.login'); ?></a>
                                                    

                                                </div>
                                            </li>
                                        <?php endif; ?>
                                            <?php if(count($locales) > 1): ?>
                                            <li class="menu-item-has-children ul-li-block">
                                                <a href="#">
                                                    <span class="d-md-down-none"><?php echo app('translator')->get('menus.language-picker.language'); ?>
                                                        (<?php echo e(strtoupper(app()->getLocale())); ?>)</span>
                                                </a>
                                                <ul class="sub-menu">
                                                    <?php $__currentLoopData = $locales; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $lang): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                        <?php if($lang != app()->getLocale()): ?>
                                                            <li>
                                                                <a href="<?php echo e('/lang/'.$lang); ?>"
                                                                   class=""> <?php echo app('translator')->get('menus.language-picker.langs.'.$lang); ?></a>
                                                            </li>
                                                        <?php endif; ?>
                                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                </ul>
                                            </li>
                                        <?php endif; ?>
                                    </ul>
                                </div>
                            </nav>

                            <div class="mobile-menu">
                                <div class="logo">
                                    <a href="<?php echo e(url('/')); ?>">
                                        <img src=<?php echo e(asset("storage/logos/".config('logo_w_image'))); ?> alt="Logo">
                                    </a>
                                </div>
                                <nav>
                                    <ul>
                                        <?php if(count($custom_menus) > 0 ): ?>
                                            <?php $__currentLoopData = $custom_menus; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $menu): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                <?php if($menu['id'] == $menu['parent']): ?>
                                                    <?php if(count($menu->subs) > 0): ?>
                                                        <li class="">
                                                            <a href="#!"><?php echo e(trans('custom-menu.'.$menu_name.'.'.str_slug($menu->label))); ?></a>
                                                            <ul class="">
                                                                <?php $__currentLoopData = $menu->subs; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                    <?php echo $__env->make('frontend.layouts.partials.dropdown', $item, \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                            </ul>
                                                        </li>
                                                     <?php else: ?>
                                                        <li class="">
                                                            <a href="<?php echo e(asset($menu->link)); ?>"
                                                               class="nav-link <?php echo e(active_class(Active::checkRoute('frontend.user.dashboard'))); ?>"
                                                               id="menu-<?php echo e($menu->id); ?>"><?php echo e(trans('custom-menu.'.$menu_name.'.'.str_slug($menu->label))); ?></a>
                                                        </li>
                                                    <?php endif; ?>

                                                <?php endif; ?>
                                            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                        <?php endif; ?>
                                        <?php if(auth()->check()): ?>
                                            <li class="">
                                                <a href="#!"><?php echo e($logged_in_user->name); ?></a>
                                                <ul class="">
                                                    <?php if (app(\Illuminate\Contracts\Auth\Access\Gate::class)->check('view backend')): ?>
                                                        <li>
                                                            <a href="<?php echo e(route('admin.dashboard')); ?>"><?php echo app('translator')->get('navs.frontend.dashboard'); ?></a>
                                                        </li>
                                                    <?php endif; ?>


                                                    <li>
                                                        <a href="<?php echo e(route('frontend.auth.logout')); ?>"><?php echo app('translator')->get('navs.general.logout'); ?></a>
                                                    </li>
                                                </ul>
                                            </li>
                                        <?php else: ?>
                                            <li>
                                                <div class=" ">
                                                    <a id="openLoginModal" data-target="#myModal"
                                                       href="#"><?php echo app('translator')->get('navs.general.login'); ?></a>
                                                    <!-- The Modal -->
                                                </div>
                                            </li>
                                        <?php endif; ?>
                                            <?php if(count($locales) > 1): ?>
                                                <li class="menu-item-has-children ul-li-block">
                                                    <a href="#">
                                                    <span class="d-md-down-none"><?php echo app('translator')->get('menus.language-picker.language'); ?>
                                                        (<?php echo e(strtoupper(app()->getLocale())); ?>)</span>
                                                    </a>
                                                    <ul class="">
                                                        <?php $__currentLoopData = $locales; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $lang): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                            <?php if($lang != app()->getLocale()): ?>
                                                                <li>
                                                                    <a href="<?php echo e('/lang/'.$lang); ?>"
                                                                       class=""> <?php echo app('translator')->get('menus.language-picker.langs.'.$lang); ?></a>
                                                                </li>
                                                            <?php endif; ?>
                                                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                    </ul>
                                                </li>
                                            <?php endif; ?>
                                    </ul>
                                </nav>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- Start of Header section
            ============================================= -->


        <?php echo $__env->yieldContent('content'); ?>
        <?php echo $__env->make('cookieConsent::index', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>


        <?php echo $__env->make('frontend.layouts.partials.footer', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

    </div><!-- #app -->

    <!-- Scripts -->

    <?php echo $__env->yieldPushContent('before-scripts'); ?>

    <!-- For Js Library -->
    <script src="<?php echo e(asset('assets/js/jquery-2.1.4.min.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/js/popper.min.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/js/bootstrap.min.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/js/owl.carousel.min.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/js/jarallax.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/js/jquery.magnific-popup.min.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/js/lightbox.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/js/jquery.meanmenu.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/js/scrollreveal.min.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/js/jquery.counterup.min.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/js/waypoints.min.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/js/jquery-ui.js')); ?>"></script>
    <script src="<?php echo e(asset('assets/js/gmap3.min.js')); ?>"></script>

    <script src="<?php echo e(asset('assets/js/switch.js')); ?>"></script>

    <script>
        <?php if(request()->has('user')  && (request('user') == 'admin')): ?>

        $('#myModal').modal('show');
        $('#loginForm').find('#email').val('admin@lms.com')
        $('#loginForm').find('#password').val('secret')

        <?php elseif(request()->has('user')  && (request('user') == 'student')): ?>

        $('#myModal').modal('show');
        $('#loginForm').find('#email').val('student@lms.com')
        $('#loginForm').find('#password').val('secret')

        <?php elseif(request()->has('user')  && (request('user') == 'teacher')): ?>

        $('#myModal').modal('show');
        $('#loginForm').find('#email').val('teacher@lms.com')
        $('#loginForm').find('#password').val('secret')

        <?php endif; ?>
    </script>


    <script src="<?php echo e(asset('assets/js/script.js')); ?>"></script>
    <script>
        <?php if((session()->has('show_login')) && (session('show_login') == true)): ?>
        $('#myModal').modal('show');
                <?php endif; ?>
        var font_color = "<?php echo e(config('font_color')); ?>"
        setActiveStyleSheet(font_color);
    </script>

    <?php echo $__env->yieldContent('js'); ?>

    <?php echo $__env->yieldPushContent('after-scripts'); ?>

    <?php echo $__env->make('includes.partials.ga', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>

    <?php if(!empty(config('custom_js'))): ?>
        <script>
            <?php echo config('custom_js'); ?>

        </script>
    <?php endif; ?>

    </body>
    </html>
<?php /**PATH F:\laravel\resources\views/frontend/layouts/app1.blade.php ENDPATH**/ ?>