<?php

namespace app\models;

use yii\db\ActiveRecord;

class Rules extends ActiveRecord
{

    public static function tableName()
    {
        return '{{RULES}}';
    }


}
