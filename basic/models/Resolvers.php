<?php
namespace app\models;

interface ResolverInterface {

    public function getName(): string;

    public function resolve(): array;

    public function toString(): string;

}
