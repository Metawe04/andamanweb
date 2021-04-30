<?php
/*
 * Created by VS Code.
 * User: Tanakorn Phompak
 * Date: Wed Jun 10 2020
 * Time: 07:10:36
 */

namespace metronic\user\controllers;

use dektrium\user\controllers\AdminController as BaseAdminController;
use metronic\user\models\Profile;
use yii\helpers\Url;
use trntv\filekit\actions\DeleteAction;
use trntv\filekit\actions\UploadAction;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;
use dektrium\user\filters\AccessRule;
use dektrium\user\models\User;
use common\models\TbUserGreduated;
use common\base\DynamicModel;
use common\models\TbUserExpertise;
use common\models\TbUsertype;
use Yii;
use yii\helpers\ArrayHelper;
use common\models\TbUserPosition;

class AdminController extends BaseAdminController
{
    /** @inheritdoc */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete'          => ['post'],
                    'confirm'         => ['post'],
                    'resend-password' => ['post'],
                    'block'           => ['post'],
                    'switch'          => ['post'],
                ],
            ],
            'access' => [
                'class' => AccessControl::className(),
                'ruleConfig' => [
                    'class' => AccessRule::className(),
                ],
                'rules' => [
                    [
                        'allow' => true,
                        'actions' => ['switch', 'upload-avatar', 'delete-avatar'],
                        'roles' => ['@'],
                    ],
                    [
                        'allow' => true,
                        'roles' => ['admin'],
                    ],
                ],
            ],
        ];
    }

    public function actions()
    {
        return [
            'upload-avatar' => [
                'class' => UploadAction::className(),
                'deleteRoute' => 'delete-avatar',
                /* 'on afterSave' => function ($event) {
                    $file = $event->file;
                    $cache = Yii::$app->cache;
                    $key = 'avatar' . Yii::$app->user->id;
                    $cache->delete($key);
                    $img = ImageManagerStatic::make($file->read())->fit(215, 215);
                    $file->put($img->encode());
                }, */
            ],
            'delete-avatar' => [
                'class' => DeleteAction::className(),
            ],
        ];
    }

    /**
     * Creates a new User model.
     * If creation is successful, the browser will be redirected to the 'index' page.
     *
     * @return mixed
     */
    public function actionCreate()
    {
        /** @var User $user */
        $user = \Yii::createObject([
            'class'    => User::className(),
            'scenario' => 'create',
        ]);
        $event = $this->getUserEvent($user);

        $this->performAjaxValidation($user);

        $this->trigger(self::EVENT_BEFORE_CREATE, $event);
        if ($user->load(\Yii::$app->request->post()) && $user->create()) {
            \Yii::$app->session->setFlash(\dominus77\sweetalert2\Alert::TYPE_SUCCESS, [
                [
                    'title' => '',
                    'text' => \Yii::t('user', 'User has been created'),
                    'showConfirmButton' => false,
                    'timer' => 3000
                ]
            ]);
            $this->trigger(self::EVENT_AFTER_CREATE, $event);
            return $this->redirect(['update', 'id' => $user->id]);
        }

        return $this->render('create', [
            'user' => $user,
        ]);
    }

    /**
     * Updates an existing User model.
     *
     * @param int $id
     *
     * @return mixed
     */
    public function actionUpdate($id)
    {
        Url::remember('', 'actions-redirect');
        $user = $this->findModel($id);
        $user->scenario = 'update';
        $event = $this->getUserEvent($user);

        $this->performAjaxValidation($user);

        $this->trigger(self::EVENT_BEFORE_UPDATE, $event);
        if ($user->load(\Yii::$app->request->post()) && $user->save()) {
            \Yii::$app->session->setFlash(\dominus77\sweetalert2\Alert::TYPE_SUCCESS, [
                [
                    'title' => '',
                    'text' => \Yii::t('user', 'Account details have been updated'),
                    'showConfirmButton' => false,
                    'timer' => 3000
                ]
            ]);
            // \Yii::$app->getSession()->setFlash('success', \Yii::t('user', 'Account details have been updated'));
            $this->trigger(self::EVENT_AFTER_UPDATE, $event);
            return $this->refresh();
        }

        return $this->render('_account', [
            'user' => $user,
        ]);
    }

    /**
     * Updates an existing profile.
     *
     * @param int $id
     *
     * @return mixed
     */
    public function actionUpdateProfile($id)
    {
        Url::remember('', 'actions-redirect');
        $user    = $this->findModel($id);
        $profile = $user->profile;

        if ($profile == null) {
            $profile = \Yii::createObject(Profile::className());
            $profile->link('user', $user);
        }
        $event = $this->getProfileEvent($profile);

        $this->performAjaxValidation($profile);

        $this->trigger(self::EVENT_BEFORE_PROFILE_UPDATE, $event);

        if ($profile->load(\Yii::$app->request->post())) {
            $bdarray = (explode("/", \Yii::$app->request->post('Profile')['user_birthdate']));
            $profile->user_birthdate = $bdarray ? $bdarray[2] . '-' . $bdarray[1] . '-' . $bdarray[0] : '';
            if ($profile->save()) {
                \Yii::$app->session->setFlash(\dominus77\sweetalert2\Alert::TYPE_SUCCESS, [
                    [
                        'title' => '',
                        'text' => \Yii::t('user', 'Profile details have been updated'),
                        'showConfirmButton' => false,
                        'timer' => 3000
                    ]
                ]);
                $this->trigger(self::EVENT_AFTER_PROFILE_UPDATE, $event);
                return $this->refresh();
            }
        } else {
            $profile->user_birthdate = empty($profile->user_birthdate) ? '' : Yii::$app->formatter->asDate($profile->user_birthdate, 'php:d/m/Y');
        }

        return $this->render('_profile', [
            'user'    => $user,
            'profile' => $profile,
        ]);
    }

    public function actionUpdateGreduated($id)
    {
        Url::remember('', 'actions-redirect');
        $user    = $this->findModel($id);
        $profile = $user->profile;

        if ($profile == null) {
            $profile = \Yii::createObject(Profile::className());
            $profile->link('user', $user);
        }

        $UserGreduateds = TbUserGreduated::find()->where(['user_id' => $id])->all();
        $UserExpertises = TbUserExpertise::find()->where(['user_id' => $id])->all();

        if (empty($UserGreduateds)) {
            $UserGreduateds = [new TbUserGreduated()];
        }
        if (empty($UserExpertises)) {
            $UserExpertises = [new TbUserExpertise()];
        }

        $event = $this->getProfileEvent($profile);

        $this->performAjaxValidation($profile);

        $this->trigger(self::EVENT_BEFORE_PROFILE_UPDATE, $event);

        if ($profile->load(\Yii::$app->request->post()) && $profile->save()) {

            $oldIDs = ArrayHelper::map($UserGreduateds, 'user_greduated_ids', 'user_greduated_ids');
            $UserGreduateds = DynamicModel::createMultiple(TbUserGreduated::classname(), $UserGreduateds, 'user_greduated_ids');
            DynamicModel::loadMultiple($UserGreduateds, Yii::$app->request->post());
            $deletedIDs = array_diff($oldIDs, array_filter(ArrayHelper::map($UserGreduateds, 'user_greduated_ids', 'user_greduated_ids')));

            $oldIDs2 = ArrayHelper::map($UserExpertises, 'user_expertise_id', 'user_expertise_id');
            $UserExpertises = DynamicModel::createMultiple(TbUserExpertise::classname(), $UserExpertises, 'user_expertise_id');
            DynamicModel::loadMultiple($UserExpertises, Yii::$app->request->post());
            $deletedIDs2 = array_diff($oldIDs2, array_filter(ArrayHelper::map($UserExpertises, 'user_expertise_id', 'user_expertise_id')));


            // validate all models
            $valid = $profile->validate();
            $valid = DynamicModel::validateMultiple($UserGreduateds) && $valid;
            $valid = DynamicModel::validateMultiple($UserExpertises) && $valid;

            if ($valid) {
                $transaction = \Yii::$app->db->beginTransaction();

                try {
                    if ($flag = $profile->save()) {

                        if (!empty($deletedIDs)) {
                            TbUserGreduated::deleteAll(['user_greduated_ids' => $deletedIDs]);
                        }
                        if (!empty($deletedIDs2)) {
                            TbUserExpertise::deleteAll(['user_expertise_id' => $deletedIDs2]);
                        }
                        foreach ($UserGreduateds as $UserGreduated) {
                            $UserGreduated->user_id = $profile->user_id;
                            if (!($flag = $UserGreduated->save())) {
                                $transaction->rollBack();
                                break;
                            }
                        }
                        foreach ($UserExpertises as $UserExpertise) {
                            $UserExpertise->user_id = $profile->user_id;
                            if (!($flag = $UserExpertise->save())) {
                                $transaction->rollBack();
                                break;
                            }
                        }
                    }

                    if ($flag) {
                        $transaction->commit();
                        $this->trigger(self::EVENT_AFTER_PROFILE_UPDATE, $event);
                        \Yii::$app->session->setFlash(\dominus77\sweetalert2\Alert::TYPE_SUCCESS, [
                            [
                                'title' => '',
                                'text' => \Yii::t('user', 'Profile details have been updated'),
                                'showConfirmButton' => false,
                                'timer' => 3000
                            ]
                        ]);
                        return $this->refresh();
                    }
                } catch (\Exception $e) {
                    $transaction->rollBack();
                }
            }
        }
        return $this->render('_form_greduated', [
            'profile' => $profile,
            'user' => $user,
            'UserGreduateds' => (empty($UserGreduateds)) ? [new TbUserGreduated] : $UserGreduateds,
            'UserExpertises' => (empty($UserExpertises)) ? [new TbUserExpertise] : $UserExpertises
        ]);
    }

    /**
     * Deletes an existing User model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     *
     * @param int $id
     *
     * @return mixed
     */
    public function actionDelete($id)
    {
        if ($id == \Yii::$app->user->getId()) {
            \Yii::$app->session->setFlash(\dominus77\sweetalert2\Alert::TYPE_ERROR, [
                [
                    'title' => '',
                    'text' => \Yii::t('user', 'You can not remove your own account'),
                    'showConfirmButton' => false,
                    'timer' => 3000
                ]
            ]);
        } else {
            $model = $this->findModel($id);
            $event = $this->getUserEvent($model);
            $this->trigger(self::EVENT_BEFORE_DELETE, $event);
            $model->delete();
            $this->trigger(self::EVENT_AFTER_DELETE, $event);
            \Yii::$app->session->setFlash(\dominus77\sweetalert2\Alert::TYPE_SUCCESS, [
                [
                    'title' => '',
                    'text' => \Yii::t('user', 'User has been deleted'),
                    'showConfirmButton' => false,
                    'timer' => 3000
                ]
            ]);
        }

        return $this->redirect(['index']);
    }

    /**
     * Blocks the user.
     *
     * @param int $id
     *
     * @return Response
     */
    public function actionBlock($id)
    {
        if ($id == \Yii::$app->user->getId()) {
            \Yii::$app->session->setFlash(\dominus77\sweetalert2\Alert::TYPE_ERROR, [
                [
                    'title' => '',
                    'text' => \Yii::t('user', 'You can not block your own account'),
                    'showConfirmButton' => false,
                    'timer' => 3000
                ]
            ]);
        } else {
            $user  = $this->findModel($id);
            $event = $this->getUserEvent($user);
            if ($user->getIsBlocked()) {
                $this->trigger(self::EVENT_BEFORE_UNBLOCK, $event);
                $user->unblock();
                $this->trigger(self::EVENT_AFTER_UNBLOCK, $event);
                \Yii::$app->session->setFlash(\dominus77\sweetalert2\Alert::TYPE_SUCCESS, [
                    [
                        'title' => '',
                        'text' => \Yii::t('user', 'User has been unblocked'),
                        'showConfirmButton' => false,
                        'timer' => 3000
                    ]
                ]);
            } else {
                $this->trigger(self::EVENT_BEFORE_BLOCK, $event);
                $user->block();
                $this->trigger(self::EVENT_AFTER_BLOCK, $event);
                \Yii::$app->session->setFlash(\dominus77\sweetalert2\Alert::TYPE_SUCCESS, [
                    [
                        'title' => '',
                        'text' => \Yii::t('user', 'User has been blocked'),
                        'showConfirmButton' => false,
                        'timer' => 3000
                    ]
                ]);
            }
        }

        return $this->redirect(Url::previous('actions-redirect'));
    }

    public function actionSortUsers()
    {
        $request = Yii::$app->request;
        if ($request->isPost) {
            $response = Yii::$app->response;
            $response->format = \yii\web\Response::FORMAT_JSON;
            $idsInOrder1 = $request->post('idsInOrder1',[]);
            $idsInOrder2 = $request->post('idsInOrder2',[]);

            foreach ($idsInOrder1 as $index => $id) {
                $model = Profile::findOne($id);
                $model->user_order = $index+1;
                $model->save();
            }
            foreach ($idsInOrder2 as $index => $id) {
                $model = Profile::findOne($id);
                $model->user_order = $index+1;
                $model->save();
            }
            return 'success';
        } else {
            $usertypes = TbUsertype::find()->where(['usertype_id' => [2, 3]])->all();
            $profiles2 = Profile::find()->where(['usertype_id' => [2]])->orderBy('user_order ASC')->all();
            $profiles3 = Profile::find()->where(['usertype_id' => [3]])->orderBy('user_order ASC')->all();

            return $this->render('_form_sort_users', [
                'usertypes' => $usertypes,
                'profiles2' => $profiles2,
                'profiles3' => $profiles3
            ]);
        }
    }
}
