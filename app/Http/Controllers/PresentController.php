<?php

namespace App\Http\Controllers;

use App\Http\Resources\Matkulresource;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use App\Matkul;
use App\User;
use App\Present;

class PresentController extends Controller
{
    public function show($mtkl_id)
    {
        // $present = Present::where('mtkl_id',$mtkl_id)->paginate(1);
        $presents = DB::table('presents')
        ->join('users','presents.mhs_id','=','users.id')
        ->join('matkuls','presents.mtkl_id','=','matkuls.id')
        ->select('presents.*','users.name','matkuls.name_matkul')
        ->where('mtkl_id',$mtkl_id)
        ->orderBy('id','desc')
        ->paginate(10);
        return $presents;
    }
}
