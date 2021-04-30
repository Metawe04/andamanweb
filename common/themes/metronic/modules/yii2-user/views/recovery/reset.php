<?php

/*
 * This file is part of the Dektrium project.
 *
 * (c) Dektrium project <http://github.com/dektrium>
 *
 * For the full copyright and license information, please view the LICENSE.md
 * file that was distributed with this source code.
 */

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/**
 * @var yii\web\View $this
 * @var yii\widgets\ActiveForm $form
 * @var dektrium\user\models\RecoveryForm $model
 */

$this->title = Yii::t('user', 'Reset your password');
$this->params['breadcrumbs'][] = $this->title;

$directoryAsset = Yii::$app->assetManager->getPublishedUrl('@metronic/assets/dist');
?>
<div class="login login-4 d-flex flex-row-fluid login-forgot-on" id="kt_login">
    <div class="d-flex flex-center flex-row-fluid bgi-size-cover bgi-position-top bgi-no-repeat" style="background-image: url('<?= $directoryAsset ?>/media/bg/bg-3.jpg');">
        <div class="login-form p-7 position-relative overflow-hidden">
            <!--begin::Login Header-->
            <div class="d-flex flex-center mb-15">
                <a href="#">
                    <img src="<?= Yii::getAlias('@web/images/logo.png'); ?>" class="max-h-75px" alt="" />
                </a>
            </div>
            <!--end::Login Header-->
            <!--begin::Login forgot password form-->
            <div class="login-forgot">
                <div class="mb-20 text-center">
                    <h3><?= Html::encode($this->title) ?></h3>
                    <div class="text-muted font-weight-bold"></div>
                </div>
                <?php $form = ActiveForm::begin([
                    'id' => 'password-recovery-form',
                    'enableAjaxValidation' => true,
                    'enableClientValidation' => false,
                ]); ?>
                <div class="form-group mb-10">
                    <?= $form->field($model, 'password')->passwordInput([
                        'autofocus' => true,
                        'class' => 'form-control form-control-solid h-auto py-4 px-8',
                        'placeholder' => $model->getAttributeLabel('password')
                    ])->label(false) ?>
                </div>
                <div class="form-group d-flex flex-wrap flex-center mt-10">
                    <?= Html::submitButton(Yii::t('user', 'Finish'), ['class' => 'btn btn-primary font-weight-bold px-9 py-4 my-3 mx-2']) ?>
                </div>
                <?php ActiveForm::end(); ?>
            </div>
            <!--end::Login forgot password form-->
        </div>
    </div>
</div>
