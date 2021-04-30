<?php
use \yii\web\Request;
$baseUrl = str_replace('/frontend/web', '', (new Request)->getBaseUrl());

$params = array_merge(
    require __DIR__ . '/../../common/config/params.php',
    require __DIR__ . '/../../common/config/params-local.php',
    require __DIR__ . '/params.php',
    require __DIR__ . '/params-local.php'
);

return [
    'id' => 'app-frontend',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
    'controllerNamespace' => 'frontend\controllers',
    'modules' => [
        'user' => [
            // following line will restrict access to admin controller from frontend application
            // 'as frontend' => 'dektrium\user\filters\FrontendFilter',
            'class' => 'dektrium\user\Module',
        ],
        'file' => [
            'class' => 'common\modules\file\Module',
        ],
        'pdfjs' => [
            'class' => '\yii2assets\pdfjs\Module',
        ],
        'settings' => [
            'class' => 'frontend\modules\settings\Module',
        ],
    ],
    'components' => [
        'request' => [
            'csrfParam' => '_csrf-frontend',
            'baseUrl' => '',
        ],
        'user' => [
            'identityClass' => 'dektrium\user\models\User',
            'enableAutoLogin' => true,
            'identityCookie' => [
                'name' => '_identity-frontend',
                //'path' => '/',
                'httpOnly' => true,
            ],
            // 'authTimeout' => 3600 * 12, // 12 ชม
        ],
        'session' => [
            'name' => 'FRONTENDSESSID',
            'cookieParams' => [
                'httpOnly' => true,
                //'path' => '/',
            ],
            // 'timeout' => 3600 * 12, // 12 ชม
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        'errorHandler' => [
            'errorAction' => 'site/error',
        ],

        'urlManager' => require __DIR__ . '/_urlManager.php',
        'assetManager' => [
            'appendTimestamp' => YII_ENV_DEV ? false : true,
            'bundles' => [
                'yii\bootstrap\BootstrapAsset' => false,
                'yii\bootstrap\BootstrapPluginAsset' => false,
                'yii\bootstrap4\BootstrapAsset' => false,
                'yii\bootstrap4\BootstrapPluginAsset' => false,
                'yii\web\JqueryAsset' => false,
                // 'yii\web\YiiAsset' => [
                //     'depends' => [
                //         'frontend\assets\AppAsset',
                //     ]
                // ],
                /* 'yii2assets\pdfjs\PdfJsAsset' => [
                    'depends' => [
                        '\mamba\assets\MambaAsset',
                    ]
                ], */

                //
                'yii\jui\JuiAsset' => [
                    'depends' => [
                        'metronic\assets\MetronicAsset',
                    ]
                ],
                'trntv\filekit\widget\UploadAsset' => [
                    'depends' => [
                        'yii\web\YiiAsset',
                        '\trntv\filekit\widget\BlueimpFileuploadAsset',
                        '\rmrevin\yii\fontawesome\NpmFreeAssetBundle'
                    ]
                ],
                'dosamigos\ckeditor\CKEditorAsset' => [
                    'sourcePath' => '@webroot/js/ckeditor'
                ],
                'wbraganca\dynamicform\DynamicFormAsset' => [
                    'basePath' => '@webroot',
                    'baseUrl' => '@web',
                    'js' => [
                        YII_ENV_DEV ? 'js/yii2-dynamic-form.js' : 'js/yii2-dynamic-form.js'
                    ]
                ],
            ],
        ],
        'view' => [
            'theme' => [
                'pathMap' => [
                    '@frontend/views' => '@mamba/views',
                    '@dektrium/user/views' => '@metronic/user/views',
                    '@mdm/admin/views' => '@metronic/admin/views',
                ],
            ],
        ],
        'fileStorage' => require __DIR__ . '/../../common/config/fileStorage.php',
        'cache' => require __DIR__ . '/_cache.php'
    ],
    'params' => $params,
];
