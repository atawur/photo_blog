<link rel="stylesheet" href="{{asset('css/plugins/dataTables/datatables.min.css')}}">
<script src="{{asset('js/plugins/dataTables/datatables.min.js')}}"></script>
<script src="{{asset('js/plugins/dataTables/dataTables.bootstrap4.min.js')}}"></script>
<script src="{{ asset('js/dataTables.fixedColumns.min.js') }}"></script>
<link href="{{asset('css/plugins/datepicker/datepicker3.css')}}" rel="stylesheet">
<script src="{{asset('js/plugins/datepicker/bootstrap-datepicker.js')}}"></script>

<script src="{{asset('js/moment.min.js')}}"></script>
<script src="{{asset('js/plugins/daterangepicker/daterangepicker.min.js')}}"></script>
<link rel="stylesheet" type="text/css" href="{{asset('css/plugins/daterangepicker/daterangepicker.css')}}"/>
<style>
    td .number-format{
        display: block;
        text-align: right;
    }
    td:first-child{

        text-align: center;
    }
    #selection-panel table td{
        padding: 0;
        vertical-align: center;
    }
    .remove_selection{
        cursor: pointer;
    }

</style>
{{csrf_field()}}
<div class="modal inmodal fade" id="dropdowngrid_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content animated bounceInRight"></div>
    </div>
</div>


<script>
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('input[name="_token"]').val()
        }
    });
 /*   $(document).on('click',"#customSearchPanel",function (e) {
        console.log(e.target);
        if(!$.isNumeric(e.target.id)){
            generate_datatable();
        }
    });
*/
    $(document).on('click', '#top_search, .top_search', function () {
        $('#search_by').toggle();
        $('.advanchedSearchToggle').toggle();
    });

    $("body").on("submit", "#customSearchPanel", function (e) {
        e.preventDefault();

        generate_datatable();

     });

    function grid_modal_show(THIS){
        selected_items = [];
        Ladda.bind(THIS);
        var l = $(THIS).ladda();
        var slug = $(THIS).data('slug');
        var selected_value = $(THIS).data('selected_value');
        var addbuttonid = $(THIS).data('addbuttonid');
        var dependent_data = $(THIS).data('dependent_data');
        if(dependent_data.length>0){
            $.each(dependent_data,function(i,v){
                var THIS_VAL = $('#'+v.id).val();
                if(v.required == true && THIS_VAL == ''){
                    swalWarning(v.id.replace('_',' ')+' is Required!');
                    die();
                }
                dependent_data[i]['value'] = THIS_VAL;
            });

        }
        $.ajax({
            type: 'POST',
            cache: false,
            url: '<?php echo URL::to('dropdown-grid-show');?>',
            data: {'slug':slug,selected_value:selected_value,addbuttonid:addbuttonid,dependent_data:dependent_data},
            beforeSend: function () {
            },
            success: function (response) {
                if(response.status == 0){
                    swalWarning(response.message);

                }else{
                    $('#dropdowngrid_modal .modal-content').html(response);
                    $('#dropdowngrid_modal').modal('show');
                    generate_datatable();
                    var old_values = $('#selected_items').val();
                    selected_items = old_values.split(',');
                    l.ladda('stop');
                }


            }
        });
    }



    function generate_datatable(){

        var slug = $('#posts').data('slug');
        var dependent_data = $('#posts').data('dependent_data');
        var selected_items = $('#selected_items').val().replace(/^,|,$/g,'');
        var search_data = $('#customSearchPanel').find('form').serializeArray();
        $('#posts').DataTable({
            "processing": true, //Feature control the processing indicator.
            "serverSide": true, //Feature control DataTables' server-side processing mode.
            "order": [], //Initial no order.
            "bDestroy": true,
            // Load data for the table's content from an Ajax source
            "ajax": {
                "url": "<?php echo URL::to('get-dropdown-grid-data')?>",
                "type": "POST",
                "data": function(data) {
//                        console.log(data);
                    data._token = "{{csrf_token()}}";
                    data.slug = slug;
                    data.selected_items = selected_items;
                    data.selected_items = selected_items;
                    data.search_data = search_data;
                    data.dependent_data = dependent_data;
                }
            },
            //Set column definition initialisation properties.
            "columnDefs": [
                {
                    "targets": [ 0 ], //first column / numbering column
                    "orderable": false, //set not orderable
                },
            ],

        });
      //  $('#posts_filter input').focus();
    }

