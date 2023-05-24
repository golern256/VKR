<?php

namespace app\models;

class EntityResolver {

    private array $InputValue;
    private string $OutputValue;

    function __construct(array $value) {$this->InputValue=$value;}

    public function getName(): string{

        return $this->InputValue['name'];
    }

    public function addEntity(): bool{

        $entity = new Entity();
        $entity->name = $this->getName();
        return $entity->save();

    }

    public function passAuthentication(): bool{

        $user = new User();
        $user->name=$this->InputValue['login'];
        $user->password=$this->InputValue['pass'];
        $validUser= $user->cheakUserPass($user->name, $user->password);
        if ($validUser)
            return $user->cheakUserStatus($user->name);
        else
            return false;

    }

}
