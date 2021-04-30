<?php

namespace frontend\controllers;

use Yii;
use yii\web\NotFoundHttpException;
use common\api\page\Page;
use common\models\search\TbResearchSearch;
use  common\models\TbResearch;
use common\models\TbResearchAttachment;
use yii\data\ActiveDataProvider;
use yii\filters\AccessControl;

class ResearchController extends \yii\web\Controller
{
    /** @inheritdoc */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['index', 'view'],
                        'allow' => true,
                        'roles' => ['?'],
                    ],
                    [
                        'actions' => ['index', 'view'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
        ];
    }

    public function actionIndex()
    {
        $searchModel = new TbResearchSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->query->andWhere(['research_status' => 1]);
        $dataProvider->sort->defaultOrder = ['research_id' => SORT_DESC];

        // $research = TbResearch::find()->where(['research_status' => 1])->orderBy('research_id DESC')->all();
        // $categories = TbResearchAttachment::find()->all();
        // if (!$research) {
        //     throw new NotFoundHttpException('Page not found');
        // }


        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionView($id)
    {
        $model = TbResearch::findOne($id);

        if (!$model) {
            throw new NotFoundHttpException('Research not found');
        }
        $models = TbResearch::find()
            ->where(['research_type_work_id' => $model['research_type_work_id']])
            ->andWhere('research_id <> :research_id', [':research_id' => $id])
            ->all();

        return $this->render('_view_research', [
            'model' => $model,
            'models' => $models
        ]);
    }
}
