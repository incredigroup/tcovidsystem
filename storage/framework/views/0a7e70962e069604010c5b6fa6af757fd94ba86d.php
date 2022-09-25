<?php
  $dropdown_alignment = "0%";
  $size_num = 0;
  $space = 0;
  if($content != '') {
    foreach($content as $key => $c){
      if(isset($c->dropdown_size)) $dropdown_size = $c->dropdown_size.'%';
      if(isset($c->dropdown_size)) $size_num = $c->dropdown_size;
      if(isset($c->dropdown_alignment)) $dropdown_alignment = $c->dropdown_alignment;
    }
    if ($dropdown_alignment == 'center') {
      $space = (100-$size_num)/2;
      $dropdown_alignment = '50%';
    } else if ( $dropdown_alignment == 'right') {
      $space = 100-$size_num;
      $dropdown_alignment = '100%';
    }
  }
?>

<div class="dropdowninput" data-required="<?php if($question->required=="1"): ?> 1 <?php else: ?> 0 <?php endif; ?>" style="width:<?php echo e($dropdown_size); ?>; transform:translateX(<?php echo e($space); ?>%);">
    <div class="form-group">
        <!-- <label for="">Select Value</label> -->
        <select class="form-control dropdown" name="dropdown"  id="<?php echo e($question->id); ?>">
        
          <option value="">Select Option</option>
          
            <?php $__currentLoopData = $content; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$c): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
              <?php if($key != (sizeof($content)-1)): ?>
                <?php if(isset($c->label)): ?>
                    <option id="opt" data-key="<?php echo e($key+1); ?>" value="<?php echo e($c->score); ?>"><?php echo e($c->label); ?></option>
                <?php endif; ?>
              <?php endif; ?>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </select>
  </div>
  <span class="message mt-2"></span>
</div><?php /**PATH F:\laravel\resources\views/frontend/components/questions/dropdown.blade.php ENDPATH**/ ?>