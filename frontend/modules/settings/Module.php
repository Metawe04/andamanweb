<?php

namespace frontend\modules\settings;

/**
 * settings module definition class
 */
class Module extends \yii\base\Module
{
    public $layout = '@metronic/views/layouts/main';
    /**
     * {@inheritdoc}
     */
    public $controllerNamespace = 'frontend\modules\settings\controllers';

    /**
     * {@inheritdoc}
     */
    public function init()
    {
        parent::init();

        // custom initialization code goes here
    }
}
