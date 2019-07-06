<div class="row">

    @foreach($user_collection as $key=>$value)
        <div class="col-md-4">
            <div class="thumbnail img-border">
                <img src="<?php echo URL::to($value->photoes_path);?>" alt="Lights" style="width:100%" data-toggle="modal" data-target="#modal{{$key}}">
                <div class="caption">
                <p>{{$value->title}}</p>
                </div>
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
                        <img src="<?php echo URL::to($value->photoes_path);?>" alt="{{$value->title}}" style="width:100%">
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
    @endforeach
 </div>
