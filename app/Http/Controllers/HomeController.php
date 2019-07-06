<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;
class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //$this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    protected function index()
    {
       // $userId = Auth::id();
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
                    'countries.id',
                    'countries.name as country_name',
                    'cities.name as city_name',
                    'photoes.created_at'
                    )
            ->join('users', 'photoes.created_by', '=', 'users.id')
            ->join('countries', 'photoes.countries_id', '=', 'countries.id')
            ->join('cities', 'photoes.cities_id', '=', 'cities.id')
            ->orderBy('photoes.id','desc')
            ->get();
        $data['pageTitle'] = 'Home';
        $data['user_collection']=$user_collections;
        return view('home', $data);
    }

    public function gatCities(Request $request)
    {
        $countries_id = $request->get('countries_id');
        $cities = DB::table('cities')
                ->select(
                        'id',
                        'name'
                        )
                ->where('countries_id', $countries_id)
                ->orderBy('id')
                ->get();
        $data['cities'] = $cities;
        return json_encode($data);
    }
}
