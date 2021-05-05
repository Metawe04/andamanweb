<?php

use yii\helpers\Html;
use yii\helpers\Url;

$isGuest = Yii::$app->user->isGuest;
$url = Yii::$app->request->url;
?>
<div class="subheader py-2 py-lg-4  subheader-transparent " id="kt_subheader">
    <div class=" container-fluid  d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
        <!--begin::Info-->
        <div class="d-flex align-items-center flex-wrap mr-2">

            <!--begin::Page Title-->
            <h5 class="text-dark font-weight-bold mt-2 mb-2 mr-5">
                <?= Html::encode($this->title) ?>
            </h5>
            <!--end::Page Title-->

            <!--begin::Action-->
            <div class="subheader-separator subheader-separator-ver mt-2 mb-2 mr-4 bg-gray-200"></div>

            <span class="text-muted font-weight-bold mr-4"></span>

            <?= Html::a('<i class="flaticon-home-2"></i> เว็บไซต์', 'http://andaman-web.local/', [
                'class' => 'btn btn-outline-success btn-hover-primary btn-sm mr-2',
            ]) ?>
            <!--end::Action-->
        </div>
        <!--end::Info-->

        <!--begin::Toolbar-->
        <div class="d-flex align-items-center">
<?php /*
            <div class="topbar-item mr-4" data-toggle="dropdown" data-offset="10px,0px" aria-expanded="false">
                <div class="btn btn-sm btn-clean btn-text-dark-75" >
                    <span class="svg-icon svg-icon-primary">
                        <!--begin::Svg Icon | path:/metronic/themes/metronic/theme/html/demo5/dist/assets/media/svg/icons/General/Settings-2.svg--><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                <rect x="0" y="0" width="24" height="24"></rect>
                                <path d="M5,8.6862915 L5,5 L8.6862915,5 L11.5857864,2.10050506 L14.4852814,5 L19,5 L19,9.51471863 L21.4852814,12 L19,14.4852814 L19,19 L14.4852814,19 L11.5857864,21.8994949 L8.6862915,19 L5,19 L5,15.3137085 L1.6862915,12 L5,8.6862915 Z M12,15 C13.6568542,15 15,13.6568542 15,12 C15,10.3431458 13.6568542,9 12,9 C10.3431458,9 9,10.3431458 9,12 C9,13.6568542 10.3431458,15 12,15 Z" fill="#000000"></path>
                            </g>
                        </svg>
                        <!--end::Svg Icon-->
                    </span>ตั้งค่า
                </div>
            </div>
            
            <div class="dropdown-menu p-0 m-0 dropdown-menu-right dropdown-menu-anim-up dropdown-menu-md">
                <!--begin::Navigation-->
                <ul class="navi navi-hover py-5">
                    <li class="navi-item <?= $url == '/admin/user/admin/index' ? 'active' : '' ?>">
                        <a href="<?= Url::to(['/user/admin/index']) ?>" class="navi-link <?= $url == '/admin/user/admin/index' ? 'active' : '' ?>">
                            <span class="navi-icon"><i class="flaticon-users"></i></span>
                            <span class="navi-text">
                                ผู้ใช้งาน
                            </span>
                        </a>
                    </li>
                    <li class="navi-item">
                        <a href="<?= Url::to(['/rbac']) ?>" class="navi-link">
                            <span class="navi-icon"><i class="flaticon-lock"></i></span>
                            <span class="navi-text">
                                สิทธิ์การใช้งาน
                            </span>
                        </a>
                    </li>
                    <li class="navi-item">
                        <a href="<?= Url::to(['/settings/carousel/index']) ?>" class="navi-link">
                            <span class="navi-icon"><i class="flaticon2-image-file"></i></span>
                            <span class="navi-text">
                                สไลด์รูปภาพ
                            </span>
                        </a>
                    </li>
                    <li class="navi-item">
                        <a href="<?= Url::to(['/settings/page/index']) ?>" class="navi-link">
                            <span class="navi-icon"><i class="flaticon2-website"></i></span>
                            <span class="navi-text">
                                เพจ
                            </span>
                        </a>
                    </li>
                    <li class="navi-item">
                        <a href="<?= Url::to(['/settings/text/index']) ?>" class="navi-link">
                            <span class="navi-icon"><i class="flaticon-speech-bubble"></i></span>
                            <span class="navi-text">
                                ข้อความ
                            </span>
                        </a>
                    </li>
                    <li class="navi-item">
                        <a href="<?= Url::to(['/file/storage/index']) ?>" class="navi-link">
                            <span class="navi-icon"><i class="flaticon-folder-1"></i></span>
                            <span class="navi-text">File Storage</span>
                        </a>
                    </li>
                    <li class="navi-item">
                        <a href="<?= Url::to(['/file/file-manager/index']) ?>" class="navi-link">
                            <span class="navi-icon"><i class="flaticon-file-1"></i></span>
                            <span class="navi-text">File Manager</span>
                        </a>
                    </li>
                    <li class="navi-item">
                        <a href="<?= Url::to(['/settings/news/index']) ?>" class="navi-link">
                            <span class="navi-icon"><i class="flaticon-notes"></i></span>
                            <span class="navi-text">ข่าว</span>
                        </a>
                    </li>
                    <li class="navi-item">
                        <a href="<?= Url::to(['/settings/news-category/index']) ?>" class="navi-link">
                            <span class="navi-icon"><i class="flaticon-notes"></i></span>
                            <span class="navi-text">หมวดหมู่ข่าว</span>
                        </a>
                    </li>
                    <li class="navi-item">
                        <a href="<?= Url::to(['/settings/events/index']) ?>" class="navi-link">
                            <span class="navi-icon"><i class="far fa-images"></i></span>
                            <span class="navi-text">กิจกรรม</span>
                        </a>
                    </li>
                    <li class="navi-item">
                        <a href="<?= Url::to(['/settings/calendar/index']) ?>" class="navi-link">
                            <span class="navi-icon"><i class="far fa-calendar-alt"></i></span>
                            <span class="navi-text">ตารางกิจกรรม</span>
                        </a>
                    </li>

                    <li class="navi-separator my-3"></li>

                </ul>
                <!--end::Navigation-->
            </div>
*/?>
            <?php if (!$isGuest) : ?>
                <div class="topbar-item mr-4">
                    <div class="btn btn-sm btn-clean btn-text-dark-75" id="kt_quick_user_toggle">
                        <i class="flaticon2-user"></i> <?= Yii::$app->user->identity->profile->name; ?>
                    </div>
                </div>

                <!--begin::Actions-->
                <?= Html::a('<i class="flaticon-logout icon-md"></i> ออกจากระบบ', ['/user/security/logout'], [
                    'class' => 'btn btn-success btn-hover-primary btn-sm mr-2',
                    'data-method' => 'post'
                ]) ?>
                <!--end::Actions-->
            <?php endif; ?>
        </div>
        <!--end::Toolbar-->
    </div>
</div>