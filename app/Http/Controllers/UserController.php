<?php

namespace App\Http\Controllers;

use App\User;
use App\Models\PrivilegeLevel;
use App\Models\PrivilegeModule;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;
use Request;
use Mail;
use DB;
class UserController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = '/create_new_user';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function index(){
        $data= array();
        $data['user_levels'] = DB::table('user_levels')->pluck('name','id');
        $data['modules'] = DB::table('modules')->pluck('name','id');
        
        return view('auth.register',$data);
    }
    

    protected function create(Request $request)
    {
        $this->validate(request(),[
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
            'modules_id' => ['required'],
            'user_levels_id' => ['required'],
            ]);         
        $user= new User();
        $user->name= request()->name;
        $user->email= request()->email;
        $user->password= Hash::make(request()->password);
        $user->save();
        $insertedId = $user->id;
        if($insertedId){
            // user module permission
            $privilege_module = new PrivilegeModule();
            $privilege_module->users_id=  $insertedId;
            $privilege_module->modules_id= request()->modules_id;
            $privilege_module->save();
            // user role permission
            $privilege_level = new PrivilegeLevel();
            $privilege_level->users_id=  $insertedId;
            $privilege_level->user_levels_id= request()->user_levels_id;
            $privilege_level->save();

            $data=array();
            $data['name']=request()->name;
            $data['username']=request()->email;
            $data['password']=request()->password;
            $data['message']='Authentication Confirmation';
            $data['subject']='Your Crendential';
            try{
                $this->send_email($data);
            } catch(Exception $e){
                echo "Mail can not be sent";
                exit();
            }
            
        }
        return back()->with('success','User created successfully!');
       //return redirect('/create_new_user');
        
    }

    public function send_email($data) {
        Mail::send('mail',$data,function($message) use ($data) {
            
            $message->to($data['username'])->subject($data['subject']);
            $message->from('rahmanatawur@gmail.com','MD ATAWUR RAHMAN');
        });
        echo "HTML Email Sent. Check your inbox.";
     }
}
