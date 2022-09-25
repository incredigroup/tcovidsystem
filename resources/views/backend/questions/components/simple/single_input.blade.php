{{-- Single Input --}}
@php
    if(isset($content)){
        $content = json_decode($question->content);
    }
    $alignment = 'left';
    $size = '100';
    $mtop = '';
    $type = '';
    isset($content[0]->alignment) ? $alignment = $content[0]->alignment : '';
    isset($content[0]->type) ? $type = $content[0]->type : '';
    isset($content[0]->size) ? $size = $content[0]->size : '';
    isset($content[0]->mtop) ? $mtop = $content[0]->mtop : '';
@endphp
<div id="single_input_part" class="question-box" @if(isset($display)) style="display:{{$display}};" @endif>
    <div class="form-group d-flex">
        <label class="type-file">Aligment</label>
        <select class="form-control" name="options" id="single_input_alignment" placeholder="Options">
            @php
                $alignment_arr = [
                    'left' => 'Left',
                    'center' => 'Center',
                    'right' => 'Right',
                ];
            @endphp
            @foreach($alignment_arr as $key=>$value)
                <option value="{{$key}}" @if($alignment == $key) selected @endif>{{$value}}</option>
            @endforeach
        </select>
    </div>
    <div class="form-group d-flex">
        <label class="type-file">Input Type</label>
        <select class="form-control" name="options" id="single_input_type" placeholder="Options">
            @php
                $type_arr = [
                    'input' => 'Input',
                    'textarea' => 'Textarea',
                ];
            @endphp
            @foreach($type_arr as $key => $value)
                <option value="{{$key}}" @if($type == $key) selected @endif>{{$value}}</option>
            @endforeach
        </select>
    </div>
    <div class="form-group d-flex">
        <label class="type-file">Size (%)</label>
        <input type="number" class="form-control" id = "single_input_size" placeholder="" value='{{$size}}'>
    </div>
    <!-- <div class="form-group d-flex">
        <label class="type-file">Margin From Top (px)</label>
        <input type="number" class="form-control" id = "single_input_mtop" placeholder="" value='{{$mtop}}'>
    </div> -->
</div>
{{-- End Signle Input --}}