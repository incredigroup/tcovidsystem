{{-- Range --}}

<div id="rangs_part" class="row question-box" @if(isset($display)) style="display:{{$display}};" @endif>
    <div class="col-12">
    <!-- <a id="dropdown_add" class="btn btn-success" style="color:white; margin-top:10px;">+ New</a> -->
    </div>
    @if(isset($content))
        @php
            $content = json_decode($content);
            
        @endphp
        <div class="col-12">
            <label class="type-file">Table Font Color</label>
            <input type="color" class="form-control col-12" id = "range_color" placeholder="color" value='{{$content->range_color}}'>
        </div>
        <br />
        <div class="col-12  form-group " id="sortable_drop1">
            <!-- <form> -->         
            <div class="radio">
                <label  style="">
                     Min Value
                    <input id="range_min_value" type="text" name="optradio" value="{{$content->min_value}}">
                </label>
                Max Value 
                <input id="range_max_value" type="text" class="radio_label" value="{{$content->max_value}}">
                <label>Step</label>
                <input id="step_value" type="text"  class ="radio_score mr-2" value="{{$question->score}}" placeholder="{{$question->score}}">
            </div>
        </div>
        <div class="col-12">
        <div class="form-group">
            <label>Select Symbol</label>
            <select id="range_symbol" class="form-control">
                <option value="0" @if($content->symbol=="0") selected @endif>None</option>
                <option value="1" @if($content->symbol=="1") selected @endif>€</option>
            </select>
        </div>
        <div class="form-group">
            <label>Range Type</label>
            <select id="range_type" class="form-control">
                <option value="1" @if($content->type=="1") selected @endif>Cursor Bar</option>
                <option value="2" @if($content->type=="2") selected @endif>+/- Button</option>
            </select>
        </div>
    </div>
    @else

        <!-- <div class="col-12">
            <label class="type-file">Table Font Color</label>
            <input type="color" class="form-control col-12" id = "range_color" placeholder="color" value='#282f79'>
        </div> -->
        
        <div class="col-12  form-group " id="sortable_drop1">
        <!-- <form> -->         
        <div class="radio">
            <label  style="">
                 Min Value
                <input id="range_min_value" type="text" name="optradio" value="1">
            </label>
            Max Value 
            <input id="range_max_value" type="text" class="radio_label" value="10">
            <label>Step</label>
            <input type="text" id="step_value"  class ="radio_score mr-2" placeholder="0">
        </div>
        </div>
        <div class="col-12">
        <div class="form-group">
            <label>Select Symbol</label>
            <select id="range_symbol" class="form-control">
                <option value="0" selected>None</option>
                <option value="1">€</option>
            </select>
        </div>
        <div class="form-group">
            <label>Range Type</label>
            <select id="range_type" class="form-control">
                <option value="1" selected>Cursor Bar</option>
                <option value="2">+/- Button</option>
            </select>
        </div>
    </div>
    @endif
</div>
{{-- End Range --}}