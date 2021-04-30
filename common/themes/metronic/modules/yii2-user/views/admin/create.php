<?php

/*
 * This file is part of the Dektrium project.
 *
 * (c) Dektrium project <http://github.com/dektrium>
 *
 * For the full copyright and license information, please view the LICENSE.md
 * file that was distributed with this source code.
 */

use yii\bootstrap\ActiveForm;
use yii\bootstrap\Nav;
use yii\helpers\Html;
use yii\helpers\Url;

/**
 * @var yii\web\View $this
 * @var dektrium\user\models\User $user
 */

$this->title = Yii::t('user', 'Create a user account');
$this->params['breadcrumbs'][] = ['label' => Yii::t('user', 'Users'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<?= $this->render('/_alert', ['module' => Yii::$app->getModule('user'),]) ?>

<!--begin::Profile Personal Information-->
<div class="d-flex flex-row">
    <!--begin::Aside-->
    <div class="flex-row-auto offcanvas-mobile w-250px w-xxl-350px" id="kt_profile_aside">
        <!--begin::Profile Card-->
        <div class="card card-custom card-stretch">
            <!--begin::Body-->
            <div class="card-body pt-4">
                <!--begin::Nav-->
                <div class="navi navi-bold navi-hover navi-active navi-link-rounded">
                    <div class="navi-item mb-2">
                        <a href="<?= Url::to(['/user/admin/index']) ?>" class="navi-link py-4 active">
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
                                <?= Yii::t('user', 'New user') ?>
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
                'layout' => 'horizontal',
                'enableAjaxValidation' => true,
                'enableClientValidation' => true,
                'fieldConfig' => [
                    'horizontalCssClasses' => [
                        'wrapper' => 'col-sm-12',
                    ],
                ],
            ]); ?>

            <!--begin::Body-->
            <div class="card-body">
                <div class="row">
                    <label class="col-xl-3"></label>
                    <div class="col-lg-9 col-xl-6">
                        <h5 class="font-weight-bold mb-6"></h5>
                    </div>
                </div>
                <?= $this->render('_user', ['form' => $form, 'user' => $user]) ?>
                <div class="form-group row">
                    <label class="col-xl-3 col-lg-3 col-form-label text-right"></label>
                    <div class="col-lg-9 col-xl-6">
                        <?= Html::submitButton(Yii::t('user', 'Save'), ['class' => 'btn btn-success ml-4']) ?>
                        <?= Html::a('ยกเลิก', ['index'], ['class' => 'btn btn-secondary']) ?>
                    </div>
                </div>
            </div>
            <!--end::Body-->
            <?php ActiveForm::end(); ?>
            <!--end::Form-->
        </div>
    </div>
    <!--end::Content-->
</div>
<!--end::Profile Personal Information-->