<?php

namespace frontend\modules\settings\controllers;

use frontend\modules\settings\models\search\CarouselItemSearch;
use frontend\modules\settings\models\search\CarouselSearch;
use common\models\WidgetCarousel;
use common\models\WidgetCarouselItem;
use common\traits\FormAjaxValidationTrait;
use Yii;
use yii\filters\VerbFilter;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\AccessControl;
use yii\helpers\Html;
use \yii\web\Response;

class CarouselController extends Controller
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
                'class' => '\dixonstarter\togglecolumn\actions\ToggleAction',
                'modelClass' => WidgetCarousel::className(),
                'attribute' => 'status'
            ],
            'toggle-update-item' => [
                'class' => '\dixonstarter\togglecolumn\actions\ToggleAction',
                'modelClass' => WidgetCarouselItem::className(),
                'attribute' => 'status'
            ],
        ];
    }

    /**
     * @return mixed
     */
    public function actionIndex()
    {
        $widgetCarousel = new WidgetCarousel();

        $this->performAjaxValidation($widgetCarousel);

        if ($widgetCarousel->load(Yii::$app->request->post()) && $widgetCarousel->save()) {
            \Yii::$app->session->setFlash(\dominus77\sweetalert2\Alert::TYPE_SUCCESS, [
                [
                    'title' => '',
                    'text' => 'บันทึกรายการสำเร็จ!',
                    'showConfirmButton' => false,
                    'timer' => 3000
                ]
            ]);
            return $this->redirect(['update', 'id' => $widgetCarousel->id]);
        } else {
            $searchModel = new CarouselSearch();
            $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

            return $this->render('index', [
                'searchModel' => $searchModel,
                'dataProvider' => $dataProvider,
                'model' => $widgetCarousel,
            ]);
        }
    }

    public function actionCreate()
    {
        $request = Yii::$app->request;
        $model = new WidgetCarousel();

        if ($request->isAjax) {
            /*
            *   Process for ajax request
            */
            Yii::$app->response->format = Response::FORMAT_JSON;
            if ($request->isGet) {
                return [
                    'title' => "บันทึกรายการ",
                    'content' => $this->renderAjax('create', [
                        'model' => $model,
                    ]),
                    'footer' => Html::button('ยกเลิก', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                        Html::button('บันทึก', ['class' => 'btn btn-primary', 'type' => "submit"])

                ];
            } else if ($model->load($request->post()) && $model->save()) {
                return [
                    'forceReload' => '#crud-datatable-pjax',
                    'title' => "แก้ไขรายการ",
                    'content' => '<span class="text-success">Create User success</span>',
                    'footer' => Html::button('ยกเลิก', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                        Html::a('เพิ่มรายการ', ['create'], ['class' => 'btn btn-primary', 'role' => 'modal-remote'])

                ];
            } else {
                return [
                    'title' => "บันทึกรายการ",
                    'content' => $this->renderAjax('create', [
                        'model' => $model,
                    ]),
                    'footer' => Html::button('ยกเลิก', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                        Html::button('บันทึก', ['class' => 'btn btn-primary', 'type' => "submit"])

                ];
            }
        } else {
            /*
            *   Process for non-ajax request
            */
            if ($model->load($request->post()) && $model->save()) {
                return $this->redirect(['view', 'id' => $model->id]);
            } else {
                return $this->render('create', [
                    'model' => $model,
                ]);
            }
        }
    }

    /**
     * @param integer $id
     *
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $widgetCarousel = $this->findWidget($id);

        $this->performAjaxValidation($widgetCarousel);

        $searchModel = new CarouselItemSearch();
        $carouselItemsProvider = $searchModel->search([]);
        $carouselItemsProvider->query->andWhere(['carousel_id' => $widgetCarousel->id]);

        if ($widgetCarousel->load(Yii::$app->request->post()) && $widgetCarousel->save()) {
            $cacheKey = [
                WidgetCarousel::class,
                $widgetCarousel->key
            ];
            Yii::$app->cache->delete($cacheKey);
            \Yii::$app->session->setFlash(\dominus77\sweetalert2\Alert::TYPE_SUCCESS, [
                [
                    'title' => '',
                    'text' => 'บันทึกรายการสำเร็จ!',
                    'showConfirmButton' => false,
                    'timer' => 3000
                ]
            ]);
            return $this->redirect(['index']);
        } else {
            return $this->render('update', [
                'model' => $widgetCarousel,
                'carouselItemsProvider' => $carouselItemsProvider,
            ]);
        }
    }

    /**
     * @param integer $id
     *
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findWidget($id)->delete();

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
     * @return WidgetCarousel the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findWidget($id)
    {
        if (($model = WidgetCarousel::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
