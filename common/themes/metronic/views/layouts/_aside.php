<?php
/*
 * Created by VS Code.
 * User: Tanakorn Phompak
 * Date: Thu Jun 11 2020
 * Time: 14:15:55
 */

use yii\helpers\Url;
?>
<!--begin::Aside-->
<div class="aside aside-left d-flex aside-fixed" id="kt_aside">
    <!--begin::Primary-->
    <div class="aside-primary d-flex flex-column align-items-center flex-row-auto">
        <!--begin::Brand-->
        <div class="aside-brand d-flex flex-column align-items-center flex-column-auto py-5 py-lg-12">
            <a href="<?= Url::base(true); ?>">
                <img alt="Logo" src="<?= Yii::getAlias('@web/images/logo.png'); ?>" class="max-h-20px" />
                <p  style="font-size: 10px;">
                 Andaman Pattana
                </p>
            </a>
            <!--begin::Logo-->
            <?php /*
            <a href="<?= Url::base(true); ?>">
                <img alt="Logo" src="<?= Yii::getAlias('@web/images/logo.png'); ?>" class="max-h-30px" />
            </a>
            */ ?>
            <!--end::Logo-->
        </div>
        <!--end::Brand-->

        <!--begin::Nav Wrapper-->
        <div class="aside-nav d-flex flex-column align-items-center flex-column-fluid py-5 scroll scroll-pull">
            <!--begin::Nav-->
            <ul class="nav flex-column" role="tablist">
                <!--begin::Item-->
                <li class="nav-item mb-3" data-toggle="tooltip" data-placement="right" data-container="body" data-boundary="window" title="ตั้งค่า">
                    <a id="kt_quick_actions_toggle" href="#" class="nav-link btn btn-icon btn-clean btn-lg active" role="tab">
                        <i class="flaticon-squares-4"></i>
                    </a>
                </li>
                <!--end::Item-->
            </ul>
            <!--end::Nav-->
        </div>

        <!--end::Nav Wrapper-->
    </div>
    <!--end::Primary-->
</div>
<!--end::Aside-->