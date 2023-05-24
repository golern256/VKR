<?php

namespace app\models;
use yii\db\ActiveRecord;

class Entity extends ActiveRecord
{
    protected int $entityID;
    protected string $entityName;

    public function getEntityParam()
    {
        return $this->hasMany(EntityParam::class, ['entity_id' => 'id']);
    }

    public function getParametrs(){

        return $this->hasMany(Parametr::class, ['id' => 'param_id'])
            ->via('entityParam');
    }

   }


