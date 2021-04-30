<?php
use yii\helpers\ArrayHelper;
$urlManagerBackend = require Yii::getAlias('@backend/config/_urlManager.php');
$urlManagerFrontend = require Yii::getAlias('@frontend/config/_urlManager.php');
$urlManagerStorage = require Yii::getAlias('@storage/config/_urlManager.php');

return [
    'aliases' => [
        '@bower' => '@vendor/bower-asset',
        '@npm' => '@vendor/npm-asset',
        '@metronic' => '@common/themes/metronic',
        '@mamba' => '@common/themes/mamba',
        '@metronic/user' => '@metronic/modules/yii2-user',
        '@metronic/admin' => '@metronic/modules/yii2-admin',
        '@CKSource/CKFinder' => '@common/lib/CKFinder',
        '@metronic/widgets/tinymce' => '@metronic/widgets/yii2-tinymce'
    ],
    'vendorPath' => dirname(dirname(__DIR__)) . '/vendor',
    'name' => ' Andaman Pattana',
    # ตั้งค่าการใช้งานภาษาไทย (Language)
    'language' => 'th-TH', // ตั้งค่าภาษาไทย
    # ตั้งค่า TimeZone ประเทศไทย
    'timeZone' => 'Asia/Bangkok', // ตั้งค่า TimeZone

    'sourceLanguage' => 'en-US',
    'components' => [
        'cache' => [
            'class' => 'yii\caching\FileCache',
        ],
        'authManager' => [
            'class' => 'yii\rbac\DbManager',
            'cache' => 'cache',
            'db' => 'db',
        ],
        'formatter' => [
            'class' => 'yii\i18n\Formatter',
            'nullDisplay' => '',
            'dateFormat' => 'php:Y-m-d',
            'datetimeFormat' => 'php:Y-m-d H:i:s',
            'timeFormat' => 'php:H:i:s',
            'defaultTimeZone' => 'Asia/Bangkok',
            'timeZone' => 'Asia/Bangkok',
            'locale' => 'th-TH',
        ],
        // 'urlManagerBackend' => ArrayHelper::merge([], $urlManagerBackend),
        // 'urlManagerFrontend' => ArrayHelper::merge([], $urlManagerFrontend),
        // 'urlManagerStorage' => ArrayHelper::merge([], $urlManagerStorage),
        'fileStorage' => require __DIR__ . '/fileStorage.php',
        'glide' => [
            'class' => 'trntv\glide\components\Glide',
            'sourcePath' => '@storage/web/source',
            'cachePath' => '@storage/cache',
            'urlManager' => 'urlManagerStorage',
            'maxImageSize' => getenv('GLIDE_MAX_IMAGE_SIZE'),
            'signKey' => getenv('GLIDE_SIGN_KEY')
        ],
    ],
    'modules' => [
        'gridview' => [
            'class' => '\kartik\grid\Module',
        ],
        'user' => [
            'class' => 'dektrium\user\Module',
            'enableUnconfirmedLogin' => true,
            'enableFlashMessages' => false,
            'enableGeneratingPassword' => false,
            'enableConfirmation' => false,
            'enablePasswordRecovery' => true,
            'enableAccountDelete' => false,
            'enableRegistration' => true,
            'confirmWithin' => 21600,
            'cost' => 12,
            'admins' => ['admin'],
            'urlPrefix' => 'auth',
            'modelMap' => [
                'User' => 'metronic\user\models\User',
                'Profile' => 'metronic\user\models\Profile',
                'RegistrationForm' => 'metronic\user\models\RegistrationForm',
                'LoginForm' => 'metronic\user\models\LoginForm',
            ],
            'controllerMap' => [
                'admin' => [
                    'class' => 'metronic\user\controllers\AdminController',
                    'layout' => '@metronic/views/layouts/main',
                ],
                'settings' => [
                    'class' => 'metronic\user\controllers\SettingsController',
                    'layout' => '@metronic/views/layouts/main',
                ],
                'registration' => [
                    'class' => 'metronic\user\controllers\RegistrationController',
                    'layout' => '@metronic/views/layouts/main-login',
                ],
                'recovery' => [
                    'class' => 'metronic\user\controllers\RecoveryController',
                    'layout' => '@metronic/views/layouts/main-login',
                ],
                'security' => [
                    'class' => 'metronic\user\controllers\SecurityController',
                    'layout' => '@metronic/views/layouts/main-login',
                ],
            ],
        ],
        'rbac' => [
            'class' => 'mdm\admin\Module',
            'layout' => 'left-menu', //'left-menu', 'right-menu' and 'top-menu'
            'mainLayout' => '@metronic/views/layouts/main.php',
            'menus' => [
                'menu' => null,
                'user' => null, // disable menu
                'rule' => null,
            ],
            'controllerMap' => [
                'assignment' => [
                    'class' => 'mdm\admin\controllers\AssignmentController',
                    'extraColumns' => [
                        [
                            'attribute' => 'name',
                            'label' => 'ชื่อ-นามสกุล',
                            'value' => function ($model, $key, $index, $column) {
                                return $model->profile->name;
                            },
                        ],
                    ],
                ],
            ],
        ],
    ],
];
