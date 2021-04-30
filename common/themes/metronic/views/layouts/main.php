<?php
/*
 * Created by VS Code.
 * User: Tanakorn Phompak
 * Date: Wed Jun 10 2020
 * Time: 21:38:45
 */

$directoryAsset = Yii::$app->assetManager->getPublishedUrl('@metronic/assets/dist');
?>

<?php $this->beginContent('@metronic/views/layouts/_base.php', [
    'directoryAsset' => $directoryAsset,
    'bodyClass' => 'header-mobile-fixed subheader-enabled aside-enabled aside-fixed aside-secondary-enabled  aside-minimize page-loading'
]); ?>

<?= \common\widgets\SweetAlert::widget(['useSessionFlash' => true]) ?>

<div class="page-loader page-loader-base">
    <div class="blockui">
        <span>Please wait...</span>
        <span>
            <div class="spinner spinner-primary"></div>
        </span>
    </div>
</div>
<!--begin::Main-->
<div class="d-flex flex-column flex-root">
    <!--begin::Page-->
    <div class="d-flex flex-row flex-column-fluid page">
        <!--begin::Aside-->
        <?= $this->render('_aside.php', ['directoryAsset' => $directoryAsset]) ?>
        <!--end::Aside-->
        <!--begin::Wrapper-->
        <div class="d-flex flex-column flex-row-fluid wrapper" id="kt_wrapper">
            <!--begin::Content-->
            <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
                <!--begin::Subheader-->
                <?= $this->render('_subheader.php', ['directoryAsset' => $directoryAsset]) ?>
                <!--end::Subheader-->
                <!--begin::Entry-->
                <div class="d-flex flex-column-fluid">
                    <!--begin::Container-->
                    <div class="container-fluid">
                        <?= $content ?>
                    </div>
                    <!--end::Container-->
                </div>
                <!--end::Entry-->
            </div>
            <!--end::Content-->
            <!--begin::Footer-->
            <?= $this->render('_footer.php', ['directoryAsset' => $directoryAsset]) ?>
            <!--end::Footer-->
        </div>
        <!--end::Wrapper-->
    </div>
    <!--end::Page-->
</div>
<!--end::Main-->
<!--begin::Quick Actions Panel-->
<?= $this->render('_quick_actions.php', ['directoryAsset' => $directoryAsset]) ?>
<!--end::Quick Actions Panel-->
<!-- begin::User Panel-->
<?= $this->render('_quick_user.php', ['directoryAsset' => $directoryAsset]) ?>
<!-- end::User Panel-->
<!--begin::Quick Panel-->
<?= $this->render('_quick_panel.php', ['directoryAsset' => $directoryAsset]) ?>
<!--end::Quick Panel-->
<!--begin::Scrolltop-->
<?= $this->render('_scrolltop.php', ['directoryAsset' => $directoryAsset]) ?>
<!--end::Scrolltop-->

<?php $this->endContent(); ?>