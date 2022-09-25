<?php $__env->startSection('title', __('labels.backend.questions.title').' | '.app_name()); ?>

<?php $__env->startSection('content'); ?>
    <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
         rel = "stylesheet">


    <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <script src="https://cdn.ckeditor.com/4.6.2/standard-all/ckeditor.js"></script>

    
    <div class="card">
        <div class="card-header">
            <h3 class="page-title float-left mb-0">Selection of Tests</h3>
            <div class="float-right">
                <a href="<?php echo e(route('admin.questions.index')); ?>"
                   class="btn btn-success"><?php echo app('translator')->get('labels.backend.questions.view'); ?></a>
                <a id="add_another_question" style="display:none" href="<?php echo e(route('admin.questions.create')); ?>"
                       class="btn btn-success">Add Another Question</a>
            </div>
                     
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-12 form-group">
                    <?php echo Form::label('tests', 'Test', ['class' => 'control-label']); ?>

                    <?php
                        $i=0;
                    ?>                
                     <select class="form-control select2 required" name="tests_id" id="tests_id" placeholder="Options" multiple>
                        <?php $__currentLoopData = $tests; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $test): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <?php if($i ==0): ?>
                                <option value="<?php echo e($test->id); ?>" selected><?php echo e($test->title); ?></option>
                                <?php
                                    $i++;
                                ?>
                            <?php else: ?>
                                <option value="<?php echo e($test->id); ?>"><?php echo e($test->title); ?></option>                             
                            <?php endif; ?> 
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>  
                    </select>
                    <div id="tests_id1"></div>
                     <p class="help-block"></p>
                    <?php if($errors->has('question')): ?>
                        <p class="help-block">
                            <?php echo e($errors->first('question')); ?>

                        </p>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
    


        <div class="row">
            
            <div class="col-md-9">
                <div class="card">
                    <div class="card-header">
                        <h3 class="page-title float-left mb-0">Question Deatils</h3>           
                    </div>
                    <div id="question_edit" class="card-body">
                        <div class="row">
                            <div class="col-12" >
                                    <div class="form-group">
                                        <div class="form-group form-md-line-input has-info" style="margin-top:10px">
                                            <textarea name="question_content" id="question_content" class="form-control ckeditor"></textarea>
                                            <!-- <input type="text" class="form-control"   id="question_content"> -->
                                            
                                            <label for="question_content">Question</label>
                                        </div>                      
                                        <div class="form-group form-md-line-input has-info">
                                            <textarea name="help-editor" id="help-editor" class="form-control ckeditor"></textarea>
                                            
                                            <label for="question_help_info">Question Help or Information</label>
                                        </div>  
                                        <?php if($errors->has('question')): ?>
                                            <p class="help-block">
                                                <?php echo e($errors->first('question')); ?>

                                            </p>
                                        <?php endif; ?>
                                    </div>    
                                    <div class="mt-2">
                                        <img id="preview" src="" width="100%">
                                        <form id="question_type_image" action="" method="POST" enctype="multipart/form-data">
                                            <?php echo csrf_field(); ?>
                                            <div class="form-group">
                                                <label class="form-label">Image</label>
                                                <input type="file" id="img" class="form-control" name="file[]" accept="image/*">
                                                <input type="hidden" id="quiz_img" name="quiz_img" value="">
                                                
                                            </div>
                                        </form>
                                        <input type="hidden" name="last_q_id" id="last_q_id" value="<?php echo e($last_q_id); ?>">
                                    </div>       
                            </div>
                        </div>
                        </div>     
                </div>
                
                <div class="card">
                    <div class="card-header">
                        <h3>Question Type</h3>
                    </div>
                    <div class="card-body">
                        <div class="mb-2">
                            <?php
                                $question_type =['Single Input or Textarea','Check Box','RadioGroup','Image','Matrix','Rating','Dropdown','File','Stars','Range','€'];
                            ?>
                            <?php echo Form::label('question_type', trans('labels.backend.questions.fields.question_type'), ['class' => 'control-label']); ?>

                            <select class="form-control"  name="options" id="question_type" placeholder="Options">
                                <?php for($i=0 ;$i< count($question_type);$i++): ?>   
                                    <option value="<?php echo e($i); ?>"><?php echo e($question_type[$i]); ?></option>
                                <?php endfor; ?>
                                </select>
                            <p class="help-block" id="question_type1"></p>
                        </div>
                        <div id="question-type-box">
                            
                            <?php echo $__env->make('backend.questions.components.simple.single_input',[
                                
                            ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                            

                            
                            <?php echo $__env->make('backend.questions.components.simple.checkbox',[
                                'display' => 'none'
                            ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                            

                            
                            <?php echo $__env->make('backend.questions.components.simple.radiogroup',[
                                'display' => 'none'
                            ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                            
                            
                            
                            <?php echo $__env->make('backend.questions.components.simple.image',[
                                'display' => 'none'
                            ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>  
                                        

                            
                            <?php echo $__env->make('backend.questions.components.simple.matrix',[
                                'display' => 'none'
                            ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                            
                            
                            
                            <?php echo $__env->make('backend.questions.components.simple.file',[
                                'display' => 'none'
                            ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                            
                            
                            
                            <?php echo $__env->make('backend.questions.components.simple.dropdown',[
                                'display' => 'none'
                            ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                            

                            
                            <?php echo $__env->make('backend.questions.components.simple.range',[
                                'display' => 'none'
                            ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                            
                            
                            
                            <?php echo $__env->make('backend.questions.components.simple.rating',[
                                'display' => 'none'
                            ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                            

                            
                            <?php echo $__env->make('backend.questions.components.simple.euro',[
                                'display' => 'none'
                            ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                            
                            
                            <div id="score-box" class="form-group" style="display: none;">
                                <label class="from-label">Score</label>
                                <input type="number" id="score" name="score"  class="form-control" placeholder="0">
                            </div>
                        </div>
                    </div>
                </div>
                
                
                
                <div class="card">
                    <div class="card-header">
                        <h3 class="page-title float-left mb-0">Logic</h3>          
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12 form-group">                    
                                <div>
                                    <div class="logic_part" style="border:1px solid #bbbbbb;padding:10px;">
                                        
                                    
                                        <div class="text-right">
                                            <button id="condition_add" class="btn btn-danger">Add Condition</button>
                                        </div>
                                        <div id="sortable-14">
                                            <?php for($hh = 0;$hh < 5; $hh++): ?>
                                                <div class="logic_condition row clone" id="<?php echo e('logic_condition_'.$hh); ?>" style="padding-top:10px;">
                                                    <div class="col-3">
                                                        <select class="form-control btn-primary first_operator" name="first_operator" placeholder="Options">
                                                            <option value="0">And</option>
                                                            <option value="1">Or</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-4">
                                                        <input type="text" class="btn-success qt_name form-control" >
                                
                                                        <div class="tree_1 tree-demo" display="none">
                                                            <ul class="treecontent">
                                                                <?php for($i=0;$i<count($course_list);$i++): ?>
                                                                <li>                  
                                                                <?php echo e($course_list[$i]['title']); ?> </a>
                                                                    <ul>
                                                                        <?php for($j=0;$j<count($course_test_list[$i]);$j++): ?>
                                                                            <li>
                                                                                <?php echo e($course_test_list[$i][$j]['title']); ?>

                                                                                <ul>
                                                                                    <?php
                                                                                        $tk=  $course_test_list[$i][$j]['id'];
                                                                                    ?>
                                                                                    <?php if(isset($question_list[$tk])): ?>
                                                                                        <?php for($k=0;$k<count($question_list[$tk]);$k++): ?>
                                                                                            <li>
                                                                                                <?php echo e($question_list[$tk][$k]['id']); ?>.<?php echo e($question_list[$tk][$k]['question']); ?>

                                                                                            </li>
                                                                                        <?php endfor; ?>
                                                                                    <?php endif; ?>
                                                                                </ul>
                                                                            </li>
                                                                        <?php endfor; ?>
                                                                    </ul>
                                                                </li>                                     
                                                                <?php endfor; ?>
                                                            </ul>                   
                                                        </div>
                                                    </div>
                                                    <input class="qt_type" type="hidden" value="">
                                                    <div class="col-5">                                    
                                                        <select class="form-control btn-warning operators" name="operators" placeholder="Options">
                                                            <?php
                                                                $operators=["equals","not equals","contains","not contains","greater","less","greater or equals","less or equals"];
                                                            ?>
                                                            <?php for($i=0;$i<count($operators);$i++): ?>
                                                                <option value="<?php echo e($i); ?>"><?php echo e($operators[$i]); ?></option>
                                                            <?php endfor; ?>                                       
                                                        </select>
                                                    </div>
                                                    <div class="col-12 logic-content" style="padding-top:10px">
                                                    </div>
                                                    <div class="col-12" style="padding-top:10px;">                                            
                                                        <a class="btn btn-xs  btn-danger del-btnx" style="cursor:pointer;"><i class="fa fa-trash" style="color:white"></i></a>
                                                    </div>
                                                </div>
                                            <?php endfor; ?>
                                        </div>                         
                                    </div>
                                </div>
                            </div>
                            <?php if($errors->has('question')): ?>
                                <p class="help-block">
                                    <?php echo e($errors->first('question')); ?>

                                </p>
                            <?php endif; ?>
                        </div>
                
                    </div>
                </div>
                
            </div>
            

            
            <div class="col-md-3">
                <div class="card">
                    <div class="card-header">
                        <h3>Layout Properties</h3>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12">
                                <div class="form-check">
                                    <input type="radio" name="required" id="required" placeholder="" class="form-check-input" value="required"/>
                                    <?php echo Form::label('required', 'Is Required', ['class' => 'form-check-label']); ?>

                                </div>
                                <div id="more_than_one_answer_box" class="form-check">
                                    <input type="radio" name="required" id="more_than_one_answer" placeholder="" class="form-check-input" value="more_than_one_answer"/>
                                    <?php echo Form::label('more_than_one_answer', 'More than 1 answers', ['class' => 'form-check-label']); ?>

                                </div>
                                <?php echo Form::label('state', 'State', ['class' => 'control-label']); ?>

                                <select class="form-control" name="options" id="state" placeholder="Options">
                                    <option value="default">Default</option>
                                    <option value="collapsed">Collapsed</option>
                                    <option value="expanded">Expanded</option>
                                </select>

                                <?php echo Form::label('image_location', 'Image location', ['class' => 'control-label']); ?>

                                <select class="form-control" name="options" id="imageposition" placeholder="Options">
                                    <option value="top">Default</option>
                                    <option value="top">Top</option>
                                    <option value="bottom">Bottom</option>
                                    <option value="left">Left</option>
                                    <option value="right">Right</option>
                                    <option value="d-none">Hidden</option>
                                </select>

                                <?php echo Form::label('question_location', 'Question Location', ['class' => 'control-label']); ?>

                                <select class="form-control" name="options" id="titlelocation" placeholder="Options">
                                    <option value="top">top</option>
                                    <option value="center">In Box</option>
                                </select>

                                <?php echo Form::label('help_info_location', 'Help Info Show', ['class' => 'control-label']); ?>

                                <select class="form-control" name="options" id="help_info_location" placeholder="Options">
                                    <option value="block">Show</option>
                                    <option value="none">Hide</option>
                                </select>

                                <!-- <?php echo Form::label('title_font', 'Title Font', ['class' => 'control-label']); ?>

                                <input type="number" name="fontsize" id="fontsize" placeholder="" class="form-control" value="14"/> 

                                <?php echo Form::label('title_color', 'Title Color', ['class' => 'control-label']); ?>

                                <input type="color" name="titlecolor" id="title_color" placeholder="" class="form-control" value="#000"/>  -->


                                <!-- <?php echo Form::label('title_color', 'Title Color', ['class' => 'control-label']); ?>

                                <select class="form-control" name="options" id="title_color" placeholder="Options">
                                    <option value="blue">blue</option>
                                    <option value="red">red</option>
                                    <option value="white">white</option>
                                    <option value="black">black</option>
                                </select>     -->

                                <?php echo Form::label('answer_alignment', 'Answer Alignment', ['class' => 'control-label']); ?>

                                <select class="form-control" name="options" id="answer_alignment" placeholder="Options">
                                    <option value="grid">Grid</option>
                                    <option value="list">List</option>
                                </select>

                                <?php echo Form::label('imagefit', 'Image Fit', ['class' => 'control-label']); ?>  
                                <select class="form-control" name="options" id="image_fit" placeholder="Options">
                                    <option value="none">None</option>
                                    <option value="contain">Contain</option>
                                    <option value="cover">Cover</option>
                                    <option value="fill">Fill</option>
                                </select>

                                <?php echo Form::label('question_bg_color', 'Question Backgroud', ['class' => 'control-label']); ?>

                                <select class="form-control" name="options" id="question_bg_color" placeholder="Options">
                                    <option value="#fff">White</option>
                                    <option value="#90ee90">Light Green</option>
                                    <option value="#00FF00">Green</option>
                                    <option value="#006400">Dark Green</option>
                                    <option value="#C4A484">Brown</option>
                                    <option value="#654321">Dark Brown</option>
                                    <option value="#FFFFE0">Light Yellow</option>
                                    <option value="#FFFCC9">Yellow</option>
                                    <option value="#8B8000">Dark Yellow</option>
                                    <option value="#0000FF">Blue</option>
                                    <option value="#ADD8E6">Light blue</option>
                                    <option value="#00008B">Dark blue</option>
                                </select>

                                <?php echo Form::label('image_width', 'Image Width', ['class' => 'control-label']); ?>

                                <input type="text" name="image_width" id="image_width" placeholder="" class="form-control"  value=""/>
                                <div id="image_width1"></div>

                                <?php echo Form::label('image_height', 'Image Height', ['class' => 'control-label']); ?>

                                <input type="text" name="image_height" id="image_height" placeholder="" class="form-control"  value=""/>
                                <div id="image_height1"></div>

                                <!-- <?php echo Form::label('indent', 'Indent', ['class' => 'control-label']); ?>

                                <input type="number" name="indent" id="indent" placeholder="" class="form-control" value=""/> -->

                                <!-- <?php echo Form::label('width', 'Width', ['class' => 'control-label']); ?>

                                <input type="number" name="width" id="width" placeholder="" class="form-control" value=""/>

                                <?php echo Form::label('min_width', 'Min Width', ['class' => 'control-label']); ?>

                                <input type="number" name="min_width" id="min_width" placeholder="" class="form-control" value=""/>

                                <?php echo Form::label('max_width', 'Max Width', ['class' => 'control-label']); ?>

                                <input type="number" name="max_width" id="max_width" placeholder="" class="form-control" value=""/>

                                <?php echo Form::label('size', 'Size', ['class' => 'control-label']); ?>

                                <input type="number" name="size" id="size" placeholder="" class="form-control"  value=""/>
                                <div id="size1"></div>
                                 -->
                                <br/>
                                <br/>
                                <br/>


                                <div class="default-color">
                                    Default Setting
                                </div>

                                <?php echo Form::label('font_style', 'Font Style', ['class' => 'control-label']); ?>

                                <select class="form-control" name="options" id="default_font_style" placeholder="Options">
                                    <?php
                                        $font_style = [
                                            'inherit' => 'Inherit',
                                            'unsete' => 'Unsete',
                                            'initial' => 'Initial',
                                            'italic' => 'Italic',
                                            'normal' => 'Normal',
                                            'revert' => 'Revert',
                                            'oblique' => 'Oblique',
                                        ];
                                    ?>
                                    <?php $__currentLoopData = $font_style; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($key); ?>" <?php if($default->font_style==$key): ?> selected <?php endif; ?>><?php echo e($value); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>

                                <?php echo Form::label('font_family', 'Font Family', ['class' => 'control-label']); ?>

                                <select class="form-control" name="options" id="default_font_family" placeholder="Options">
                                    <?php
                                        $font_family = [
                                            'Arial,Helvetica,sans-serif' => 'Arial',
                                            'Comic Sans MS,cursive' => 'Comic Sans MS',
                                            'Courier New,Courier,monospace' => 'Courier New',
                                            'Georgia,serif' => 'Georgia',
                                            'Lucida Sans Unicode,Lucida Grande,sans-serif' => 'Lucida Sans Unicode',
                                            'Tahoma,Geneva,sans-serif' => 'Tahoma',
                                            'Times New Roman,Times,serif' => 'Times New Roman',
                                            'Trebuchet MS,Helvetica,sans-serif' => 'Trebuchet MS',
                                            'Verdana,Geneva,sans-serif' => 'Verdana',
                                        ];
                                    ?>
                                    <?php $__currentLoopData = $font_family; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($key); ?>" <?php if($default->font_family==$key): ?> selected <?php endif; ?>><?php echo e($value); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>

                                <?php echo Form::label('default_font_size', 'Font Size', ['class' => 'control-label']); ?>

                                <input type="text" name="default_font_size" id="default_font_size" placeholder="" class="form-control"  value="<?php echo e($default->font_size); ?>"/>

                                <?php echo Form::label('font_color', 'Font Color', ['class' => 'control-label']); ?>

                                <input type="color" name="font_color" id="default_font_color" placeholder="" class="form-control"  value="<?php echo e($default->font_color); ?>"/>
                                
                                <?php echo Form::label('background_color', 'Background Color', ['class' => 'control-label']); ?>

                                <input type="color" name="background_color" id="default_background_color" placeholder="" class="form-control"  value="<?php echo e($default->background_color); ?>"/>
                            
                            </div> 
                        </div>
                    </div>
                </div>
                <div class="mt-2 mb-2">
                    <button id="save_data" class="btn btn-danger">Save Data</button>
                </div>
            </div>

            
        </div>


    

    <!-- <?php for($question=1; $question<=2; $question++): ?>
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-12 form-group">
                    <?php echo Form::label('option_text_' . $question, trans('labels.backend.questions.fields.option_text').'*', ['class' => 'control-label']); ?>

                    <?php echo Form::textarea('option_text_' . $question, old('option_text'), ['class' => 'form-control ', 'rows' => 3, 'required' =>  true]); ?>

                    <p class="help-block"></p>
                    <?php if($errors->has('option_text_' . $question)): ?>
                        <p class="help-block">
                            <?php echo e($errors->first('option_text_' . $question)); ?>

                        </p>
                    <?php endif; ?>
                </div>
            </div>
            <div class="row">
                <div class="col-12 form-group">
                    <?php echo Form::label('explanation_' . $question, trans('labels.backend.questions.fields.option_explanation'), ['class' => 'control-label']); ?>

                    <?php echo Form::textarea('explanation_' . $question, old('explanation_'.$question), ['class' => 'form-control ', 'rows' => 3]); ?>

                    <p class="help-block"></p>
                    <?php if($errors->has('explanation_' . $question)): ?>
                        <p class="help-block">
                            <?php echo e($errors->first('explanation_' . $question)); ?>

                        </p>
                    <?php endif; ?>
                </div>
            </div>
            <div class="row">
                <div class="col-12 form-group">
                    <?php echo Form::label('correct_' . $question, trans('labels.backend.questions.fields.correct'), ['class' => 'control-label']); ?>

                    <?php echo Form::hidden('correct_' . $question, 0); ?>

                    <?php echo Form::checkbox('correct_' . $question, 1, false, []); ?>

                    <p class="help-block"></p>
                    <?php if($errors->has('correct_' . $question)): ?>
                        <p class="help-block">
                            <?php echo e($errors->first('correct_' . $question)); ?>

                        </p>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
    <?php endfor; ?>
    <div class="col-12 text-center">
        <?php echo Form::submit(trans('strings.backend.general.app_save'), ['class' => 'btn btn-danger mb-4 form-group']); ?>

    </div>

    <?php echo Form::close(); ?> -->
    
    <script type="text/javascript" src="<?php echo e(asset('js/select2.full.min.js')); ?>"></script>
    <script type="text/javascript" src="<?php echo e(asset('js/main.js')); ?>"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script type="text/javascript" src="<?php echo e(asset('js/ui-nestable.js')); ?>"></script>
    <script type="text/javascript" src="<?php echo e(asset('js/jquery.nestable.js')); ?>"></script>

    <!-- <script type="text/javascript" src="<?php echo e(asset('js/select2.min.js')); ?>"></script> -->
    <script type="text/javascript" src="<?php echo e(asset('js/jquery.dataTables.min.js')); ?>"></script>
    <script type="text/javascript" src="<?php echo e(asset('js/dataTables.bootstrap.js')); ?>"></script>
    
    <script type="text/javascript" src="<?php echo e(asset('js/table-editable.js')); ?>"></script>
    <script type="text/javascript" src="<?php echo e(asset('js/question-create.js')); ?>"></script>

    <script src="<?php echo e(asset('assets/metronic_assets/global/plugins/jquery.min.js')); ?>" type="text/javascript"></script>


    <script type="text/javascript" src="<?php echo e(asset('js/3.5.1/jquery.min.js')); ?>"></script>

    
    <link rel="stylesheet" type="text/css" href="<?php echo e(asset('assets/metronic_assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css')); ?>"/>   
    <script type="text/javascript" src="<?php echo e(asset('assets/metronic_assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js')); ?>"></script>

    
    <script src="<?php echo e(asset('plugins/bootstrap-tagsinput/bootstrap-tagsinput.js')); ?>"></script>
<!--
    <script type="text/javascript" src="<?php echo e(asset('/vendor/unisharp/laravel-ckeditor/ckeditor.js')); ?>"></script>
    <script type="text/javascript" src="<?php echo e(asset('/vendor/unisharp/laravel-ckeditor/adapters/jquery.js')); ?>"></script>
-->
    <script src="<?php echo e(asset('/vendor/laravel-filemanager/js/lfm.js')); ?>"></script>
    <script>

        CKEDITOR.replace('question_content', {
            height : 300,
            filebrowserUploadUrl: `<?php echo e(route('admin.questions.editor_fileupload',['_token' => csrf_token() ])); ?>`,
            filebrowserUploadMethod: 'form',
            extraPlugins: 'font,widget,colorbutton,colordialog,justify',
        });

        CKEDITOR.replace('help-editor', {
            height : 300,
            filebrowserUploadUrl: `<?php echo e(route('admin.questions.editor_fileupload',['_token' => csrf_token() ])); ?>`,
            filebrowserUploadMethod: 'form',
            extraPlugins: 'font,widget,colorbutton,colordialog,justify',
        });


        jQuery(document).ready(function(e) {       
            // initiate layout and plugins
            // Metronic.init(); // init metronic core components
            // Layout.init(); // init current layout
            // QuickSidebar.init(); // init quick sidebar
            // Demo.init(); // init demo features
            UITree.init();  
            UINestable.init();
            TableEditable.init();
            QuestionCreate.init();  
            //UIToastr.init();  
        });

        $('.jstree-anchor').on('click', function(e) {
            alert("clicked");
            e.preventDefault();

            // This removes the class on selected li's
            $("#sizelist li").removeClass("select");

            // adds 'select' class to the parent li of the clicked element
            // 'this' here refers to the clicked a element
            $(this).closest('li').addClass('select');

            // sets the input field's value to the data value of the clicked a element
            $('#sizevalue').val($(this).data('value'));
        });

        function radioScore(ele){
            // var id = $(ele).attr('id');
            // console.log(id);
            // $('#'+id).attr('value',$(ele).val());
            // console.log($('#'+id).val());
            $(ele).data('value',ele.value);
            $('#'+ele.dataset.q_id).attr('value',ele.value);
            // console.log($('body .q_id'+ele.dataset.q_id).val());
            console.log($('#'+ele.dataset.q_id));

        }
    </script>
<?php $__env->stopSection(); ?>

<?php echo $__env->make('backend.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\laravel\resources\views/backend/questions/create.blade.php ENDPATH**/ ?>