@extends('backend.layouts.app')
@section('title', __('Charts&Tables').' | '.app_name())

@section('content')
    <!-- {!! Form::open(['method' => 'POST', 'route' => ['admin.questions.store'], 'files' => true,]) !!} -->
    <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
         rel = "stylesheet">
    <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>


   {{-- <link rel="stylesheet" href="{{asset('css/jquery-toasts.css')}}">  
    <script type="text/javascript" src="{{asset('js/jquery-toasts.js')}}"></script>
    {{-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/3.2.1/anime.min.js"></script> --}}
    <style>
         #sortable-8{ list-style-type: none; margin: 0; 
            padding: 0; width: 25%; float:left;}
         #sortable-8 li{ margin: 0 3px 3px 3px; padding: 0.4em; 
            padding-left: 1.5em; font-size: 17px; height: 16px; }
         .default {
            background: #ccc;
            border: 1px solid #DDDDDD;
            color: #333333;
         }     
      </style>

      <style>
        #pie-chartdiv {
        width: 50%;
        height: 500px;
        }
        #bar-chartdiv {
        width: 50%;
        height: 500px;
        }
        #donut-chartdiv {
        width: 50%;
        height: 500px;
        }
        #d3bar-chartdiv {
        width: 50%;
        height: 500px;
        }

        </style>
      
      <script>
          $(document).ready(function(){
            $('[data-toggle="tooltip"]').tooltip();   
        });
         $(function() {
            $('#sortable-8').sortable({
               update: function(event, ui) {
                  var productOrder = $(this).sortable('toArray').toString();
                  $("#sortable-9").text (productOrder);

                    for (var i=1;i<= $("#sortable-8").children().length ; i++)
                    {
                        $("#sortable-8 li:nth-child("+i+")").find("span.no").text( i );
                    }								
               }
            });
         });

         $(function() {
            $('#sortable-10').sortable({
               update: function(event, ui) {								
               }
            });
         });

         $(function() {
            $('#sortable-11').sortable({
               update: function(event, ui) {
								
               }
            });
         });

     
         $(function() {
            $('#sortable-13').sortable({
               update: function(event, ui) {
								
               }
            });
         });

         $(function() {
            $('#sortable-14').sortable({
               update: function(event, ui) {
               }
            });
         });
         
      </script>

    <div class="card">
        <div class="card-header">
            <h3 class="page-title float-left mb-0">Charts & Tables</h3>
            <div class="float-right">
                <a href="{{ route('admin.charts.index') }}"
                   class="btn btn-success">View Charts</a>
            </div>         
         
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-12 form-group">
                    {!! Form::label('tests', 'Test', ['class' => 'control-label']) !!}
                 <?php 
                    $i=0;
                 ?>                 
                     <select class="form-control select2 required" name="tests_id" id="tests_id" placeholder="Options" multiple>
                        @foreach($tests as $test)
                            @if ($i ==0)
                                <option value="{{$test->id}}" selected>{{ $test->title}}</option>
                                 <?php
                                    $i++;
                                ?>
                            @else
                                <option value="{{$test->id}}">{{$test->title}}</option>                             
                            @endif 
                        @endforeach  
                    </select>

                    <div class="form-group form-md-line-input has-info" style="margin-top:10px">
                        <input type="text" class="form-control"   id="title">
                        <label for="title">Input the title</label>
                    </div>    
                  
                </div>
            </div>
        </div>
    </div>

   
    <div class="card">
        <div class="card-header">
            <h3 class="page-title float-left mb-0">Edit</h3>           
        </div>
        <div id="question_edit" class="card-body row">
            <div class="col-4">                 

                <input type="text" class="btn-primary qt_name form-control" value="Questions TreeView">
                <div class="tree_5 tree-demo" display="none">
                    <ul class="treecontent">
                        @for ($i=0;$i<count($course_list);$i++)
                        <li>                  
                        {{ $course_list[$i]['title'] }} </a>
                            <ul>
                                @for ($j=0;$j<count($course_test_list[$i]);$j++)
                                    <li>
                                        {{ $course_test_list[$i][$j]['title']}}
                                        <ul>
                                            <?php
                                                $tk=  $course_test_list[$i][$j]['id'];
                                            ?>
                                            @if(isset($question_list[$tk]))
                                                @for ($k=0;$k<count($question_list[$tk]);$k++)
                                                        <?php 
                                                            $scores = json_decode($question_list[$tk][$k]['score'], true);
                                                            $sum = 0;
                                                            if(is_array($scores)) {
                                                                foreach($scores as $score) {
                                                                        $sum = $sum + (int)$score;
                                                                } 
                                                            } else { $sum = (int)$scores;}
                                                       ?>
                                                    <li>
                                                        <?php
                                                            if($question_list[$tk][$k]['questiontype'] != 4 && $question_list[$tk][$k]['questiontype'] != 7){
                                                        ?>
                                                        <span data-toggle="tooltip" data-placement="top" title=" <?php
                                                            echo $sum;
                                                            ?>" data-count="{{$question_list[$tk][$k]['questiontype']}}" data-testid="{{$course_test_list[$i][$j]['id']}}" class= "question-item" onclick= 'selectQuestion(event,this.getAttribute("data-testid"),this.getAttribute("data-count"))'>{{$question_list[$tk][$k]['id']}}.{{$question_list[$tk][$k]['question']}}
                                                        </span>
                                                        <?php
                                                            }
                                                            else if($question_list[$tk][$k]['questiontype'] == 4){
                                                        ?>
                                                            <span data-toggle="tooltip" data-placement="top" class= "question-item">
                                                            {{$question_list[$tk][$k]['id']}}.{{$question_list[$tk][$k]['question']}}
                                                            </span>

                                                            @for ($n=0;$n<count($question_row_list);$n++)
                                                                @if($question_list[$tk][$k]['id'] == $question_row_list[$n]['id'] && isset($question_row_list[$n]['rowcols']))

                                                                    @foreach($question_row_list[$n]['rowcols'] as $row_col)
                                                                        <ul>
                                                                            <li onclick= 'selectQuestion(event,this.getAttribute("data-testid"),this.getAttribute("data-count"))'>
                                                                                <span data-toggle="tooltip" data-placement="top" title=" <?php
                                                                                echo $sum;
                                                                                ?>" data-count="{{$question_list[$tk][$k]['questiontype']}}" data-testid="{{$course_test_list[$i][$j]['id']}}" class= "question-item" onclick= 'selectMatrixQuestion(event,this.getAttribute("data-testid"),this.getAttribute("data-count"))'>{{ $question_list[$tk][$k]['id'] }}.{{$row_col}}
                                                                                </span>
                                                                            </li>
                                                                        </ul>
                                                                    @endforeach
                                                                @endif
                                                            @endfor
                                                        <?php
                                                            }else if($question_list[$tk][$k]['questiontype'] == 7) {
                                                        ?>
                                                            <span data-toggle="tooltip" data-placement="top" class= "question-item">
                                                                {{$question_list[$tk][$k]['id']}}.{{$question_list[$tk][$k]['question']}}
                                                            </span>
                                                            @for($s = 0; $s < count($question_file_list); $s++)
                                                                @if($question_list[$tk][$k]['id'] == $question_file_list[$s]['id'] && isset($question_file_list[$s]['file_num']))
                                                                    @for($h = 0; $h < $question_file_list[$s]['file_num']; $h++)
                                                                        <ul>
                                                                            <li onclick= 'selectQuestion(event,this.getAttribute("data-testid"),this.getAttribute("data-count"))'>
                                                                                <span data-toggle="tooltip" data-placement="top" title=" <?php
                                                                                echo $sum;
                                                                                ?>" data-count="{{$question_list[$tk][$k]['questiontype']}}" data-testid="{{$course_test_list[$i][$j]['id']}}" class= "question-item" onclick= 'selectQuestion(event,this.getAttribute("data-testid"),this.getAttribute("data-count"))'>{{ $question_list[$tk][$k]['id'] }}.{{'file'}}.{{$h+1}}
                                                                                </span>
                                                                            </li>
                                                                        </ul>
                                                                    @endfor
                                                                @endif
                                                            @endfor
                                                        <?php } ?>
                                                    </li>
                                                @endfor
                                            @endif
                                        </ul>
                                    </li>
                                @endfor
                            </ul>
                        </li>                                     
                        @endfor
                    </ul>                   
                </div>

                <input type="text" class="btn-success qt_name form-control" value="Textgroups TreeView">
                <div class="tree_6 tree-demo" display="none">
                    <ul class="treecontent">
                        @for ($i=0;$i<count($course_list);$i++)
                        <li>                  
                        {{ $course_list[$i]['title'] }} </a>
                            <ul>
                                @for ($j=0;$j<count($course_test_list[$i]);$j++)
                                    <li>
                                        {{ $course_test_list[$i][$j]['title']}}
                                        <ul>
                                            <?php
                                                $tk=  $course_test_list[$i][$j]['id'];
                                            ?>
                                            @if(isset($textgroup_list[$tk]))
                                                @for ($k=0;$k<count($textgroup_list[$tk]);$k++)
                                                    <li>
                                                        <span data-toggle="tooltip" data-placement="top" title="{{$textgroup_list[$tk][$k]['id']}}" data-testid="{{$tk}}" class= "question-item" onclick= 'selectTextGroup(event,this.getAttribute("data-testid"))'>{{ $textgroup_list[$tk][$k]['id'] }}.{{ $textgroup_list[$tk][$k]['title'] }}
                                                        </span>
                                                    </li>
                                                @endfor
                                            @endif
                                        </ul>
                                    </li>
                                @endfor
                            </ul>
                        </li>                                     
                        @endfor
                    </ul>                   
                </div>
            </div>
            
            <div class="edit col-8" >               

                <div class="row main-content" id="matrix_part">                
                    <div class="col-12" id="mat_set">
                        <div class="col-12">
                            <div>
                            {!! Form::label('qt_col', trans('labels.backend.questions.fields.qt_col').'*', ['class' => 'control-label']) !!}
                            
                            </div>              
                            <div>
                                <a id="col_add"
                                class="btn btn-success" style="color:white; margin-top:10px;">+ Add Column</a>
                            </div>
                        </div>
                        <div id="col_panel" class="col-12" style="padding-top:10px;">
                            <div class="row" >
                                <div class="col-2">
                                    <label>Cell Type</label>  
                                </div>
                                <div class="col-2">
                                    <label>Name</label>                             
                                </div>
                            </div>
                            <div class="row" role="col">
                                <div class="col-2">
                                    <select class="form-control input-small select2me" data-placeholder="Select..."  disabled>
                                        <option >Single Input</option>
                                        <option >Checkbox</option>
                                        <option >Radiogroup</option>
                                        <option >Imagepicker</option>
                                    </select>
                                </div>
                                <div class="col-2">
                                    <input type="text" value="col1" style="z-index:20;"  class="form-control">
                                </div>
                                <div class="col-2">
                                    <a class="btn btn-xs mb-2 btn-danger del-btnx" style="cursor:pointer;" data-id="c_0">
                                        <i class="fa fa-trash" style="color:white"></i>
                                    </a>
                                </div>
                            </div>
                            <!-- <div class="row" style="padding-top:0.5vh;">
                                <div class="col-2">
                                    <select class="form-control input-small select2me" data-placeholder="Select..."  disabled>
                                        <option >Single Input</option>
                                        <option >Checkbox</option>
                                        <option >Radiogroup</option>
                                        <option >Imagepicker</option>
                                    </select>
                                </div>
                                <div class="col-2">
                                    <input type="text" value="col2" style="z-index:20;"  class="form-control">
                                    
                                </div>
                                <div class="col-2">
                                    <a class="btn btn-xs mb-2 btn-danger del-btnx" style="cursor:pointer;" data-id="11">
                                        <i class="fa fa-trash" style="color:white"></i>
                                    </a>
                                </div>
                            </div> -->
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
                            <div class="row" role="row">
                                <div class="col-2">
                                    <select class="form-control input-small select2me" data-placeholder="Select..."  disabled>
                                        <option >Single Input</option>
                                        <option >Checkbox</option>
                                        <option >Radiogroup</option>
                                        <option >Imagepicker</option>
                                    </select>
                                </div>
                                <div class="col-2">
                                    <input type="text" value="row1" style="z-index:20;"  class="form-control">
                                </div>
                                <div class="col-2">
                                    <a class="btn btn-xs mb-2 btn-danger del-btnx" style="cursor:pointer;" data-id="r_0">
                                        <i class="fa fa-trash" style="color:white"></i>
                                    </a>
                                </div>
                            </div>
                            <!-- <div class="row" style="padding-top:0.5vh;">
                                <div class="col-2"> 
                                    <select class="form-control input-small select2me" data-placeholder="Select..." disabled>
                                        <option >Single Input</option>
                                        <option >Checkbox</option>
                                        <option >Radiogroup</option>
                                        <option >Imagepicker</option>
                                    </select>   
                                </div>
                                <div class="col-2">
                                    <input type="text" value="row1" style="z-index:20;"  class="form-control">
                                    
                                </div>
                                <div class="col-2">
                                    <a class="btn btn-xs mb-2 btn-danger del-btnx" style="cursor:pointer;" data-id="11">
                                        <i class="fa fa-trash" style="color:white"></i>
                                    </a>
                                </div>
                            </div> -->
                        </div>

                    </div>
                    
                    <div class="col-12" style="padding-top:3vh;">
                        {!! Form::label('value', 'value', ['class' => 'control-label']) !!}
                        <div id="htmltable" data-status="0">
                        <table id="real_matrix" width="100%">
                             <input type="hidden" placeholder="" class="form-control head" value="col2" disabled="" >
                            <tr>
                                <td><input type="text" placeholder="" class="form-control empty-cell" value="  " disabled="" ></td>
                                <td><input type="text" placeholder="" class="form-control head" value="col1" disabled="" ></td>
                            </tr>
                            <tr>
                                <td width="15%"><input type="text" placeholder="" class="form-control head" value="row1" disabled=""></td>                               
                                <td> <input type="text" placeholder="" class="form-control formulas" id="1_1" onfocus="selectItemFunction(event)"></td>
                            </tr>
                        </table>
                        </div>
                        <div id="htmltable1"> 
                        </div>
                    </div> 
                </div>
            </div>     
        </div>   
            
        
    </div>

    <div class="card">
        <div class="card-header">
            <h3 class="page-title float-left mb-0">Content</h3>          
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-12 form-group"> 
                 
                        <div class="logic_condition row clone_condition" style="padding-top:10px;">
                            <div class="col-3" style="text-align:right">
                                <label> Type:</label>
                            </div>
                        
                            <input class="chart_type" type="hidden" value="">
                            <div class="col-5">                                    
                                <select class="form-control btn-warning" id="chart_type" placeholder="Options">
                                    <?php
                                        $types=[
                                            "pie chart",
                                            "donut chart",
                                            "bar chart",
                                            "3D bar chart",
                                            "sortable-table",
                                            "horizontal bar chart",
                                            "line chart",
                                            "radar chart",
                                            "polar chart",
                                            "bubble chart",
                                            "responsive-table",
                                            "radar1 chart",
                                            "not chart and table"
                                        ];
                                    ?>
                                    @for($i=0;$i<count($types);$i++)
                                        <option value="{{ $i }}">{{ $types[$i] }}</option>
                                    @endfor               
                                </select>
                            </div>   
                            <div class="col-4">
                                    <a id="create_chart"
                                        class="btn btn-primary" style="color:white">Create Chart</a>                                                      
                                    <a id="save_data"
                                    class="btn btn-danger" style="color:white">Save Data</a>

                                  <!--   <a id="create_chart1"
                                        class="btn btn-primary" style="color:white">Create Chart</a>                                                      
                                    <a id="save_data"
                                    class="btn btn-danger" style="color:white">Save Data</a> -->
      
                            </div>              
                        
                        </div>
                         <div class="row" style="margin-top:10px!important">
                            <div id="table_result1" class="col-12">
                                
                            </div>
                        </div>    

                        <div class="row" style="margin-top:10px!important">
                            <div id="pie-chartdiv" class="col-12"  style="margin-top:20px!important" ></div>
                            <div id="bar-chartdiv" class="col-12"></div>
                            <div id="d3bar-chartdiv" class="col-12"></div>
                            <div id="donut-chartdiv" class="col-12"></div>
                            <div id="table_result" class="col-12">
                                
                            </div>
                        </div>  

                                     
                </div>
            </div>
      
       
        </div>
    </div>

    
    <script type="text/javascript" src="{{asset('js/select2.full.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('js/main.js')}}"></script>

    <script type="text/javascript" src="{{asset('js/ui-nestable.js')}}"></script>
    <script type="text/javascript" src="{{asset('js/jquery.nestable.js')}}"></script>

    <!-- <script type="text/javascript" src="{{asset('js/select2.min.js')}}"></script> -->
    <script type="text/javascript" src="{{asset('js/jquery.dataTables.min.js')}}"></script>
    <script type="text/javascript" src="{{asset('js/dataTables.bootstrap.js')}}"></script>
    
    <script type="text/javascript" src="{{asset('js/table-editable.js')}}"></script>
    <script type="text/javascript" src="{{asset('js/chart-create.js')}}"></script>

    <script src="{{ asset('assets/metronic_assets/global/plugins/jquery.min.js')}}" type="text/javascript"></script>

    <script type="text/javascript" src="{{asset('js/3.5.1/jquery.min.js')}}"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    {{-- <link href="{{asset('css/custom.css')}}"  rel="stylesheet" type="text/css"/> --}}
    <link rel="stylesheet" type="text/css" href="{{asset('assets/metronic_assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css')}}"/>   
    <script type="text/javascript" src="{{asset('assets/metronic_assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js')}}"></script>

    {{-- ///////////////////////////////chart/////////////// --}}
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

        jQuery(document).ready(function(e) {       
            // initiate layout and plugins
            // Metronic.init(); // init metronic core components
            // Layout.init(); // init current layout
            // QuickSidebar.init(); // init quick sidebar
            // Demo.init(); // init demo features
            UITree.init();  
            UINestable.init();
            TableEditable.init();
            ChartCreate.init();
        })
    </script>    
@stop