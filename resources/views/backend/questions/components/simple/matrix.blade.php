{{-- Matrix --}}
@php
    if(isset($content)){
        $content = json_decode($question->content);
    }
    $label = '';
    $alignment = 'center';
    $size = '';
    $type = '';
    isset($content[0]->label) ? $label = $content[0]->label : '';
    isset($content[0]->alignment) ? $alignment = $content[0]->alignment : '';
    isset($content[0]->type) ? $type = $content[0]->type : '';
    isset($content[0]->size) ? $size = $content[0]->size : '';
@endphp
<div id="matrix_part" class="row question-box" @if(isset($display)) style="display:{{$display}};" @endif>
    
    <!-- Bilal Code -->
        <!-- <div class="col-12"> -->
            <!-- @php  $matrixbox_header_color = '#282f79'; @endphp -->
            <!-- @if(isset($content))
            @php
                $con = json_decode($content);
                $matrixbox_header_color = '#282f79';
                foreach($con as $key => $c){
                    if(isset($c->matrixbox_header_color)){
                        $matrixbox_header_color = $c->matrixbox_header_color;
                    }
                }
            @endphp
            @endif -->
            <!-- <label class="form-label">Tabel Header Color</label> -->
            <!-- <input type="color" class="matrixbox_header_color col-12" id="matrixbox_header_color" value="{{$matrixbox_header_color}}"> -->
        <!-- </div> -->

        <!-- <div class="col-12">
            <label class="type-file">Header Font Color</label>
            <input type="color" class="form-control col-12" id = "matrixbox_headerfont_color" placeholder="color" value='#ffffff'>
        </div> -->
        
        <!-- <div class="col-12">
            <label class="type-file">Table Font Color</label>
            <input type="color" class="form-control col-12" id = "matrixbox_tablefont_color" placeholder="color" value='#0000000'>
        </div>


        <div class="col-12">
            <label class="type-file">Font size</label>
            <input type="number" class="form-control col-12" id = "matrixbox_fontsize" placeholder="Number" value='14'>
        </div>

        <div class="col-12">
            <label class="type-file">Aligment</label>
            <select class="form-control" name="options" id="matrixbox_alignment" placeholder="Options">
                @php
                    $alignment_arr = [
                        'center' => 'Center',
                        'left' => 'Left',
                        'right' => 'Right',
                    ];
                @endphp
                @foreach($alignment_arr as $key=>$value)
                    <option value="{{$key}}" @if($alignment == $key) selected @endif>{{$value}}</option>
                @endforeach
            </select>
        </div> -->
        <br/>
        <div class="col-12">
            <div class="row" >
                    <div class="col-6">
                        <select class="form-control input-small select2me selecttype" data-placeholder="Select..." >
                            <option value="text" >Single Input</option>
                            <!-- <option value="checkbox">Checkbox</option> -->
                            <option value="radio">Multiple Selection</option>
                            <!-- <option value="file">File</option> -->
                        </select>
                    </div>
                    <div class="col-6">
                        <select class="form-control input-small select2me selecttype" id="matrix_symbol" data-placeholder="Select..." >
                            <option value="€" >€</option>
                            <!-- <option value="checkbox">Checkbox</option> -->
                            <option value="Number">Number</option>
                            <!-- <option value="file">File</option> -->
                        </select>
                    </div>
                </div>
            </div>
        <div class="col-12">
            <div class="row">
                <div class="col-4">
                    <div>
                        <!-- {!! Form::label('qt_row', trans('labels.backend.questions.fields.qt_row').'*', ['class' => 'control-label']) !!}     -->
                    </div>              
                    <div>
                        <button id="row_add"
                        class="btn btn-success" style="color:white; margin-top:10px;" data-columns="0">+ Add Row</button>
                    </div>
                </div>
                <div class="col-4">
                    <div>
                    <!-- {!! Form::label('qt_col', trans('labels.backend.questions.fields.qt_col').'*', ['class' => 'control-label']) !!} -->
                    
                    </div>              
                    <div>
                        <button id="add_col"
                        class="btn btn-success" style="color:white; margin-top:10px;">+ Add Column</button>
                    </div>
                </div>
            </div>
        </div>
        @if(isset($question) && strpos($question->content,"table "))
                <?php 
                    $content = $question->content;
                    $content = str_replace('contenteditable="false"','contenteditable="true"',$content);
                    $content = str_replace('id=""','id="delete_matrix_row"',$content);
                    $content = str_replace('class="hide_btn"','class="btn btn-danger"',$content);
                    $content = str_replace('<th></th>','<th>Action</th>',$content);
                    echo html_entity_decode($content); 
                ?>
        @else
        <table id="add-matrix" name="matrix" data-id="[q_id]" class="ml-2 table table-striped">
            <style id="matrixbox_style">

            </style>
            <thead id="symbol_matrix_value">
                
            </thead>
        </table>
        @endif

    <!-- End Here Bilal Code -->
    <!-- <div class="col-12">
        <div>
        {!! Form::label('qt_col', trans('labels.backend.questions.fields.qt_col').'*', ['class' => 'control-label']) !!}
        
        </div>              
        <!-- <div>
            <a id="col_add"
            class="btn btn-success" style="color:white; margin-top:10px;">+ Add Column</a>
        </div>
    </div>
    <div id="col_panel" class="col-12 " style="padding-top:10px;">
        <div class="row" >
            <div class="col-2">
                <label>Cell Type</label>  
            </div>
            <div class="col-2">
                <label>Name</label>                             
            </div>
        </div>
        <div class="row" >
            <div class="col-2">
                <select class="form-control input-small select2me" data-placeholder="Select..." disabled>
                    <option value="single_input" >Single Input</option>
                    <option value="checkbox">Checkbox</option>
                    <option value="radiogroup">Radiogroup</option>
                    <option value="file">File</option>
                </select>
            </div>
            <div class="col-2">
                <input type="text" value="Input" style="z-index:20;"  class="form-control">
                
            </div>
            <div class="col-2">
                <a class="btn btn-xs mb-2 btn-danger del-btnx" style="cursor:pointer;" data-id="11">
                    <i class="fa fa-trash" style="color:white"></i>
                </a>
            </div>
        </div>
        <div class="row" style="padding-top:0.5vh;">
            <div class="col-2">
                <select class="form-control input-small select2me" data-placeholder="Select..." disabled>
                    <option value="single_input" >Single Input</option>
                    <option value="checkbox">Checkbox</option>
                    <option value="radiogroup">Radiogroup</option>
                    <option value="file">File</option>
                </select>
            </div>
            <div class="col-2">
                <input type="text" value="Input" style="z-index:20;"  class="form-control">
                
            </div>
            <div class="col-2">
                <a class="btn btn-xs mb-2 btn-danger del-btnx" style="cursor:pointer;" data-id="11">
                    <i class="fa fa-trash" style="color:white"></i>
                </a>
            </div>
        </div>
    </div>

    <div class="col-12">
        <div>
            {!! Form::label('qt_row', trans('labels.backend.questions.fields.qt_row').'*', ['class' => 'control-label']) !!}    
        </div>              
        <div>
            <a id="row_add"
            class="btn btn-success" style="color:white; margin-top:10px;">+ Add Row</a>
        </div>
    </div>
    <div id= "row_panel" class="col-12" style="padding-top:10px;">
        <div class="row" >
            <div class="col-2">
                <label>Cell Type</label>  
            </div>
            <div class="col-2">
                <label>Name</label>                             
            </div>
        </div>
        <div class="row" >
            <div class="col-2">
                <select class="form-control input-small select2me" data-placeholder="Select..." >
                    <option value="single_input" >Single Input</option>
                    <option value="checkbox">Checkbox</option>
                    <option value="radiogroup">Radiogroup</option>
                    <option value="file">File</option>
                </select>
            </div>
            <div class="col-2">
                <input type="text" value="Input" style="z-index:20;"  class="form-control">
                
            </div>
            <div class="col-2">
                <a class="btn btn-xs mb-2 btn-danger del-btnx" style="cursor:pointer;" data-id="11">
                    <i class="fa fa-trash" style="color:white"></i>
                </a>
            </div>
        </div>
        <div class="row" style="padding-top:0.5vh;">
            <div class="col-2"> 
                <select class="form-control input-small select2me" data-placeholder="Select..." >
                    <option value="single_input" >Single Input</option>
                    <option value="checkbox">Checkbox</option>
                    <option value="radiogroup">Radiogroup</option>
                    <option value="file">File</option>
                </select>   
            </div>
            <div class="col-2">
                <input type="text" value="Input" style="z-index:20;"  class="form-control">
                
            </div>
            <div class="col-2">
                <a class="btn btn-xs mb-2 btn-danger del-btnx" style="cursor:pointer;" data-id="11">
                    <i class="fa fa-trash" style="color:white"></i>
                </a>
            </div>
        </div>
    </div>
    <div class="col-12">
        <button id="mat_update" type="button" class="btn-danger">Update</button>
    </div>
    
    <div class="col-12" style="padding-top:3vh;">
        {!! Form::label('value', 'value', ['class' => 'control-label']) !!}
        <table  id="real_matrix" width="100%">
        </table>
        
        {!! Form::label('score', 'Score', ['class' => 'control-label']) !!}
        <table  id="score_matrix" width="100%" stylr="padding-top:2vh;">
        </table>
        
    </div>  -->
</div>
{{-- End Matrix --}}