<?php

namespace frontend\modules\settings\controllers;

use common\models\Page;
use common\traits\FormAjaxValidationTrait;
use Yii;
use yii\data\ActiveDataProvider;
use yii\filters\VerbFilter;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use frontend\modules\settings\models\search\PageSearch;
use yii\filters\AccessControl;

class PageController extends Controller
{
    use FormAjaxValidationTrait;

    /** @inheritdoc */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::class,
                'actions' => [
                    'delete' => ['post'],
                ],
            ],
        ];
    }

    public function actions()
    {
        return [
            'toggle-update' => [
                'class' => '\common\actions\ToggleAction',
                'modelClass' => Page::className(),
                'attribute' => 'status'
            ],
            'editor-upload' => [
                'class' => 'common\actions\EditorUploadAction',
                'uploadPath' => 'source',
                'fileparam' => 'file',
                'editor' => 'tinymce'
            ],
        ];
    }

    /**
     * @return mixed
     */


    public function actionIndex()
    {
        $searchModel = new PageSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        return $this->render('index', [
            'dataProvider' => $dataProvider,
            'searchModel' => $searchModel,
        ]);
    }

    /**
     * @return mixed
     */
    public function actionCreate($slug = null)
    {
        $model = new Page();

        $this->performAjaxValidation($model);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            \Yii::$app->session->setFlash(\dominus77\sweetalert2\Alert::TYPE_SUCCESS, [
                [
                    'title' => '',
                    'text' => 'บันทึกรายการสำเร็จ!',
                    'showConfirmButton' => false,
                    'timer' => 3000
                ]
            ]);
            return $this->redirect(['index']);
        }
        if($slug) $model->slug = $slug;
        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * @param integer $id
     *
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $page = $this->findModel($id);

        $this->performAjaxValidation($page);

        if ($page->load(Yii::$app->request->post()) && $page->save()) {
            \Yii::$app->session->setFlash(\dominus77\sweetalert2\Alert::TYPE_SUCCESS, [
                [
                    'title' => '',
                    'text' => 'บันทึกรายการสำเร็จ!',
                    'showConfirmButton' => false,
                    'timer' => 3000
                ]
            ]);
            return $this->redirect(['index']);
        }

        return $this->render('update', [
            'model' => $page,
        ]);
    }

    /**
     * @param integer $id
     *
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        \Yii::$app->session->setFlash(\dominus77\sweetalert2\Alert::TYPE_SUCCESS, [
            [
                'title' => '',
                'text' => 'ลบรายการสำเร็จ!',
                'showConfirmButton' => false,
                'timer' => 3000
            ]
        ]);

        return $this->redirect(['index']);
    }

    /**
     * @param integer $id
     *
     * @return Page the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Page::findOne($id)) !== null) {
            return $model;
        }
        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
