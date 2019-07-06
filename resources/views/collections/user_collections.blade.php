@extends('layouts.app')

@section('content')

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">{{$pageTitle}}</div>
                <div class="card-body">
                    <form method="POST" action="{{ route('users_collection.post') }}" id="users_collection_form" enctype="multipart/form-data">
                        @csrf

                        <div class="form-group row">
                            <label for="users_id" class="col-md-4 col-form-label text-md-right">{{ __('Select User') }}</label>

                            <div class="col-md-6">
                                {{__combo('users',array(
                                                    'selected_value'=> NULL,
                                                    'attributes'=>array(
                                                        'name'=>'users_id',
                                                        'id'=>'users_id',
                                                        'class'=>'form-control',
                                                        'required'=>'required'
                                                    )
                                                )
                                )}}

                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-primary">
                                    {{ __('Submit') }}
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<br>
<div class="container" id="collections" style="display:none;">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">{{$searchTitle}} <span id="users_name"></span></div>
                <div class="card-body">
                    <div class="col-lg-12 no-padding grid_form">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $('#users_collection_form').on('submit', function (e) {
        e.preventDefault();
        var formData = new FormData(this);
        $('.grid_form').slideUp();
        $.ajax({
            url:"<?php echo URL('user_search_post');?>",
            method:"POST",
            data:formData,
            dataType:'JSON',
            contentType: false,
            cache: false,
            processData: false,
            success:function(response){
                $('#users_name').text('');
                $('#users_name').text(response.name);
                $('#collections').hide();
                $('#collections').show();
                $('.grid_form').html('');
                $('.grid_form').html(response.returnHTML);
                $('.grid_form').slideDown();
            }
        });
    });
</script>
@endsection




