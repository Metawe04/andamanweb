<?php
/*
 * Created by VS Code.
 * User: Tanakorn Phompak
 * Date: Wed Jun 10 2020
 * Time: 07:12:01
 */

namespace metronic\user\controllers;

use dektrium\user\controllers\SettingsController as BaseSettingsController;
use dektrium\user\models\SettingsForm;
use metronic\user\models\Profile;
use trntv\filekit\actions\DeleteAction;
use trntv\filekit\actions\UploadAction;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;
use common\models\TbUserGreduated;
use common\base\DynamicModel;
use common\components\DateConvert;
use common\models\TbUserExpertise;
use dektrium\user\models\User;
use kartik\form\ActiveForm;
use Yii;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;
use common\models\TbUserPosition;
use common\models\search\TbUserPositionSearch;

class SettingsController extends BaseSettingsController
{
    /** @inheritdoc */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'disconnect' => ['post'],
                    'delete'     => ['post'],
                ],
            ],
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'allow'   => true,
                        'actions' => ['profile', 'account', 'networks', 'disconnect', 'delete', 'upload-avatar', 'delete-avatar', 'greduated'],
                        'roles'   => ['@'],
                    ],
                    [
                        'allow'   => true,
                        'actions' => ['confirm'],
                        'roles'   => ['?', '@'],
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
     * Shows profile settings form.
     *
     * @return string|\yii\web\Response
     */
    public function actionProfile()
    {
        $model = $this->finder->findProfileById(\Yii::$app->user->identity->getId());

        if ($model == null) {
            $model = \Yii::createObject(Profile::className());
            $model->link('user', \Yii::$app->user->identity);
        }

        $event = $this->getProfileEvent($model);

        $this->performAjaxValidation($model);

        $this->trigger(self::EVENT_BEFORE_PROFILE_UPDATE, $event);
        if ($model->load(\Yii::$app->request->post())) {
            $bdarray = (explode("/", \Yii::$app->request->post('Profile')['user_birthdate']));
            $model->user_birthdate = $bdarray ? $bdarray[2].'-'.$bdarray[1].'-'.$bdarray[0] : '';
            if ($model->save()) {
                \Yii::$app->session->setFlash(\dominus77\sweetalert2\Alert::TYPE_SUCCESS, [
                    [
                        'title' => '',
                        'text' => \Yii::t('user', 'Your profile has been updated'),
                        'showConfirmButton' => false,
                        'timer' => 3000
                    ]
                ]);
                $this->trigger(self::EVENT_AFTER_PROFILE_UPDATE, $event);
                return $this->refresh();
            }
        } else {
            $model->user_birthdate = empty($model->user_birthdate) ? '' : Yii::$app->formatter->asDate($model->user_birthdate, 'php:d/m/Y');
        }

        return $this->render('profile', [
            'model' => $model,
        ]);
    }

    /**
     * Displays page where user can update account settings (username, email or password).
     *
     * @return string|\yii\web\Response
     */
    public function actionAccount()
    {
        /** @var SettingsForm $model */
        $model = \Yii::createObject(SettingsForm::className());
        $event = $this->getFormEvent($model);

        $this->performAjaxValidation($model);

        $this->trigger(self::EVENT_BEFORE_ACCOUNT_UPDATE, $event);
        if ($model->load(\Yii::$app->request->post()) && $model->save()) {
            \Yii::$app->session->setFlash(\dominus77\sweetalert2\Alert::TYPE_SUCCESS, [
                [
                    'title' => '',
                    'text' => \Yii::t('user', 'Your account details have been updated'),
                    'showConfirmButton' => false,
                    'timer' => 3000
                ]
            ]);
            $this->trigger(self::EVENT_AFTER_ACCOUNT_UPDATE, $event);
            return $this->refresh();
        }

        return $this->render('account', [
            'model' => $model,
        ]);
    }

    public function actionGreduated()
    {
        Url::remember('', 'actions-redirect');
        $profile = $this->finder->findProfileById(\Yii::$app->user->identity->getId());

        if ($profile == null) {
            $profile = \Yii::createObject(Profile::className());
            $profile->link('user', \Yii::$app->user->identity);
        }
        $UserGreduateds = TbUserGreduated::find()->where(['user_id' => \Yii::$app->user->identity->getId()])->all();
        $UserExpertises = TbUserExpertise::find()->where(['user_id' => \Yii::$app->user->identity->getId()])->all();

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
            'UserGreduateds' => (empty($UserGreduateds)) ? [new TbUserGreduated] : $UserGreduateds,
            'UserExpertises' => (empty($UserExpertises)) ? [new TbUserExpertise] : $UserExpertises
        ]);
    }

}
