<?php


namespace app\models;

use yii\db\ActiveRecord;

class User extends ActiveRecord
{
    public function cheakUserPass(string $login, string $password): bool{

        $user = User::find()->where(['name'=>$login])->one();
        if($user->password==$password)
            return true;
        else
            return false;
    }

    public function cheakUserStatus(string $login ): bool{

        $user = User::find()->where(['name'=>$login])->one();
        if($user->flag==1)
            return true;
        else
            return false;
    }

}