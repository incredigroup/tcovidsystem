@php
    $q_number=1;
    $ids = [];
    $identy = [];
@endphp
@foreach ($lesson->questions as $key => $question)
    @php
        if($question->logic != "[]"){
            $logic_data = $question->logic;
            $decoded_json_data = json_decode($logic_data);
            foreach($decoded_json_data as $key=>$data){
                $ids[$question->id]=$data[1];
                $identy[$question->id] = $data[3];
            }
        }
    @endphp
@endforeach
@foreach ($lesson->questions as $question)
    @php
        $content = json_decode($question->content);
        if($question->questionimage==""){
            $question->questionimage=null;
        }
    @endphp
    @if(in_array($question->id,$ids))
        <div id="q_{{$question->id}}" class="question-card card custom-card mb-3 p-2" data-page="{{$question->page_number}}" style="background-color:{{($question->question_bg_color != '')?$question->question_bg_color:'#fff'}};box-shadow: 1px 1px 6px {{($question->question_bg_color != '' && $question->question_bg_color != '#fff')?'2px':'-3px'}}  {{($question->question_bg_color != '' && $question->question_bg_color != '#fff')?$question->question_bg_color:'#000'}};">
            <form id="checkForm">
            <div class="row">
                    <div class="col-2 p-0"><span class="q_number gradient-bg my-auto">{{$q_number++}}</span></div>
                    <div class="col-8 p-0">
                        
                        @if($question->titlelocation == 'col-12 order-1')
                        {!! html_entity_decode($question->question) !!}
                        <!-- <h2 class="d-inline-flex question-heading  w-100">
                            <span class="">{!! html_entity_decode($question->question) !!}</span>
                        <h2> -->
                        @endif
                    </div>
                    @if(!$question->required)
                        @php
                            $col = 4;
                        @endphp
                    @else
                        @php
                            $col = 2;
                        @endphp
                    @endif
                    @php 
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
                            
                        @endphp
                    <div class="col-2 p-0 text-right ">
                        @if($question->help_info_location == 'display')
                            <span data-toggle="modal" data-target="#exampleModalLong{{$question->id}}" style="" class="d-inline-block mr-2"><img src="https://www.diagnosiaziendale.it/storage/logos/help.png" class="img-responsive" width="29px" height="35px"></span>
                        @endif
                        @include('frontend.components.questions.required')
                    </div>
                </div>
                <hr>
            <div class="card-body">
            @if($question->imageposition == 'left')
                    <!-- question,answer,image in same row but first question,second image and third is answer -->
                    <div class="row">
                        @if($question->questionimage!==null)
                        <div class="question-image">
                            <img src="{{asset('uploads/image/'.$question->questionimage)}}" width="{{$question->imagewidth}}" height="{{$question->imageheight}}">
                        </div>
                        @endif
                        <div class="question-answer-area" style="width: calc(100% - {{$question->imagewidth}}px - 45px);">
                            @if($question->titlelocation == 'center')
                            <span>{!! html_entity_decode($question->question) !!}</span>
                            @endif
                            <div class="question-help-area" style="display: {{$question->help_info_location}}">
                                    <span>{!! html_entity_decode($question->help_info) !!}</span>
                            </div>
                            @include('frontend.components.questions.inputs')
                        </div>
                    </div>
                @elseif($question->imageposition == 'top')
                    <div class="row">
                        @if($question->questionimage!==null)
                        <div class="question-image  top-bottm-m">
                            <img src="{{asset('uploads/image/'.$question->questionimage)}}" width="{{$question->imagewidth}}" height="{{$question->imageheight}}">
                        </div>
                        @endif
                    </div>
                    <div class="row">
                        <div class="question-answer-area w-100">
                            @if($question->titlelocation == 'center')
                            <span>{!! html_entity_decode($question->question) !!}</span>
                            @endif
                            <div class="question-help-area" style="display: {{$question->help_info_location}}">
                                    <span>{!! html_entity_decode($question->help_info) !!}</span>
                            </div>
                            @include('frontend.components.questions.inputs')
                        </div>
                    </div>
                @elseif($question->imageposition == 'right')
                    <div class="row">
                        <div class="question-answer-area" style="width: calc(100% - {{$question->imagewidth}}px - 45px);">
                        @if($question->titlelocation == 'center')
                            <span>{!! html_entity_decode($question->question) !!}</span>
                            @endif
                            <div class="question-help-area" style="display: {{$question->help_info_location}}">
                                    <span>{!! html_entity_decode($question->help_info) !!}</span>
                            </div>    
                        @include('frontend.components.questions.inputs')
                        </div>
                        @if($question->questionimage!==null)
                        <div class="question-image">
                            <img src="{{asset('uploads/image/'.$question->questionimage)}}" width="{{$question->imagewidth}}" height="{{$question->imageheight}}">
                        </div>
                        @endif
                    </div>
                @elseif($question->imageposition == 'bottom')
                    <div class="row">
                        <div class="question-answer-area w-100">
                        @if($question->titlelocation == 'center')
                            <span>{!! html_entity_decode($question->question) !!}</span>
                            <div class="question-help-area" style="display: {{$question->help_info_location}}">
                                <span>{!! html_entity_decode($question->help_info) !!}</span>
                            </div>
                            @endif
                            @include('frontend.components.questions.inputs')
                        </div>
                    </div>
                    <div class="row">
                        @if($question->questionimage!==null)
                        <div class="question-image top-bottm-m">
                            <img src="{{asset('uploads/image/'.$question->questionimage)}}" width="{{$question->imagewidth}}" height="{{$question->imageheight}}">
                        </div>
                        @endif
                    </div>
                @elseif($question->imageposition == 'default')
                    <div class="row">
                        @if($question->questionimage!==null)
                        <div class="question-image">
                            <img src="{{asset('uploads/image/'.$question->questionimage)}}" width="{{$question->imagewidth}}" height="{{$question->imageheight}}">
                        </div>
                        @endif
                        <div class="question-answer-area w-100">
                        @if($question->titlelocation == 'center')
                            <span>{!! html_entity_decode($question->question) !!}</span>
                            @endif
                            <div class="question-help-area" style="display: {{$question->help_info_location}}">
                                    <span>{!! html_entity_decode($question->help_info) !!}</span>
                            </div>
                            @include('frontend.components.questions.inputs')
                        </div>
                    </div>
                @elseif($question->imageposition == 'd-none')
                    <div class="row">
                        <div class="question-answer-area w-100">
                        @if($question->titlelocation == 'center')
                            <span>{!! html_entity_decode($question->question) !!}</span>
                            <div class="question-help-area" style="display: {{$question->help_info_location}}">
                                <span>{!! html_entity_decode($question->help_info) !!}</span>
                            </div>
                            @endif
                            @include('frontend.components.questions.inputs')
                        </div>
                    </div>
                @endif 

                @php
                    $content = json_decode($question->content);
                    $logic_content = json_decode($question->logic);
                
                @endphp
               {{-- Hidden Information --}}
                <div class="hidden-information">
                    <input type="hidden" class="qt_type" value="{{ $question->questiontype }}">
                    <input type="hidden" class="logic_cnt" value="{{ count($logic_content) }}">
                </div>
                <input type="hidden" id="displayed_answer" value="0">
                @for ($k=0;$k< count($logic_content);$k++)
                    <div class="logic_{{ $k }}">
                        <input type="hidden" class="logic_type" value="{{ $logic_content[$k][0] }}">
                        <input type="hidden" class="logic_qt" value="{{ $logic_content[$k][1] }}">
                        <input type="hidden" class="logic_operator" value="{{ $logic_content[$k][2] }}">
                        @foreach($logic_content[$k][3] as $key => $value)
                            <input type="hidden" class="{{'logic_cont '.$key}}" name="logic_cont[]" value="{{ $value }}">
                        @endforeach
                        <input type="hidden" class="logic_state" value="0">
                    </div>
                @endfor
                {{-- End Hidden Information --}}
            </div>
            </form>
            
        </div>
    @else
        <div id="q_{{$question->id}}" class="question-card card custom-card mb-3 p-2" data-page="{{$question->page_number}}" style="background-color:{{($question->question_bg_color != '')?$question->question_bg_color:'#fff'}};box-shadow: 1px 1px 6px {{($question->question_bg_color != '' && $question->question_bg_color != '#fff')?'2px':'-3px'}}  {{($question->question_bg_color != '' && $question->question_bg_color != '#fff')?$question->question_bg_color:'#000'}};">
            <form id="checkForm">
            <div class="row">
                    <div class="col-10 p-0">
                        <span class="q_number gradient-bg my-auto">{{$q_number++}}</span>
                        @if($question->titlelocation == 'top')
                        <span >{!! html_entity_decode($question->question) !!}</span>
                        @endif
                    </div>
                    @if(!$question->required)
                        @php
                            $col = 4;
                        @endphp
                    @else
                        @php
                            $col = 2;
                        @endphp
                    @endif
                    @php 
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
                            
                        @endphp
                    <div class="col-2 p-0 text-right ">
                        @if($question->help_info_location == 'display')
                            <span data-toggle="modal" data-target="#exampleModalLong{{$question->id}}" style="display:{{$question->help_info_location}}" class="d-inline-block mr-2"><img src="https://www.diagnosiaziendale.it/storage/logos/help.png" class="img-responsive" width="29px" height="35px"></span>
                        @endif
                        @include('frontend.components.questions.required')
                    </div>
                </div>
                <hr>
            <div class="card-body">
                @if($question->imageposition == 'left')
                    <!-- question,answer,image in same row but first question,second image and third is answer -->
                    <div class="row">
                        @if($question->questionimage!==null)
                        <div class="question-image">
                            <img src="{{asset('uploads/image/'.$question->questionimage)}}" width="{{$question->imagewidth}}" height="{{$question->imageheight}}">
                        </div>
                        @endif
                        <div class="question-answer-area" style="width: calc(100% - {{$question->imagewidth}}px - 45px);">
                            @if($question->titlelocation == 'center')
                            <span>{!! html_entity_decode($question->question) !!}</span>
                            @endif
                            <div class="question-help-area" style="display: {{$question->help_info_location}}">
                                    <span>{!! html_entity_decode($question->help_info) !!}</span>
                            </div>
                            @include('frontend.components.questions.inputs')
                        </div>
                    </div>
                @elseif($question->imageposition == 'top')
                    <div class="row">
                        @if($question->questionimage!==null)
                        <div class="question-image  top-bottm-m">
                            <img src="{{asset('uploads/image/'.$question->questionimage)}}" width="{{$question->imagewidth}}" height="{{$question->imageheight}}">
                        </div>
                        @endif
                    </div>
                    <div class="row">
                        <div class="question-answer-area w-100">
                            @if($question->titlelocation == 'center')
                            <span>{!! html_entity_decode($question->question) !!}</span>
                            @endif
                            <div class="question-help-area" style="display: {{$question->help_info_location}}">
                                    <span>{!! html_entity_decode($question->help_info) !!}</span>
                            </div>
                            @include('frontend.components.questions.inputs')
                        </div>
                    </div>
                @elseif($question->imageposition == 'right')
                    <div class="row">
                        <div class="question-answer-area" style="width: calc(100% - {{$question->imagewidth}}px - 45px);">
                        @if($question->titlelocation == 'center')
                            <span>{!! html_entity_decode($question->question) !!}</span>
                            @endif
                            <div class="question-help-area" style="display: {{$question->help_info_location}}">
                                    <span>{!! html_entity_decode($question->help_info) !!}</span>
                            </div>    
                        @include('frontend.components.questions.inputs')
                        </div>
                        @if($question->questionimage!==null)
                        <div class="question-image">
                            <img src="{{asset('uploads/image/'.$question->questionimage)}}" width="{{$question->imagewidth}}" height="{{$question->imageheight}}">
                        </div>
                        @endif
                    </div>
                @elseif($question->imageposition == 'bottom')
                    <div class="row">
                        <div class="question-answer-area w-100">
                        @if($question->titlelocation == 'center')
                            <span>{!! html_entity_decode($question->question) !!}</span>
                            <div class="question-help-area" style="display: {{$question->help_info_location}}">
                                <span>{!! html_entity_decode($question->help_info) !!}</span>
                            </div>
                            @endif
                            @include('frontend.components.questions.inputs')
                        </div>
                    </div>
                    <div class="row">
                        @if($question->questionimage!==null)
                        <div class="question-image top-bottm-m">
                            <img src="{{asset('uploads/image/'.$question->questionimage)}}" width="{{$question->imagewidth}}" height="{{$question->imageheight}}">
                        </div>
                        @endif
                    </div>
                @elseif($question->imageposition == 'default')
                    <div class="row">
                        @if($question->questionimage!==null)
                        <div class="question-image">
                            <img src="{{asset('uploads/image/'.$question->questionimage)}}" width="{{$question->imagewidth}}" height="{{$question->imageheight}}">
                        </div>
                        @endif
                        <div class="question-answer-area w-100">
                        @if($question->titlelocation == 'center')
                            <span>{!! html_entity_decode($question->question) !!}</span>
                            @endif
                            <div class="question-help-area" style="display: {{$question->help_info_location}}">
                                    <span>{!! html_entity_decode($question->help_info) !!}</span>
                            </div>
                            @include('frontend.components.questions.inputs')
                        </div>
                    </div>
                @elseif($question->imageposition == 'd-none')
                    <div class="row">
                        <div class="question-answer-area w-100">
                        @if($question->titlelocation == 'center')
                            <span>{!! html_entity_decode($question->question) !!}</span>
                            <div class="question-help-area" style="display: {{$question->help_info_location}}">
                                <span>{!! html_entity_decode($question->help_info) !!}</span>
                            </div>
                            @endif
                            @include('frontend.components.questions.inputs')
                        </div>
                    </div>
                @endif            
                @php
                    $content = json_decode($question->content);
                    $logic_content = json_decode($question->logic);
                
                @endphp
                {{-- Hidden Information --}}
                <div class="hidden-information">
                    <input type="hidden" class="qt_type" value="{{ $question->questiontype }}">
                    <input type="hidden" class="logic_cnt" value="{{ count($logic_content) }}">
                </div>
                <input type="hidden" id="displayed_answer" value="0">
                @for ($k=0;$k< count($logic_content);$k++)
                    <div class="logic_{{ $k }}">
                        <input type="hidden" class="logic_type" value="{{ $logic_content[$k][0] }}">
                        <input type="hidden" class="logic_qt" value="{{ $logic_content[$k][1] }}">
                        <input type="hidden" class="logic_operator" value="{{ $logic_content[$k][2] }}">
                        @foreach($logic_content[$k][3] as $key => $value)
                            <input type="hidden" class="{{'logic_cont '.$key}}" name="logic_cont[]" value="{{ $value }}">
                        @endforeach
                        <input type="hidden" class="logic_state" value="0">
                    </div>
                @endfor
                {{-- End Hidden Information --}}
            </div>
            </form>
            
        </div>
    @endif
