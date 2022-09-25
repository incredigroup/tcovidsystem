<?php echo html_entity_decode($question->content);?>
<div class="hidden">
    <input type="text" id="font_style" value="<?php echo e($default->font_style); ?>">
    <input type="text" id="font_family" value="<?php echo e($default->font_family); ?>">
</div>
<script>
    var background_color = "<?php echo e($default->background_color); ?>";
    var font_style = $('#font_style').val();
    var font_color = "<?php echo e($default->font_color); ?>";
    var font_size = "<?php echo e($default->font_size); ?>";
    var font_family = $('#font_family').val();
    // var background = "linear-gradient(to right, "+background_color+" 0%, "+background_color+" 51%, "+background_color+" 100%) !important";
    $('#add-matrix #header_row_col1').css({"background": background_color});
    $('#add-matrix #header_row_col1 th label').css({"color": font_color, "font-family": font_family,"font-size": font_size, "font-style": font_style});
    $('#add-matrix td label').css({"color": "#000000", "font-family": font_family, "font-style": font_style});
    // $('a.preview-del-button').css({"background": background, "color": font_color, "font-family": font_family, "font_style": font_style})
</script><?php /**PATH F:\laravel\resources\views/frontend/components/questions/matrix.blade.php ENDPATH**/ ?>