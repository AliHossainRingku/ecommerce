<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Session;
session_start();

class AdminController extends Controller
{
    public function index(){
        return view('admin_login');
    }
    /* public function showAdminDashboard(){
        return view('admin.dashboard');
    }*/
    public function dashboard(Request $request){

        //dd($request->all());
        $admin_email = $request->admin_email;
        $admin_password = $request->admin_password;

        $result = DB::table('tbl_admin')
            ->where('admin_email',$admin_email)
            ->where('admin_password',$admin_password)
            ->first();

        if($result){
            session::put('admin_name',$result->admin_name);
            session::put('admin_id',$result->admin_id);
            session::put('admin_email',$result->admin_email);
            return view('admin.dashboard');
            
        }else{
            session::put('msg','E-mail or password invalid!');
            return Redirect::to('/login');

        }

        //return view('admin.dashboard');
    }

    public function adminLogout(){
        Session::flush();
        return Redirect::to('/login');

    }



}
