<?php

namespace frontend\controllers;

use Yii;
use yii\web\NotFoundHttpException;
use common\api\page\Page;
use yii\filters\AccessControl;

class PageController extends \yii\web\Controller
{
    /** @inheritdoc */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['view'],
                        'allow' => true,
                        'roles' => ['?'],
                    ],
                    [
                        'actions' => ['view'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
        ];
    }

    public function actionView($slug)
    {
        $model = Page::get($slug); //Page::find()->where(['slug' => $slug, 'status' => Page::STATUS_PUBLISHED])->one();
        if (!$model) {
            throw new NotFoundHttpException('Page not found');
        }
        $viewFile = $model->view ?: 'view';
        return $this->render($viewFile, ['page' => $model]);
    }
}
