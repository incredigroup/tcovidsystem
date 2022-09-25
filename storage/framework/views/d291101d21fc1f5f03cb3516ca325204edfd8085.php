

<div id="rangs_part" class="row question-box" <?php if(isset($display)): ?> style="display:<?php echo e($display); ?>;" <?php endif; ?>>
    <div class="col-12">
    <!-- <a id="dropdown_add" class="btn btn-success" style="color:white; margin-top:10px;">+ New</a> -->
    </div>
    <?php if(isset($content)): ?>
        <?php
            $content = json_decode($content);
            
        ?>
        <div class="col-12">
            <label class="type-file">Table Font Color</label>
            <input type="color" class="form-control col-12" id = "range_color" placeholder="color" value='<?php echo e($content->range_color); ?>'>
        </div>
        <br />
        <div class="col-12  form-group " id="sortable_drop1">
            <!-- <form> -->         
            <div class="radio">
                <label  style="">
                     Min Value
                    <input id="range_min_value" type="text" name="optradio" value="<?php echo e($content->min_value); ?>">
                </label>
                Max Value 
                <input id="range_max_value" type="text" class="radio_label" value="<?php echo e($content->max_value); ?>">
                <label>Step</label>
                <input id="step_value" type="text"  class ="radio_score mr-2" value="<?php echo e($question->score); ?>" placeholder="<?php echo e($question->score); ?>">
            </div>
        </div>
        <div class="col-12">
        <div class="form-group">
            <label>Select Symbol</label>
            <select id="range_symbol" class="form-control">
                <option value="0" <?php if($content->symbol=="0"): ?> selected <?php endif; ?>>None</option>
                <option value="1" <?php if($content->symbol=="1"): ?> selected <?php endif; ?>>€</option>
            </select>
        </div>
        <div class="form-group">
            <label>Range Type</label>
            <select id="range_type" class="form-control">
                <option value="1" <?php if($content->type=="1"): ?> selected <?php endif; ?>>Cursor Bar</option>
                <option value="2" <?php if($content->type=="2"): ?> selected <?php endif; ?>>+/- Button</option>
            </select>
        </div>
    </div>
    <?php else: ?>

        <!-- <div class="col-12">
            <label class="type-file">Table Font Color</label>
            <input type="color" class="form-control col-12" id = "range_color" placeholder="color" value='#282f79'>
        </div> -->
        
        <div class="col-12  form-group " id="sortable_drop1">
        <!-- <form> -->         
        <div class="radio">
            <label  style="">
                 Min Value
                <input id="range_min_value" type="text" name="optradio" value="1">
            </label>
            Max Value 
            <input id="range_max_value" type="text" class="radio_label" value="10">
            <label>Step</label>
            <input type="text" id="step_value"  class ="radio_score mr-2" placeholder="0">
        </div>
        </div>
        <div class="col-12">
        <div class="form-group">
            <label>Select Symbol</label>
            <select id="range_symbol" class="form-control">
                <option value="0" selected>None</option>
                <option value="1">€</option>
            </select>
        </div>
        <div class="form-group">
            <label>Range Type</label>
            <select id="range_type" class="form-control">
                <option value="1" selected>Cursor Bar</option>
                <option value="2">+/- Button</option>
            </select>
        </div>
    </div>
    <?php endif; ?>
</div>
<?php /**PATH F:\laravel\resources\views/backend/questions/components/simple/range.blade.php ENDPATH**/ ?>