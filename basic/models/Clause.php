<?php


namespace app\models;

use yii\db\ActiveRecord;

class Clause extends ActiveRecord
{

    public static function tableName()
    {
        return '{{CLAUSE}}';
    }


 #public function getParam()
  #  {
  #      return $this->hasOne(Parametr::class, ['ID_PARAMETR' => 'ID_PARAMETR']);
   # }

}