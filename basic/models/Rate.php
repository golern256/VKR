<?php

namespace app\models;

use yii\db\ActiveRecord;

class Rate extends ActiveRecord
{

    private int $Id;
    private string $RateName;
    private int $IdParam;
    public static function tableName()
    {
        return '{{Rate}}';
    }

}

