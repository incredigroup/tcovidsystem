<style>
    .modal-dialog {
        margin: 1.75em auto;
        min-height: calc(100vh - 60px);
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

    #myModal .close {
        position: absolute;
        right: 0.3rem;
    }

    .g-recaptcha div {
        margin: auto;
    }

    .modal-body .contact_form input[type='radio'] {
        width: auto;
        height: auto;
    }
    .modal-body .contact_form textarea{
        background-color: #eeeeee;
        padding: 15px;
        border-radius: 4px;
        margin-bottom: 10px;
        width: 100%;
        border: none
    }

    @media (max-width: 768px) {
        .modal-dialog {
            min-height: calc(100vh - 20px);
        }

        #myModal .modal-body {
            padding: 15px;
        }
    }

</style>
<?php
//$fields = json_decode(config('registration_fields'));
//$inputs = ['text','number','date','gender'];
//dd($fields);
?>
<?php if(!auth()->check()): ?>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">


                <!-- Modal Header -->
                <div class="modal-header backgroud-style">

                    <div class="gradient-bg"></div>
                    <div class="popup-logo">
                        <img src="<?php echo e(asset("storage/logos/".config('logo_popup'))); ?>" alt="">
                    </div>
                    <div class="popup-text text-center">
                        <h2><?php echo app('translator')->get('labels.frontend.modal.my_account'); ?> </h2>
                        <p><?php echo app('translator')->get('labels.frontend.modal.login_register'); ?></p>
                    </div>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>

                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    <div class="tab-content">
                        <div class="tab-pane container active" id="login">

                            <span class="error-response text-danger"></span>
                            <span class="success-response text-success"><?php echo e((session()->get('flash_success'))); ?></span>
                            <form class="contact_form" id="loginForm" action="<?php echo e(route('frontend.auth.login.post')); ?>"
                                  method="POST" enctype="multipart/form-data">
                                <a href="#" class="go-register float-left text-info pl-0">
                                    <?php echo app('translator')->get('labels.frontend.modal.new_user_note'); ?>
                                </a>
                                <div class="contact-info mb-2">
                                    <?php echo e(html()->email('email')
                                        ->class('form-control mb-0')
                                        ->placeholder(__('validation.attributes.frontend.email'))
                                        ->attribute('maxlength', 191)); ?>

                                    <span id="login-email-error" class="text-danger"></span>

                                </div>
                                <div class="contact-info mb-2">
                                    <?php echo e(html()->password('password')
                                                     ->class('form-control mb-0')
                                                     ->placeholder(__('validation.attributes.frontend.password'))); ?>

                                    <span id="login-password-error" class="text-danger"></span>

                                    <a class="text-info p-0 d-block text-right my-2"
                                       href="<?php echo e(route('frontend.auth.password.reset')); ?>"><?php echo app('translator')->get('labels.frontend.passwords.forgot_password'); ?></a>

                                </div>

                                <?php if(config('access.captcha.registration')): ?>
                                    <div class="contact-info mb-2 text-center">
                                        <?php echo e(no_captcha()->display()); ?>

                                        <?php echo e(html()->hidden('captcha_status', 'true')); ?>

                                        <span id="login-captcha-error" class="text-danger"></span>

                                    </div><!--col-->
                                <?php endif; ?>

                                <div class="nws-button text-center white text-capitalize">
                                    <button type="submit"
                                            value="Submit"><?php echo app('translator')->get('labels.frontend.modal.login_now'); ?></button>
                                </div>

                            </form>

                            <div id="socialLinks" class="text-center">
                            </div>

                        </div>
                        <div class="tab-pane container fade" id="register">

                            <form id="registerForm" class="contact_form"
                                  action="#"
                                  method="post">
                                <?php echo csrf_field(); ?>

                                <a href="#"
                                   class="go-login float-right text-info pr-0"><?php echo app('translator')->get('labels.frontend.modal.already_user_note'); ?></a>
                                <div class="contact-info mb-2">


                                    <?php echo e(html()->text('first_name')
                                        ->class('form-control mb-0')
                                        ->placeholder(__('validation.attributes.frontend.first_name'))
                                        ->attribute('maxlength', 191)); ?>

                                    <span id="first-name-error" class="text-danger"></span>
                                </div>
                                <div class="contact-info mb-2">
                                    <?php echo e(html()->text('last_name')
                                      ->class('form-control mb-0')
                                      ->placeholder(__('validation.attributes.frontend.last_name'))
                                      ->attribute('maxlength', 191)); ?>

                                    <span id="last-name-error" class="text-danger"></span>

                                </div>

                                <div class="contact-info mb-2">
                                    <?php echo e(html()->email('email')
                                       ->class('form-control mb-0')
                                       ->placeholder(__('validation.attributes.frontend.email'))
                                       ->attribute('maxlength', 191)); ?>

                                    <span id="email-error" class="text-danger"></span>

                                </div>
                                <div class="contact-info mb-2">
                                    <?php echo e(html()->password('password')
                                        ->class('form-control mb-0')
                                        ->placeholder(__('validation.attributes.frontend.password'))); ?>

                                    <span id="password-error" class="text-danger"></span>
                                </div>
                                <div class="contact-info mb-2">
                                    <?php echo e(html()->password('password_confirmation')
                                        ->class('form-control mb-0')
                                        ->placeholder(__('validation.attributes.frontend.password_confirmation'))); ?>

                                </div>
                                <?php if(config('registration_fields') != NULL): ?>
                                    <?php
                                        $fields = json_decode(config('registration_fields'));
                                        $inputs = ['text','number','date'];
                                    ?>
                                    <?php $__currentLoopData = $fields; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <?php if(in_array($item->type,$inputs)): ?>
                                            <div class="contact-info mb-2">
                                                <input type="<?php echo e($item->type); ?>" class="form-control mb-0" value="<?php echo e(old($item->name)); ?>" name="<?php echo e($item->name); ?>"
                                                       placeholder="<?php echo e(__('labels.backend.general_settings.user_registration_settings.fields.'.$item->name)); ?>">
                                            </div>
                                        <?php elseif($item->type == 'radio'): ?>
                                            <div class="contact-info mb-2">
                                                <label class="radio-inline mr-3 mb-0">
                                                    <input type="radio" name="<?php echo e($item->name); ?>" value="male"> <?php echo e(__('validation.attributes.frontend.male')); ?>

                                                </label>
                                                <label class="radio-inline mr-3 mb-0">
                                                    <input type="radio" name="<?php echo e($item->name); ?>" value="female"> <?php echo e(__('validation.attributes.frontend.female')); ?>

                                                </label>
                                                <label class="radio-inline mr-3 mb-0">
                                                    <input type="radio" name="<?php echo e($item->name); ?>" value="other"> <?php echo e(__('validation.attributes.frontend.other')); ?>

                                                </label>
                                            </div>
                                        <?php elseif($item->type == 'textarea'): ?>
                                            <div class="contact-info mb-2">

                                            <textarea name="<?php echo e($item->name); ?>" placeholder="<?php echo e(__('labels.backend.general_settings.user_registration_settings.fields.'.$item->name)); ?>" class="form-control mb-0"><?php echo e(old($item->name)); ?></textarea>
                                            </div>
                                        <?php endif; ?>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                <?php endif; ?>

                                <?php if(config('access.captcha.registration')): ?>
                                    <div class="contact-info mt-3 text-center">
                                        <?php echo e(no_captcha()->display()); ?>

                                        <?php echo e(html()->hidden('captcha_status', 'true')->id('captcha_status')); ?>

                                        <span id="captcha-error" class="text-danger"></span>

                                    </div><!--col-->
                                <?php endif; ?>


                                <div class="contact-info mb-2 mx-auto w-50 py-4">
                                    <div class="nws-button text-center white text-capitalize">
                                        <button id="registerButton" type="submit"
                                                value="Submit"><?php echo app('translator')->get('labels.frontend.modal.register_now'); ?></button>
                                    </div>
                                </div>


                                <a href="<?php echo e(route('frontend.auth.teacher.register')); ?>"
                                   class="fgo-register float-left text-info mt-2">
                                    <?php echo app('translator')->get('labels.teacher.teacher_register'); ?>
                                </a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php endif; ?>

