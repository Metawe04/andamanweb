<?php

namespace backend\modules\settings\controllers;

use Yii;
use common\models\TbUserPosition;
use common\models\search\TbUserPositionSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use \yii\web\Response;
use yii\helpers\Html;

/**
 * UserPositionController implements the CRUD actions for TbUserPosition model.
 */
class UserPositionController extends Controller
{
    /**
     * {@inheritdoc}
     */
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
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all TbUserPosition models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new TbUserPositionSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single TbUserPosition model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new TbUserPosition model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $request = Yii::$app->request;
        $model = new TbUserPosition();

        if ($request->isAjax) {
            /*
            *   Process for ajax request
            */
            Yii::$app->response->format = Response::FORMAT_JSON;
            if ($request->isGet) {
                return [
                    'title' => "บันทึกตำแหน่ง",
                    'content' => $this->renderAjax('create', [
                        'model' => $model,
                    ]),
                    'footer' => Html::button('ปิด', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                        Html::button('บันทึกรายการ', ['class' => 'btn btn-primary', 'type' => "submit"])

                ];
            } else if ($model->load($request->post()) && $model->save()) {
                return [
                    'forceReload' => '#crud-datatable-pjax',
                    'title' => "บันทึกตำแหน่ง",
                    'content' => '<span class="text-success">บันทึกสำเร็จ!</span>',
                    'footer' => Html::button('ปิด', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                        Html::a('เพิ่มรายการ', ['create'], ['class' => 'btn btn-primary', 'role' => 'modal-remote'])

                ];
            } else {
                return [
                    'title' => "บันทึกตำแหน่ง",
                    'content' => $this->renderAjax('create', [
                        'model' => $model,
                    ]),
                    'footer' => Html::button('ปิด', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                        Html::button('บันทึกรายการ', ['class' => 'btn btn-primary', 'type' => "submit"])

                ];
            }
        } else {
            /*
            *   Process for non-ajax request
            */
            if ($model->load($request->post()) && $model->save()) {
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
                return $this->render('create', [
                    'model' => $model,
                ]);
            }
        }
    }

    /**
     * Updates an existing TbUserPosition model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */

    public function actionUpdate($id)
    {
        $request = Yii::$app->request;
        $model = $this->findModel($id);

        if ($request->isAjax) {
            /*
            *   Process for ajax request
            */
            Yii::$app->response->format = Response::FORMAT_JSON;
            if ($request->isGet) {
                return [
                    'title' => "แก้ไข ตำแหน่ง",
                    'content' => $this->renderAjax('update', [
                        'model' => $model,
                    ]),
                    'footer' => Html::button('ปิด', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                        Html::button('บันทึกรายการ', ['class' => 'btn btn-primary', 'type' => "submit"])
                ];
            } else if ($model->load($request->post()) && $model->save()) {
                return [
                    'forceReload' => '#crud-datatable-pjax',
                    'title' => "แก้ไข ตำแหน่ง" ,
                    'content' => '<span class="text-success">บันทึกสำเร็จ!</span>',
                    'footer' => Html::button('ปิด', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                        Html::a('แก้ไข', ['update', 'id' => $id], ['class' => 'btn btn-primary', 'role' => 'modal-remote'])
                ];
            } else {
                return [
                    'title' => "แก้ไข ตำแหน่ง " ,
                    'content' => $this->renderAjax('update', [
                        'model' => $model,
                    ]),
                    'footer' => Html::button('ปิด', ['class' => 'btn btn-default pull-left', 'data-dismiss' => "modal"]) .
                        Html::button('บันทึกรายการ', ['class' => 'btn btn-primary', 'type' => "submit"])
                ];
            }
        } else {
            /*
            *   Process for non-ajax request
            */
            if ($model->load($request->post()) && $model->save()) {
                \Yii::$app->session->setFlash(\dominus77\sweetalert2\Alert::TYPE_SUCCESS, [
                    [
                        'title' => '',
                        'text' => 'แก้ไขรายการสำเร็จ!',
                        'showConfirmButton' => false,
                        'timer' => 3000
                    ]
                ]);
            } else {
                return $this->render('update', [
                    'model' => $model,
                ]);
            }
        }
    }

    /**
     * Deletes an existing TbUserPosition model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
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
     * Finds the TbUserPosition model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return TbUserPosition the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = TbUserPosition::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
