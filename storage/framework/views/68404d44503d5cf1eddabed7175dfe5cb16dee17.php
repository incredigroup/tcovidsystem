
<?php
    if(isset($content)){
        $content = json_decode($question->content);
    }
    $alignment = 'left';
    $size = '100';
    $mtop = '';
    $type = '';
    isset($content[0]->alignment) ? $alignment = $content[0]->alignment : '';
    isset($content[0]->type) ? $type = $content[0]->type : '';
    isset($content[0]->size) ? $size = $content[0]->size : '';
    isset($content[0]->mtop) ? $mtop = $content[0]->mtop : '';
?>
<div id="single_input_part" class="question-box" <?php if(isset($display)): ?> style="display:<?php echo e($display); ?>;" <?php endif; ?>>
    <div class="form-group d-flex">
        <label class="type-file">Aligment</label>
        <select class="form-control" name="options" id="single_input_alignment" placeholder="Options">
            <?php
                $alignment_arr = [
                    'left' => 'Left',
                    'center' => 'Center',
                    'right' => 'Right',
                ];
            ?>
            <?php $__currentLoopData = $alignment_arr; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <option value="<?php echo e($key); ?>" <?php if($alignment == $key): ?> selected <?php endif; ?>><?php echo e($value); ?></option>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </select>
    </div>
    <div class="form-group d-flex">
        <label class="type-file">Input Type</label>
        <select class="form-control" name="options" id="single_input_type" placeholder="Options">
            <?php
                $type_arr = [
                    'input' => 'Input',
                    'textarea' => 'Textarea',
                ];
            ?>
            <?php $__currentLoopData = $type_arr; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <option value="<?php echo e($key); ?>" <?php if($type == $key): ?> selected <?php endif; ?>><?php echo e($value); ?></option>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </select>
    </div>
    <div class="form-group d-flex">
        <label class="type-file">Size (%)</label>
        <input type="number" class="form-control" id = "single_input_size" placeholder="" value='<?php echo e($size); ?>'>
    </div>
    <!-- <div class="form-group d-flex">
        <label class="type-file">Margin From Top (px)</label>
        <input type="number" class="form-control" id = "single_input_mtop" placeholder="" value='<?php echo e($mtop); ?>'>
    </div> -->
</div>
<?php /**PATH F:\laravel\resources\views/backend/questions/components/simple/single_input.blade.php ENDPATH**/ ?>