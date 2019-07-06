@extends('layouts.app')

@section('content')
<link href="{{asset('css/plugins/dataTables/datatables.min.css')}}" rel="stylesheet">
<link href="{{asset('css/plugins/summernote/summernote-bs4.css')}}" rel="stylesheet">
<script src="{{asset('js/plugins/dataTables/datatables.min.js')}}"></script>
<script src="{{asset('js/plugins/dataTables/dataTables.bootstrap4.min.js')}}"></script>
<script src="https://cdn.datatables.net/select/1.2.7/js/dataTables.select.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">{{$pageTitle}}</div>
                <div class="card-body">
                    <div class="form-group row">
                    <div class="col-md-12">
                        <div class="table-responsive">
                            <table class="checkbox-clickable table table-striped table-bordered dataTables-example">
                                <thead>
                                    <tr>
                                        <th class="text-center" width="5%">Sl No.</th>
                                        <th class="text-center">Photo</th>
                                        <th class="text-center">Uploaded By</th>
                                        <th class="text-center">Uploading Time</th>
                                        <th class="text-center">Title</th>
                                        <th class="text-center">Country</th>
                                        <th class="text-center">City</td>
                                        <th class="text-center">Post Code</td>
                                        <th class="text-center">Description</th>
                                        <th class="text-center">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @php $sl=0 @endphp
                                    @foreach($user_collection as $key=>$value)
                                    <tr>
                                        <td class="text-center">{{++$sl}}</td>
                                        <td class="text-center">
                                            <div class="col-md-8">
                                                <div class="thumbnail img-border">
                                                    <img src="<?php echo URL::to($value->photoes_path);?>" alt="Lights" style="width:100%" data-toggle="modal" data-target="#modal{{$key}}">
                                                </div>
                                            </div>
                                            <div class="modal fade" id="modal{{$key}}" role="dialog">
                                                <div class="modal-dialog modal-lg">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="col-md-12">
                                                                <div class="thumbnail img-border">
                                                                    <img src="<?php echo URL::to($value->photoes_path);?>" alt="Lights" style="width:100%">
                                                                    <div class="caption">
                                                                        <table class="table table-borderless">

                                                                            <tbody>
                                                                                <tr>
                                                                                    <td>Title</td>
                                                                                    <td>{{$value->title}}</td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>City</td>
                                                                                    <td>{{$value->city_name}}</td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>Country</td>
                                                                                    <td>{{$value->country_name}}</td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>Uploaded By(Date)</td>
                                                                                    <td>{{$value->name}}({{$value->created_at}})</td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="">{{$value->name}}</td>
                                        <td class="">{{$value->created_at}}</td>
                                        <td class="">{{$value->title}}</td>
                                        <td class="">{{$value->country_name}}</td>
                                        <td class="">{{$value->city_name}}</td>
                                        <td class="">{{$value->post_code}}</td>
                                        <td class="">{{ str_limit($value->description, $limit = 30, $end = '...') }}</td>
                                        <td class="text-center">
                                            <a type="button" href="{{ URL::to('/edit_photo/') .'/' .$value->photoes_id }}" class="btn btn-primary edit" title="Edit" data-photos="{{$value->photoes_id}}"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="{{asset('js/moment.min.js')}}"></script>
<script>
    $('.dataTables-example').dataTable();

    // $(document).on('click','.edit',function(){
    //     var photos_id = $(this).data("photos");
    //     $.ajax({
    //         type:'POST',
    //         url:'{{ route('add_to_my_collection') }}',
    //         data:{_token : '<?php //echo csrf_token() ?>',photos_id:photos_id},
    //         success:function(data) {
    //             alert(data);
    //         }
    //     });
    // });
</script>
@endsection




