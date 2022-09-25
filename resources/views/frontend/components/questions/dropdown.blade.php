@php
  $dropdown_alignment = "0%";
  $size_num = 0;
  $space = 0;
  if($content != '') {
    foreach($content as $key => $c){
      if(isset($c->dropdown_size)) $dropdown_size = $c->dropdown_size.'%';
      if(isset($c->dropdown_size)) $size_num = $c->dropdown_size;
      if(isset($c->dropdown_alignment)) $dropdown_alignment = $c->dropdown_alignment;
    }
    if ($dropdown_alignment == 'center') {
      $space = (100-$size_num)/2;
      $dropdown_alignment = '50%';
    } else if ( $dropdown_alignment == 'right') {
      $space = 100-$size_num;
      $dropdown_alignment = '100%';
    }
  }
@endphp

<div class="dropdowninput" data-required="@if($question->required=="1") 1 @else 0 @endif" style="width:{{$dropdown_size}}; transform:translateX({{$space}}%);">
    <div class="form-group">
        <!-- <label for="">Select Value</label> -->
        <select class="form-control dropdown" name="dropdown"  id="{{$question->id}}">
        
          <option value="">Select Option</option>
          
            @foreach($content as $key=>$c)
              @if($key != (sizeof($content)-1))
                @if(isset($c->label))
                    <option id="opt" data-key="{{$key+1}}" value="{{$c->score}}">{{$c->label}}</option>
                @endif
              @endif
            @endforeach
        </select>
  </div>
  <span class="message mt-2"></span>
</div>