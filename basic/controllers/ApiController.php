<?php
namespace app\controllers;
use yii\web\Controller;
use yii\web\Request;
use app\models\Parametr;
use app\models\Rules;
use app\models\Predicat;
use app\models\Clause;

class ApiController extends Controller
{
    public function getArg(){

        $request = new Request();
        $args=$request->get();
        print_r($args); 
    }   
       
    public function checkRules(){
        $rules = Rules::find()->asArray()->all();
        foreach ( $rules as $rule) {

            ApiController::findClause($rule['ID_PREDICAT']);
        }
    }

     public function findClause($idPed){

        $clauses = Predicat::find()->where(['ID_PREDICAT'=> $idPed])->asArray()->all();
        foreach ( $clauses as $clause) {
            ApiController:: findParametr($clause['ID_CLAUSE']);
        }
    }
    
    public function findParametr($idClause){
        $nameParam=[];
        $params = Clause::find()->where(['ID_CLAUSE'=> $idClause])->asArray()->all();

        foreach ( $params as $param  ) {
       
            $nameParam[$param['ID_PARAM']] = Parametr::find()->where(['ID_PARAMETR'=>$param['ID_PARAMETR']])->asArray()->one()['NAME_PARAMETR'];
        }

        return $nameParam;
    }

    public function createClause($idParam, $value){

        $param = Parametr::find()->where(['ID_PARAMETR'=>$idParam])->asArray()->one();

         if ($param['OPERATION']== '=')
         {
            return $param['VAL'] == $value;
         }

         if($param['OPERATION']== '>'){

            return $value > $$param['VAL'];

         }

         else{

            return $value < $$param['VAL'];
         }

    }

    public function CompareClause($nameParam,$inputParam){

        foreach($inputParam as $key1 => $param){

            foreach($nameParam as $key2 => $name){

                if($name==$key1){

                    if(!ApiController::createClause($key2,$param["$name"])){

                        return false;
                    }
                }

                else{

                    print_r("Invalid Parametr");
                    return false;

                }
            }
        }

    }

    public function actionIndex(){

      # ApiController :: checkRules();
      ApiController :: getArg();
    }
    
}