
<div id="dropdown_part" class="row question-box" <?php if(isset($display)): ?> style="display:<?php echo e($display); ?>;" <?php endif; ?>>
    <?php
        $dropdown_size = '100';
        $alignment = 'left';
        if(isset($content)){
            $radioContent = json_decode($content);
            foreach($radioContent as $key=>$c) {
                if(isset($c->dropdown_size)) {
                    $dropdown_size = $c->dropdown_size;
                }
                if(isset($c->alignment)) {
                    $alignment = $c->alignment;
                }
            }
        }
    ?>
    <div class="col-12">
        <label class="type-file">Aligment</label>
        <select class="form-control" name="options" id="dropdown_alignment" placeholder="Options">
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
    <div class="col-12">
        <label class="type-file">Size (%)</label>
        <input type="number" class="form-control" id = "dropdown_size" placeholder="Number" value='<?php echo e($dropdown_size); ?>'>
    </div>
    <div class="col-12">
        <a id="dropdown_add" class="btn btn-success" style="color:white; margin-top:10px;">+ New</a>
    </div>
    <div class="col-12  form-group " id="sortable_drop">
    <!-- <form> -->
        <?php if(isset($content)): ?>
            <?php
                $radioContent = json_decode($content);
            ?>
            <?php $__currentLoopData = $radioContent; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$c): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php if(isset($c->label)): ?>
                    <div class="radio">
                    <label  style="color:transparent"><input type="radio" name="opt_drop" <?php if(isset($c->is_checked)): ?><?php echo e(($c->is_checked==1) ? 'checked' : ''); ?><?php endif; ?>>Option 1</label>
                        <input class="radio_label" type="text" value="<?php echo e($c->label); ?>" style="margin-left:-2vw;;margin-right:5vw;z-index:20;border:none;">
                        <label  >Score</label>
                        <input  class ="radio_score" type="text"   value="<?php echo e($c->score); ?>" style="margin-right:1vw">
                        <a class="btn btn-xs mb-2 btn-danger del-btnx" style="cursor:pointer;" data-id="41">
                            <i class="fa fa-trash" style="color:white"></i>
                        </a>
                    </div>
                <?php endif; ?>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        <?php else: ?>
            <div class="radio">
                <label  style="color:transparent"><input type="radio" name="radio" checked>Option</label>
                <input class="radio_label" type="text" value="1" style="margin-left:-2vw;;margin-right:5vw;z-index:20;border:none;">
                <label  >Score</label>
                <input  class ="radio_score" type="text"   value="" style="margin-right:1vw">
                <a class="btn btn-xs mb-2 btn-danger del-btnx" style="cursor:pointer;" data-id="41">
                    <i class="fa fa-trash" style="color:white"></i>
                </a>
            </div>
            <div class="radio">
                <label  style="color:transparent"><input type="radio" name="radio" >Option</label>
                <input class="radio_label" type="text" value="2" style="margin-left:-2vw;;margin-right:5vw;z-index:20;border:none;">
                <label  >Score</label>
                <input  class ="radio_score" type="text"   value="" style="margin-right:1vw">
                <a class="btn btn-xs mb-2 btn-danger del-btnx" style="cursor:pointer;" data-id="42">
                    <i class="fa fa-trash" style="color:white"></i>
                </a>
            </div>
        <?php endif; ?>
    </div>
</div>
<?php /**PATH F:\laravel\resources\views/backend/questions/components/simple/dropdown.blade.php ENDPATH**/ ?>