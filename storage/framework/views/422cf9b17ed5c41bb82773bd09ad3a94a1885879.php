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
            </div>         
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-12 form-group">
                    <?php echo Form::label('tests', 'Test', ['class' => 'control-label']); ?>

                    <?php
                        $i=0;
                        $selected_tests = array();
                        foreach($question_tests as $q){
                            array_push($selected_tests, $q->test_id);
                        }
                    ?>
                     <select class="form-control select2 required" name="tests_id" id="tests_id" placeholder="Options" multiple>
                        <?php $__currentLoopData = $tests; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $test): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                            <option value="<?php echo e($test->id); ?>"  <?php if(in_array($test->id, $selected_tests)): ?> selected <?php endif; ?>><?php echo e($test->title); ?></option>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>  
                    </select>
                    
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
                        <input type="hidden" id="question_id" value="<?php echo e($question->id); ?>">
                        <div class="row">
                            <div class="col-12" >
                                    <div class="form-group">
                                        <div class="form-group form-md-line-input has-info" style="margin-top:10px">
<!--                                            <textarea name="question_content" id="question_content" class="form-control ckeditor"></textarea>-->
                                            <!-- <input type="text" class="form-control"   id="question_content"> -->
                                            <?php echo Form::textarea('content', $question->question , ['class' => 'form-control ckeditor', 'placeholder' => '','name'=>'question_content','id' => 'question_content']); ?>

                                            <label for="question_content">Question</label>
                                        </div>                      
                                        <div class="form-group form-md-line-input has-info">
