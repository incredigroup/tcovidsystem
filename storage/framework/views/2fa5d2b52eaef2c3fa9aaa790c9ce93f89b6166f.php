<?php
    $file_type = '';
    $file_dimention = '';
    $number = 1;
    if(isset($question->content)){
        $content = json_decode($question->content);
        isset($content[0]->number) ? $number = $content[0]->number : '';
        isset($content[0]->file_dimention) ? $file_dimention = $content[0]->file_dimention : '';
        isset($content[0]->file_type) ? $file_type = $content[0]->file_type : '';
    }
?>



<div id="file_upload_input" class="question-box" <?php if(isset($display)): ?> style="display:<?php echo e($display); ?>;" <?php endif; ?>>
    <div class="form-group">
        <label class="type-file">Type of File</label>
        <input type="text" class="form-control" placeholder="Separate with dots.  Ex: doc,pdf,wav " id="file_type" value="<?php echo e($file_type); ?>">
    </div>
    <div class="form-group">
        <label> Dimention of Files (MB) </label>
        <input type="number" class="form-control dimention-file" max="20" id="file_dimention" placehoder="Maxmum size is 20MB" value="<?php echo e($file_dimention); ?>">
    </div>
    <div class="form-group">
        <label for="Number of Files"> Nuermious of Files </label>
        <input type="number" class="form-control" min="1" id="num_files" max="3" name="num_files" placeholder="Please type number of files" value="<?php echo e($number); ?>">
    </div>
</div>                          

<?php /**PATH F:\laravel\resources\views/backend/questions/components/simple/file.blade.php ENDPATH**/ ?>