@endforeach
<div class="text-right">
    <div id="navigation-btns" class="mb-2" style="">
        <button type="button" id="pre-pg" class="btn btn-danger">Previous</button>
        <button type="button" id="next-pg" class="btn btn-danger">Next</button>
    </div>
    {{-- <div id="navigation-btns" class="mb-2" style="">
        <button type="submit" id="pre-pg" class="btn btn-danger">Answer</button>
    </div> --}}
    <div class="genius-btn btn-block text-white  gradient-bg text-center text-uppercase  bold-font" id="report_div" style="width: 150px; float: right;">
        <a id="create-report" href="javascript:void(0);" class="">Report</a>
    </div>
    <div class="genius-btn mt60 gradient-bg ml-auto custom-btn" id="update_report_div" style="display: none; width: 150px;">
        <a id="update-report" href="javascript:void(0);" class="">Save Report</a>
    </div>
    {{-- <div class="genius-btn mt60 gradient-bg ml-auto custom-btn" id="answer" style="width: 130px;">
        <button id="answer-submit" class="" style="border:none; background-color:inherit; color:white" type="submit">Answer</a>
    </div> --}}
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
<script src="{{asset('js/pie-chart.js')}}"></script>
<script src="{{asset('js/bar-chart.js')}}"></script>
<script src="{{asset('js/d3bar-chart.js')}}"></script>
<script src="{{asset('js/donut-chart.js')}}"></script>
<script src="{{asset('js/horizontal-bar.js')}}"></script>
<script src="{{asset('js/line-chart.js')}}"></script>
<script src="{{asset('js/radar-chart.js')}}"></script>
<script src="{{asset('js/polar-chart.js')}}"></script>
<script src="{{asset('js/bubble-chart.js')}}"></script>
<script src="{{asset('js/radar1-chart.js')}}"></script>
<script src="{{asset('js/responsive-table.js')}}"></script>
<script src="{{asset('js/sortable-table.js')}}"></script>
<script src="{{asset('js/no-table-chart.js')}}"></script>


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