<!--                                            <textarea name="help-editor" id="help-editor" class="form-control ckeditor"></textarea>-->
                                            <?php echo Form::textarea('content', $question->help_info , ['class' => 'form-control ckeditor', 'placeholder' => '','id' => 'help-editor']); ?>

                                            <label for="question_help_info">Question Help or Information</label>
                                        </div>  
                                        <?php if($errors->has('question')): ?>
                                            <p class="help-block">
                                                <?php echo e($errors->first('question')); ?>

                                            </p>
                                        <?php endif; ?>
                                    </div>    
                                    <div class="mt-2">
                                        <img id="preview" src="<?php if($question->questionimage!="" && $question->questionimage!=null): ?> <?php echo e(asset('uploads/image/'.$question->questionimage)); ?> <?php endif; ?>" width="100%">
                                        <form id="question_type_image" action="" method="POST" enctype="multipart/form-data">
                                            <?php echo csrf_field(); ?>
                                            <div class="form-group">
                                                <label class="form-label">Image</label>
                                                <input type="file" id="img" class="form-control" name="file[]" accept="image/*">
                                                <input type="hidden" id="quiz_img" name="quiz_img" value="<?php echo e($question->questionimage); ?>">
                                            </div>
                                        </form>
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
                                $question_type =['Single Input','Check Box','RadioGroup','Image','Matrix','Rating','Dropdown','File','Stars','Range','€'];
                            ?>
                            <?php echo Form::label('question_type', trans('labels.backend.questions.fields.question_type'), ['class' => 'control-label']); ?>

                            <select class="form-control"  name="options" id="question_type" placeholder="Options">
                                <?php for($i=0 ;$i< count($question_type);$i++): ?>   
                                    <option value="<?php echo e($i); ?>" <?php if($question->questiontype==$i): ?> selected <?php endif; ?>><?php echo e($question_type[$i]); ?></option>
                                <?php endfor; ?>
                            </select>
                            <p class="help-block"></p>
                        </div>
                        <div id="question-type-box">
                            
                            <?php switch($question->questiontype):
                                
                                case (0): ?>
                                
                                    <?php echo $__env->make('backend.questions.components.simple.single_input', [
                                        'content' => $question->content
                                    ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.checkbox',[ 'display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.radiogroup',[ 'display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.image',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>  
                                    <?php echo $__env->make('backend.questions.components.simple.matrix',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.file',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.dropdown',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.range',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.rating',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.euro',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php break; ?>
                                
                                <?php case (1): ?>
                                    <?php echo $__env->make('backend.questions.components.simple.checkbox',[
                                        'content' => $question->content
                                    ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.single_input',[ 'display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.radiogroup',[ 'display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.image',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>  
                                    <?php echo $__env->make('backend.questions.components.simple.matrix',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.file',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.dropdown',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.range',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.rating',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.euro',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php break; ?>
                                
                                <?php case (2): ?>
                                    <?php echo $__env->make('backend.questions.components.simple.radiogroup',[
                                        'content' => $question->content
                                    ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.checkbox',[ 'display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.single_input',[ 'display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.image',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>  
                                    <?php echo $__env->make('backend.questions.components.simple.matrix',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.file',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.dropdown',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.range',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.rating',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.euro',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php break; ?>
                                
                                <?php case (3): ?>
                                    <?php echo $__env->make('backend.questions.components.simple.image', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.radiogroup',[ 'display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.checkbox',[ 'display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.single_input',[ 'display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>  
                                    <?php echo $__env->make('backend.questions.components.simple.matrix',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.file',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.dropdown',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.range',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.rating',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.euro',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php break; ?>
                                
                                <?php case (4): ?>
                                    <?php echo $__env->make('backend.questions.components.simple.matrix',[
                                        'content' => $question->content
                                    ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.radiogroup',[ 'display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.checkbox',[ 'display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.single_input',[ 'display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.image',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>  
                                    <?php echo $__env->make('backend.questions.components.simple.file',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.dropdown',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.range',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.rating',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.euro',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php break; ?>
                                
                                <?php case (5): ?>
                                
                                <?php case (8): ?>
                                    <?php echo $__env->make('backend.questions.components.simple.rating',[
                                        'content' => $question->content
                                    ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.radiogroup',[ 'display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.checkbox',[ 'display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.single_input',[ 'display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.image',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>  
                                    <?php echo $__env->make('backend.questions.components.simple.matrix',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.file',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.dropdown',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.range',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.euro',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php break; ?>
                                
                                <?php case (6): ?>
                                    <?php echo $__env->make('backend.questions.components.simple.dropdown',[
                                        'content' => $question->content
                                    ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.radiogroup',[ 'display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.checkbox',[ 'display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.single_input',[ 'display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.image',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>  
                                    <?php echo $__env->make('backend.questions.components.simple.matrix',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.file',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.range',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.rating',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.euro',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php break; ?>
                                
                                <?php case (7): ?>
                                    <?php echo $__env->make('backend.questions.components.simple.file', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.radiogroup',[ 'display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.checkbox',[ 'display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.single_input',[ 'display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.image',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>  
                                    <?php echo $__env->make('backend.questions.components.simple.matrix',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.dropdown',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.range',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.rating',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.euro',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php break; ?>
                                
                                <?php case (9): ?>
                                    
                                    <?php echo $__env->make('backend.questions.components.simple.range',[
                                        'content' => $question->content
                                    ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.radiogroup',[ 'display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.checkbox',[ 'display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.single_input',[ 'display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.matrix',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.file',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.rating',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.euro',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php break; ?>
                                
                                <?php case (10): ?>
                                    <?php echo $__env->make('backend.questions.components.simple.euro',[
                                        'content' => $question->content
                                    ], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.radiogroup',[ 'display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.checkbox',[ 'display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.single_input',[ 'display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.image',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>  
                                    <?php echo $__env->make('backend.questions.components.simple.matrix',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.file',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.dropdown',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.range',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php echo $__env->make('backend.questions.components.simple.rating',['display' => 'none'], \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
                                    <?php break; ?>
                                <?php default: ?>
                                    
                            <?php endswitch; ?>

                            
                            <div id="score-box" class="form-group" style="display: none;">
                                <label class="from-label">Score</label>
                                <input type="number" id="score" name="score"  class="form-control" placeholder="0" <?php if($question->questiontype==0): ?> value="<?php echo e($question->score); ?>" <?php endif; ?>>
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
                                            <?php if($question->logic != "[]"): ?>
                                                <?php
                                                    $logics = json_decode($question->logic); 
                                                ?>
                                                <?php $__currentLoopData = $logics; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $logic): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                    <div class="logic_condition row" id="logic_condition_<?php echo e($key); ?>" style="padding-top:10px;">
                                                            <div class="col-3">
                                                                <select class="form-control btn-primary first_operator" name="first_operator" placeholder="Options">
                                                                    <option value="0" <?php echo e(($logic[0] == 0)?'selected':''); ?>>And</option>
                                                                    <option value="1" <?php echo e(($logic[0] == 1)?'selected':''); ?>>Or</option>
                                                                </select>
                                                            </div>
                                                            <div class="col-4">
                                                                <?php 
                                                                    $data= DB::table('questions')->where('id','=',$logic[1])->first();
                                                                ?>
                                                                <?php if(isset($data->question)): ?>
                                                                    <input type="text" class="btn-success qt_name form-control" id="logic_qt_name" value="<?php echo e($logic[1].'.'.$data->question); ?>">
                                                                <?php else: ?>
                                                                    <input type="text" class="btn-success qt_name form-control" id="logic_qt_name" value="">
                                                                <?php endif; ?>
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
                                                            <?php if(isset($data->id)): ?>
                                                                <input class="qt_type" type="hidden" value="<?php echo e($data->id); ?>">
                                                            <?php else: ?>
                                                                <input class="qt_type" type="hidden" value="">
                                                            <?php endif; ?>
                                                            <div class="col-5">                                    
                                                                <select class="form-control btn-warning operators" name="operators" placeholder="Options">
                                                                    <?php
                                                                        $operators=["equals","not equals","contains","not contains","greater","less","greater or equals","less or equals"];
                                                                    ?>
                                                                    <?php for($i=0;$i<count($operators);$i++): ?>
                                                                        <option value="<?php echo e($i); ?>" <?php echo e(($logic[2] == $i)?'selected':''); ?>><?php echo e($operators[$i]); ?></option>
                                                                    <?php endfor; ?>                                       
                                                                </select>
                                                            </div>
                                                            <div class="col-12 logic-content" style="padding-top:10px">
                                                            </div>
                                                            <div class="col-12" style="padding-top:10px;">                                            
                                                                <a class="btn btn-xs  btn-danger del-btnx" style="cursor:pointer;"><i class="fa fa-trash" style="color:white"></i></a>
                                                            </div>
                                                            <?php if(isset($logic[3])): ?>
                                                                <?php $__currentLoopData = $logic[3]; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $k => $val): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                                                    <input type="hidden" name="logic_<?php echo e($logic[1]); ?>[]" value="<?php echo e($val); ?>">
                                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                            <?php endif; ?>                         
                                                    </div>
                                                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                                <?php for($q = 0; $q < 5; $q++): ?>
                                                    <div class="logic_condition row clone" id="logic_condition_<?php echo e(count($logics) + $q); ?>" style="padding-top:10px;">
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
                                            <?php else: ?>
                                                <?php for($i = 0; $i < 5; $i++): ?>
                                                    <div class="logic_condition row" id="<?php echo e('logic_condition_'.$i); ?>" style="padding-top:10px;">
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
                                            <?php endif; ?>
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
                                    <input type="radio" name="required" id="required" placeholder="" class="form-check-input" value="1" <?php if($question->required==1): ?> checked <?php endif; ?>/>
                                    <?php echo Form::label('required', 'Is Required', ['class' => 'form-check-label']); ?>

                                </div>
                                <div id="more_than_one_answer_box" class="form-check">
                                    <input type="radio" name="required" id="more_than_one_answer" placeholder="" class="form-check-input" value="1" <?php if($question->more_than_one_answer==1): ?> checked <?php endif; ?> />
                                    <?php echo Form::label('more_than_one_answer', 'More than 1 answers', ['class' => 'form-check-label']); ?>

                                </div>
                                <?php echo Form::label('state', 'State', ['class' => 'control-label']); ?>

                                <select class="form-control" name="options" id="state" placeholder="Options">
                                    <?php
                                        $states = [
                                            'deafult' => 'Default',
                                            'collapased' => 'Collapsed',
                                            'expanded' => 'Expanded'
                                        ];
                                    ?>
                                    <?php $__currentLoopData = $states; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($key); ?>" <?php if($question->state==$key): ?> selected <?php endif; ?>><?php echo e($value); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>

                                <?php echo Form::label('image_location', 'Image location', ['class' => 'control-label']); ?>

                                <select class="form-control" name="options" id="imageposition" placeholder="Options">
                                    <?php
                                        $image_location = [
                                            'default' => 'Default',
                                            'left' => 'Left',
                                            'right' => 'Right',
                                            'top' => 'Top',
                                            'bottom' => 'Bottom',
                                            'd-none' => 'Hide'
                                        ];
                                    ?>
                                    <?php $__currentLoopData = $image_location; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($key); ?>" <?php if($question->imageposition==$key): ?> selected <?php endif; ?>><?php echo e($value); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                                <?php echo Form::label('question_location', 'Question Location', ['class' => 'control-label']); ?>

                                <select class="form-control" name="options" id="titlelocation" placeholder="Options">
                                    
                                    <?php
                                        $image_location = [
                                            'top' => 'Top',
                                            'center' => 'In Box',
                                        ];
                                    ?>
                                    <?php $__currentLoopData = $image_location; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($key); ?>" <?php if($question->imageposition==$key): ?> selected <?php endif; ?>><?php echo e($value); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>

                                <?php echo Form::label('help_info_location', 'Help Info location', ['class' => 'control-label']); ?>

                                <select class="form-control" name="options" id="help_info_location" placeholder="Options">
                                    <?php
                                        $help_info_location = [
                                            'none' => 'Hide',
                                            'block' => 'show'
                                        ];
                                    ?>
                                    <?php $__currentLoopData = $help_info_location; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($key); ?>" <?php if($question->help_info_location==$key): ?> selected <?php endif; ?>><?php echo e($value); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                                
                                <!-- <?php echo Form::label('title_size', 'Title Size', ['class' => 'control-label']); ?>

                                <input type="number" name="fontsize" id="fontsize" placeholder="" class="form-control" value="<?php echo e($question->font_size); ?>"/>

                                <?php echo Form::label('title_color', 'Title Color', ['class' => 'control-label']); ?>

                                <input type="color" name="titlecolor" id="title_color" placeholder="" class="form-control" value="<?php echo e($question->titlecolor); ?>"/> -->

                                <!-- <?php echo Form::label('answer_location', 'Answer location', ['class' => 'control-label']); ?>

                                <select class="form-control" name="options" id="answerposition" placeholder="Options">
                                    <?php
                                        $answer_location = [
                                            'col-12' => 'Default',
                                            'col-12 order-1' => 'Top',
                                            'col-12 order-3' => 'Bottom',
                                            'col-12 order-2' => 'Center',
                                            'col-8 order-1' => 'Left',
                                            'col-8 order-2' => 'Right',
                                            'd-none' => 'Hide'
                                        ];
                                    ?>
                                    <?php $__currentLoopData = $answer_location; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($key); ?>" <?php if($question->answerposition==$key): ?> selected <?php endif; ?>><?php echo e($value); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select> -->

                                <!-- <?php echo Form::label('image_aligment', 'Image Aligment', ['class' => 'control-label']); ?>

                                <select class="form-control" name="options" id="image_aligment" placeholder="Options">
                                    <?php
                                        $image_aligment = [
                                            'grid' => 'grid',
                                            'list' => 'list',
                                        ];
                                    ?>
                                    <?php $__currentLoopData = $image_aligment; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($key); ?>" <?php if($question->image_aligment==$key): ?> selected <?php endif; ?>><?php echo e($value); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select> -->
                                <?php echo Form::label('answer_alignment', 'Answer Aligment', ['class' => 'control-label']); ?>

                                <select class="form-control" name="options" id="answer_alignment" placeholder="Options">
                                    <?php
                                        $answer_alignment = [
                                            'grid' => 'Grid',
                                            'list' => 'List',
                                        ];
                                    ?>
                                    <?php $__currentLoopData = $answer_alignment; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($key); ?>" <?php if($question->answer_alignment==$key): ?> selected <?php endif; ?>><?php echo e($value); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>

                                <?php echo Form::label('question_bg_color', 'Question Background', ['class' => 'control-label']); ?>

                                <select class="form-control" name="options" id="question_bg_color" placeholder="Options">
                                    <?php
                                        $question_bg_color = [
                                            '#fff' => 'White',
                                            '#90ee90' => 'Light Green',
                                            '#00FF00' => 'Green',
                                            '#006400' => 'Dark Green',
                                            '#C4A484' => 'Brown',
                                            '#654321' => 'Dark Brown',
                                            '#FFFFE0' => 'Light Yellow',
                                            '#FFFCC9' => 'Yellow',
                                            '#8B8000' => 'Dark Yellow',
                                            '#0000FF' => 'Blue',
                                            '#ADD8E6' => 'Light blue',
                                            '#00008B' => 'Dark blue'
                                        ];
                                    ?>
                                    <?php $__currentLoopData = $question_bg_color; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($key); ?>" <?php if($question->question_bg_color==$key): ?> selected <?php endif; ?>><?php echo e($value); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>

                                <!-- <?php echo Form::label('indent', 'Indent', ['class' => 'control-label']); ?>

                                <input type="number" name="indent" id="indent" placeholder="" class="form-control" value="<?php echo e($question->indent); ?>"/>

                                <?php echo Form::label('width', 'Width', ['class' => 'control-label']); ?>

                                <input type="number" name="width" id="width" placeholder="" class="form-control" value="<?php echo e($question->width); ?>"/>

                                <?php echo Form::label('min_width', 'Min Width', ['class' => 'control-label']); ?>

                                <input type="number" name="min_width" id="min_width" placeholder="" class="form-control" value="<?php echo e($question->min_width); ?>"/>

                                <?php echo Form::label('max_width', 'Max Width', ['class' => 'control-label']); ?>

                                <input type="number" name="max_width" id="max_width" placeholder="" class="form-control" value="<?php echo e($question->max_width); ?>"/>

                                <?php echo Form::label('size', 'Size', ['class' => 'control-label']); ?>

                                <input type="number" name="size" id="size" placeholder="" class="form-control"  value="<?php echo e($question->size); ?>"/>

                                 -->

                                <?php echo Form::label('imagefit', 'Image Fit', ['class' => 'control-label']); ?>  
                                <select class="form-control" name="options" id="image_fit" placeholder="Options">
                                    <?php
                                        $image_fit = [
                                            '0' => 'None',
                                            '1' => 'Contain',
                                            '2' => 'Cover',
                                            '3' => 'Fill'
                                        ];
                                    ?>
                                    <?php $__currentLoopData = $image_fit; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$value): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                                        <option value="<?php echo e($key); ?>" <?php if($question->imagefit==$key): ?> selected <?php endif; ?>><?php echo e($value); ?></option>
                                    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                                </select>
                                <div id="image_fit1"></div>
                                <?php echo Form::label('image_width', 'Image Width', ['class' => 'control-label']); ?>

                                <input type="text" name="image_width" id="image_width" placeholder="" class="form-control"  value="<?php echo e($question->imagewidth); ?>"/>
                                <div id="image_width1"></div>
                                <?php echo Form::label('image_height', 'Image Height', ['class' => 'control-label']); ?>

                                <input type="text" name="image_height" id="image_height" placeholder="" class="form-control"  value="<?php echo e($question->imageheight); ?>"/>
                                <div id="image_height1"></div>

                                <?php echo Form::label('font_style', 'Font Style', ['class' => 'control-label']); ?>

                                <select class="form-control" name="options" id="default_font_style" placeholder="Options">
                                <?php
                                        $font_style = [
                                            'italic' => 'bold',
                                            'bold and italic' => 'Bold and Italic',
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
                                            'roboto' => 'roboto',
                                            'hevetica' => 'lright green',
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
        function radioScore(ele){
            alert("Score Updated");
            $(ele).data('value',ele.value);
            $('#'+ele.dataset.q_id).attr('value',ele.value);
            // console.log($('body .q_id'+ele.dataset.q_id).val());
            console.log($('#'+ele.dataset.q_id));

        }
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
        /*$('.editor').each(function () {

            CKEDITOR.replace($(this).attr('id'), {
                filebrowserImageBrowseUrl: '/laravel-filemanager?type=Images',
                filebrowserImageUploadUrl: '/laravel-filemanager/upload?type=Images&_token=<?php echo e(csrf_token()); ?>',
                filebrowserBrowseUrl: '/laravel-filemanager?type=Files',
                filebrowserUploadUrl: '/laravel-filemanager/upload?type=Files&_token=<?php echo e(csrf_token()); ?>',

                //extraPlugins: 'font,smiley,lineutils,widget,codesnippet,prism,flash,colorbutton,colordialog',
                extraPlugins: 'font,widget,colorbutton,colordialog,justify',
            });

        });*/

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
    </script>








    
<?php $__env->stopSection(); ?>


<?php echo $__env->make('backend.layouts.app', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH F:\laravel\resources\views/backend/questions/edit.blade.php ENDPATH**/ ?>