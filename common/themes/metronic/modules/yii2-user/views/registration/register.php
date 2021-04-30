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
 * @var dektrium\user\models\User $model
 * @var dektrium\user\Module $module
 */

$this->title = Yii::t('user', 'Sign up');
$this->params['breadcrumbs'][] = $this->title;

$directoryAsset = Yii::$app->assetManager->getPublishedUrl('@metronic/assets/dist');
?>
<div class="login login-4 d-flex flex-row-fluid login-signup-on" id="kt_login">
    <div class="d-flex flex-center flex-row-fluid bgi-size-cover bgi-position-top bgi-no-repeat" style="background-image: url('<?= $directoryAsset ?>/media/bg/bg-3.jpg');">
        <div class="login-form p-7 position-relative overflow-hidden">
            <!--begin::Login Header-->
            <div class="d-flex flex-center mb-15">
                <a href="#">
                    <img src="<?= Yii::getAlias('@web/images/logo.png'); ?>" class="max-h-75px" alt="" />
                </a>
            </div>
            <!--end::Login Header-->
            <div class="login-signup">
                <div class="mb-20 text-center">
                    <h3><?= Html::encode($this->title) ?></h3>
                    <div class="text-muted font-weight-bold">Enter your details to create your account</div>
                </div>
                <?php $form = ActiveForm::begin([
                    'id' => 'registration-form',
                    'enableAjaxValidation' => true,
                    'enableClientValidation' => false,
                ]); ?>
                <div class="form-group mb-5">
                    <?= $form->field($model, 'name')->textInput([
                        'class' => 'form-control h-auto form-control-solid py-4 px-8',
                        'placeholder' => $model->getAttributeLabel('name')
                    ]) ?>
                </div>
                <div class="form-group mb-5">
                    <?= $form->field($model, 'email')->textInput([
                        'class' => 'form-control h-auto form-control-solid py-4 px-8',
                        'placeholder' => $model->getAttributeLabel('email')
                    ]) ?>
                </div>
                <div class="form-group mb-5">
                    <?= $form->field($model, 'username')->textInput([
                        'class' => 'form-control h-auto form-control-solid py-4 px-8',
                        'placeholder' => $model->getAttributeLabel('username')
                    ]) ?>
                </div>

                <?php if ($module->enableGeneratingPassword == false) : ?>
                    <div class="form-group mb-5">
                        <?= $form->field($model, 'password')->passwordInput([
                            'class' => 'form-control h-auto form-control-solid py-4 px-8',
                            'placeholder' => $model->getAttributeLabel('password')
                        ]) ?>
                    </div>
                <?php endif ?>

                <div class="form-group d-flex flex-wrap flex-center mt-10">
                    <?= Html::submitButton(Yii::t('user', 'Sign up'), ['class' => 'btn btn-primary font-weight-bold px-9 py-4 my-3 mx-2']) ?>
                    <?= Html::a(Yii::t('user', 'Already registered? Sign in!'), ['/auth/login'], ['class' => 'btn btn-light-primary font-weight-bold px-9 py-4 my-3 mx-2']) ?>
                </div>
                <?php ActiveForm::end(); ?>
            </div>
        </div>
    </div>
</div>