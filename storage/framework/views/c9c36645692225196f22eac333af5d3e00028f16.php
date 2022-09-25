<?php if(isset($content->symbol)): ?>
    <?php if($content->symbol == "1"): ?>
    <!-- <div class="mb-2">
        Value in €
    </div> -->
    <?php endif; ?>
<?php endif; ?>
<?php if(isset($content)): ?>
<?php if(isset($content->type)==1): ?>
    <div class="mb-2 radiogroup cursorbar"><div class="d-flex">
            <div class="minus text-center">
                <i class="fas fa-minus"></i> <br>
               
                <span id="max-val"><?php echo e(number_format($content->min_value, 0, ',', '.')); ?> €</span>

            </div>
            <div class="range-slider col-10">
                <div id="tooltip" class="ctooltip"></div>
              <!-- <input name="range" class="rangeslider" type="range"     min="<?php echo e($content->min_value); ?>" max="<?php echo e($content->max_value); ?>" value="<?php echo e($content->min_value); ?>"> -->
              <input name="b_range" class="crange" id="range" data-id="<?php echo e($question->id); ?>" type="range" min="<?php echo e($content->min_value); ?>" step="<?php echo e($content->steps); ?>" max="<?php echo e($content->max_value); ?>" value="$content->min_value}}">
              <!-- <div class="range-output text-center">
                <output class="output" name="output" for="range">
                  <?php echo e($content->min_value); ?>

                </output>
              </div> -->
            </div>
            <div class="plus text-center">
                <i class="fas fa-plus"></i> <br>
                <span id="min-val"><?php echo e(number_format($content->max_value, 0, ',', '.')); ?> €</span>
            </div>
        </div>
    </div>

<?php else: ?>
    <div class="radiogroup cursorbar btns"><div class="d-flex">
            <button type="button" class="minus btn-minus text-center">
                -
            </button>
            <div class="input-range">
                <input name="b_range" id="<?php echo e($question->id); ?>" type="number" class="form-control rangevalue" min="<?php echo e($content->min_value); ?>" step="<?php echo e($content->steps); ?>" max="<?php echo e($content->max_value); ?>" value="<?php echo e($content->min_value); ?>" <?php if($content->symbol=="1"): ?> step="any" <?php endif; ?>>
            </div>
            <button type="button" class="plus btn-plus text-center">
                +
            </button>
        </div>
    </div>
<?php endif; ?>
<?php endif; ?>
<?php /**PATH F:\laravel\resources\views/frontend/components/questions/rangs.blade.php ENDPATH**/ ?>