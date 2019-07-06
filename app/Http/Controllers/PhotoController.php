<?php

namespace App\Http\Controllers;

use URL;
use Session;
use Auth;
use Redirect;
use DB;

use App\Models\Photo;
use App\Models\UsersPhotoesCollections;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Input;

class PhotoController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    protected function add_photo()
    {
        $data['pageTitle'] = 'Add Your Photo';
        return view('photo/add_photo', $data);
    }

    protected function create_photo(Request $request, Photo $photo, UsersPhotoesCollections $user_photo)
    {
        $validator = Validator::make($request->all(), Photo::$rules);
		if ($validator->fails()){
			return Redirect::back()->withErrors($validator)->withInput();
        }
        $imgfile = Input::file('image');
        $imageName = time().'.'.$imgfile->getClientOriginalExtension();
        request()->image->move(public_path('images'), $imageName);
        $path = 'images/' .$imageName;

        $photo = new Photo;
        $photo->users_id = Auth::id();
        $photo->created_by = Auth::id();
		$photo->title = $request->get('title');
        $photo->post_code = $request->get('post_code');
        $photo->description = $request->get('description');
        $photo->countries_id = $request->get('countries_id');
        $photo->cities_id = $request->get('cities_id');
        $photo->photoes_path = $path;
        $result=$photo->save();

        if($result){
            $user_photo = new UsersPhotoesCollections;
            $user_photo->users_id = Auth::id();
            $user_photo->created_by = Auth::id();
            $user_photo->photoes_id = $photo->id;
            $save=$user_photo->save();
			return back()->with('success','Photo Uploaded Successfully!');
		}
		return back()->with('error','Photo Uploading Failed');
    }

    public function allPhotos()
    {
        $user_collections = DB::table('photoes')
            ->select(
                    'photoes.id as photoes_id',
                    'users.name',
                    'users.email',
                    'users.created_at',
                    'photoes.title',
                    'photoes.post_code',
                    'photoes.users_id',
                    'photoes.countries_id',
                    'photoes.photoes_path',
                    'photoes.description',
                    'countries.id',
                    'countries.name as country_name',
                    'cities.name as city_name',
                    'photoes.created_at'
                    )
            ->join('users', 'photoes.created_by', '=', 'users.id')
            ->join('countries', 'photoes.countries_id', '=', 'countries.id')
            ->join('cities', 'photoes.cities_id', '=', 'cities.id')
            ->orderBy('photoes.created_at','desc')
            ->get();
        $data['user_collection']=$user_collections;
        $data['pageTitle'] = 'All Photos';
        //$data['photos'] = Photo::with('users')->get();
        return view('photo/all_photo', $data);
    }

    public function editPhoto($id)
    {
        $photo = Photo::where('id', $id)->first();
        $data['id'] = $id;
        $data['photo'] = $photo;
        $data['pageTitle'] = 'Edit Photo';
        return view('photo/edit_photo', $data);
    }

    public function editPhotoPost(Request $request, $id)
    {
        $validator = Validator::make($request->all(), Photo::$update_rules);
		if ($validator->fails()){
			return Redirect::back()->withErrors($validator)->withInput();
        }
        $update_array = array();
        if ($request->hasFile('image')) {
            $imgfile = Input::file('image');
            $imageName = time().'.'.$imgfile->getClientOriginalExtension();
            request()->image->move(public_path('images'), $imageName);
            $path = 'images/' .$imageName;
            $update_array['photoes_path'] = $path;
        }
        $update_array['title'] = $request->get('title');
        $update_array['post_code'] = $request->get('post_code');
        $update_array['description'] = $request->get('description');
        $update_array['countries_id'] = $request->get('countries_id');
        $update_array['cities_id'] = $request->get('cities_id');
        $update = Photo::where('id', $id)->update($update_array);
        if($update){
			return back()->with('success','Photo Informations Updated Successfully!');
		}
		return back()->with('error','Photo Updated Failed');
    }
}
