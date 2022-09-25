@if(isset($content) && !empty($content[0]->image))
    @if($question->answer_alignment == "grid")
        <div class="row {{$question->answer_alignment}} image_content">
            @foreach($content[0]->image as $key=>$c)
            <div class="{{isset($content[(sizeof($content)-1)]->col)?$content[(sizeof($content)-1)]->col:''}} img-individual" >
                <img id="preview" src="" width="100%">
                    <div class="form-group">
                        <img src="{{asset('uploads/image/')}}{{'/'.$c}}" class="img-thumbnail" alt="image{{$key}}" onclick="clickimg(this)" srcset="" style="margin-bottom: 20px; width: 200px; height: 250px;">
                        <input class="form-control {{' imagebox_'.$key}}" type="text" style="width: 200px" name="imgradiogroup"  id="{{$question->id}}" data-key="{{$key+1}}" value="{{$content[0]->score[$key]}}" data-score="{{$content[0]->score[$key]}}">
                    </div>
            </div> 
            @endforeach
        </div>
        @else
        <div class="row {{$question->answer_alignment}} image_content">
            @foreach($content[0]->image as $key=>$c)
            <div class="{{isset($content[(sizeof($content)-1)]->col)?$content[(sizeof($content)-1)]->col:''}} img-individual" >
                <img id="preview" src="" width="100%">
                    <div class="form-group">
                        <img src="{{asset('uploads/image/')}}{{'/'.$c}}" class="img-thumbnail" alt="image{{$key}}" onclick="clickimg(this)" srcset="" style="margin-bottom: 20px; width: 100px; height: 100px;">
                        <input class="form-control {{' imagebox_'.$key}}" type="text" style="" name="imgradiogroup"  id="{{$question->id}}" data-key="{{$key+1}}" value="{{$content[0]->score[$key]}}" data-score="{{$content[0]->score[$key]}}">
                    </div>
            </div> 
            @endforeach
        </div>
        @endif;
@endif
@push('after-scripts')
    <script>
        function clickimg(ele){
            if($('#percent').val() == 1000  && $('#reported').val() == 10){
                alert('You can not edit your answers!');
            }else {
                $('.change-img-bg-color').each(function(){
                    $(this).removeClass('change-img-bg-color');
                });
                $(ele).addClass('change-img-bg-color');
                $(ele).next().prop("checked", true);
            }
        }
    </script>
@endpush