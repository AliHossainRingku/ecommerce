<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class SliderController extends Controller
{
    public function index(){

    }
    public function addSlider(){
        return view('admin.slider.addSlider');
    }

    public function manageSlider(){
        return view('admin.slider.manageSlider');
    }
}
