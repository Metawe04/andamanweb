<?php

/**
 * Created by PhpStorm.
 * User: Tanakorn Phompak
 * Date: 31/10/2562
 * Time: 16:00
 */
namespace common\components\filesystem;

use League\Flysystem\Adapter\Local;
use League\Flysystem\Filesystem;
use trntv\filekit\filesystem\FilesystemBuilderInterface;

class LocalFlysystemBuilder implements FilesystemBuilderInterface
{
    public $path;
    public function build()
    {
        $adapter = new Local(\Yii::getAlias($this->path));
        return new Filesystem($adapter);
    }
}