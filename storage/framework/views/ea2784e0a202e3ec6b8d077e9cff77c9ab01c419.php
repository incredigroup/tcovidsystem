
<?php
    $image_count = 2;
    if(isset($question->content) && $question->content != null){
        $content = json_decode($question->content);
        if(is_array($content)){
            $col = isset($content[(sizeof($content))-1]->col)?$content[(sizeof($content))-1]->col:'';
        }
        else{
            $col = '';
        }
        
    }
?>
<div id="image_part" class="row question-box" <?php if(isset($display)): ?> style="display:<?php echo e($display); ?>;" <?php endif; ?>>
    <div class="col-12">
        <label for="">Select Display</label>
        <?php if(isset($content)): ?>
           <?php
               $con = $content;
               foreach($con as $key => $c){
                   if(isset($c->display)){
                       $display = $c->display;
                   }
               }
           ?>
       <?php endif; ?>
        <?php $disp_len = 4; $max = 12; ?>
        <select name="display_image" class="form-control" id="display_image">
            <?php for($i = 1; $i <= $disp_len; $i++): ?>
               <option value="<?php echo e('col-'.$max/$i); ?>" <?php if(isset($display)): ?><?php if($i == $display): ?> selected <?php endif; ?> <?php endif; ?>><?php echo e($i); ?></option>
            <?php endfor; ?>
        </select>
    </div>
    <div class="col-md-12 form-body">                                    
        <div class="form-group ">
            <!-- <label class="control-label col-md-3">Image Upload</label> -->
            <div class="col-md-12">
                <form method="POST" enctype="multipart/form-data" class="image-upload-form" action="javascript:void(0)" id="sortable-13">
                    <?php echo csrf_field(); ?>
                    <div class="form-group " id="sortable-11">
                        <div class="input-group hdtuto control-group lst increment image_part_file" style="margin-right:30%">
                            
                            
                            <div class="input-group-btn"> 
                                <button class="btn btn-success add-btn" type="button">+</button>
                            </div>
                            
                            
                        </div>
                            <?php if(isset($content) && !empty($content[0]->image)): ?>
                                <?php $__currentLoopData = $content[0]->image; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$c): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                    <div class="image_part_file" >
                                        <div class="hdtuto control-group lst input-group" style="margin-top:10px">
                                            <input type="file" name="file[]" class="b-images images myfrm form-control">
                                            <input  class="imge_names" type="hidden" value="<?php echo e($c); ?>">
                                            <div class="input-group-btn">
                                                <button class="btn btn-danger del-btn" type="button"><i class="fa fa-trash" style="color:white"></i></button>
                                            </div>
                                            <label style="margin-left:5vw;margin-right:1vw;">Score</label>
                                            <input class="image_score" type="text" value="<?php echo e($content[0]->score[$key]); ?>" style="margin-right:1vw">
                                            <img src="<?php echo e('/uploads/image/'.$c); ?>"  width="50px" height="50px" style="object-fit:fill">
                                        </div>
                                    </div>
                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                            <?php else: ?>
                                <div class="image_part_file">
                                    <div class="hdtuto control-group lst input-group" style="margin-top:10px">
                                        <input type="file" name="file[]" class="b-images images myfrm form-control q">
                                        <div class="input-group-btn">
                                            <button class="btn btn-danger del-btn" type="button"><i class="fa fa-trash" style="color:white"></i></button>
                                        </div>
                                        <label style="margin-left:5vw;margin-right:1vw;">Score</label>
                                        <input class="image_score" type="text" value="" style="margin-right:1vw">                             </div>
                                </div>
                            <?php endif; ?>
                    </div>
                    
                    <div class="clone-sample" style="display: none;">
                        <div class="image_part_file">
                            <div class="hdtuto control-group lst input-group" style="margin-top:10px;padding-right:8%;">
                                <input type="file" name="file[]" class="b-images images myfrm form-control q">
                                <input  class="imge_names" type="hidden" value="">
                                <div class="input-group-btn"> 
                                <button class="btn btn-danger del-btn" type="button"><i class="fa fa-trash" style="color:white"></i></button>
                                </div>
                                <label  style="margin-left:5vw;margin-right:1vw;">Score</label>
                                <input  class="image_score" type="text"   value="" style="margin-right:1vw">
                            </div>                                  
                        </div>
                    </div>
            
                
                </form>
            </div>
        </div>            
    </div>
</div>   
<?php /**PATH F:\laravel\resources\views/backend/questions/components/simple/image.blade.php ENDPATH**/ ?>