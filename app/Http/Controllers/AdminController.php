<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Tymon\JWTAuth\Contracts\JWTSubject;
use Illuminate\Http\Request;
// use Illuminate\Foundation\Auth\Session;
use Tymon\JWTAuth\Facades\JWTAuth;
use Session;
use App\User;
use App\Matkul;
use App\Present;


class AdminController extends Controller
{
    public function index()
    {
        $data['token'] = session::get('token');
        return view('admin.dashboard',$data);
    }
}
