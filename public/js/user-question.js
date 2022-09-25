
var UserQuestion = function () {

    var id_list;
    $(document).ready(function (e) {
        display_question();
        
        $("table[name='matrix']").each(function(id, ele){
            if($(this).attr('matrix-type') == 'radio'){
                var checkboxes = $(ele).find('input[type="radio"]');
                var inputs = $(ele).find('input[type="text"]');
                for(var k = 0; k < inputs.length; k++){
                    $(inputs[k]).attr('type', 'hidden');
                }
                for(var i = 0; i < checkboxes.length; i++){
                    $(checkboxes[i]).removeAttr('checked');
                }
            }else{
                var inputs = $(ele).find('input[type="text"]');
                for(var i = 0; i < inputs.length; i++){
                    $(inputs[i]).attr('value', '');
                }
            }
        })
        

        var test_id = $("#test_id").val()

        $.ajax({
            data:{
                test_id: test_id,
            },
            url: '../get_answers_fill',
            type: 'POST',
            dataType: 'json',
            success: function(response) {
                var res_answers;
                if(response.answers){
                    res_answers = response.answers;
                }
                for(var i=0; i<res_answers.length; i++){
                    display_answers(res_answers[i]);
                }
                display_question();
            }
        })
        var reported = $('#reported').val();
        var percent = $('#percent').val();
        if(reported == 10 && percent == 1000){
            $('#question_form').each(function () {
                $(this).find(':input').not('button').prop('disabled', true);
            });
        }

        $('input[type="text"]').on('change', function (e) {
            if(reported == 10 && percent == 1000){
                e.preventDefault();
            }else{
                logic_perform();
                storeData(test_id);
                show_progress();
            }
        })

        $('input[type="radio"]').on('change', function (e) {
            if(reported == 10 && percent == 1000){
                e.preventDefault();
            }else{
                logic_perform();
                storeData(test_id);
                show_progress();
            }           
        })

        $('.square-check').on('click', function (e) {
            if(reported == 10 && percent == 1000){
                e.preventDefault();
            }else{
                logic_perform();
                storeData(test_id);
                show_progress();
            }
        });

        $(".rating-stars .star").on('click', function (e) {
            if(reported == 10 && percent == 1000){
                e.preventDefault();
            }else{
                logic_perform();
                storeData(test_id); 
                show_progress();
            }           
        })

        $(".rate").on('click', function (e) {
            if(reported == 10 && percent == 1000){
                e.preventDefault();
            }else{
                logic_perform();
                storeData(test_id); 
                show_progress();
            }
        })

        $('.img-thumbnail').on('click', function (e) {
            if(reported == 10 && percent == 1000){
                e.preventDefault();
            }else{
                logic_perform();
                storeData(test_id); 
                show_progress();
            }           
        })
    
        $('input[name="radiogroup"]').on('change', function (e) {
            if(reported == 10 && percent == 1000){
                e.preventDefault();
            }else{
                logic_perform();
                storeData(test_id); 
                show_progress();
            }
        });
        
        $('input[name="single_input[]"]').on('change', function (e) {
            if(reported == 10 && percent == 1000){
                e.preventDefault();
            }else{
                logic_perform();
                storeData(test_id); 
                show_progress();
            }
        });
    
        $('input[name="imgradiogroup"]').on('change', function (e) {
            if(reported == 10 && percent == 1000){
                e.preventDefault();
            }else{
                logic_perform();
                storeData(test_id); 
                show_progress();
            }
        });
    
        $('input[name="b_range"]').on('change', function (e) {
            if(reported == 10 && percent == 1000){
                e.preventDefault();
            }else{
                logic_perform();
                storeData(test_id); 
                show_progress();
            }
        });
    
        $('li[name="rating"]').on('click', function (e) {
            if(reported == 10 && percent == 1000){
                e.preventDefault();
            }else{
                logic_perform();
                storeData(test_id); 
                show_progress();
            }
        });
    
        $('li[name="star"]').on('change', function (e) {
            if(reported == 10 && percent == 1000){
                e.preventDefault();
            }else{
                logic_perform();
                storeData(test_id);
                show_progress();
            }
        });
    
        $('select[name="dropdown"]').on('change', function (e) {
            if(reported == 10 && percent == 1000){
                e.preventDefault();
            }else{
                logic_perform();
                storeData(test_id); 
                show_progress();
            }
        });
    });

    //when change form, display condition logic question following answers
    //start
    function logic_perform(){
        var get_answer_id = 0;
        id_list = $('.question-card').map(function () {
            return $(this).attr('id');
        });
        if(id_list.length == 0)
            return;

        for (var i = 0; i < id_list.length; i++) {

            var logic_val = 0;
            var cnt = $("#" + id_list[i]).find(".logic_cnt").val();

            for (var j = 0; j < cnt; j++) {
                var current_val = [];
                var logic_qt_id = "q_" + $("#" + id_list[i]).find(".logic_" + j + " .logic_qt").val();
                logic_val = $("#" + id_list[i]).find(".logic_" + j + " .logic_cont").map(function (){
                    return $(this).val()
                });
                var qt_existed = 0;
                for (var k = 0; k < id_list.length; k++) {
                    if (logic_qt_id == id_list[k])
                        qt_existed = 1;
                }

                if (qt_existed != 0) {

                    var qt_type = $("#" + logic_qt_id).find(".qt_type").val();

                    if (qt_type == 0) {
                        current_val[0] = $.trim($("#" + logic_qt_id).find("textarea").val());
                    } else if (qt_type == 1) {
                        current_val[0] = 0;
                        var len = $('#' + logic_qt_id).find(".check_content").children().length;
                        for (var k = 0; k < len; k++) {
                            if ($('#' + logic_qt_id + ' .check_content .checkbox_' + k).is(':checked') == true)
                                current_val[0] = $('#' + logic_qt_id + ' .check_content .checkbox_' + k).val();
                        }

                    } else if (qt_type == 2) {
                        current_val[0] = 0;
                        var len = $('#' + logic_qt_id).find(".radio_content").children().length;

                        for (var k = 0; k < len; k++) {
                            if ($('#' + logic_qt_id + ' .radio_content .radio_' + k).is(':checked'))
                                current_val[0] = $('#' + logic_qt_id + ' .radio_content .radio_' + k).val();
                        }
                    } else if (qt_type == 3) {
                        current_val[0] = 0;
                        var len = $('#' + logic_qt_id).find(".image_content").children().length;

                        for (var k = 0; k < len; k++) {
                            if ($('#' + logic_qt_id + ' .image_content .imagebox_' + k).is(':checked') == true)
                                current_val[0] = $('#' + logic_qt_id + ' .image_content .imagebox_' + k).val();
                        }
                    } else if(qt_type == 5){
                        current_val[0] = 0;
                        current_val[0] = $('#' + logic_qt_id + ' .rating_content .ratinginput').val();
                    } else if(qt_type == 6){
                        current_val[0] = 0;
                        current_val[0] = $('#' + logic_qt_id + ' select.dropdown option:selected').val();
                    } else if(qt_type == 8){
                        current_val[0] = 0;
                        current_val[0] = $('#' + logic_qt_id + ' .stars_content .starinput').val();
                    } else {
                        current_val = [];
                        current_val = $('#' + logic_qt_id).find("input[type='text']").map(function () {
                            return $(this).val();
                        });

                    }
                }

                var logic_operator = $('#' + id_list[i]).find(".logic_" + j + " .logic_operator").val();

                if (logic_operator == 0) //equals
                {
                    if (qt_type == 4) {
                        var state = 1;
                        for (var t = 0; t < logic_val.length; t++) {
                            if (logic_val[t] == current_val[t]) {
                                state *= 1;
                            } else
                                state *= 0;
                        }
                        $('#' + id_list[i] + " .logic_" + j + " .logic_state").val(state);
                    } else {
                        if (logic_val[0] == current_val[0]) {
                            $('#' + id_list[i] + " .logic_" + j + " .logic_state").val(1);
                        } else
                            $('#' + id_list[i] + " .logic_" + j + " .logic_state").val(0);
                    }
                } else if (logic_operator == 1) //not equals
                {
                    if (qt_type == 4) {
                        var state = 1;
                        for (var t = 0; t < logic_val.length; t++) {
                            if (logic_val[t] != current_val[t]) {
                                state *= 1;
                            } else
                                state *= 0;
                            $('#' + id_list[i] + " .logic_" + j + " .logic_state").val(1);
                        }

                    } else {
                        if (logic_val[0] != current_val[0]) {
                            $('#' + id_list[i] + " .logic_" + j + " .logic_state").val(1);
                        } else
                            $('#' + id_list[i] + " .logic_" + j + " .logic_state").val(0);
                    }
                } else if (logic_operator == 2) //contains
                {
                    if (qt_type == 4) {
                        for (var t = 0; t < logic_val.length; t++) {
                            if (current_val.includes(logic_val[t]) == true) {
                                $('#' + id_list[i] + " .logic_" + j + " .logic_state").val(1);
                                break;
                            } else
                                $('#' + id_list[i] + " .logic_" + j + " .logic_state").val(0);
                        }
                    } else {
                        if (current_val.includes(logic_val) == true) {
                            $('#' + id_list[i] + " .logic_" + j + " .logic_state").val(1);
                        } else
                            $('#' + id_list[i] + " .logic_" + j + " .logic_state").val(0);
                    }
                } else if (logic_operator == 3) //not contains
                {
                    if (qt_type == 4) {
                        for (var t = 0; t < logic_val.length; t++) {
                            if (current_val.includes(logic_val[t]) == false) {
                                $('#' + id_list[i] + " .logic_" + j + " .logic_state").val(1);
                                break;
                            } else
                                $('#' + id_list[i] + " .logic_" + j + " .logic_state").val(0);
                        }
                    } else {
                        if (current_val.includes(logic_val[0]) == false) {
                            $('#' + id_list[i] + " .logic_" + j + " .logic_state").val(1);
                        } else {
                            $('#' + id_list[i] + " .logic_" + j + " .logic_state").val(0);
                        }

                    }
                } else if (logic_operator == 4) //greater
                {
                    if (qt_type == 4) {
                        var state = 1;
                        for (var t = 0; t < logic_val.length; t++) {
                            if (current_val[t] > parseFloat(logic_val[t])) {
                                state *= 1;
                            } else
                                state *= 0;
                            $('#' + id_list[i] + " .logic_" + j + " .logic_state").val(state);
                        }
                    } else {
                        if (current_val[0] > parseFloat(logic_val[0])) {
                            $('#' + id_list[i] + " .logic_" + j + " .logic_state").val(1);
                        } else
                            $('#' + id_list[i] + " .logic_" + j + " .logic_state").val(0);
                    }
                } else if (logic_operator == 5) //less
                {
                    if (qt_type == 4) {
                        var state = 1;
                        for (var t = 0; t < logic_val.length; t++) {
                            if (current_val[t] < parseFloat(logic_val[t])) {
                                state *= 1;
                            } else
                                state *= 0;
                            $('#' + id_list[i] + " .logic_" + j + " .logic_state").val(state);
                        }
                    } else {
                        if (current_val[0] < parseFloat(logic_val[0])) {
                            $('#' + id_list[i] + " .logic_" + j + " .logic_state").val(1);
                        } else
                            $('#' + id_list[i] + " .logic_" + j + " .logic_state").val(0);
                    }

                } else if (logic_operator == 6) //greater or equals
                {
                    if (qt_type == 4) {
                        var state = 1;
                        for (var t = 0; t < logic_val.length; t++) {
                            if (current_val[t] >= parseFloat(logic_val[t])) {
                                state *= 1;
                            } else
                                state *= 0;
                            $('#' + id_list[i] + " .logic_" + j + " .logic_state").val(state);
                        }
                    } else {
                        if (current_val[0] >= parseFloat(logic_val[0])) {
                            $('#' + id_list[i] + " .logic_" + j + " .logic_state").val(1);
                        } else
                            $('#' + id_list[i] + " .logic_" + j + " .logic_state").val(0);

                    }
                } else if (logic_operator == 7) //less or equals
                {
                    if (qt_type == 4) {
                        var state = 1;
                        for (var t = 0; t < logic_val.length; t++) {
                            if (current_val[t] <= parseFloat(logic_val[t])) {
                                state *= 1;
                            } else
                                state *= 0;
                            $('#' + id_list[i] + " .logic_" + j + " .logic_state").val(state);
                        }
                    } else {
                        if (current_val[0] <= parseFloat(logic_val[0])) {
                            $('#' + id_list[i] + " .logic_" + j + " .logic_state").val(1);
                        } else
                            $('#' + id_list[i] + " .logic_" + j + " .logic_state").val(0);
                    }
                }

            }

            var current_state = 0;
            var current_page = $('input[name="current_page"]').val();
            for (var j = 0; j < cnt; j++) {
                var logic_type = $('#' + id_list[i]).find(".logic_" + j + " .logic_type").val();

                if (j == 0)
                    current_state = parseInt($('#' + id_list[i]).find(".logic_" + j + " .logic_state").val());

                if (logic_type == 0)
                    current_state *= parseInt($('#' + id_list[i]).find(".logic_" + j + " .logic_state").val());
                else
                    current_state += parseInt($('#' + id_list[i]).find(".logic_" + j + " .logic_state").val());
            }

            if (current_state != 0 && $('#' + id_list[i]).data('page') == current_page)
                $('#' + id_list[i]).show();
            else if ($('#' + id_list[i]).find(".logic_cnt").val() != 0)
                $('#' + id_list[i]).hide();
        }
    }
    //end

    $(document).on('click', '#answer_submit', function (e) {
        var current_val = [];

        for (var i = 0; i < id_list.length; i++) {
            var qt_type = $("#" + id_list[i]).find(".qt_type").val();
            if (qt_type == 0) {
                current_val[i] = $.trim($("#" + id_list[i]).find("textarea").val());

            } else if (qt_type == 1) {
                current_val[i] = 0;

                var len = $('#' + id_list[i]).find(".check_content").children().length;

                for (var k = 0; k < len; k++) {
                    if ($('#' + id_list[i] + ' .check_content .checkbox_' + k).is(':checked') == true)
                        current_val[i] += Math.pow(2, len - k);
                }
            } else if (qt_type == 2) {
                current_val[i] = 0;
                var len = $('#' + id_list[i]).find(".radio_content").children().length;
                for (var k = 0; k < len; k++) {
                    if ($('#' + id_list[i] + ' .radio_content .radio_' + k + ':checked').val() == "on")
                        current_val[i] += Math.pow(2, len - k);
                }
            } else if (qt_type == 3) {
                current_val[i] = 0;
                var len = $('#' + id_list[i]).find(".image_content").children().length;

                for (var k = 0; k < len; k++) {
                    if ($('#' + id_list[i] + ' .image_content .imagebox_' + k).is(':checked') == true)
                        current_val[i] += Math.pow(2, len - k);
                }
            } else {
                current_val[i] = []
                dd = $('#' + id_list[i]).find("input[type='text']").map(function () {
                    return $(this).val();
                });
                for (var k = 0; k < dd.length; k++)
                    current_val[i].push(dd[k]);
            }
        }

        var question_id = [];

        for (var k = 0; k < id_list.length; k++) {
            question_id[k] = id_list[k].split('_')[1];
        }
        data = {
            'question_id': question_id,
            'answer': JSON.stringify(current_val),
            'test_id': $("#test_id").val()
        };

        e.preventDefault();

        $.ajax({
            data: {data: data},
            url: "../store_answer",
            type: "GET",
            dataType: 'json',
            success: function (response) {
                $("#textresult").text(response.report_data[0]['origin_content']);

            },
            error: function (response) {
                console.log('Error:', response);
            }
        });
    });

    $(document).on('change', '#files',function(e) {
        e.preventDefault();
        var data = new FormData();
        var TotalFiles = $(this)[0].files.length; //Total Files
        var default_number_files = $(this).siblings('#num_files').val();
        var files = $(this)[0];
        var question_id = $(this).siblings('#file_q_id').val();
        var all_number = TotalFiles + $('#q_'+question_id).children().find('#preview').children().length;
        console.log('all_number', all_number);
        console.log('default_number_files', default_number_files);
        for(var i = 0; i < TotalFiles; i++){
            data.append('files'+i, files.files[i]);
        }
        data.append('TotalFiles', TotalFiles);
        data.append('q_id', question_id);
        data.append('test_id', $('#test_id').val());
        if(all_number <= default_number_files){
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN' : $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.ajax({
                type: 'POST',
                url: filePath, //this url is defined in files.blade.php
                data: data,
                cache: false,
                contentType: false,
                processData: false,
                success: function(response) {
                    template_alert('File salvata con successo',response.result);
                    // $("#user_upload_file").val(response.img_name);
                    // $(".files_user").val(response.file_name);
                    console.log('file_names',response.file_names);
                    var files = response.file_names;
                    $('#q_'+response.q_id).children().find('#preview').children().remove();
                    for(var i = 0; i < files.length; i++){
                        display_image(files[i], response.q_id);
                    }
                },
                error: function(response) {
                    template_alert('errore',response.error);
                }
            });
        }else{
            template_alert('Avvertimento','Il numero totale di file deve essere inferiore a '+default_number_files);
        }
        $(this).val('');
    });

    // var file_save = function () {
    //     var data = new FormData();
    //     var TotalFiles = $('#files')[0].files.length; //Total Files
    //     var files = $('#files')[0];
    //     for(var i = 0; i < TotalFiles; i++){
    //         data.append('files'+i, files.files[i]);
    //     }
    //     data.append('TotalFiles', TotalFiles);
    //     data.append('q_id', $('#file_q_id').val());
    //     data.append('test_id', $('#test_id').val());
    //     $.ajaxSetup({
    //         headers: {
    //             'X-CSRF-TOKEN' : $('meta[name="csrf-token"]').attr('content')
    //         }           
    //     });
    //     $.ajax({
    //         type: 'POST',
    //         url: filePath, //this url is defined in files.blade.php
    //         data: data,
    //         cache: false,
    //         contentType: false,
    //         processData: false,
    //         success: function(response) {
    //             console.log('file_names',response.file_names);
    //             var files = response.file_names;
    //             $('#q_'+response.q_id).children().find('#preview').children().remove();
    //             for(var i = 0; i < files.length; i++){
    //                 display_image(files[i]);
    //             }
    //         },
    //         error: function(response) {
    //             template_alert('error','Error in uploading the File.','error');
    //             console.log(response);
    //         }
    //     })
    // }
    /**
     * 
     * @param {
     * } image_name : image name
     * @usage: display image with param => image name 
     */
    var display_image = function (image_name, qt) {
        var default_path = image_defaultPath;
        if(image_name['type'] == 'image'){
            var html_append = `<div class="preview-img clearfix mt-3" data-question="`+qt+`" data-file="`+image_name['name']+`"><img src='`+default_path+`/`+image_name['name']+`' alt=`+image_name['name']+` class="mb-5 float-left"><a class="preview-del-button gradient-bg float-right" id="del_file" href="javascript:void(0)">Delete</a></div>`;
        }else {
            var html_append = `<div class="preview-files clearfix mt-3" data-question="`+qt+`" data-file="`+image_name['name']+`"><a href='`+default_path+`/`+image_name['name']+`' class="mb-5" download>`+image_name['name']+`</a><a class="preview-del-button gradient-bg float-right" id="del_file" href="javascript:void(0)">Delete</a></div>`;
        }
        $('#q_'+qt).children().find('#preview').append(html_append);
        console.log(image_name);
        return html_append;
    }

    var file_element = function (image_name) {
        var default_path = image_defaultPath;
        var html_append = ``;
        if(image_name.type == 'image'){
            var html_append = `<div class="display-img mt-3"><img src='`+default_path+`/`+image_name.name+`' alt=`+image_name.name+` class="mb-5"></div>`;
        }else {
            var html_append = `<div class="display-files mt-3"><a href='`+default_path+`/`+image_name.name+`' class="mb-5" download>`+image_name['name']+`</a></div>`;
        }
        return html_append;
    }

    let user_question;
    let user_textgroup;
    let textgroup_data;
    let arr = [];
    let textgroup_ids = [];
    let answers = [];
    let scores = [];
    let textgroup_scores = [];
    
    $(document).on('click', '#create-report', function (e) {
        
        var arr = collecting_answers();
        $(".report-card").show();
        var flag = true;
        var test_id = $("#test_id").val();
        e.preventDefault();

        $('input[type=text]').each(function (i) {
            if ($(this).prop('required') && $(this).val() == "") {
                $(this).siblings('.message').html("<p class='text-danger'>Compila i dettagli.</p>");
                flag = false;
                $(this).closest('.question-card').css('border', 'solid 1px #ff0000');
            } else {
                $(this).siblings('.message').html("");
            }
        });

        $('.rating-box').each(function (i) {
            var required = parseInt($(this).data('required'));
            if (required == 1) {
                var data = $(this).find('.ratinginput').data('selected');
                if (!data) {
                    $(this).find('.message').html("<p class='text-danger'>E' necessario rispondere a questa domanda.</p>");
                    flag = false;
                    $(this).closest('.question-card').css('border', 'solid 1px #ff0000');
                } else {
                    $(this).find('.message').html('');
                }
            }
        });

        $('.rating-stars').each(function (i) {

            var required = parseInt($(this).data('required'));
            if (required == 1) {
                var data = $(this).find('.starinput').data('selected');
                if (!data) {
                    $(this).find('.message').html("<p class='text-danger'>E' necessario rispondere a questa domanda.</p>");
                    flag = false;
                    $(this).closest('.question-card').css('border', 'solid 1px #ff0000');
                } else {
                    $(this).find('.message').html('');
                }
            }
        });

        $('.checkbox-input').each(function (i) {
            var required = parseInt($(this).data('required'));
            if (required == 1) {
                var data = $(this).find('input:checked').length;
                if (data <= 0) {
                    $(this).siblings('.message').html("<p class='text-danger'>E' necessario rispondere a questa domanda.</p>");
                    flag = false;
                    $(this).closest('.question-card').css('border', 'solid 1px #ff0000');
                } else {
                    $(this).siblings('.message').html('');
                }
            }
        });

        $('.radiogroup').each(function (i) {
            var required = parseInt($(this).data('required'));
            if (required == 1) {
                var data = $(this).find('input:checked').length;
                if (data <= 0) {
                    $(this).find('.message').html("<p class='text-danger'>E' necessario rispondere a questa domanda.</p>");
                    flag = false;
                    $(this).closest('.question-card').css('border', 'solid 1px #ff0000');
                } else {
                    $(this).find('.message').html('');
                }
            }
        });
        $('.images_files').each(function (i) {
            var required = parseInt($(this).data('required'));
            if (required == 1) {
                var data = $(this).find('input:checked').length;
                if (data <= 0) {
                    $(this).find('.message').html("<p class='text-danger'>E' necessario rispondere a questa domanda.</p>");
                    flag = false;
                    $(this).closest('.question-card').css('border', 'solid 1px #ff0000');
                } else {
                    $(this).find('.message').html('');
                }
            }
        });

        $('.dropdowninput').each(function (i) {
            var required = parseInt($(this).data('required'));
            if (required == 1) {
                var data = $(this).find('select').val();
                template_alert("Required Rating", "rating" + data);
                if (data == "") {
                    $(this).find('.message').html("<p class='text-danger'>E' necessario rispondere a questa domanda.</p>");
                    flag = false;
                    $(this).closest('.question-card').css('border', 'solid 1px #ff0000');
                } else {
                    $(this).find('.message').html('');
                }
            }
        });
        // var formData = JSON.stringify(arr);
        // Original Code
        if (flag != false) {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
            $.ajax({
                data: {test_id: test_id, test: arr, reported: 1},
                url: "../get_report",
                type: "POST",
                dataType: "json",
                success: function (response) {
                    user_question = response.user_question;
                    user_textgroup = response.user_textgroup;
                    textgroup_data = response.textgroup_data;

                    contents = [];
                    types = [];
                    if(response.report_data){
                        var con = JSON.parse(response.report_data[0]['origin_content']);
                        $('#reported').val(1);
                        // $('#question_form').each(function () { //block all edit answers
                        //     $(this).find(':input').not('button').prop('disabled', true);
                        // });
                    }else {
                        template_alert("Errore",response.error);
                    }
                    let chart_type = 0;
                    var content_str = con;
                    const con_str = con.split('\n');
                    $("#report").html($.parseHTML(content_str));
                    let tg_idx = 0;
                    let idx = 1;

                    for (var i = 0; i < con_str.length; i++) {
                        if (con_str[i].includes("[text id=") == true) {
                            var text_index = con_str[i].split("[text id=")[1].replace("]</p>", "");
                            var text_val = text_index.split(["]"])[0];
                            for (var j = 0; j < textgroup_data.length; j++) {
                                if (text_val == textgroup_data[j]['id']) {
                                    textgroup_ids.push(text_val);
                                    content_str = $("#report").html();
                                    let tg_strs = JSON.parse(textgroup_data[j]['content']);
                                    let tg_scores = JSON.parse(textgroup_data[j]['score']);
                                    let tg_content = "";
                                    let tg_score = 0;
                                    if(textgroup_data[j]['logic'].length == 1 && textgroup_data[j]['logic'][0] == null){
                                        for(let tg = 0; tg < tg_strs.length; tg++) {
                                            tg_content += tg_strs[tg];
                                            if(tg_scores[tg] != "")
                                                tg_score += parseInt(tg_scores[tg]);
                                        }
                                        answers.push(tg_content);
                                        scores.push(tg_score);
                                        textgroup_scores.push({'id':text_val, 'score': tg_score});
                                    }else { 
                                        var logic = JSON.parse(textgroup_data[j]['logic']);
                                        for(let tg = 0; tg < tg_strs.length; tg++) {
                                            if(logic_validation(logic[tg])){
                                                tg_content += tg_strs[tg];
                                                if(tg_scores[tg] != "")
                                                    tg_score += parseInt(tg_scores[tg]);
                                            }
                                        }
                                        answers.push(tg_content);
                                        scores.push(tg_score);
                                        textgroup_scores.push({'id':text_val, 'score': tg_score});
                                    }
                                    //let tg_html = '<div id="textgroup'+text_index+'" class="col-12">'+tg_content+'</div>';
                                    content_str = content_str.replace("[text id=" + text_val + "]", tg_content);
                                    $("#report").html($.parseHTML(content_str));
                                    tg_idx++;
                                    break;
                                }
                            }
                        }

                        if (con_str[i].includes("[chart id=") == true) {
                            let con_split = con_str[i].split("[chart id=")
                            for(let k = 1; k < con_split.length; k++) {
                                let con_style = con_split[0].split("text-align:");
                                let style = "";
                                if (con_style.length > 1) {
                                    let style1 = con_style[1].replace('">', '');
                                    if (style1 == "center")
                                        style = 'style="justify-content: center;"';
                                    if (style1 == "right")
                                        style = 'style="justify-content: right;"';
                                }
                                var chart_index = con_split[k].replace("]</p>", "");
                                var chart_val = chart_index.split(["]"])[0];
                                for (var j = 0; j < response.chart_data.length; j++) {
                                    if (chart_val == response.chart_data[j]['id']) {
                                        chart_type = response.chart_data[j]['type'];
                                        var content = JSON.parse(response.chart_data[j]['content']);
                                        console.log('content of chart_data', content);
                                        contents.push(ExpressionCalculation(content, user_question));
                                        types.push(chart_type);
                                        content_str = $("#report").html();
                                        if (chart_type == 0) {
                                            content_str = content_str.replace('[chart id=' + chart_val + ']', '<div id="pie-chartdiv' + idx + '" class="col-12" ' + style + '></div>');
                                            $("#report").html($.parseHTML(content_str));
                                            // pie_chart_draw(content, j);
                                        } else if (chart_type == 1) {
                                            content_str = content_str.replace('[chart id=' + chart_val + ']', '<div id="donut-chartdiv' + idx + '" class="col-12" ' + style + '></div>');
                                            $("#report").html($.parseHTML(content_str));
                                            // donut_chart_draw(content, j);
                                        } else if (chart_type == 2) {
                                            content_str = content_str.replace('[chart id=' + chart_val + ']', '<div id="bar-chartdiv' + idx + '" class="col-12" ' + style + '></div>');
                                            $("#report").html($.parseHTML(content_str));
                                            // bar_chart_draw(content, j);
                                        } else if (chart_type == 3) {
                                            content_str = content_str.replace('[chart id=' + chart_val + ']', '<div id="d3bar-chartdiv' + idx + '" class="col-12" ' + style + '></div>');
                                            $("#report").html($.parseHTML(content_str));
                                            // d3bar_chart_draw(content, j);
                                        } else if (chart_type == 5) {
                                            content_str = content_str.replace('[chart id=' + chart_val + ']', '<div id="horizontal-chartdiv' + idx + '" class="col-12" ' + style + '></div>');
                                            $("#report").html($.parseHTML(content_str));
                                            // horizontal_bar_chart_draw(content, j);
                                        } else if (chart_type == 6) {
                                            content_str = content_str.replace('[chart id=' + chart_val + ']', '<div id="line-chartdiv' + idx + '" class="col-12" ' + style + '></div>');
                                            $("#report").html($.parseHTML(content_str));
                                            // line_chart_draw(content, j);
                                        } else if (chart_type == 7) {
                                            content_str = content_str.replace('[chart id=' + chart_val + ']', '<div id="radar-chartdiv' + idx + '" class="col-12" ' + style + '></div>');
                                            $("#report").html($.parseHTML(content_str));
                                            // radar_chart_draw(content, j);
                                        } else if (chart_type == 8) {
                                            content_str = content_str.replace('[chart id=' + chart_val + ']', '<div id="polar-chartdiv' + idx + '" class="col-12" ' + style + '></div>');
                                            $("#report").html($.parseHTML(content_str));
                                            // polar_chart_draw(content, j);
                                        } else if (chart_type == 9) {
                                            content_str = content_str.replace('[chart id=' + chart_val + ']', '<div id="bubble-chartdiv' + idx + '" class="col-12" ' + style + '></div>');
                                            $("#report").html($.parseHTML(content_str));
                                            // bubble_chart_draw(content, j);
                                        } else if (chart_type == 11) {
                                            content_str = content_str.replace('[chart id=' + chart_val + ']', '<div id="radar1-chartdiv' + idx + '" class="col-12" ' + style + '></div>');
                                            $("#report").html($.parseHTML(content_str));
                                            // radar1_chart_draw(content, j);
                                        } else if (chart_type == 4) { //sortable table
                                            content_str = content_str.replace('[chart id=' + chart_val + ']', ' <table id="sortable_table' + idx + '" class="col-12 sortable"' + style + '></table>');
                                            $("#report").html($.parseHTML(content_str));
                                        } else if (chart_type == 10) { //responsive table
                                            content_str = content_str.replace('[chart id=' + chart_val + ']', ' <table id="responsive_table' + idx + '" class="col-12 responstable"' + style + '></table>');
                                            $("#report").html($.parseHTML(content_str));
                                        } else if (chart_type == 12) { //no chart and table
                                            content_str = content_str.replace('[chart id=' + chart_val + ']', ' <div id="no_table_chart' + idx + '" class="col-12 no-table-chart"></div>');
                                            $("#report").html($.parseHTML(content_str));
                                        }
                                        idx++;
                                    }
                                }
                            }
                        }
                    }
                    drawChart(contents, types);
                    setTimeout(function () {
                        $("#report_div").css('display', 'none');
                        $("#update_report_div").css('display', 'block');
                    },2000);
                },
                error: function (error) {
                    var err_type = error.stauts;
                    // var err_text = error.responseText;
                    if(err_type == 500) template_alert('Errore','Si prega di rispondere a tutte le domande');
                    if(err_type == 419) template_alert('Errore','Le tue credenziali di accesso sono scadute. Quindi accedi ancora una volta');
                }
            });
        }
    });

    $(document).on('click', '#del_file', function (e) {
        var qt = $(this).parent().data('question');
        var name = $(this).parent().data('file');
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $.ajax({
            data:{
                'question_id': qt,
                'name': name,
                'test_id': $('#test_id').val(),
            },
            url: '../delete_file',
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                template_alert('Successo',response.success);
            },
            error: function (error) {
                template_alert('Errore', 'Eliminazione file non riuscita');
            }
        })
        $(this).parent().remove();
    })

    var drawChart = function (contents, types) {
        let idx = 1;
        for(let j = 0; j < contents.length; j++) {
            let content = contents[j];
            if (types[j] == 0) {
                pie_chart_draw(content, idx);
            } else if (types[j] == 1) {
                donut_chart_draw(content, idx);
            } else if (types[j] == 2) {
                bar_chart_draw(content, idx);
            } else if (types[j] == 3) {
                d3bar_chart_draw(content, idx);
            } else if(types[j] == 5) {
                horizontal_bar_chart_draw(content, idx);
            } else if(types[j] == 6) {
                line_chart_draw(content, idx);
            } else if(types[j] == 7) {
                radar_chart_draw(content, idx);
            } else if(types[j] == 8) {
                polar_chart_draw(content, idx);
            } else if(types[j] == 9) {
                bubble_chart_draw(content, idx);
            } else if(types[j] == 11) {
                radar1_chart_draw(content, idx);
            } else if(types[j] == 4) {
                sortable_table_draw(content, idx);
            } else if(types[j] == 10) { //resonsive table
                responsive_table_draw(content, idx)
            } else if(types[j] == 12){ // no table and chart
                no_table_chart_draw(content, idx);
            }
            idx++;
        }
    }
    var equation_extraction = function (origin_expression) {
        var operator = ["+", "-", "*", "/", "(", ")"];
        //var origin_expression="6*(5+(2+3)*8+3)";
        var expression = [];
        expression[0] = "";
        var i = 0;
        var operator_flag = 0;
        for (var t = 0; t < origin_expression.length; t++) {
            operator_flag = 0;
            for (var j = 0; j < operator.length; j++) {
                if (origin_expression[t] == operator[j]) {
                    operator_flag = 1;
                    break;
                }
            }
            if (operator_flag == 0)
                expression[i] += origin_expression[t];
            else {
                if (expression[i].length > 0)
                    i++;
                expression[i] = operator[j];
                if (t != origin_expression.length - 1) {
                    i++;
                    expression[i] = "";
                }
            }

        }

        return expression;
    }
    var precedence = function (c) {
        switch (c) {
            case '+':
            case '-':
                return 1;
            case '*':
            case '/':
                return 2;
            case '^':
                return 3;
        }
        return -1;
    }
    var infixToPostFix = function (expression) {

        var result = [];
        stack = [];
        for (var i = 0; i < expression.length; i++) {

            //check if char is operator
            if (precedence(expression[i]) > 0) {
                while (stack.length > 0 && precedence(stack[stack.length - 1]) >= precedence(expression[i])) {
                    result.push(stack.pop());
                }
                stack.push(expression[i]);
            } else if (expression[i] == ')') {
                var x = stack.pop();
                while (x != '(') {
                    result.push(x);
                    x = stack.pop();
                }
            } else if (expression[i] == '(') {
                stack.push(expression[i]);
            } else {
                //character is neither operator nor ( 
                result.push(expression[i]);
            }
        }

        for (var i = 0; i <= stack.length; i++) {
            result.push(stack.pop());
        }

        return result;
    }
    var infix_evaluation = function (infix_expression) {
        var temp = [];
        let cnx = "";
        for( let j = 0; j < infix_expression.length; j++){
            cnx += infix_expression[j];
        }
        if(cnx.includes('<div') == true) {
            let formula = cnx;
            return formula;
        }
        cnx = cnx.replace("++", "+");
        cnx = cnx.replace("+*", "*");
        cnx = cnx.replace("+-", "-");
        cnx = cnx.replace("+/", "/");
        cnx = cnx.replace("-*", "*");
        cnx = cnx.replace("--", "-");
        cnx = cnx.replace("-+", "+");
        cnx = cnx.replace("-/", "/");
        cnx = cnx.replace("**", "*");
        cnx = cnx.replace("*-", "-");
        cnx = cnx.replace("*+", "+");
        cnx = cnx.replace("*/", "/");
        cnx = cnx.replace("/*", "*");
        cnx = cnx.replace("/-", "-");
        cnx = cnx.replace("/+", "+");
        cnx = cnx.replace("//", "/");
        cnx = cnx.replace("(+", "(");
        cnx = cnx.replace(")+", ")");
        cnx = cnx.replace("(*", "(");
        cnx = cnx.replace(")*", ")");
        cnx = cnx.replace("(-", "(");
        cnx = cnx.replace(")-", ")");
        cnx = cnx.replace("(/", "(");
        cnx = cnx.replace("/)", ")");
        try {
            let formula = eval(cnx);
            return formula;
        }catch(e){
            return cnx;
        }
        /*for (var i = 0; i < infix_expression.length; i++) {
            if (infix_expression[i] == "+" || infix_expression[i] == "-" || infix_expression[i] == "*" || infix_expression[i] == "/") {
                var first_num = parseFloat(temp.pop());
                var second_num = parseFloat(temp.pop());
                if (infix_expression[i] == "+")
                    temp.push(first_num + second_num);
                else if (infix_expression[i] == "-")
                    temp.push(first_num - second_num);
                else if (infix_expression[i] == "*")
                    temp.push(first_num * second_num);
                else
                    temp.push(first_num / second_num);
            } else {
                temp.push(infix_expression[i]);
            }
        }
        return temp.pop();*/
    }
    var ExpressionCalculation = function (content, user_question) {

        for (var i = 1; i < content.length; i++) {
            for (var j = 1; j < content[i].length; j++) {
                var expression = [];
                expression = equation_extraction(content[i][j]);
                var infix_expression = expression;//infixToPostFix(expression);

                for (var k = 0; k < infix_expression.length; k++) {
                    if(infix_expression[k] == undefined || infix_expression[k] == "" || infix_expression[k] == null)
                        continue;
                    if (infix_expression[k].includes("question") == true) {
                        var q_item = infix_expression[k].split("question")[1];
                        for (var m = 0; m < user_question.length; m++) {
                            if (user_question[m]['q_id'] == q_item) {
                                infix_expression[k] = user_question[m]['score'];
                                break;
                            }
                            else
                                infix_expression[k] = 0;
                        }
                    }else if (infix_expression[k].includes("textgroup") == true) {
                        var t_item = infix_expression[k].split("textgroup")[1];
                        for (var m = 0; m < textgroup_scores.length; m++) {
                            if (textgroup_scores[m]['id'] == t_item) {
                                infix_expression[k] = textgroup_scores[m]['score'];
                                break;
                            }
                        }
                    }else if(infix_expression[k].includes("file") == true){
                        var q_item = infix_expression[k].split(".")[0];
                        var file_id = infix_expression[k].split(".")[2] - 1;
                        for(var m = 0; m < user_question.length; m++){
                            if(user_question[m]['q_id'] == q_item) {
                                files = JSON.parse(user_question[m]['answer']);
                                infix_expression[k] = file_element(files[file_id]);
                            }
                        }
                    }else{
                        let names = infix_expression[k].split(".");
                        if(names.length >= 3){
                            let num = names.length - 1;
                            $("table[name='matrix']").each(function (idx, ele) {
                                let id = $(this).data("id");
                                if(id === parseInt(names[0])){
                                    var value = 0;
                                    let input = $(this).find("input[id='q_id" + names[num] + "']");
                                    var row = $(input).parent().parent();
                                    let inputs = $(row).children().find('input[type="radio"]');
                                    if(inputs.length == 0){
                                        // inputs = $(row).children().find('input[type="text"]');
                                        // for(var i = 0; i < inputs.length; i++){
                                            value = $(input).val();
                                        // }
                                    }else {
                                        for(var i = 0; i < inputs.length; i++){
                                            if($(inputs[i]).is(':checked')){
                                                value = $(inputs[i]).val();
                                                break;
                                            }
                                        }
                                    }
                                    
                                    // let value = $(input).val();
                                    // if($(input).attr("type") == "radio")
                                    // {
                                    //     if($(input).is(':checked') == false)
                                    //         value = 0;
                                    // }
                                    if(value == "" || value == null)
                                        value = 0;
                                    value = parseInt(value);
                                    infix_expression[k] = value;
                                }
                            })

                        }
                    }
                }

                content[i][j] = infix_expression;
            }
        }

        for (var i = 1; i < content.length; i++) {
            for (var j = 1; j < content[i].length; j++) {
                content[i][j] = infix_evaluation(content[i][j]);
            }
        }
        return content;
    }

    $(document).on('click', '#update-report', function (e) {
        let test_id = $("#test_id").val();
        let report_str = JSON.stringify($("#report").html());
        let tg_ids = JSON.stringify(textgroup_ids);
        let tg_answers = JSON.stringify(answers);
        let tg_scores = JSON.stringify(scores);

        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
        $.ajax({
            data: {
                test_id : test_id,
                report_content : report_str,
                tg_ids : tg_ids,
                tg_answers : tg_answers,
                tg_scores : tg_scores
            },
            url: "../update_report",
            type: "POST",
            dataType: "json",
            success: function (response) {
                template_alert("Rapporto aggiornato",response.success);
                $("#report_div").css('display', 'block');
                $("#update_report_div").css('display', 'none');
                textgroup_scores = [];
            },
            error: function (error) {
                var err = error.responseText;
                console.log(err);
            }
        });
    });

    var logic_validation = function (logic){
        var logic_result = [];
        for(var i = 0; i < logic.length; i++){
            var logic_type = logic[i][0];
            var logic_pb = logic[i][1];
            var logic_opt = logic[i][2];
            var logic_val = JSON.parse(logic[i][3]);
            var answer_arr = [];
            var qt_type = $('#q_'+logic_pb).find('.qt_type').val();
            //start get answers array
            if(qt_type == 0){
                answer_arr.push($('#q_'+logic_pb).children().find('input[type="text"]').val());
            } else if(qt_type == 1){

                var checkboxes = $('#q_'+logic_pb).children().find('input[name="checkbox-radio"]');
                for(var l = 0; l < checkboxes.length; l++){
                    if($(checkboxes[l]).is(':checked')){
                        answer_arr.push(1);
                    }else {
                        answer_arr.push(0);
                    }
                }
            } else if(qt_type == 2){
                var radiogroups = $('#q_'+logic_pb).children().find('input[type="radio"]');
                for(var l = 0; l < radiogroups.length; l++){
                    if($(radiogroups[l]).is(':checked')){
                        answer_arr.push(1);
                    }else {
                        answer_arr.push(0);
                    }
                }
            } else if(qt_type == 3){
                var images = $('#q_'+logic_pb).children().find('input[name="imgradiogroup"]');
                for(var l = 0; l < images.length; l++){
                    if($(images[l]).is(':checked')){
                        answer_arr.push(1);
                    }else {
                        answer_arr.push(0);
                    }
                }
            } else if(qt_type == 4){ //matrix
                console.log(qt_type);
            } else if(qt_type == 5){ //rating
                var rates = $('#q_'+logic_pb).children().find('.rate');
                var val = $('#q_'+logic_pb).children().find('.ratinginput');
                for(var l = 0; l < rates.length; l++){
                    if(l == val.val()-1){
                        answer_arr.push(1);
                    }else{
                        answer_arr.push(0);
                    }
                }
            } else if(qt_type == 6){ //Dropdown
                var select = $('#q_'+logic_pb).children().find('select option#opt');
                for(var l = 0; l < select.length; l++){
                    if($(select[l]).is(':selected')){
                        answer_arr.push(1);
                    }else {
                        answer_arr.push(0);
                    }
                }
            } else if(qt_type == 7){
                console.log(qt_type);
            } else if(qt_type == 8){ //stars
                var stars = $('#q_'+logic_pb).children().find('.star');
                var val = $('#q_'+logic_pb).children().find('.starinput');
                for(var l = 0; l < stars.length; l++){
                    if(l == val.val()-1){
                        answer_arr.push(1);
                    }else{
                        answer_arr.push(0);
                    }
                }
            } else if(qt_type == 9){ //Eur
                answer_arr.push($('#q_'+logic_pb).children().find('input[type="number"]').val());
            } //end get answers array
            //start calculate with logic operator
            if(logic_opt == 0){ // equals
                if(logic_val.length == 1 && $.isNumeric(logic_val[0])){
                    var res = answer_arr[0] === logic_val;
                }else {
                    var res = (answer_arr.length === logic_val.length && answer_arr.every(function (el, id) {
                        return el == logic_val[id];
                    }));
                }
                
                // var res = answer_arr[0] > logic_val[0];
                var obj = {'lg_type': logic_type, 'val': +res};
                logic_result.push(obj);
            }else if(logic_opt == 1){ // not equals
                if(logic_val.length == 1 && $.isNumeric(logic_val[0])){
                    var res = answer_arr[0] != logic_val;
                }else {
                    var res = (answer_arr.length !== logic_val.length || answer_arr.every(function (el, id) {
                        return el != logic_val[id];
                    }));
                }
                var obj = {'lg_type': logic_type, 'val': +res};
                logic_result.push(obj);
            }else if(logic_opt == 2){ // contains
                var res = function (answer_arr, logic_val) {
                    if(answer_arr.length === logic_val.length){
                        for(var i = 0; i < answer_arr.length; i++){
                            if(answer_arr[i] == logic_val[i]){
                                return true;
                            }
                        }
                    }
                }
                var obj = {'lg_type': logic_type, 'val': +res};
                logic_result.push(obj);
            }else if(logic_opt == 3){ // not contains
                var res = true;
                res = function (answer_arr, logic_val) {
                    if(answer_arr.length !== logic_val.length){
                        for(var i = 0; i < answer_arr.length; i++){
                            if(answer_arr[i] == logic_val[i]){
                                return false;
                            }
                        }
                    }
                }
                var obj = {'lg_type': logic_type, 'val': +res};
                logic_result.push(obj);
            }else if(logic_opt == 4) { //greater
                if(logic_val.length == 1 && $.isNumeric(logic_val[0])){
                    var res = answer_arr[0] > logic_val;
                }else {
                    var res = (answer_arr.length !== logic_val.length || answer_arr.every(function (el, id) {
                        return el > logic_val[id];
                    }));
                }
                var obj = {'lg_type': logic_type, 'val': +res};
                logic_result.push(obj);
            }else if(logic_opt == 5) { //less
                if(logic_val.length == 1 && $.isNumeric(logic_val[0])){
                    var res = answer_arr[0] < logic_val;
                }else {
                    var res = (answer_arr.length !== logic_val.length || answer_arr.every(function (el, id) {
                        return el < logic_val[id];
                    }));
                }
                var obj = {'lg_type': logic_type, 'val': +res};
                logic_result.push(obj);
            }else if(logic_opt == 6) { //greater or equal
                if(logic_val.length == 1 && $.isNumeric(logic_val[0])){
                    var res = answer_arr[0] >= logic_val;
                }else {
                    var res = (answer_arr.length !== logic_val.length || answer_arr.every(function (el, id) {
                        return el >= logic_val[id];
                    }));
                }
                var obj = {'lg_type': logic_type, 'val': +res};
                logic_result.push(obj);
            }else if(logic_opt == 7) { //less or equal
                if(logic_val.length == 1 && $.isNumeric(logic_val[0])){
                    var res = answer_arr[0] >= logic_val;
                }else {
                    var res = (answer_arr.length !== logic_val.length || answer_arr.every(function (el, id) {
                        return el >= logic_val[id];
                    }));
                }
                var obj = {'lg_type': logic_type, 'val': +res};
                logic_result.push(obj);
            }
        }
        console.log(logic_result);
        var current = 0;
        for(var s = 0; s < logic_result.length; s++){
            var lg_type = logic_result[s].lg_type;
            if(s == 0) current = Number(logic_result[0].val);
            if(lg_type == 0) current *= Number(logic_result[s].val);
            if(lg_type == 1) current += Number(logic_result[s].val);
        }
        if(current !== 0){
            return true;
        }else {
            return false;
        }
    }

    var display_answers = function (answer) {
        var qt = answer.question_id;
        var ans = answer.ans;
        var type = answer.type;
        var question =  $('#q_'+qt);
        if(type == 0){
            var input = $(question).children().find('input[type="text"]');
            $(input).val(ans[0].answer);
            $(question).children().find('#displayed_answer').val(1);
        } else if(type == 1) { //checkbox
            var checkboxes = $(question).children().find('input[name="checkbox-radio"]');
            for(var k = 0; k < checkboxes.length; k++){
                for(var i = 0; i < ans.length; i++){
                    if($(checkboxes[k]).val() == ans[i].answer){
                        $(checkboxes[k]).attr('checked', 'checked');
                        $(checkboxes[k]).parent().addClass('toggle_btn_active');
                    }
                }
            }
            $(question).children().find('#displayed_answer').val(1);
        } else if(type == 2){
            var radios = $(question).children().find('input[type="radio"]');
            for(var k = 0; k < radios.length; k++){
                for(var i = 0; i < ans.length; i++){
                    if($(radios[k]).val() == ans[i].answer){
                        $(radios[k]).prop('checked', true);
                    }
                }
            }
            $(question).children().find('#displayed_answer').val(1);
        } else if(type == 3){
            var radios = $(question).children().find('input[type="radio"]');
            for(var k = 0; k < radios.length; k++){
                for(var i = 0; i < ans.length; i++){
                    if($(radios[k]).val() == ans[i].answer){
                        $(radios[k]).prop('checked', true);
                        $(radios[k]).siblings().addClass('change-img-bg-color');
                    }
                }
            }
            $(question).children().find('#displayed_answer').val(1);
        } else if(type == 4){
            var table = $(question).children().find('#add-matrix');
            if($(table).attr('matrix-type') == "radio"){
                var radios = $(table).children().find('input[type="radio"]');
                for(var k = 0; k < radios.length; k++){
                    for(var i = 0; i < ans.length; i++){
                        if($(radios[k]).attr('id') == ans[i].q_id){
                            $(radios[k]).prop('checked', true);
                        }
                    }
                }
            }else {
                var inputs = $(table).children().find('input[type="text"]');
                for(var k = 0; k < inputs.length; k++){
                    for(var i = 0; i < ans.length; i++){
                        if($(inputs[k]).attr('id') == ans[i].q_id){
                            $(inputs[k]).val(ans[i].answer);
                        }
                    }                    
                }
            }
            $(question).children().find('#displayed_answer').val(1);
        } else if(type == 5){
            $(question).children().find('#scoreNow' + qt).val(ans[0].answer);
            $(question).children().find('#scoreNow' + qt).data('selected', true);
            var rates = $(question).children().find('.rate');
            var color = $(question).children().find('.star_color').val() ?? '#fcb103';
            for(var k = 0; k < rates.length; k++){
                if($(rates[k]).data('value') == ans[0].answer){
                    $(rates[k]).css('background',color);
                }
            }
            $(question).children().find('#displayed_answer').val(1);
        } else if(type == 6){
            var select = $(question).children().find('select option');
            $(select).each(function(id, opt){
                if($(opt).val() == ans[0].answer){
                    $(opt).prop('selected', true);
                }
            })
            $(question).children().find('#displayed_answer').val(1);
        } else if(type == 7){
            var images = JSON.parse(ans[0].answer);
            $(question).children().find('#preview').children().remove();
            for(var i = 0; i < images.length; i++){
                display_image(images[i], qt);
            }
        } else if(type == 8){
            $(question).children().find('.starinput').val(ans[0].answer);
            $(question).children().find('.starinput').data('selected', true);
            var stars = $(question).children().find('.star');
            var color = $(question).children().find('.star_color').val() ?? '#fcb103';
            for(var k = 0; k < stars.length; k++){
                if($(stars[k]).data('value') == ans[0].answer){
                    for(var i = 0; i <= k; i++){
                        $(stars[i]).find('i').css('color',color);
                    }
                }
            }
            $(question).children().find('#displayed_answer').val(1);
        } else if(type == 9){
            var num = ans[0].answer;
            $(question).children().find('input[type="range"]').val(num);
            $(function() {
                const range = document.getElementById('range'),
                tooltip = document.getElementById('tooltip'),
                setValue = ()=>{
                    const
                        newValue = Number( (range.value - range.min) * 100 / (range.max - range.min) ),
                        newPosition = 16 - (newValue * 0.32);
                    tooltip.innerHTML = `<span>${(Number(range.value).toLocaleString('de-DE'))}</span>`;
                    tooltip.style.left = `calc(${newValue}% + (${newPosition}px))`;
                    document.documentElement.style.setProperty("--range-progress", `calc(${newValue}% + (${newPosition}px))`);
                };
                document.addEventListener("DOMContentLoaded", setValue);
                range.addEventListener('input', setValue);
                setValue();
            });
            $(question).children().find('input[type="range"]').siblings().find('span').text(Number(num).toLocaleString('de-DE'));
            $(question).children().find('#displayed_answer').val(1);
        } else if(type == 10){
            $(question).children().find('input[type="number"]').val(ans[0].answer);
            $(question).children().find('#displayed_answer').val(1);
        }
    }

    // display logic question following answer
    var display_question = function () {
        id_list = $('.question-card').map(function () {
            return $(this).attr('id');
        });

        var tid = 0;
        var tval = 0;
        var tj = 0;
        var current_page = $('input[name="current_page"]').val();
        if(id_list.length == 0)
            return;
        for (var t = 0; t < id_list.length; t++) {
            if ($("#" + id_list[t]).find(".logic_cnt").val() == 0 && $("#" + id_list[t]).data('page') == current_page)
                $("#" + id_list[t]).show();
            else {
                if($("#" + id_list[t]).children().find('#displayed_answer').val() == 1 && $("#" + id_list[t]).data('page') == current_page){
                    $("#" + id_list[t]).show();
                }else{
                    $("#" + id_list[t]).hide();
                }
            }
            var logic_val = 0;
            var cnt = $("#" + id_list[t]).find(".logic_cnt").val();

            for (var j = 0; j < cnt; j++) {
                var current_val = 0;
                var logic_qt_id = "q_" + $("#" + id_list[t]).find(".logic_" + j + " .logic_qt").val();
                var logic_val = $("#" + id_list[t]).find(".logic_" + j + " .logic_cont").val();
                var qt_existed = 0;
                for (var k = 0; k < id_list.length; k++) {
                    if (logic_qt_id == id_list[k])
                        qt_existed = 1;
                }

                if (qt_existed == 0) {
                    tid = t;
                    tval = logic_val;
                    tj = j;

                    $.ajax({
                        data: {question_id: logic_qt_id.split('_')[1]},
                        url: "../get_answer",
                        type: "GET",
                        dataType: 'json',
                        success: function (response) {
                            if (response.length > 0) {
                                current_val = response[0]['answer'];
                                if (tval == current_val) {
                                    $('#' + id_list[tid] + " .logic_" + tj + " .logic_state").val(1);
                                } else
                                    $('#' + id_list[tid] + " .logic_" + tj + " .logic_state").val(0);
                            } else
                                $('#' + id_list[tid] + " .logic_" + tj + " .logic_state").val(0);
                        }
                    });
                }
            }
        }
    }

    var collecting_answers = function () {
        arr = [];
        var single_input_ids = $('input[name^=single_input]').map(function (idx, elem) {
            return $(elem).attr('id');
        }).get();
        var radiogroup_id = $('input[name^=radiogroup]:checked').map(function (idx, elem) {
            return $(elem).attr('id');
        }).get();
        var img_radiogroup_id = $('input[name^=imgradiogroup]:checked').map(function (idx, elem) {
            return $(elem).attr('id');
        }).get();
        var checkbox = $('input[name^=checkbox-radio]').map(function (idx, elem) {
            if($(elem).is(':checked')){
                return $(elem).attr('id');
            }    
        }).get();
        var rating = $('input[name^=b_rating]').map(function (idx, elem) {
            if ($(elem).data('selected')) {
                return $(elem).data('qid');
            }
        }).get();
        var dropdown = $('.dropdown').map(function (idx, elem) {
            return $(elem).attr('id');
        }).get();
        var stars = $('.starinput').map(function (idx, elem) {
            return $(elem).data('qid');
        }).get();
        // var files = $('input[name^=files]').map(function (idx, elem) {
        //     return $(elem).attr('id');
        // }).get();
        var ranges = $('input[name^=b_range]').map(function (idx, elem) {
            return $(elem).data('id');
        }).get();
        var matrix = $('table[name^=matrix]').map(function (idx, elem) {
            return $(elem).data('id');
        }).get();
        var images = $('input[name^=images]').map(function (idx, elem) {
            return $(elem).attr('id');
        }).get();
        var numbers = $('input[name^=number]').map(function (idx, elem) {
            return $(elem).attr('id');
        }).get();
        var count = 0;
        $.each(img_radiogroup_id, function (i, v) {
            if ($("#" + v).val() != "") {
                var obj = {};
                obj.key = v;
                obj.qid = v;
                obj.value = $('input[name^=imgradiogroup]:checked').val().trim();
                arr.push(obj);
                // arr[v] = $("#"+v).val().trim();
            }
        });
        $.each(single_input_ids, function (i, v) {
            if ($("#" + v).val() != "") {
                var obj = {};
                obj.key = v;
                obj.qid = v;
                obj.value = $("#" + v).val();//$("#"+v).val().trim();
                arr.push(obj);
                // arr[v] = $("#"+v).val().trim();
            }
        });
        $.each(radiogroup_id, function (i, v) {
            if ($("#" + v).val() != "") {
                var obj = {};
                obj.key = v;
                obj.qid = v;
                obj.value = $('input[id^='+v+']:checked').val().trim();
                arr.push(obj);
                // arr[v] =$('input[name^=radiogroup]:checked').val().trim();
            }
        });
        $.each(rating, function (i, v) {
            if ($("#" + v).val() != "") {
                var obj = {};
                obj.key = v;
                obj.qid = v;
                obj.value = $('#scoreNow' + v).val().trim();
                arr.push(obj);
                // arr[v] =$('input[name^=radiogroup]:checked').val().trim();   
            }
        });
        var t = 0;
        $.each(checkbox, function (i, v) {
            if ($("#" + v).val() != "") {
                var obj = {};
                obj.key = v;
                obj.qid = v;
                var parent = $('#' + v).parents('.check_content');
                var checked_val = $(parent).find('input[name^=checkbox-radio]:checked');
                var value = $(checked_val[t]).val();
                obj.value = value;
                arr.push(obj);
                if(v == checkbox[i+1]){
                    t++;
                }else{
                    t = 0;
                }
                // arr[v] =$('input[name^=radiogroup]:checked').val().trim();
            }else {
                var q_id = $('table[data-id='+ v +']').find('input[type^=checkbox]:checked').attr('id');
                obj.key = v;
                obj.qid = q_id;
                obj.value = $('#' + v).val().trim();
                arr.push(obj);
            }
        });
        $.each(ranges, function (i, v) {
            if ($('input[data-id="' + v + '"]').val() != "") {
                var obj = {};
                obj.key = v;
                obj.qid = v;
                obj.value = $('input[data-id="' + v + '"]').val().trim();
                arr.push(obj);
                // arr[v] =$('input[name^=radiogroup]:checked').val().trim();   
            }
        });
        $.each(dropdown, function (i, v) {
            if ($("#" + v + " option:selected").val() != "") {
                var obj = {};
                obj.key = v;
                obj.qid = v;
                obj.value = $("#" + v + " option:selected").val().trim();
                arr.push(obj);
                // arr[v] =$('input[name^=radiogroup]:checked').val().trim();   
            }
        });
        // $.each(files, function (i, v) {
        //     if ($("#" + v).val() != "") {
        //         var obj = {};
        //         obj.key = v;
        //         obj.qid = v;
        //         obj.value = $('#' + v).val().trim();
        //         arr.push(obj);
        //         // arr[v] =$('input[name^=radiogroup]:checked').val().trim();   
        //     }
        // });
        $.each(stars, function (i, v) {
            if ($("#" + v).val() != "") {
                var obj = {};
                obj.key = v;
                obj.qid = v;
                obj.value = $('#' + v).val().trim();
                arr.push(obj);
                // arr[v] =$('input[name^=radiogroup]:checked').val().trim();   
            }
        });
        $.each(numbers, function (i, v) {
            if ($("#" + v).val() != "") {
                var obj = {};
                obj.key = v;
                obj.qid = v;
                value = $('#' + v).val().trim();
                value = Number(value);
                obj.value = value;
                // arr[v] =$('input[name^=radiogroup]:checked').val().trim();   
                arr.push(obj);
            }
        });
        $("table[name='matrix']").each(function (idx, ele) {
            if ($(this).attr('matrix-type') == "radio") {
                let id = $(this).data("id");
                let input = $(this).find("input[type='radio']");
                let v = 0;
                if (input.length > 0) {
                    for (let i = 0; i < input.length; i++) {
                        var obj = {};
                        let index = i + 1;
                        if($(input[i]).is(':checked')){
                            if ($(input[i]).val() != "")
                                v = $(input[i]).val();
                            obj.key = id;
                            obj.qid = "q_id" + index;
                            obj.value = Number(v);
                            arr.push(obj);
                        
                        }
                    }
                } else {
                    var obj = {};
                    let index = 1;
                    if ($(input).val() != "")
                        v = $(input).val();
                    obj.key = id;
                    obj.qid = "q_id" + index;
                    obj.value = Number(v);
                    arr.push(obj);
                
                }
            }else{
                let id = $(this).data("id");
                let input = $(this).find("input");
                let v = 0;
                if (input.length > 0) {
                    for (let i = 0; i < input.length; i++) {
                        var obj = {};
                        let index = i + 1;
                        if ($(input[i]).val() != "")
                            v = $(input[i]).val();
                        obj.key = id;
                        obj.qid = "q_id" + index;
                        obj.value = v;
                        arr.push(obj);
                    }
                
                } else {
                    var obj = {};
                    let index = 1;
                    if ($(input).val() != "")
                        v = $(input).val();
                    obj.key = id;
                    obj.qid = "q_id" + index;
                    obj.value = v;
                    arr.push(obj);
                
                }
            }
        })
        /*$.each(matrix,function(i,v){
            if($("<div />").append($("*[data-id="+v+"]").clone()).html() != ""){
                var obj = {};
                obj.key = v;
                obj.value = $("<div />").append($("*[data-id="+v+"]").clone()).html();
                arr.push(obj);
            }
        });*/
        var img_question_id = '';
        var images_names = {};
        var temp_arr = [];
        let contents = [];
        let types = [];
        $.each(images, function (i, v) {
            if ($("#" + v).val() != "") {
                images_names[v] = $("#" + v).val().trim();
                img_question_id = $("#" + v).data('id');
                // var obj = {};
                // obj.key = v;
                // obj.value = $('#'+v).val().trim(); 
                // arr.push(obj);
                // arr[v] =$('input[name^=radiogroup]:checked').val().trim();   
            }
            temp_arr.push(images_names);
            var obj = {};
            obj.key = img_question_id;
            obj.qid = img_question_id;
            obj.value = JSON.stringify(temp_arr);
            arr.push(obj);
        });

        return arr;
    }

    var storeData = function (test_id) {
        var answers = collecting_answers();
        $.ajax({
            data: {test_id: test_id, test: answers},
            url: "../get_report",
            type: "POST",
            dataType: "json",
            success: function () {
                console.log('success');
            }
        })
        // localStorage.setItem(test_id, answers);
    }

    var show_progress = function (){
        id_list = $('.question-card').map(function () {
            return $(this).attr('id');
        });

        var answers = collecting_answers();
        var count = 1;
        var first_q = 0;
        for(var i = 0; i < answers.length; i++){
            if(i == 0){
                first_q = answers[0].key;
            }else {
                if(answers[i].key != first_q){
                    count ++;
                    first_q = answers[i].key;
                }
            }
        }
        var percent = count / id_list.length * 100;
        $('#percent').val(percent);
        $('.b_progress_bar').css({'width': percent.toFixed(2)+'%'});
        $('.b_progress').html(Math.round(percent)+'%');
    }

    var template_alert = function (title, content) {
        $('#templateAlert_content').children().find('.alert-title').text(title);
        $('#templateAlert_content').children().find('.alert-content').text(content);
        $('#templateAlert_content').attr('aria-hidden', false);
        $('#templateAlert_logo').trigger('click');
    }

    var isJson = function (str) {
        try {
            JSON.parse(str);
        } catch (e) {
            return false;
        }
        return true;
    }

    return {
        //main function to initiate the module
        init: function () {
        }
    };
}();
