<?php

/**
 * Created by PhpStorm.
 * User: Tanakorn Phompak
 * Date: 1/11/2562
 * Time: 10:58
 */

namespace common\modules\file\controllers;

use alexantr\elfinder\ConnectorAction;
use Yii;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;
use yii\web\Controller;

class FileManagerController extends Controller
{
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
        ];
    }
    /**
     * @return array
     */
    public function actions()
    {
        return [
            'connector' => [
                'class' => ConnectorAction::class,
                'options' => [
                    'disabledCommands' => ['netmount'],
                    'connectOptions' => [
                        'filter'
                    ],
                    'roots' => [
                        [
                            'driver' => 'LocalFileSystem',
                            'path' => Yii::getAlias('@storage/web/source'),
                            'URL' => Yii::getAlias('@storageUrl'), //Yii::getAlias('@frontend/web'),
                            'uploadDeny' => [
                                'text/x-php', 'text/php', 'application/x-php', 'application/php'
                            ],
                            'accessControl' => 'access',
                            'attributes' => [
                                [
                                    'pattern' => '!^/assets!',
                                    'hidden' => true
                                ],
                                [
                                    'pattern' => '!^/index.php!',
                                    'hidden' => true
                                ],
                                [
                                    'pattern' => '!^/index-test.php!',
                                    'hidden' => true
                                ]
                            ],
                        ],
                    ],
                ],
            ],
        ];
    }

    /**
     * @return mixed
     */
    public function actionIndex()
    {
        return $this->render('index');
    }
}
