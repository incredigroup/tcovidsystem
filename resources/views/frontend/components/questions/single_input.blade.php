@php
    $alignment = "0%";
    $size = "100%";
    $size_num = 0;
    $space = 0;
    $type = "input";
    if(isset($content)){
        if($content[0]->size) {
            $size = $content[0]->size.'%';
            $size_num = $content[0]->size;
        }
        $type=$content[0]->type;
        $alignment=$content[0]->alignment;
    }
    if ($alignment == 'center') {
        $space = (100 - $size_num)/2;
        $alignment = '50%';
    } else if ( $alignment == 'right') {
        $space = 100-$size_num;
        $alignment = '100%';
    }
@endphp
<div class="single-input-container">
    <div class="single-input" style="width:{{$size}}; transform:translateX({{$space}}%);">
        @if($type == "input")
        <div class="single_input_individual">
            <input type="text" class="form-control"  id="{{$question->id}}" name="single_input[]" placeholder="Write your answer" @if($question->required) required @endif>
            <span class="message mt-2"></span>
        </div>
        @else
        <div class="single_input_individual">
            <textarea class="form-control" id="{{$question->id}}"  name="single_input[]" placeholder="Write your answer" @if($question->required) required @endif></textarea>
        </div>
        @endif
        <!-- <div class="more_answers">
        </div> -->
        <!-- @if($question->more_than_one_answer==1)
            <div class="genius-btn mt60 gradient-bg ml-auto custom-btn">
                <a href="javascript:void(0);" class="btn-add-answer">Add another answer</a>
            </div>
        @endif -->
    </div>
</div>