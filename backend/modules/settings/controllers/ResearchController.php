<?php

namespace backend\modules\settings\controllers;

use Yii;
use common\models\TbResearch;
use common\models\search\TbResearchSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use  common\models\TbResearchUserOnus;
use app\base\Model;
use common\base\DynamicModel;
use yii\web\Response;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;


/**
 * ResearchController implements the CRUD actions for TbResearch model.
 */
class ResearchController extends Controller
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
    public function actions()
    {
        return [
            'toggle-update' => [
                'class' => '\common\actions\ToggleAction',
                'modelClass' => TbResearch::className(),
                'attribute' => 'status'
            ],
            'editor-upload' => [
                'class' => 'common\actions\EditorUploadAction',
                'uploadPath' => 'source',
                'fileparam' => 'file',
                'editor' => 'tinymce'
            ],
            'delete-file' => [
                'class' => 'trntv\filekit\actions\DeleteAction',
            ],
        ];
    }

    /**
     * Lists all TbResearch models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new TbResearchSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single TbResearch model.
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
     * Creates a new TbResearch model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new TbResearch();
        $researchUsers = [new TbResearchUserOnus];

        if ($model->load(Yii::$app->request->post())) {

            $researchUser = DynamicModel::createMultiple(TbResearch::classname(), $researchUsers, 'research_id');
            DynamicModel::loadMultiple($researchUsers, Yii::$app->request->post());

            // validate all models
            $valid = $model->validate();
            $valid = DynamicModel::validateMultiple($researchUsers) && $valid;

            if ($valid) {
                $transaction = \Yii::$app->db->beginTransaction();

                try {
                    if ($flag = $model->save()) {
                        foreach ($researchUsers as $researchUser) {
                            $researchUser->research_id = $model->research_id;
                            if (!($flag = $researchUser->save())) {
                                $transaction->rollBack();
                                break;
                            }
                        }
                    }

                    if ($flag) {
                        $transaction->commit();
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
                } catch (\Exception $e) {
                    $transaction->rollBack();
                }
            }
        }

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

        return $this->render('create', [
            'model' => $model,
            'researchUsers' => (empty($researchUsers)) ? [new TbResearchUserOnus] : $researchUsers

        ]);
    }

    /**
     * Updates an existing TbResearch model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */

    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $researchUsers = TbResearchUserOnus::find()->where(['research_id' => $id])->all();

        if ($model->load(Yii::$app->request->post())) {

            $oldIDs = ArrayHelper::map($researchUsers, 'researcher_name_ids', 'researcher_name_ids');
            $researchUsers = DynamicModel::createMultiple(TbResearchUserOnus::classname(), $researchUsers, 'researcher_name_ids');
            DynamicModel::loadMultiple($researchUsers, Yii::$app->request->post());
            $deletedIDs = array_diff($oldIDs, array_filter(ArrayHelper::map($researchUsers, 'researcher_name_ids', 'researcher_name_ids')));

            // validate all models
            $valid = $model->validate();
            $valid = DynamicModel::validateMultiple($researchUsers) && $valid;

            if ($valid) {
                $transaction = \Yii::$app->db->beginTransaction();
                try {
                    if ($flag = $model->save()) {
                        if (!empty($deletedIDs)) {
                            TbResearchUserOnus::deleteAll(['researcher_name_ids' => $deletedIDs]);
                        }
                        foreach ($researchUsers as $researchUser) {
                            $researchUser->research_id = $model->research_id;
                            if (!($flag = $researchUser->save())) {
                                $transaction->rollBack();
                                break;
                            }
                        }
                    }
                    if ($flag) {
                        $transaction->commit();
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
                } catch (\Exception $e) {
                    $transaction->rollBack();
                }
            }

      
        }

        return $this->render('update', [
            'model' => $model,
            'researchUsers' => (empty($researchUsers)) ? [new TbResearchUserOnus] : $researchUsers
        ]);
    }


    // public function actionUpdate($id)
    // {
    //     $model = $this->findModel($id);
    //     $researchUsers = TbResearchUserOnus::find()->where(['researcher_name_ids' => $id])->all();

    //     if ($model->load(Yii::$app->request->post()) && $model->save()) {
    //         \Yii::$app->session->setFlash(\dominus77\sweetalert2\Alert::TYPE_SUCCESS, [
    //             [
    //                 'title' => '',
    //                 'text' => 'แก้ไขรายการสำเร็จ!',
    //                 'showConfirmButton' => false,
    //                 'timer' => 3000
    //             ]
    //         ]);
    //         return $this->redirect(['index']);
    //     }

    //     return $this->render('update', [
    //         'model' => $model,
    //         'researchUsers' => (empty($researchUsers)) ? [new TbResearchUserOnus] : $researchUsers
    //     ]);
    // }



    /**
     * Deletes an existing TbResearch model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        if (Yii::$app->request->isAjax) {
            $response = Yii::$app->response;
            $response->format = \yii\web\Response::FORMAT_JSON;
            return [
                'message' => 'ลบรายการสำเร็จ!'
            ];
        }
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
     * Finds the TbResearch model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return TbResearch the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = TbResearch::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }
}
