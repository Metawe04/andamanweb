<?php

namespace common\modules\file;

/**
 * file module definition class
 */
class Module extends \yii\base\Module
{
    public $layout = '@metronic/views/layouts/main';
    /**
     * {@inheritdoc}
     */
    public $controllerNamespace = 'common\modules\file\controllers';

    /**
     * {@inheritdoc}
     */
    public function init()
    {
        parent::init();

        // custom initialization code goes here
    }
}
