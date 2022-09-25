       
        <div class="modal fade" id="exampleModalLong{{$question->id}}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
            <div class="modal-dialog" role="document" style="padding-right: 17px; display: block;">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header backgroud-style p-0">
    
                        <div class="gradient-bg"></div>
                        <div class="popup-logo">
                            <img src="http://www.diagnosiaziendale.it/storage/logos/popup-logo.png" alt="">
                        </div>
                        <div class="popup-text text-center">
                            <h2>Guida</h2>
                        </div>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    
                    </div>
    
                    <!-- Modal body -->
                    <div class="modal-body">
                        {!!$question->help_info!!}
                        <div class="nws-button text-right white text-capitalize">
                            <button type="button" class="p-3" style="height:unset;width:unset;font-size:1.2rem;" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
            {{-- Single Input --}}
            
            @if($question->questiontype==0)
                @include('frontend.components.questions.single_input')
            {{-- Checkbox --}}
            @elseif($question->questiontype==1)
                @include('frontend.components.questions.checkbox')
            {{-- Radio Group --}}
            @elseif($question->questiontype==2)
                @include('frontend.components.questions.radiogroup')
            {{-- Image --}}
            @elseif($question->questiontype==3)
                @include('frontend.components.questions.image')
            {{-- Matrix --}}
            @elseif($question->questiontype==4)
                @include('frontend.components.questions.matrix')
            {{-- Rating --}}
            @elseif($question->questiontype==5)
                @include('frontend.components.questions.rating')
            {{-- Dropdown --}}
            @elseif($question->questiontype==6)
                @include('frontend.components.questions.dropdown')
            {{-- File --}}
            @elseif($question->questiontype==7)
                @include('frontend.components.questions.file')
            {{-- Stars --}}
            @elseif($question->questiontype==8)
                @include('frontend.components.questions.stars')
            {{-- Rangs --}}
            @elseif($question->questiontype==9)
                @include('frontend.components.questions.rangs')
            {{-- Euro --}}
            @elseif($question->questiontype==10)
                @include('frontend.components.questions.euro')
            @endif