// item selection from modal

    // $('body').on('change','.dataTables_length select', function () {
    //
    //     generate_datatable();
    // });
    //     $('body').on('click','#posts>thead', function () {
    //     generate_datatable();
    // });

    $('body').on('change','.grid-item-selection', function () {
        var THIS = $(this);
        gridItemSelection(THIS);
    });
    $('body').on('click','.remove_selection', function () {
        var selected_id = $(this).data('selected_id');
        var This = $(this);
        swalConfirm().then(function (e) {
            if(e.value){
                selected_items.splice($.inArray(selected_id, selected_items),1);
                $('#posts tbody').find('.'+selected_id).prop('checked',false);
                $('#selected_items').val(selected_items);
                This.parent().parent().remove();
                // generate_datatable();
            }
        });

    });

    // get selected items id from grid

 function getSelectedItems(){

     var selected_items = $('#selected_items').val();
     if(selected_items==''){
         swalWarning('Please select at least one Item from Grid');

     }else{
         selected_items = selected_items.replace(/^,|,$/g,'');
         $('#dropdowngrid_modal').modal('hide');
         return selected_items;
     }
 }

 function gridItemSelection(THIS) {
     // var option_field = $(this).parent().parent().html();
     var table_header = $(THIS).parent().parent().parent().parent().find('thead').html();
     var checked = $(THIS).val();

     if(!$('#selected-items-area').find('tr').html()){
         $("#selected-items-area").html(table_header);
     }

     if ($(THIS).is(':checked')) {

         if($(THIS).attr('type') =='radio'){
             selected_items = [checked];
             $("#selected-items-area").html('');
             $("#selected-items-area").html(table_header);
             $(THIS).parent().parent().clone().appendTo('#selected-items-area').find('td:first-child').replaceWith("<td><label data-selected_id='"+checked+"' class='label remove_selection label-danger select-"+checked+"'><i class='fa fa-trash'></i> </label> </td>");
             $(THIS).prop('checked',true);
         }else{
             selected_items.push(checked);
             $(THIS).parent().parent().clone().appendTo('#selected-items-area').find('td:first-child').replaceWith("<td><label data-selected_id='"+checked+"' class='label remove_selection label-danger select-"+checked+"'><i class='fa fa-trash'></i> </label> </td>");

         }

     }else{
         selected_items.splice($.inArray(checked, selected_items),1);
         $('#selected-items-area').find('.select-'+checked).parent().parent().remove();
     }

     $('#selected_items').val(selected_items);
     if(selected_items.length==0){
         $('#selection-panel').hide();
     }else{
         $('#selection-panel').show();
         $('#posts').data('selected_items',selected_items);
     }
     //   generate_datatable();
 }
    $(document).on('change','.between_type',function () {
        if($(this).val() == 'BETWEEN'){
            $(this).parent().parent().next().next().show();
        }else{
            $(this).parent().parent().next().next().hide();
            $(this).parent().parent().next().next().find('input').val('');
        }
    });



    $(document).on('change','#custom_search_by',function () {
        var default_search_by = $(this).val();
        // var search_items = search_items;
        $.each(search_items.split(','),function (i,v) {
            if(default_search_by.includes(v)){
                $('#area-'+v).show();
            }else{
                $('#area-'+v).hide();
                $('#area-'+v).find('.form-control').val('');
                // $('#area-'+v).find('select').val('');
            }
        });
        if(default_search_by == ''){
            $('.search').hide();
        }else{
            $('.search').show();
        }
    });



</script>
