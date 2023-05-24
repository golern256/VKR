<?php
namespace app\controllers;
use yii\web\Controller;
use yii\web\Request;
use app\models\Entity;
use app\models\Rate_Parametr;
use app\models\Rules;
use app\models\Rate;
use app\models\EntityResolver;
use app\models\User;
use Yii;
use yii\filters\AccessControl;

class ApiController  extends Controller
{
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'allow' => true,
                        'actions' => ['insert-entity'],
                        'roles' => ['@'], // требуется аутентификация
                    ],
                    [
                        'allow' => true,
                        'actions' => ['index'],
                        'roles' => ['?'], // аутентификация не требуется
                    ],
                ],
            ],
        ];
    }


    public function actionIndex(){
        print_r("Hello World");
    }

    public function actionInsertEntity(){
        $response = Yii::$app->response;
        $response->format = \yii\web\Response::FORMAT_JSON;


        $resolver = new EntityResolver($this->getArg());

      $status =  $resolver->passAuthentication();
      if($status){
          $flag=$resolver->addEntity();
          if($flag==true){
              $response->data = ['status' => 'OK'];

          }
          else{
              $response->data = ['status' => 'Error'];
          }
      }
      else
          throw new yii\web\ForbiddenHttpException;
          $response->data = ['status' => 'Invalid User'];
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
