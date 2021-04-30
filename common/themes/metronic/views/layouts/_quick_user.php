<?php
use yii\helpers\Html;
use yii\helpers\Url;

$identity = Yii::$app->user->identity;
?>

<div id="kt_quick_user" class="offcanvas offcanvas-right p-10">
    <!--begin::Header-->
    <div class="offcanvas-header d-flex align-items-center justify-content-between pb-5">
        <h3 class="font-weight-bold m-0">ข้อมูลส่วนตัว
            <small class="text-muted font-size-sm ml-2"></small></h3>
        <a href="#" class="btn btn-xs btn-icon btn-light btn-hover-primary" id="kt_quick_user_close">
            <i class="ki ki-close icon-xs text-muted"></i>
        </a>
    </div>
    <!--end::Header-->
    <?php if(!Yii::$app->user->isGuest): ?>
    <!--begin::Content-->
    <div class="offcanvas-content pr-5 mr-n5">
        <!--begin::Header-->
        <div class="d-flex align-items-center mt-5">
            <div class="symbol symbol-100 mr-5">
                <div class="symbol-label" style="background-image:url('<?= $identity->profile->getPictureUrl(); ?>')"></div>
                <i class="symbol-badge bg-success"></i>
            </div>
            <div class="d-flex flex-column">
                <a href="#" class="font-weight-bold font-size-h5 text-dark-75 text-hover-primary">
                    <?= $identity->profile->name; ?>
                </a>
                <div class="text-muted mt-1"></div>
                <div class="navi mt-2">
                    <a href="#" class="navi-item">
                        <span class="navi-link p-0 pb-2">
                            <span class="navi-icon mr-1">
                                <i class="flaticon-email"></i>
                            </span>
                            <span class="navi-text text-muted text-hover-primary">
                                <?= $identity->email; ?>
                            </span>
                        </span>
                    </a>
                    <?= Html::a('ออกจากระบบ',['/auth/logout'], [
                        'class' => 'btn btn-sm btn-light-primary font-weight-bolder py-2 px-5',
                        'data-method' => 'post'
                    ]) ?>
                </div>
            </div>
        </div>
        <!--end::Header-->
        <!--begin::Separator-->
        <div class="separator separator-dashed mt-8 mb-5"></div>
        <!--end::Separator-->
        <!--begin::Nav-->
        <div class="navi navi-spacer-x-0 p-0">
            <!--begin::Item-->
            <a href="<?= Url::to(['/user/admin/index']); ?>" class="navi-item">
                <div class="navi-link">
                    <div class="symbol symbol-40 bg-light mr-3">
                        <div class="symbol-label">
                            <i class="flaticon-users"></i>
                        </div>
                    </div>
                    <div class="navi-text">
                        <div class="font-weight-bold">
                            จัดการผู้ใช้งาน
                        </div>
                    </div>
                </div>
            </a>
            <!--end:Item-->
            <!--begin::Item-->
            <a href="<?= Url::to(['/user/settings/profile']); ?>" class="navi-item">
                <div class="navi-link">
                    <div class="symbol symbol-40 bg-light mr-3">
                        <div class="symbol-label">
                            <i class="flaticon-user"></i>
                        </div>
                    </div>
                    <div class="navi-text">
                        <div class="font-weight-bold">
                            ข้อมูลส่วนตัว
                        </div>
                    </div>
                </div>
            </a>
            <!--end:Item-->
        </div>
        <!--end::Nav-->
    </div>
    <!--end::Content-->
    <?php endif; ?>
</div>