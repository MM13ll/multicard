<?php

namespace App\Controllers;
use App\Models\MainModel as MainModel;

class Api extends BaseController
{
  public function __construct()
  {
      $this->MModel = new MainModel();
  }
	public function index()
	{
	}

  public function dashboard($requst){
    switch ($requst) {
        case 'value':
        $response  = array('title' => 'cards',
                            'requst' => $requst,
                            'result'=> false);
        echo json_encode($response);
        break;
      default:
        $response  = array('title' => 'cards',
                            'requst' => $requst,
                            'result'=> false);
        echo json_encode($response);
        break;
    }
  }

  public function cards($requst){
    switch ($requst) {
        case 'get_all':
        $result = $this->MModel->cards_get_all();
        $response  = array('title' => 'cards',
                            'requst' => $requst,
                            'result'=>  $result);
        echo json_encode($response);
        break;
      default:
        $response  = array('title' => 'cards',
                            'requst' => $requst,
                            'result'=> false);
        echo json_encode($response);
        break;
    }
  }

  public function partners($requst){
    switch ($requst) {
        case 'value':
        $response  = array('title' => 'cards',
                            'requst' => $requst,
                            'result'=> false);
        echo json_encode($response);
        break;
      default:
        $response  = array('title' => 'cards',
                            'requst' => $requst,
                            'result'=> false);
        echo json_encode($response);
        break;
    }
  }

}
