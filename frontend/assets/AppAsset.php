<?php

namespace frontend\assets;

use yii\web\AssetBundle;

/**
 * Main frontend application asset bundle.
 */
class AppAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [
        'css/site.css',
        'app/bundle.min.css'
    ];
    public $js = [
        'app/bundle.min.js',
        // 'https://cdn.jsdelivr.net/npm/socket.io-client@2/dist/socket.io.js',
        // 'https://cdn.jsdelivr.net/npm/vue/dist/vue.js',
        // 'https://unpkg.com/vue-lazyload/vue-lazyload.js',
        'js/lazyload.js',
        'js/app.js'
    ];
    public $depends = [
        // 'yii\web\YiiAsset',
        'yii\bootstrap4\BootstrapAsset',
        'yii\bootstrap4\BootstrapPluginAsset',
    ];
}
