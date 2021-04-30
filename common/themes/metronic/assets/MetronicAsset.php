<?php

namespace metronic\assets;

use yii\web\AssetBundle;

class MetronicAsset extends AssetBundle
{
    public $sourcePath = '@metronic/assets/dist';
    public $css = [
        '//fonts.googleapis.com/css?family=Poppins:300,400,500,600,700',
        '//fonts.googleapis.com/icon?family=Material+Icons',
        'plugins/global/plugins.bundle.css',
        'plugins/custom/prismjs/prismjs.bundle.css',
        'css/style.bundle.css'
    ];

    public $js = [
        'plugins/global/plugins.bundle.js',
        'plugins/custom/prismjs/prismjs.bundle.js',
        'js/scripts.bundle.js'
    ];

    public $depends = [
        // 'yii\web\YiiAsset',
        'yii\web\JqueryAsset',
        // 'backend\assets\AppAsset',
        'yii\bootstrap4\BootstrapAsset',
        'yii\bootstrap4\BootstrapPluginAsset'
        // 'metronic\assets\FontAwesomeAsset',
    ];
}
