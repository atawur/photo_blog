$(document).ready(function(){
    $('.validator').validator();
    $('.multi').multiselect({
        buttonWidth: '100%',
        enableFiltering: true,
        filterPlaceholder: 'Search',
        enableCaseInsensitiveFiltering : true,
        includeSelectAllOption: true,
//            dropRight: true,
        maxHeight: 300
    });

    $('.i-checks').iCheck({
        checkboxClass: 'icheckbox_square-green',
        radioClass: 'iradio_square-green',
    });
    Ladda.bind('.ladda-button');
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('input[name="_token"]').val()
        }
    });
});

function makeAjaxText(url, load) {
    return $.ajax({
        url: url,
        type: 'get',
        beforeSend: function(){
            if(typeof(load) != "undefined" && load !== null){
                load.ladda('start');
            }
        }
    }).always(function() {
        if(typeof(load) != "undefined" && load !== null){
            load.ladda('stop');
        }
    }).fail(function() {
        swalError();
    });
}
function makeAjaxPostText(data, url, load) {
    return $.ajax({
        url: url,
        type: 'post',
        data: data,
        beforeSend: function(){
            if(typeof(load) != "undefined" && load !== null){
                load.ladda('start');
            }
        }
    }).always(function() {
        if(typeof(load) != "undefined" && load !== null){
            load.ladda('stop');
        }
    }).fail(function() {
        swalError();
    });
}
function makeAjax(url, load) {
    return $.ajax({
        url: url,
        type: 'get',
        dataType: 'json',
        beforeSend: function(){
            if(typeof(load) != "undefined" && load !== null){
                load.ladda('start');
            }
        }
    }).always(function() {
        if(typeof(load) != "undefined" && load !== null){
            load.ladda('stop');
        }
    }).fail(function() {
        swalError();
    });
}
function makeAjaxPost(data, url, load) {
    return $.ajax({
        url: url,
        type: 'post',
        dataType: 'json',
        data: data,
        beforeSend: function(){
            if(typeof(load) != "undefined" && load !== null){
                load.ladda('start');
            }
        }
    }).always(function() {
        if(typeof(load) != "undefined" && load !== null){
            load.ladda('stop');
        }
    }).fail(function() {
        swalError();
    });
}

function swalError(msg) {
    var message = typeof(msg) != "undefined" && msg !== null ? msg : "Something went wrong";
    Swal.fire({
        title: "Sorry !!",
        html: message,
        type: "error",
        showConfirmButton: false,
        timer: 1500
    });
}
function swalWarning(msg) {
    var message = typeof(msg) != "undefined" && msg !== null ? msg : "Something went wrong";
    Swal.fire({
        title: "Warning !!",
        html: message,
        type: "warning",
        showConfirmButton: false,
        timer: 1500
    });
}
function swalSuccess(msg) {
    var message = typeof(msg) != "undefined" && msg !== null ? msg : "Action has been Completed Successfully";
    Swal.fire({
        title: 'Successful !!',
        html: message,
        type: 'success',
        showConfirmButton: false,
        timer: 1500
    });
}

function swalRedirect(url, msg, mode) {
    var message = typeof(msg) != "undefined" && msg !== null ? msg : "Action has been Completed Successfully";
    var title = 'Successful !!';
    var type = 'info';
    if(typeof(mode) != "undefined" && mode !== null){
        if(mode == 'success'){
            var title = 'Successful !!';
            var type = 'success';
        } else if(mode == 'error'){
            var title = 'Failed !!';
            var type = 'error';
        }else if(mode == 'warning'){
            var title = 'Warning !!';
            var type = 'warning';
        }else if(mode == 'question'){
            var title = 'Warning !!';
            var type = 'question';
        }else{
            var title = 'Successful !!';
            var type = 'info';
        }
    }
    return Swal.fire({
        title: title,
        html: message,
        type: type,
        reverseButtons : true,
        showCancelButton: false,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Thank You',
    }).then(function (s) {
        if(s.value){
            if(typeof(url) != "undefined" && url !== null){
                window.location.replace(url);
            }else{
                location.reload();
            }
        }
    });
}
function swalConfirm(msg) {
    var message = typeof(msg) != "undefined" && msg !== null ? msg : "You won't be able to revert this!";
    return Swal.fire({
        title: 'Are you sure?',
        html: message,
        type: 'warning',
        reverseButtons : true,
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Yes, Confirm!',
        cancelButtonText: 'Cancel'
    });
}

$('.datepicker').datepicker({
    todayBtn: "linked",
    keyboardNavigation: false,
    forceParse: false,
    autoclose: true,
    autoApply:true,
    format: "yyyy-mm-dd"
});
$('.daterange').daterangepicker({
    locale: {
        format: 'Y-MM-DD'
    },
    autoApply:true,
});

/*===================will be removed========================*/
/*
$(document).on('click', '.send_for_approval', function (e) {
    e.preventDefault();
    var id_slug = $(this).attr('id_slug');
    var job_value = [];
    var url = $('#delegation-initialize-url').text();
    $('.delegation_job_id:checkbox:checked').each(function(){
        var val = $(this).attr('code');
        job_value.push(val);
    });
    if(job_value.length){
        swal({
            title: "Are you sure?",
            type: "warning",
            showCancelButton: true,
            // closeOnCancel: true
            closeOnConfirm: false,
            closeOnCancel: true
        },
        function (isConfirm) {
            // alert(id_slug+'hh'+job_value);
            if (isConfirm) {
                $.ajax({
                    url: url,
                    type: 'POST',
                    data: {id_slug:id_slug,code:job_value},
                    success: function (data) {
                        // alert(data['mode']);
                        if(data['mode']=='Success') {
                            swal({
                                    title: "Success",
                                    text: "Successfully Initiated",
                                    type: "success",
                                    //showCancelButton: true,
                                    closeOnConfirm: true,
                                },
                                function (isConfirm) {
                                    if (isConfirm) {
                                        location.reload();
                                    }
                                });
                        } else {
                            swal({
                                    title: "Failed",
                                    text: "Operation Failed!",
                                    type: "warning",
                                    //showCancelButton: true,
                                    closeOnConfirm: true,
                                },
                                function (isConfirm) {
                                    if (isConfirm) {
                                        location.reload();
                                    }
                                });
                        }
                    }
                });
            }
        });
    }else{
        swal({
            title: "Sorry!",
            text: "Please select at least one job!",
            type: "warning"
        });
    }
});
*/
//Approval decline
$(document).on('click', '.approvalordecline', function (e) {
    e.preventDefault();
    var actionType = $(this).attr('actionType');
    var slug = $('input[name=slug]').val();
    var code = $('input[name=code]').val();
    var comments = $('.comments').val();
    var url = '';
    if(actionType == 'approve'){
        url = $('#delegation-approval-process-url').text();
    }else if(actionType == 'decline'){
        url = $('#delegation-decline-process-url').text();;
    }
    $.ajax({
        url: url,
        type: 'POST',
        data: {'slug':slug, 'code':code, 'comments':comments},
        success: function (data) {
        }
    });
});


