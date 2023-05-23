<?php
namespace app\controllers;
use yii\web\Controller;
use yii\web\Request;
use app\models\Entity;
use app\models\Rate_Parametr;
use app\models\Rules;
use app\models\Rate;
use app\models\EntityResolver;

class ApiController extends Controller
{
    public function actionIndex(){
        print_r("Hello World");
    }

    public function actionInsertEntity(){

        $resolver = new EntityResolver($this->getArg());
        $flag=$resolver->addEntity();
        if($flag==true){
            print_r("OK");
        }
        else{
            print_r("Error");
        }
    }


    public function getArg(){
        $request = new Request();
        $args=$request->get();
        return $args;
    }   

    public function resolveArg(array $value){
        $Resolver = new StringResolver($value);
        $Resolver->resolve();
    }
}