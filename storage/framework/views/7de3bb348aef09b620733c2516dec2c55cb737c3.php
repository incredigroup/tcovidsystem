<?php $__env->startSection('title', __('labels.backend.tests.title').' | '.app_name()); ?>

<?php $__env->startPush('after-styles'); ?>
    <style>
        .select2-container--default .select2-selection--single {
            height: 35px;
        }

        .select2-container--default .select2-selection--single .select2-selection__rendered {
            line-height: 35px;
        }

        .select2-container--default .select2-selection--single .select2-selection__arrow {
            height: 35px;
        }

    </style>
<?php $__env->stopPush(); ?>
<?php $__env->startSection('content'); ?>

    <?php echo Form::open(['method' => 'POST', 'route' => ['admin.tests.store']]); ?>


    <div class="card">
        <div class="card-header">
            <h3 class="page-title float-left mb-0"><?php echo app('translator')->get('labels.backend.tests.create'); ?></h3>
            <div class="float-right">
                <a href="<?php echo e(route('admin.tests.index')); ?>"
                   class="btn btn-success"><?php echo app('translator')->get('labels.backend.tests.view'); ?></a>
            </div>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-12 col-lg-6 form-group">
                    <?php echo Form::label('course_id', trans('labels.backend.tests.fields.course'), ['class' => 'control-label']); ?>

                    <?php echo Form::select('course_id', $courses, old('course_id'), ['class' => 'form-control select2']); ?>


                </div>

                <div class="col-12 col-lg-6  form-group">
                    <?php echo Form::label('title',trans('labels.backend.tests.fields.title'), ['class' => 'control-label']); ?>

                    <?php echo Form::text('title', old('title'), ['class' => 'form-control', 'placeholder' => trans('labels.backend.tests.fields.title')]); ?>


                </div>
            </div>

            <div class="row">
                <div class="col-12 form-group">
                    <?php echo Form::label('description',trans('labels.backend.tests.fields.description'), ['class' => 'control-label']); ?>

                    <?php echo Form::textarea('description', old('description'), ['class' => 'form-control ', 'placeholder' => trans('labels.backend.tests.fields.description')]); ?>

                </div>
            </div>
            <div class="row">
                <div class="col-12 form-group">
                    <?php echo Form::hidden('published', 0); ?>

                    <?php echo Form::checkbox('published', 1, false, []); ?>

                    <?php echo Form::label('published', trans('labels.backend.tests.fields.published'), ['class' => 'control-label font-weight-bold']); ?>


                </div>
            </div>
        </div>
    </div>

    <?php echo Form::submit(trans('strings.backend.general.app_save'), ['class' => 'btn btn-danger']); ?>

    <?php echo Form::close(); ?>

<?php $__env->stopSection(); ?>



<?php echo $__env->make('backend.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\laravel\resources\views/backend/tests/create.blade.php ENDPATH**/ ?>