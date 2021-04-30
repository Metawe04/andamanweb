<?php

/*
 * This file is part of the Dektrium project.
 *
 * (c) Dektrium project <http://github.com/dektrium>
 *
 * For the full copyright and license information, please view the LICENSE.md
 * file that was distributed with this source code.
 */

use yii\bootstrap\Nav;
use yii\helpers\Url;
use yii\helpers\Html;

/**
 * @var \yii\web\View $this
 * @var \dektrium\user\models\User $user
 * @var string $content
 */




$directoryAsset = Yii::$app->assetManager->getPublishedUrl('@metronic/assets/dist');
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
                        <div class="symbol-label" style="background-image:url('<?= $user->profile->getPictureUrl() ?>')"></div>
                        <i class="symbol-badge bg-success"></i>
                    </div>
                    <div>
                        <a href="#" class="font-weight-bolder font-size-h5 text-dark-75 text-hover-primary">
                            <?= $user->profile->name; ?>
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
                            <?= $user['email']; ?>
                        </a>
                    </div>
                </div>
                <!--end::Contact-->

                <!--begin::Nav เมนู-->  
                <div class="navi navi-bold navi-hover navi-active navi-link-rounded">
                    <div class="navi-item mb-2">
                        <a href="<?= Url::to(['/user/admin/update', 'id' => $user->id]); ?>" class="navi-link py-4 <?= $action == 'update' ? 'active' : '' ?>">
                            <span class="navi-text font-size-lg">
                                <i class="flaticon2-user"></i> <?= Yii::t('user', 'Account details') ?>
                            </span>
                        </a>
                    </div>
                    <div class="navi-item mb-2">
                        <a href="<?= Url::to(['/user/admin/update-profile', 'id' => $user->id]); ?>" class="navi-link py-4 <?= $action == 'update-profile' ? 'active' : '' ?>">
                            <span class="navi-text font-size-lg">
                                <i class="flaticon-list-2"></i> <?= Yii::t('user', 'Profile details') ?>
                            </span>
                        </a>
                    </div>
                    <div class="navi-item mb-2">
                        <a href="<?= Url::to(['/user/admin/update-greduated', 'id' => $user->id]); ?>" class="navi-link py-4 <?= $action == 'update-greduated' ? 'active' : '' ?>">
                            <span class="navi-text font-size-lg">
                                <i class="flaticon-list-2"></i> <?= Yii::t('user', 'ข้อมูลการศึกษา') ?> <!--ข้อมูลการศึกษา--->
                            </span>
                        </a>
                    </div>
                    <div class="navi-item mb-2">
                        <a href="<?= Url::to(['/user/admin/info', 'id' => $user->id]); ?>" class="navi-link py-4 <?= $action == 'info' ? 'active' : '' ?>">
                            <span class="navi-text font-size-lg">
                                <i class="flaticon-list-2"></i> <?= Yii::t('user', 'Information') ?>
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
                    <?php if (!$user->isConfirmed) : ?>
                        <?= Html::a(Yii::t('user', 'Confirm'), ['/user/admin/confirm', 'id' => $user->id], [
                            'class' => 'btn btn-success mr-2',
                            'data-method' => 'post',
                            'data-confirm' => Yii::t('user', 'Are you sure you want to confirm this user?'),
                        ]) ?>
                    <?php endif; ?>
                    <?php if (!$user->isBlocked) : ?>
                        <?= Html::a(Yii::t('user', 'Block'), ['/user/admin/block', 'id' => $user->id], [
                            'class' => 'btn btn-danger mr-2',
                            'data-method' => 'post',
                            'data-confirm' => Yii::t('user', 'Are you sure you want to block this user?'),
                        ]) ?>
                    <?php endif; ?>
                    <?php if ($user->isBlocked) : ?>
                        <?= Html::a(Yii::t('user', 'Unblock'), ['/user/admin/block', 'id' => $user->id], [
                            'class' => 'btn btn-success mr-2',
                            'data-method' => 'post',
                            'data-confirm' => Yii::t('user', 'Are you sure you want to unblock this user?'),
                        ]) ?>
                    <?php endif; ?>
                    <?= Html::a(Yii::t('user', 'Delete'), ['/user/admin/delete', 'id' => $user->id], [
                        'class' => 'btn btn-danger mr-2',
                        'data-method' => 'post',
                        'data-confirm' => Yii::t('user', 'Are you sure you want to delete this user?'),
                    ]) ?>
                </div>
            </div>
            <!--end::Header-->
            <!--begin::Form-->
            <?= $content ?>
            <!--end::Form-->
        </div>
    </div>
    <!--end::Content-->
</div>
<!--end::Profile Personal Information-->