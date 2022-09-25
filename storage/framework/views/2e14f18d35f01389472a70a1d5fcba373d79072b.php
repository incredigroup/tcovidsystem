<div class="radiogroup" data-required="<?php if($question->required=="1"): ?> 1 <?php else: ?> 0 <?php endif; ?>">
 
  <?php if($content != ''): ?>
  <div class="row radio_content">
    <?php
      foreach($content as $key => $c){
        if(isset($c->col)) $col = $c->col;
        if(isset($c->display)) $display = $c->display;
      }
    ?>
    <?php $__currentLoopData = $content; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$c): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
      <?php if(isset($c->label)): ?>
      <div class="row">
        <div class="form-check form-check-inline">
          <input class="form-check-input <?php echo e(' radio_'.$key); ?>" type="radio" name="radiogroup" id="<?php echo e($question->id); ?>" data-key="<?php echo e($key+1); ?>" value="<?php echo e($c->score); ?>" data-score="<?php echo e($c->score); ?>">
          <label class="form-check-label" for="inlineRadio1"><?php echo e($c->label); ?></label>
        </div>
      </div>
      <?php endif; ?>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
  </div>
    <div class="message mt-2">
    </div>
  <?php endif; ?>
</div><?php /**PATH F:\laravel\resources\views/frontend/components/questions/radiogroup.blade.php ENDPATH**/ ?>