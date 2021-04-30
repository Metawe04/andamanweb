<?php
$params = array_merge(
    require __DIR__ . '/../../common/config/params.php',
    require __DIR__ . '/../../common/config/params-local.php',
    require __DIR__ . '/params.php',
    require __DIR__ . '/params-local.php'
);

return [
    'id' => 'app-backend',
    'basePath' => dirname(__DIR__),
    'controllerNamespace' => 'backend\controllers',
    'bootstrap' => ['log'],
    'homeUrl' => '/admin',
    'modules' => [
        'user' => [
            'class' => 'dektrium\user\Module',
            // following line will restrict access to profile, recovery, registration and settings controllers from backend
            // 'as backend' => 'dektrium\user\filters\BackendFilter',
        ],
        'file' => [
            'class' => 'common\modules\file\Module',
        ],
        'settings' => [
            'class' => 'backend\modules\settings\Module',
        ],
    ],
    'components' => [
        'request' => [
            'csrfParam' => '_csrf-backend',
            'baseUrl' => '/admin',
        ],
        'user' => [
            'identityClass' => 'dektrium\user\models\User',
            'enableAutoLogin' => false,
            'identityCookie' => [
                'name' => '_identity-backend',
                //'path' => '/admin',
                'httpOnly' => true,
            ],
            'authTimeout' => 3600 * 12, // 12 ชม
        ],
        'session' => [
            'name' => 'BACKENDSESSID',
            'cookieParams' => [
                'httpOnly' => true,
                //'path' => '/admin',
            ],
            'timeout' => 3600 * 12, // 12 ชม
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
                'yii\web\YiiAsset' => [
                    'depends' => [
                        'metronic\assets\MetronicAsset',
                    ]
                ],
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
                    '@backend/views' => '@metronic/views',
                    '@dektrium/user/views' => '@metronic/user/views',
                    '@mdm/admin/views' => '@metronic/admin/views',
                ],
            ],
        ],
        'fileStorage' => require __DIR__ . '/../../common/config/fileStorage.php',
        'frontendCache' => require Yii::getAlias('@frontend/config/_cache.php')
    ],
    'params' => $params,
];
