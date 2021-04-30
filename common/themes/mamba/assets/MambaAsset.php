<?php

namespace mamba\assets;

use yii\web\AssetBundle;

class MambaAsset extends AssetBundle
{
    public $sourcePath = '@mamba/assets/dist';

    public $css = [
        '//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,600,600i,700,700i,900|Prompt:300,400,500,600,700&amp;amp;display=swap',
        '//fonts.googleapis.com/icon?family=Material+Icons'
        // 'vendor/icofont/icofont.min.css',
        // 'vendor/boxicons/css/boxicons.min.css',
        // 'vendor/animate.css/animate.min.css',
        // 'vendor/venobox/venobox.css',
        // 'vendor/aos/aos.css',
        // 'css/style.css',
    ];

    public $js = [
        /* 'vendor/jquery.easing/jquery.easing.min.js',
        'vendor/php-email-form/validate.js',
        'vendor/jquery-sticky/jquery.sticky.js',
        'vendor/venobox/venobox.min.js',
        'vendor/waypoints/jquery.waypoints.min.js',
        'vendor/counterup/counterup.min.js', 
        'vendor/isotope-layout/isotope.pkgd.min.js',
        /* 'vendor/aos/aos.js',
        'js/main.js', */
    ];

    public $depends = [
        // 'yii\web\YiiAsset',
        'frontend\assets\AppAsset',
        // 'metronic\assets\FontAwesomeAsset'
    ];
}
