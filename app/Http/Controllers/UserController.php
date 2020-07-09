<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use Auth;

class UserController extends Controller
{
    public function index()
    {
        $user = User::find(Auth::user()->id);
        return response()->json([
            'status' => 'success',
            'data' => $user
        ])->header('Content-Type','application/json');
    }
    public function dosens()
    {
        $dosens = User::where('role',2)->get();
        return response()->json([
            'status' => 'success',
            'data' => $dosens
        ]);
    }
    public function mhs()
    {
        $mhs = User::where('role',1)
        ->orderBy('id','desc')
        ->paginate(3);
        return $mhs;
    }
    public function dsn()
    {
        $mhs = User::where('role',2)
        ->orderBy('id','desc')
        ->paginate(3);
        return $mhs;
    }
    public function destroy(User $user)
    {
        $user->delete();
        return response()->json([
            'status'    => 'success'
        ],200);
    }
}
