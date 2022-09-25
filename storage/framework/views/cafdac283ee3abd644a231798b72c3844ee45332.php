<?php
    $q_number=1;
    $ids = [];
    $identy = [];
?>
<?php $__currentLoopData = $lesson->questions; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $question): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
    <?php
        if($question->logic != "[]"){
            $logic_data = $question->logic;
            $decoded_json_data = json_decode($logic_data);
            foreach($decoded_json_data as $key=>$data){
                $ids[$question->id]=$data[1];
                $identy[$question->id] = $data[3];
            }
        }
    ?>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
<?php $__currentLoopData = $lesson->questions; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $question): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
    <?php
        $content = json_decode($question->content);
        if($question->questionimage==""){
            $question->questionimage=null;
        }
    ?>
    <?php if(in_array($question->id,$ids)): ?>
        <div id="q_<?php echo e($question->id); ?>" class="question-card card custom-card mb-3 p-2" data-page="<?php echo e($question->page_number); ?>" style="background-color:<?php echo e(($question->question_bg_color != '')?$question->question_bg_color:'#fff'); ?>;box-shadow: 1px 1px 6px <?php echo e(($question->question_bg_color != '' && $question->question_bg_color != '#fff')?'2px':'-3px'); ?>  <?php echo e(($question->question_bg_color != '' && $question->question_bg_color != '#fff')?$question->question_bg_color:'#000'); ?>;">
            <form id="checkForm">
            <div class="row">
                    <div class="col-2 p-0"><span class="q_number gradient-bg my-auto"><?php echo e($q_number++); ?></span></div>
                    <div class="col-8 p-0">
                        
                        <?php if($question->titlelocation == 'col-12 order-1'): ?>
                        <?php echo html_entity_decode($question->question); ?>

                        <!-- <h2 class="d-inline-flex question-heading  w-100">
                            <span class=""><?php echo html_entity_decode($question->question); ?></span>
                        <h2> -->
                        <?php endif; ?>
                    </div>
                    <?php if(!$question->required): ?>
                        <?php
                            $col = 4;
                        ?>
                    <?php else: ?>
                        <?php
                            $col = 2;
                        ?>
                    <?php endif; ?>
                    <?php 
                            if(isset($question->answer_aligment)){
                                if(($question->answer_aligment == 'offset-md-0')){
                                    $aligment = 'col-12 '.$question->answer_aligment;
                                }else{
                                    $aligment = $question->answer_aligment;
                                }
                            }else{
                                $aligment = 'col-12';
                            }  
                            if(isset($question->image_aligment)){
                                if(($question->image_aligment == 'offset-md-0')){
                                    $imagealigment = 'col-12 '.$question->image_aligment;
                                }else{
                                    $imagealigment = $question->image_aligment;
                                }
                            }else{
                                $imagealigment = 'col-12';
                            }
                            
                        ?>
                    <div class="col-2 p-0 text-right ">
                        <?php if($question->help_info_location == 'display'): ?>
                            <span data-toggle="modal" data-target="#exampleModalLong<?php echo e($question->id); ?>" style="" class="d-inline-block mr-2"><img src="https://www.diagnosiaziendale.it/storage/logos/help.png" class="img-responsive" width="29px" height="35px"></span>
                        <?php endif; ?>
                        <?php echo $__env->make('frontend.components.questions.required', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                    </div>
                </div>
                <hr>
            <div class="card-body">
            <?php if($question->imageposition == 'left'): ?>
                    <!-- question,answer,image in same row but first question,second image and third is answer -->
                    <div class="row">
                        <?php if($question->questionimage!==null): ?>
                        <div class="question-image">
                            <img src="<?php echo e(asset('uploads/image/'.$question->questionimage)); ?>" width="<?php echo e($question->imagewidth); ?>" height="<?php echo e($question->imageheight); ?>">
                        </div>
                        <?php endif; ?>
                        <div class="question-answer-area" style="width: calc(100% - <?php echo e($question->imagewidth); ?>px - 45px);">
                            <?php if($question->titlelocation == 'center'): ?>
                            <span><?php echo html_entity_decode($question->question); ?></span>
                            <?php endif; ?>
                            <div class="question-help-area" style="display: <?php echo e($question->help_info_location); ?>">
                                    <span><?php echo html_entity_decode($question->help_info); ?></span>
                            </div>
                            <?php echo $__env->make('frontend.components.questions.inputs', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                        </div>
                    </div>
                <?php elseif($question->imageposition == 'top'): ?>
                    <div class="row">
                        <?php if($question->questionimage!==null): ?>
                        <div class="question-image  top-bottm-m">
                            <img src="<?php echo e(asset('uploads/image/'.$question->questionimage)); ?>" width="<?php echo e($question->imagewidth); ?>" height="<?php echo e($question->imageheight); ?>">
                        </div>
                        <?php endif; ?>
                    </div>
                    <div class="row">
                        <div class="question-answer-area w-100">
                            <?php if($question->titlelocation == 'center'): ?>
                            <span><?php echo html_entity_decode($question->question); ?></span>
                            <?php endif; ?>
                            <div class="question-help-area" style="display: <?php echo e($question->help_info_location); ?>">
                                    <span><?php echo html_entity_decode($question->help_info); ?></span>
                            </div>
                            <?php echo $__env->make('frontend.components.questions.inputs', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                        </div>
                    </div>
                <?php elseif($question->imageposition == 'right'): ?>
                    <div class="row">
                        <div class="question-answer-area" style="width: calc(100% - <?php echo e($question->imagewidth); ?>px - 45px);">
                        <?php if($question->titlelocation == 'center'): ?>
                            <span><?php echo html_entity_decode($question->question); ?></span>
                            <?php endif; ?>
                            <div class="question-help-area" style="display: <?php echo e($question->help_info_location); ?>">
                                    <span><?php echo html_entity_decode($question->help_info); ?></span>
                            </div>    
                        <?php echo $__env->make('frontend.components.questions.inputs', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                        </div>
                        <?php if($question->questionimage!==null): ?>
                        <div class="question-image">
                            <img src="<?php echo e(asset('uploads/image/'.$question->questionimage)); ?>" width="<?php echo e($question->imagewidth); ?>" height="<?php echo e($question->imageheight); ?>">
                        </div>
                        <?php endif; ?>
                    </div>
                <?php elseif($question->imageposition == 'bottom'): ?>
                    <div class="row">
                        <div class="question-answer-area w-100">
                        <?php if($question->titlelocation == 'center'): ?>
                            <span><?php echo html_entity_decode($question->question); ?></span>
                            <div class="question-help-area" style="display: <?php echo e($question->help_info_location); ?>">
                                <span><?php echo html_entity_decode($question->help_info); ?></span>
                            </div>
                            <?php endif; ?>
                            <?php echo $__env->make('frontend.components.questions.inputs', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                        </div>
                    </div>
                    <div class="row">
                        <?php if($question->questionimage!==null): ?>
                        <div class="question-image top-bottm-m">
                            <img src="<?php echo e(asset('uploads/image/'.$question->questionimage)); ?>" width="<?php echo e($question->imagewidth); ?>" height="<?php echo e($question->imageheight); ?>">
                        </div>
                        <?php endif; ?>
                    </div>
                <?php elseif($question->imageposition == 'default'): ?>
                    <div class="row">
                        <?php if($question->questionimage!==null): ?>
                        <div class="question-image">
                            <img src="<?php echo e(asset('uploads/image/'.$question->questionimage)); ?>" width="<?php echo e($question->imagewidth); ?>" height="<?php echo e($question->imageheight); ?>">
                        </div>
                        <?php endif; ?>
                        <div class="question-answer-area w-100">
                        <?php if($question->titlelocation == 'center'): ?>
                            <span><?php echo html_entity_decode($question->question); ?></span>
                            <?php endif; ?>
                            <div class="question-help-area" style="display: <?php echo e($question->help_info_location); ?>">
                                    <span><?php echo html_entity_decode($question->help_info); ?></span>
                            </div>
                            <?php echo $__env->make('frontend.components.questions.inputs', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                        </div>
                    </div>
                <?php elseif($question->imageposition == 'd-none'): ?>
                    <div class="row">
                        <div class="question-answer-area w-100">
                        <?php if($question->titlelocation == 'center'): ?>
                            <span><?php echo html_entity_decode($question->question); ?></span>
                            <div class="question-help-area" style="display: <?php echo e($question->help_info_location); ?>">
                                <span><?php echo html_entity_decode($question->help_info); ?></span>
                            </div>
                            <?php endif; ?>
                            <?php echo $__env->make('frontend.components.questions.inputs', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                        </div>
                    </div>
                <?php endif; ?> 

                <?php
                    $content = json_decode($question->content);
                    $logic_content = json_decode($question->logic);
                
                ?>
               
                <div class="hidden-information">
                    <input type="hidden" class="qt_type" value="<?php echo e($question->questiontype); ?>">
                    <input type="hidden" class="logic_cnt" value="<?php echo e(count($logic_content)); ?>">
                </div>
                <input type="hidden" id="displayed_answer" value="0">
                <?php for($k=0;$k< count($logic_content);$k++): ?>
                    <div class="logic_<?php echo e($k); ?>">
                        <input type="hidden" class="logic_type" value="<?php echo e($logic_content[$k][0]); ?>">
                        <input type="hidden" class="logic_qt" value="<?php echo e($logic_content[$k][1]); ?>">
                        <input type="hidden" class="logic_operator" value="<?php echo e($logic_content[$k][2]); ?>">
                        <?php $__currentLoopData = $logic_content[$k][3]; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <input type="hidden" class="<?php echo e('logic_cont '.$key); ?>" name="logic_cont[]" value="<?php echo e($value); ?>">
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        <input type="hidden" class="logic_state" value="0">
                    </div>
                <?php endfor; ?>
                
            </div>
            </form>
            
        </div>
    <?php else: ?>
        <div id="q_<?php echo e($question->id); ?>" class="question-card card custom-card mb-3 p-2" data-page="<?php echo e($question->page_number); ?>" style="background-color:<?php echo e(($question->question_bg_color != '')?$question->question_bg_color:'#fff'); ?>;box-shadow: 1px 1px 6px <?php echo e(($question->question_bg_color != '' && $question->question_bg_color != '#fff')?'2px':'-3px'); ?>  <?php echo e(($question->question_bg_color != '' && $question->question_bg_color != '#fff')?$question->question_bg_color:'#000'); ?>;">
            <form id="checkForm">
            <div class="row">
                    <div class="col-10 p-0">
                        <span class="q_number gradient-bg my-auto"><?php echo e($q_number++); ?></span>
                        <?php if($question->titlelocation == 'top'): ?>
                        <span ><?php echo html_entity_decode($question->question); ?></span>
                        <?php endif; ?>
                    </div>
                    <?php if(!$question->required): ?>
                        <?php
                            $col = 4;
                        ?>
                    <?php else: ?>
                        <?php
                            $col = 2;
                        ?>
                    <?php endif; ?>
                    <?php 
                            if(isset($question->answer_aligment)){
                                if(($question->answer_aligment == 'offset-md-0')){
                                    $aligment = 'col-12 '.$question->answer_aligment;
                                }else{
                                    $aligment = $question->answer_aligment;
                                }
                            }else{
                                $aligment = 'col-12';
                            }  
                            if(isset($question->image_aligment)){
                                if(($question->image_aligment == 'offset-md-0')){
                                    $imagealigment = 'col-12 '.$question->image_aligment;
                                }else{
                                    $imagealigment = $question->image_aligment;
                                }
                            }else{
                                $imagealigment = 'col-12';
                            }
                            
                        ?>
                    <div class="col-2 p-0 text-right ">
                        <?php if($question->help_info_location == 'display'): ?>
                            <span data-toggle="modal" data-target="#exampleModalLong<?php echo e($question->id); ?>" style="display:<?php echo e($question->help_info_location); ?>" class="d-inline-block mr-2"><img src="https://www.diagnosiaziendale.it/storage/logos/help.png" class="img-responsive" width="29px" height="35px"></span>
                        <?php endif; ?>
                        <?php echo $__env->make('frontend.components.questions.required', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                    </div>
                </div>
                <hr>
            <div class="card-body">
                <?php if($question->imageposition == 'left'): ?>
                    <!-- question,answer,image in same row but first question,second image and third is answer -->
                    <div class="row">
                        <?php if($question->questionimage!==null): ?>
                        <div class="question-image">
                            <img src="<?php echo e(asset('uploads/image/'.$question->questionimage)); ?>" width="<?php echo e($question->imagewidth); ?>" height="<?php echo e($question->imageheight); ?>">
                        </div>
                        <?php endif; ?>
                        <div class="question-answer-area" style="width: calc(100% - <?php echo e($question->imagewidth); ?>px - 45px);">
                            <?php if($question->titlelocation == 'center'): ?>
                            <span><?php echo html_entity_decode($question->question); ?></span>
                            <?php endif; ?>
                            <div class="question-help-area" style="display: <?php echo e($question->help_info_location); ?>">
                                    <span><?php echo html_entity_decode($question->help_info); ?></span>
                            </div>
                            <?php echo $__env->make('frontend.components.questions.inputs', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                        </div>
                    </div>
                <?php elseif($question->imageposition == 'top'): ?>
                    <div class="row">
                        <?php if($question->questionimage!==null): ?>
                        <div class="question-image  top-bottm-m">
                            <img src="<?php echo e(asset('uploads/image/'.$question->questionimage)); ?>" width="<?php echo e($question->imagewidth); ?>" height="<?php echo e($question->imageheight); ?>">
                        </div>
                        <?php endif; ?>
                    </div>
                    <div class="row">
                        <div class="question-answer-area w-100">
                            <?php if($question->titlelocation == 'center'): ?>
                            <span><?php echo html_entity_decode($question->question); ?></span>
                            <?php endif; ?>
                            <div class="question-help-area" style="display: <?php echo e($question->help_info_location); ?>">
                                    <span><?php echo html_entity_decode($question->help_info); ?></span>
                            </div>
                            <?php echo $__env->make('frontend.components.questions.inputs', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                        </div>
                    </div>
                <?php elseif($question->imageposition == 'right'): ?>
                    <div class="row">
                        <div class="question-answer-area" style="width: calc(100% - <?php echo e($question->imagewidth); ?>px - 45px);">
                        <?php if($question->titlelocation == 'center'): ?>
                            <span><?php echo html_entity_decode($question->question); ?></span>
                            <?php endif; ?>
                            <div class="question-help-area" style="display: <?php echo e($question->help_info_location); ?>">
                                    <span><?php echo html_entity_decode($question->help_info); ?></span>
                            </div>    
                        <?php echo $__env->make('frontend.components.questions.inputs', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                        </div>
                        <?php if($question->questionimage!==null): ?>
                        <div class="question-image">
                            <img src="<?php echo e(asset('uploads/image/'.$question->questionimage)); ?>" width="<?php echo e($question->imagewidth); ?>" height="<?php echo e($question->imageheight); ?>">
                        </div>
                        <?php endif; ?>
                    </div>
                <?php elseif($question->imageposition == 'bottom'): ?>
                    <div class="row">
                        <div class="question-answer-area w-100">
                        <?php if($question->titlelocation == 'center'): ?>
                            <span><?php echo html_entity_decode($question->question); ?></span>
                            <div class="question-help-area" style="display: <?php echo e($question->help_info_location); ?>">
                                <span><?php echo html_entity_decode($question->help_info); ?></span>
                            </div>
                            <?php endif; ?>
                            <?php echo $__env->make('frontend.components.questions.inputs', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                        </div>
                    </div>
                    <div class="row">
                        <?php if($question->questionimage!==null): ?>
                        <div class="question-image top-bottm-m">
                            <img src="<?php echo e(asset('uploads/image/'.$question->questionimage)); ?>" width="<?php echo e($question->imagewidth); ?>" height="<?php echo e($question->imageheight); ?>">
                        </div>
                        <?php endif; ?>
                    </div>
                <?php elseif($question->imageposition == 'default'): ?>
                    <div class="row">
                        <?php if($question->questionimage!==null): ?>
                        <div class="question-image">
                            <img src="<?php echo e(asset('uploads/image/'.$question->questionimage)); ?>" width="<?php echo e($question->imagewidth); ?>" height="<?php echo e($question->imageheight); ?>">
                        </div>
                        <?php endif; ?>
                        <div class="question-answer-area w-100">
                        <?php if($question->titlelocation == 'center'): ?>
                            <span><?php echo html_entity_decode($question->question); ?></span>
                            <?php endif; ?>
                            <div class="question-help-area" style="display: <?php echo e($question->help_info_location); ?>">
                                    <span><?php echo html_entity_decode($question->help_info); ?></span>
                            </div>
                            <?php echo $__env->make('frontend.components.questions.inputs', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                        </div>
                    </div>
                <?php elseif($question->imageposition == 'd-none'): ?>
                    <div class="row">
                        <div class="question-answer-area w-100">
                        <?php if($question->titlelocation == 'center'): ?>
                            <span><?php echo html_entity_decode($question->question); ?></span>
                            <div class="question-help-area" style="display: <?php echo e($question->help_info_location); ?>">
                                <span><?php echo html_entity_decode($question->help_info); ?></span>
                            </div>
                            <?php endif; ?>
                            <?php echo $__env->make('frontend.components.questions.inputs', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                        </div>
                    </div>
                <?php endif; ?>            
                <?php
                    $content = json_decode($question->content);
                    $logic_content = json_decode($question->logic);
                
                ?>
                
                <div class="hidden-information">
                    <input type="hidden" class="qt_type" value="<?php echo e($question->questiontype); ?>">
                    <input type="hidden" class="logic_cnt" value="<?php echo e(count($logic_content)); ?>">
                </div>
                <input type="hidden" id="displayed_answer" value="0">
                <?php for($k=0;$k< count($logic_content);$k++): ?>
                    <div class="logic_<?php echo e($k); ?>">
                        <input type="hidden" class="logic_type" value="<?php echo e($logic_content[$k][0]); ?>">
                        <input type="hidden" class="logic_qt" value="<?php echo e($logic_content[$k][1]); ?>">
                        <input type="hidden" class="logic_operator" value="<?php echo e($logic_content[$k][2]); ?>">
                        <?php $__currentLoopData = $logic_content[$k][3]; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <input type="hidden" class="<?php echo e('logic_cont '.$key); ?>" name="logic_cont[]" value="<?php echo e($value); ?>">
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        <input type="hidden" class="logic_state" value="0">
                    </div>
                <?php endfor; ?>
                
            </div>
            </form>
            
        </div>
    <?php endif; ?>
<?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
<div class="text-right">
    <div id="navigation-btns" class="mb-2" style="">
        <button type="button" id="pre-pg" class="btn btn-danger">Previous</button>
        <button type="button" id="next-pg" class="btn btn-danger">Next</button>
    </div>
    
    <div class="genius-btn btn-block text-white  gradient-bg text-center text-uppercase  bold-font" id="report_div" style="width: 150px; float: right;">
        <a id="create-report" href="javascript:void(0);" class="">Report</a>
    </div>
    <div class="genius-btn mt60 gradient-bg ml-auto custom-btn" id="update_report_div" style="display: none; width: 150px;">
        <a id="update-report" href="javascript:void(0);" class="">Save Report</a>
    </div>
    
</div>
<div class="report-card card mt-2" style="display: none;">
    <div class="card-body">
        <div id="report">
        </div>
    </div>
</div>

<script src="https://cdn.amcharts.com/lib/4/core.js"></script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/material.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/kelly.js"></script>
<script src='https://cdn.plot.ly/plotly-2.9.0.min.js'></script>
<script src="<?php echo e(asset('js/pie-chart.js')); ?>"></script>
<script src="<?php echo e(asset('js/bar-chart.js')); ?>"></script>
<script src="<?php echo e(asset('js/d3bar-chart.js')); ?>"></script>
<script src="<?php echo e(asset('js/donut-chart.js')); ?>"></script>
<script src="<?php echo e(asset('js/horizontal-bar.js')); ?>"></script>
<script src="<?php echo e(asset('js/line-chart.js')); ?>"></script>
<script src="<?php echo e(asset('js/radar-chart.js')); ?>"></script>
<script src="<?php echo e(asset('js/polar-chart.js')); ?>"></script>
<script src="<?php echo e(asset('js/bubble-chart.js')); ?>"></script>
<script src="<?php echo e(asset('js/radar1-chart.js')); ?>"></script>
<script src="<?php echo e(asset('js/responsive-table.js')); ?>"></script>
<script src="<?php echo e(asset('js/sortable-table.js')); ?>"></script>
<script src="<?php echo e(asset('js/no-table-chart.js')); ?>"></script>


<script>
    
    function inputToData(ele){
        if(ele.type == 'radio'){
            $('.radioselected').each(function(el){
                console.log(el);
                $(this).removeClass('selected');
                $(this).attr('data-selected','false');
            });
            $(ele).addClass('selected');
            $(ele).attr('data-selected','true');
        }else{
            ele.value=ele.value.toString().replace('.','').replace(/\B(?=(\d{3})+(?!\d))/g, ".");
            $(ele).data('value',ele.value);
            $('.q_id'+ele.dataset.q_id).data('value',ele.value);
        }
    }

    
</script>

<?php /**PATH F:\laravel\resources\views/frontend/components/questions/questions.blade.php ENDPATH**/ ?>