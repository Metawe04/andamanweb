<?php

namespace metronic\widgets\ajaxcrud;

use yii\web\AssetBundle;

/**
 * @author John Martin <john.itvn@gmail.com>
 * @since 1.0
 */
class AjaxCrudAsset extends AssetBundle
{
    public $sourcePath = '@metronic/widgets/ajaxcrud/assets';

    public $css = [
        'ajaxcrud.min.css'
    ];

    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap4\BootstrapAsset',
        'yii\bootstrap4\BootstrapPluginAsset',
        'kartik\grid\GridViewAsset',
    ];

    public function init()
    {
        // In dev mode use non-minified javascripts
        $this->js = YII_DEBUG ? [
            'ModalRemote.js',
            'ajaxcrud.js',
        ] : [
            'ModalRemote.min.js',
            'ajaxcrud.min.js',
        ];

        parent::init();
    }
}
