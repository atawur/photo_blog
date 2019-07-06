<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Menu;
use URL;
use Session;
use Auth;
use Illuminate\Support\Facades\Input;
use DB;
class MenuController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public  $module_id;
    public $allParentId = array();
    public function index()
    {
        
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
     public static  function menuList()
    {
         $module_id=Session::get('selected_module');
         $userId=Auth::id();
         $levelId=1;
         //echo $module_id;
         //$module_id=$request->session()->get('selected_module') ;;
         //return "test";
         $_this = new self;
         //echo $module_id.'jj';
         //exit();
        $menuList = Menu::where('is_active', '1')
               
                ->whereIn('id',function($query) use ($userId,$levelId){
                           $query->select('menus_id')
                            ->from('privilege_menus')
                            ->where('users_id', $userId)
                            ->orWhereIn('user_levels_id', function($query) use ($userId){
                            $query->select('user_levels_id')
                             ->from('privilege_levels')
                             ->where('users_id', $userId);
                       });
                      })
               ->orderBy('sort_number', 'asc')
               ->get()->all();

               //echo "<pre>";
              // print_r($menuList);
               //exit();
        //$tree = $_this->buildTree($menuList);
        $menuHtml = $_this->makeMenuTree($menuList);
        return $menuHtml;
        
    }
    /*
function buildTree(array $elements, $parentId = 0) {
   // $elements = $elementarray;
    $branch = array();
// echo "<pre>";
//        print_r($elements);
//        exit();
    foreach ($elements as $element) {
        if ($element['parent_menus_id'] == $parentId) {
            $children = $this->buildTree($elements, $element['id']);
            if ($children) {
                $element['children'] = $children;
            }
            $branch[] = $element;
        }
    }

    return $branch;
}*/

    public function makeMenuTree($tree, $pid = null)
    {
        $html = '';
         foreach($tree as $kye=>$value){
            $html .= ' <li class="nav-item">
                                    <a class="nav-link" href="'.URL::to($value['menu_url']).'">'.$value['name'].'</a></li>';
         }
        return $html;
    }


}
