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

}
