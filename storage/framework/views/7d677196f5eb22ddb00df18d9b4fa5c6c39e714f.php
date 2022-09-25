<!-- <div class="mb-2">
    <div class="form-group">
    <label for="">Example file input</label>
    <input type="file" class="form-control-file" id="">
  </div>
</div> -->

<!-- <div class="mt-2">
      <img id="preview" src="" width="100%">
      <form id="user_type_image" action="" method="POST" enctype="multipart/form-data">
          <?php echo csrf_field(); ?>
          <div class="form-group">
              <label class="form-label">Image</label>
              <input type="file" id="img"  class="form-control" name="file" accept="image/*">
              <input type="hidden" id="quiz_img" name="quiz_img" value="">
          </div>
      </form>
  </div>  -->
<?php
    $content = json_decode($question->content);
    $number_of_files = $content[0]->number;
?>
<div class="mt-2">
    <form id="question_type_image" action="" method="POST" enctype="multipart/form-data">
        <?php echo csrf_field(); ?>
        <div class="form-group">
            <!-- <label class="form-label">Image</label> -->
            <input type="file" id="files" class="form-control" name="files[]" accept="/*" multiple>
            <input type="hidden" name="files" class="files_user" id="<?php echo e($question->id); ?>" value="">
            <input type="hidden" id="user_upload_file" name="user_upload_file" value="">
            <input type="hidden" id="file_q_id" name="user_upload_img" value="<?php echo e($question->id); ?>">
            <input type="hidden" id="num_files" name="num_files" value="<?php echo e($number_of_files); ?>">
        </div>
    </form>
    <div id="preview">
        
    </div>
</div> 

<script>
    var filePath = `<?php echo e(route('user_upload_files')); ?>`;
    var image_defaultPath = `<?php echo e(asset('uploads/storage/')); ?>`;
    var background_color = '<?php echo e($default->background_color); ?>';
    var font_style = '<?php echo e($default->font_style); ?>';
    var font_color = '<?php echo e($default->font_color); ?>';
    var font_family = '<?php echo e($default->font_family); ?>';
    var background = "linear-gradient(to right, "+background_color+" 0%, "+background_color+" 51%, "+background_color+" 100%) !important";
    $('a.preview-del-button').css({"background": background, "color": font_color, "font-family": font_family, "font_style": font_style})
</script><?php /**PATH F:\laravel\resources\views/frontend/components/questions/file.blade.php ENDPATH**/ ?>