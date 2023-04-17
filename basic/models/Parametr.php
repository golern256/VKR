<?php

namespace app\models;

use yii\db\ActiveRecord;

class Parametr extends ActiveRecord
{

    public static function tableName()
    {
        return '{{PARAMETR}}';
    }

  #  public function getClause()
 #   {
 #       return $this->hasOne(Clause::class, ['ID_PARAMETR' => 'ID_PARAMETR']);
#    }

}

