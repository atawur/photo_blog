<?php

namespace App\Http\Controllers;

use URL;
use Session;
use Auth;
use App\Models\UsersPhotoesCollections;
use Illuminate\Http\Request;
use App\Helpers\sysHelper;
use DB;
//use Request;
class CollectionController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    protected function index()
    {
       // $userId = Auth::id();
        $user_collections = DB::table('users_photoes_collections')
            ->select('users_photoes_collections.id','users_photoes_collections.photoes_id',
            'users.name',
            'users.email',
            'users.created_at',
            'photoes.title',
            'photoes.post_code',
            'photoes.users_id',
            'photoes.countries_id',
            'photoes.photoes_path',
            'countries.id',
            'countries.name as country_name',
            'cities.name as city_name',
            'photoes.created_at')
            ->join('photoes', 'users_photoes_collections.photoes_id', '=', 'photoes.id')
            ->join('users', 'photoes.created_by', '=', 'users.id')
            ->join('countries', 'photoes.countries_id', '=', 'countries.id')
            ->join('cities', 'photoes.cities_id', '=', 'cities.id')
            ->where('users_photoes_collections.users_id', Auth::id())
            ->orderBy('users_photoes_collections.id','desc')
            ->get();
        $data['pageTitle'] = 'My Collections';
        $data['user_collection']=$user_collections;
        return view('collections/photo_collections', $data);
    }

    public function add_to_my_collection(Request $request){

        //echo request()->photos_id;
        $checkLoggedUserIsUploade = DB::table('photoes')
            ->where('created_by', Auth::id())
            ->where('id',request()->photos_id)
            ->first();
        if($checkLoggedUserIsUploade ){
            echo "Sorry You Can not add this because you have uploaded this photo";
        }else{
            $isExist = DB::table('users_photoes_collections')
            ->where('users_id', Auth::id())
            ->where('photoes_id',request()->photos_id)
            ->first();
            if($isExist){
                echo "Sorry You Have already added this Photo in Your Collections";
            }else{
                $collection= new UsersPhotoesCollections();
                $collection->users_id= Auth::id();
                $collection->photoes_id= request()->photos_id;
                $collection->created_by= Auth::id();
                $collection->save();
                $insertedId = $collection->id;
                echo "Successfully added";
            }

        }
    }

    public function userCollections()
    {
        $data['pageTitle'] = 'Select User';
        $data['searchTitle'] = 'Collections of Selected User';
        return view('collections/user_collections', $data);
    }

    public function userSearch(Request $request)
    {
        $user_collections = DB::table('users_photoes_collections')
            ->select('users_photoes_collections.id','users_photoes_collections.photoes_id',
            'users.name',
            'users.email',
            'users.created_at',
            'photoes.title',
            'photoes.post_code',
            'photoes.users_id',
            'photoes.countries_id',
            'photoes.photoes_path',
            'countries.id',
            'countries.name as country_name',
            'cities.name as city_name',
            'photoes.created_at')
            ->join('photoes', 'users_photoes_collections.photoes_id', '=', 'photoes.id')
            ->join('users', 'photoes.created_by', '=', 'users.id')
            ->join('countries', 'photoes.countries_id', '=', 'countries.id')
            ->join('cities', 'photoes.cities_id', '=', 'cities.id')
            ->where('users_photoes_collections.users_id', $request->get('users_id'))
            ->orderBy('users_photoes_collections.id','desc')
            ->get();
        $data['users_name'] = '';
        $data['user_collection']=$user_collections;
        $returnHTML = view('collections/ajax_users_collections', $data)->render();
        $data['returnHTML'] = $returnHTML;
        return json_encode($data);
    }
}
