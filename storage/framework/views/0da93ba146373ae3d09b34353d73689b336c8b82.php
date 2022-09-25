<?php
    $alignment = "0%";
    $size = "100%";
    $size_num = 0;
    $space = 0;
    $type = "input";
    if(isset($content)){
        if($content[0]->size) {
            $size = $content[0]->size.'%';
            $size_num = $content[0]->size;
        }
        $type=$content[0]->type;
        $alignment=$content[0]->alignment;
    }
    if ($alignment == 'center') {
        $space = (100 - $size_num)/2;
        $alignment = '50%';
    } else if ( $alignment == 'right') {
        $space = 100-$size_num;
        $alignment = '100%';
    }
?>
<div class="single-input-container">
    <div class="single-input" style="width:<?php echo e($size); ?>; transform:translateX(<?php echo e($space); ?>%);">
        <?php if($type == "input"): ?>
        <div class="single_input_individual">
            <input type="text" class="form-control"  id="<?php echo e($question->id); ?>" name="single_input[]" placeholder="Write your answer" <?php if($question->required): ?> required <?php endif; ?>>
            <span class="message mt-2"></span>
        </div>
        <?php else: ?>
        <div class="single_input_individual">
            <textarea class="form-control" id="<?php echo e($question->id); ?>"  name="single_input[]" placeholder="Write your answer" <?php if($question->required): ?> required <?php endif; ?>></textarea>
        </div>
        <?php endif; ?>
        <!-- <div class="more_answers">
        </div> -->
        <!-- <?php if($question->more_than_one_answer==1): ?>
            <div class="genius-btn mt60 gradient-bg ml-auto custom-btn">
                <a href="javascript:void(0);" class="btn-add-answer">Add another answer</a>
            </div>
        <?php endif; ?> -->
    </div>
</div><?php /**PATH F:\laravel\resources\views/frontend/components/questions/single_input.blade.php ENDPATH**/ ?>