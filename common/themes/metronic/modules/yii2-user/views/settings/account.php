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
use yii\helpers\Url;

/**
 * @var yii\web\View $this
 * @var yii\widgets\ActiveForm $form
 * @var dektrium\user\models\SettingsForm $model
 */

$this->title = Yii::t('user', 'Account settings');
$this->params['breadcrumbs'][] = $this->title;

$action = Yii::$app->controller->action->id;
?>

<?= $this->render('/_alert', ['module' => Yii::$app->getModule('user')]) ?>

<!--begin::Profile Personal Information-->
<div class="d-flex flex-row">
    <!--begin::Aside-->
    <div class="flex-row-auto offcanvas-mobile w-250px w-xxl-350px" id="kt_profile_aside">
        <!--begin::Profile Card-->
        <div class="card card-custom card-stretch">
            <!--begin::Body-->
            <div class="card-body pt-4">
                <!--begin::User-->
                <div class="d-flex align-items-center">
                    <div class="symbol symbol-60 symbol-xxl-100 mr-5 align-self-start align-self-xxl-center">
                        <div class="symbol-label" style="background-image:url('<?= $model->user->profile->getPictureUrl() ?>')"></div>
                        <i class="symbol-badge bg-success"></i>
                    </div>
                    <div>
                        <a href="#" class="font-weight-bolder font-size-h5 text-dark-75 text-hover-primary">
                            <?= $model->user->profile->name; ?>
                        </a>
                        <div class="text-muted"></div>
                    </div>
                </div>
                <!--end::User-->
                <!--begin::Contact-->
                <div class="py-9">
                    <div class="d-flex align-items-center justify-content-between mb-2">
                        <span class="font-weight-bold mr-2">Email:</span>
                        <a href="#" class="text-muted text-hover-primary">
                            <?= $model->user->email ?>
                        </a>
                    </div>
                </div>
                <!--end::Contact-->
                <!--begin::Nav-->
                <div class="navi navi-bold navi-hover navi-active navi-link-rounded">
                    <div class="navi-item mb-2">
                        <a href="<?= Url::to(['/user/settings/profile']); ?>" class="navi-link py-4 <?= $action == 'profile' ? 'active' : '' ?>">
                            <span class="navi-icon mr-2">
                                <span class="svg-icon">
                                    <!--begin::Svg Icon | path:assets/media/svg/icons/General/User.svg-->
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <polygon points="0 0 24 0 24 24 0 24" />
                                            <path d="M12,11 C9.790861,11 8,9.209139 8,7 C8,4.790861 9.790861,3 12,3 C14.209139,3 16,4.790861 16,7 C16,9.209139 14.209139,11 12,11 Z" fill="#000000" fill-rule="nonzero" opacity="0.3" />
                                            <path d="M3.00065168,20.1992055 C3.38825852,15.4265159 7.26191235,13 11.9833413,13 C16.7712164,13 20.7048837,15.2931929 20.9979143,20.2 C21.0095879,20.3954741 20.9979143,21 20.2466999,21 C16.541124,21 11.0347247,21 3.72750223,21 C3.47671215,21 2.97953825,20.45918 3.00065168,20.1992055 Z" fill="#000000" fill-rule="nonzero" />
                                        </g>
                                    </svg>
                                    <!--end::Svg Icon-->
                                </span>
                            </span>
                            <span class="navi-text font-size-lg">
                                <?= Yii::t('user', 'Profile') ?>
                            </span>
                        </a>
                    </div>
                    <div class="navi-item mb-2">
                        <a href="<?= Url::to(['/user/settings/account']); ?>" class="navi-link py-4 <?= $action == 'account' ? 'active' : '' ?>">
                            <span class="navi-icon mr-2">
                                <span class="svg-icon">
                                    <!--begin::Svg Icon | path:assets/media/svg/icons/Code/Compiling.svg-->
                                    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                                        <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                            <rect x="0" y="0" width="24" height="24" />
                                            <path d="M2.56066017,10.6819805 L4.68198052,8.56066017 C5.26776695,7.97487373 6.21751442,7.97487373 6.80330086,8.56066017 L8.9246212,10.6819805 C9.51040764,11.267767 9.51040764,12.2175144 8.9246212,12.8033009 L6.80330086,14.9246212 C6.21751442,15.5104076 5.26776695,15.5104076 4.68198052,14.9246212 L2.56066017,12.8033009 C1.97487373,12.2175144 1.97487373,11.267767 2.56066017,10.6819805 Z M14.5606602,10.6819805 L16.6819805,8.56066017 C17.267767,7.97487373 18.2175144,7.97487373 18.8033009,8.56066017 L20.9246212,10.6819805 C21.5104076,11.267767 21.5104076,12.2175144 20.9246212,12.8033009 L18.8033009,14.9246212 C18.2175144,15.5104076 17.267767,15.5104076 16.6819805,14.9246212 L14.5606602,12.8033009 C13.9748737,12.2175144 13.9748737,11.267767 14.5606602,10.6819805 Z" fill="#000000" opacity="0.3" />
                                            <path d="M8.56066017,16.6819805 L10.6819805,14.5606602 C11.267767,13.9748737 12.2175144,13.9748737 12.8033009,14.5606602 L14.9246212,16.6819805 C15.5104076,17.267767 15.5104076,18.2175144 14.9246212,18.8033009 L12.8033009,20.9246212 C12.2175144,21.5104076 11.267767,21.5104076 10.6819805,20.9246212 L8.56066017,18.8033009 C7.97487373,18.2175144 7.97487373,17.267767 8.56066017,16.6819805 Z M8.56066017,4.68198052 L10.6819805,2.56066017 C11.267767,1.97487373 12.2175144,1.97487373 12.8033009,2.56066017 L14.9246212,4.68198052 C15.5104076,5.26776695 15.5104076,6.21751442 14.9246212,6.80330086 L12.8033009,8.9246212 C12.2175144,9.51040764 11.267767,9.51040764 10.6819805,8.9246212 L8.56066017,6.80330086 C7.97487373,6.21751442 7.97487373,5.26776695 8.56066017,4.68198052 Z" fill="#000000" />
                                        </g>
                                    </svg>
                                    <!--end::Svg Icon-->
                                </span>
                            </span>
                            <span class="navi-text font-size-lg">
                                <?= Yii::t('user', 'Account') ?>
                            </span>
                        </a>
                    </div>
                </div>
                <!--end::Nav-->
            </div>
            <!--end::Body-->
        </div>
        <!--end::Profile Card-->
    </div>
    <!--end::Aside-->
    <!--begin::Content-->
    <div class="flex-row-fluid ml-lg-8">
        <!--begin::Card-->
        <div class="card card-custom card-stretch">
            <!--begin::Header-->
            <div class="card-header py-3">
                <div class="card-title align-items-start flex-column">
                    <h3 class="card-label font-weight-bolder text-dark">
                        <?= Html::encode($this->title); ?>
                    </h3>
                    <span class="text-muted font-weight-bold font-size-sm mt-1"></span>
                </div>
                <div class="card-toolbar">
                </div>
            </div>
            <!--end::Header-->
            <!--begin::Form-->
            <?php $form = ActiveForm::begin([
                'id' => 'account-form',
                'options' => ['class' => 'form-horizontal'],
                /* 'fieldConfig' => [
                    'template' => "{label}\n<div class=\"col-lg-9\">{input}</div>\n<div class=\"col-sm-offset-3 col-lg-9\">{error}\n{hint}</div>",
                    'labelOptions' => ['class' => 'col-lg-3 control-label'],
                ], */
                'enableAjaxValidation' => true,
                'enableClientValidation' => false,
            ]); ?>
            <!--begin::Body-->
            <div class="card-body">
                <div class="row">
                    <label class="col-xl-3"></label>
                    <div class="col-lg-9 col-xl-6">
                        <h5 class="font-weight-bold mb-6"></h5>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-xl-3 col-lg-3 col-form-label text-right">
                        <?= $model->getAttributeLabel('email') ?>
                    </label>
                    <div class="col-lg-9 col-xl-6">
                        <?= $form->field($model, 'email')->label(false) ?>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-xl-3 col-lg-3 col-form-label text-right">
                        <?= $model->getAttributeLabel('username') ?>
                    </label>
                    <div class="col-lg-9 col-xl-6">
                        <?= $form->field($model, 'username')->label(false) ?>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-xl-3 col-lg-3 col-form-label text-right">
                        <?= $model->getAttributeLabel('new_password') ?>
                    </label>
                    <div class="col-lg-9 col-xl-6">
                        <?= $form->field($model, 'new_password')->passwordInput()->label(false) ?>
                    </div>
                </div>
                <hr>
                <div class="form-group row">
                    <label class="col-xl-3 col-lg-3 col-form-label text-right">
                        <?= $model->getAttributeLabel('current_password') ?>
                    </label>
                    <div class="col-lg-9 col-xl-6">
                        <?= $form->field($model, 'current_password')->passwordInput()->label(false) ?>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-xl-3 col-lg-3 col-form-label text-right">
                    </label>
                    <div class="col-lg-9 col-xl-6">
                        <?= Html::submitButton(Yii::t('user', 'Save'), ['class' => 'btn btn-block btn-success']) ?>
                        <br>
                    </div>
                </div>
            </div>
            <!--end::Body-->
            <?php ActiveForm::end(); ?>
            <!--end::Form-->
            <?php if ($model->module->enableAccountDelete) : ?>
                <div class="panel panel-danger">
                    <div class="panel-heading">
                        <h3 class="panel-title"><?= Yii::t('user', 'Delete account') ?></h3>
                    </div>
                    <div class="panel-body">
                        <p>
                            <?= Yii::t('user', 'Once you delete your account, there is no going back') ?>.
                            <?= Yii::t('user', 'It will be deleted forever') ?>.
                            <?= Yii::t('user', 'Please be certain') ?>.
                        </p>
                        <?= Html::a(Yii::t('user', 'Delete account'), ['delete'], [
                            'class' => 'btn btn-danger',
                            'data-method' => 'post',
                            'data-confirm' => Yii::t('user', 'Are you sure? There is no going back'),
                        ]) ?>
                    </div>
                </div>
            <?php endif ?>
        </div>
    </div>
    <!--end::Content-->
</div>
<!--end::Profile Personal Information-->