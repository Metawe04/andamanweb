<?php

/*
 * This file is part of the Dektrium project.
 *
 * (c) Dektrium project <http://github.com/dektrium>
 *
 * For the full copyright and license information, please view the LICENSE.md
 * file that was distributed with this source code.
 */

use dektrium\user\widgets\Connect;
use dektrium\user\models\LoginForm;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\widgets\ActiveFormAsset;

$bundle = ActiveFormAsset::register(Yii::$app->view);
$bundle->depends[] = 'metronic\assets\MetronicAsset';

/**
 * @var yii\web\View $this
 * @var dektrium\user\models\LoginForm $model
 * @var dektrium\user\Module $module
 */

$this->title = Yii::t('user', 'Sign in');
$this->params['breadcrumbs'][] = $this->title;

$directoryAsset = Yii::$app->assetManager->getPublishedUrl('@metronic/assets/dist');
$this->registerCss(<<<CSS
.form-group {
    margin-bottom: 1rem !important;
}
CSS
)
?>

<?= $this->render('/_alert', ['module' => Yii::$app->getModule('user')]) ?>
<!--begin::Login-->
<div class="login login-4 login-signin-on d-flex flex-row-fluid" id="kt_login">
    <div class="d-flex flex-center flex-row-fluid bgi-size-cover bgi-position-top bgi-no-repeat" style="background-image: url('<?= $directoryAsset ?>/media/bg/bg-3.jpg');">
        <div class="login-form p-7 position-relative overflow-hidden">
            <!--begin::Login Header-->
            <div class="d-flex flex-center mb-15">
                <a href="#">
                    <img src="<?= Yii::getAlias('@web/images/logo.png'); ?>" class="max-h-75px" alt="" />
                </a>
            </div>
            <!--end::Login Header-->
            <!--begin::Login Sign in form-->
            <div class="login-signin">
                <div class="mb-20 text-center">
                    <h3><?= Html::encode($this->title) ?></h3>
                    <div class="text-muted font-weight-bold"></div>
                </div>
                <?php $form = ActiveForm::begin([
                    'id' => 'login-form',
                    'enableAjaxValidation' => true,
                    'enableClientValidation' => false,
                    'validateOnBlur' => false,
                    'validateOnType' => false,
                    'validateOnChange' => false,
                    'options' => [
                        'class' => 'form'
                    ]
                ]) ?>
                <div class="form-group mb-5">
                    <?= $form->field(
                        $model,
                        'login',
                        ['inputOptions' => ['autofocus' => 'autofocus', 'class' => 'form-control', 'tabindex' => '1', 'placeholder' => 'ชื่อผู้ใช้งานหรืออีเมล']]
                    );
                    ?>
                </div>
                <div class="form-group mb-5">
                    <?= $form->field(
                        $model,
                        'password',
                        ['inputOptions' => ['class' => 'form-control', 'tabindex' => '2', 'placeholder' => 'รหัสผ่าน']]
                    )
                        ->passwordInput()
                        ->label(
                            Yii::t('user', 'Password')
                                . ($module->enablePasswordRecovery ?
                                    ' (' . Html::a(
                                        Yii::t('user', 'Forgot password?'),
                                        ['/user/recovery/request'],
                                        ['tabindex' => '5']
                                    )
                                    . ')' : '')
                        ) ?>
                </div>
                <div class="form-group d-flex flex-wrap justify-content-between align-items-center">
                    <?= $form->field($model, 'rememberMe')->checkbox(['tabindex' => '3']) ?>
                </div>
                <?= Html::submitButton(
                    Yii::t('user', 'Sign in'),
                    ['class' => 'btn btn-primary btn-block font-weight-bold', 'tabindex' => '4']
                ) ?>
                <?php ActiveForm::end(); ?>



                <div class="mt-10">
                    <span class="opacity-70 mr-4">Don't have an account yet?</span>
                    <?php if ($module->enableRegistration) : ?>
                        <?= Html::a(Yii::t('user', 'Don\'t have an account? Sign up!'), ['/user/registration/register'], ['class' => 'text-muted text-hover-primary font-weight-bold']) ?>
                    <?php endif ?>
                    <?php if ($module->enableConfirmation) : ?>
                        <p class="text-center">
                            <?= Html::a(Yii::t('user', 'Didn\'t receive confirmation message?'), ['/user/registration/resend']) ?>
                        </p>
                    <?php endif ?>
                    <?= Connect::widget([
                        'baseAuthUrl' => ['/user/security/auth'],
                    ]) ?>
                </div>
            </div>
            <!--end::Login Sign in form-->
        </div>
    </div>
</div>
<!--end::Login-->