<?php $__env->startPush('after-scripts'); ?>
    <?php if(session('openModel')): ?>
        <script>
            $('#myModal').modal('show');
        </script>
    <?php endif; ?>


    <?php if(config('access.captcha.registration')): ?>
        <?php echo e(no_captcha()->script()); ?>


    <?php endif; ?>

    <script>
        $(function () {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });

            $(document).ready(function () {
                $(document).on('click', '.go-login', function () {
                    $('#register').removeClass('active').addClass('fade')
                    $('#login').addClass('active').removeClass('fade')

                });
                $(document).on('click', '.go-register', function () {
                    $('#login').removeClass('active').addClass('fade')
                    $('#register').addClass('active').removeClass('fade')
                });

                $(document).on('click', '#openLoginModal', function (e) {
                    $.ajax({
                        type: "GET",
                        url: "<?php echo e(route('frontend.auth.login')); ?>",
                        success: function (response) {
                            $('#socialLinks').html(response.socialLinks)
                            $('#myModal').modal('show');
                        },
                    });
                });

                $('#loginForm').on('submit', function (e) {
                    e.preventDefault();

                    var $this = $(this);
                    $('.success-response').empty();
                    $('.error-response').empty();

                    $.ajax({
                        type: $this.attr('method'),
                        url: $this.attr('action'),
                        data: $this.serializeArray(),
                        dataType: $this.data('type'),
                        success: function (response) {
                            $('#login-email-error').empty();
                            $('#login-password-error').empty();
                            $('#login-captcha-error').empty();

                            if (response.errors) {
                                if (response.errors.email) {
                                    $('#login-email-error').html(response.errors.email[0]);
                                }
                                if (response.errors.password) {
                                    $('#login-password-error').html(response.errors.password[0]);
                                }

                                var captcha = "g-recaptcha-response";
                                if (response.errors[captcha]) {
                                    $('#login-captcha-error').html(response.errors[captcha][0]);
                                }
                            }
                            if (response.success) {
                                $('#loginForm')[0].reset();
                                if (response.redirect == 'back') {
                                    location.reload();
                                } else {
                                    window.location.href = "<?php echo e(route('admin.dashboard')); ?>"
                                }
                            }
                        },
                        error: function (jqXHR) {
                            var response = $.parseJSON(jqXHR.responseText);
                            console.log(jqXHR)
                            if (response.message) {
                                $('#login').find('span.error-response').html(response.message)
                            }
                        }
                    });
                });

                $(document).on('submit','#registerForm', function (e) {
                    e.preventDefault();
                    console.log('he')
                    var $this = $(this);

                    $.ajax({
                        type: $this.attr('method'),
                        url: "<?php echo e(route('frontend.auth.register.post')); ?>",
                        data: $this.serializeArray(),
                        dataType: $this.data('type'),
                        success: function (data) {
                            $('#first-name-error').empty()
                            $('#last-name-error').empty()
                            $('#email-error').empty()
                            $('#password-error').empty()
                            $('#captcha-error').empty()
                            if (data.errors) {
                                if (data.errors.first_name) {
                                    $('#first-name-error').html(data.errors.first_name[0]);
                                }
                                if (data.errors.last_name) {
                                    $('#last-name-error').html(data.errors.last_name[0]);
                                }
                                if (data.errors.email) {
                                    $('#email-error').html(data.errors.email[0]);
                                }
                                if (data.errors.password) {
                                    $('#password-error').html(data.errors.password[0]);
                                }

                                var captcha = "g-recaptcha-response";
                                if (data.errors[captcha]) {
                                    $('#captcha-error').html(data.errors[captcha][0]);
                                }
                            }
                            if (data.success) {
                                $('#registerForm')[0].reset();
                                $('#register').removeClass('active').addClass('fade')
                                $('.error-response').empty();
                                $('#login').addClass('active').removeClass('fade')
                                $('.success-response').empty().html("<?php echo app('translator')->get('labels.frontend.modal.registration_message'); ?>");
                            }
                        }
                    });
                });
            });

        });
    </script>
<?php $__env->stopPush(); ?>
<?php /**PATH F:\laravel\resources\views/frontend/layouts/modals/loginModal.blade.php ENDPATH**/ ?>