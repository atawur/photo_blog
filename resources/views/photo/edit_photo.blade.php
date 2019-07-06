@extends('layouts.app')

@section('content')
@include('dropdown_grid.dropdown_grid')

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{$pageTitle}}</div>
                <strong style="text-align:center;color:green">{{  Session::get('success') }}</strong>
                <strong style="text-align:center;color:red">{{  Session::get('error') }}</strong>
                <div class="card-body">
                    <form method="POST" action="{{ URL::to('/edit_photo/') .'/' .$id }}" enctype="multipart/form-data">
                        @csrf

                        <div class="form-group row">
                            <label for="title" class="col-md-4 col-form-label text-md-right">{{ __('Title') }}</label>

                            <div class="col-md-6">
                                <input id="title" type="text" class="form-control @error('title') is-invalid @enderror" name="title" value="{{ $photo->title }}" required autocomplete="Title" autofocus>

                                @error('title')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="description" class="col-md-4 col-form-label text-md-right">{{ __('Description') }}</label>

                            <div class="col-md-6">
                                <textarea rows="4" cols="50" id="description" type="photo_code" class="form-control @error('description') is-invalid @enderror" name="description">
                                    {{ $photo->description }}
                                </textarea>

                                @error('description')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="title" class="col-md-4 col-form-label text-md-right">{{ __('Post Code') }}</label>

                            <div class="col-md-6">
                                <input id="post_code" type="text" class="form-control @error('post_code') is-invalid @enderror" name="post_code" value="{{ $photo->post_code }}" autocomplete="Post Code" autofocus>

                                @error('post_code')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="password" class="col-md-4 col-form-label text-md-right">{{ __('Country') }}</label>

                            <div class="col-md-6">
                                {{__combo('country',array(
                                                    'selected_value'=> $photo->countries_id,
                                                    'attributes'=>array(
                                                        'name'=>'countries_id',
                                                        'id'=>'countries_id',
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

                        <div class="form-group row">
                            <label for="cities_id" class="col-md-4 col-form-label text-md-right">{{ __('City') }}</label>

                            <div class="col-md-6">
                                {{__combo('city',array(
                                                    'selected_value'=> $photo->cities_id,
                                                    'attributes'=>array(
                                                        'name'=>'cities_id',
                                                        'id'=>'cities_id',
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

                        <div class="form-group row">
                            <label for="file" class="col-md-4 col-form-label text-md-right">{{ __('Choose New Image') }}</label>

                            <div class="col-md-6">
                                <input id="file" type="file" name="image" id="" class="form-control">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="file" class="col-md-4 col-form-label text-md-right">{{ __('Old Image') }}</label>

                            <div class="col-md-6">
                                <img src="<?php echo URL::to($photo->photoes_path);?>" alt="Lights" style="width:100%">
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
<script>
    $(document).on('change','#countries_id',function(){
        var countries_id = $(this).val();
        var html = '';
        if (countries_id != '') {
            $('#cities_id').prop('disabled', false);
            $.ajax({
                type:'POST',
                dataType:'JSON',
                url:'{{ route('get_cities') }}',
                data:{_token : '<?php echo csrf_token() ?>', countries_id : countries_id},
                success:function(data) {
                    $('#cities_id').html('');

                    $.each(data.cities, function( index, value ) {
                        html += '<option value="' + value.id + '">' + value.name +'</option>';
                        //alert( value.id + ':' + value.name );
                    });
                    $('#cities_id').html(html);
                }
            });
        }
        else{
            $('#cities_id').val('');
            $('#cities_id').prop('disabled', true);
        }
    });
</script>
@endsection




