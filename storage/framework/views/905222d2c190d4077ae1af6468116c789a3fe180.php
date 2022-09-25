<div class="">
    <div class="checkbox-input" data-required="<?php if($question->required=="1"): ?> 1 <?php else: ?> 0 <?php endif; ?>">
        <?php
            $temp_val =1;
            $p_use = 0;
            $content = json_decode($question->content);
            foreach($content as $key => $c){
                if(isset($c->col)) $col = $c->col;
            }
        ?>
        <div class="row check_content">
            <?php $__currentLoopData = $content; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $c): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <?php if(isset($c->label)): ?>
                <div class="row">
                    <div class="form-check">
                        <div class="square-check gradient-bg" style="background-color: <?php echo e($default->background_color); ?>;  background: linear-gradient(to right, <?php echo e($default->background_color); ?> 0%, <?php echo e($default->background_color); ?> 51%, <?php echo e($default->background_color); ?> 100%) !important; color: <?php echo e($default->font_color); ?>; font-size:<?php echo e($default->font_size); ?>; font-family:<?php echo e($default->font_family); ?>;font-style:<?php echo e($default->font_style); ?>">
                            <input class="form-check-input <?php echo e(' checkbox_'.$key); ?>" name="checkbox-radio" type="radio" data-qid="<?php echo e($question->id); ?>" data-key="<?php echo e($key+1); ?>" value="<?php echo e($c->score); ?>" <?php echo e((isset($identy[$question->id]))?($identy[$question->id]==$c->score)?'data-opendiv='.$ids[$question->id]:'':''); ?> name="flexRadioDefault"  id="<?php echo e($question->id); ?>">
                            <?php echo e($c->label); ?>

                            <div class="square-check--content"></div>
                        </div>
                    </div>
                </div>
                <?php endif; ?>
                <?php
                    $temp_val++;
                ?>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </div>
    </div>
    <span class="message mt-2"></span>
</div><?php /**PATH F:\laravel\resources\views/frontend/components/questions/checkbox.blade.php ENDPATH**/ ?>