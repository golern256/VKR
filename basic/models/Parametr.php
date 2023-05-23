<?php

namespace app\models;

use yii\db\ActiveRecord;

class Parametr extends ActiveRecord
{
    protected int $paramID;
    protected string $paramName;
    protected string $resValue;

    public function getEntityParam()
    {
        return $this->hasMany(EntityParam::class, ['param_id' => 'id']);
    }

    public function getEntity(){

        return $this->hasMany(Entity::class, ['id' => 'entity_id'])
            ->via('entityParam');
    }

    public function insertEntity(){

    }

}