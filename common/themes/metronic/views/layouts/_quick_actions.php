<?php

use yii\helpers\Url;

$menus = [
    [
        'icon' => 'flaticon-users',
        'url' => ['/user/admin/index'],
        'label' => 'ผู้ใช้งาน',
        'visible' => Yii::$app->user->can('admin')
    ],
    [
        'icon' => 'flaticon-lock',
        'url' => ['/rbac'],
        'label' => 'สิทธิ์การใช้งาน',
        'visible' => Yii::$app->user->can('admin')
    ],
    [
        'icon' => 'flaticon2-website',
        'url' => ['/settings/page/index'],
        'label' => 'เพจ',
        'visible' => Yii::$app->user->can('admin') || Yii::$app->user->can('page')
    ],
    [
        'icon' => 'fas fa-book',
        'url' => ['/settings/research/index'],
        'label' => 'งานวิจัย',
        'visible' => Yii::$app->user->can('admin') || Yii::$app->user->can('research')
    ],
    [
        'icon' => 'fas fa-user-tag',
        'url' => ['/settings/user-position/index'],
        'label' => 'ตำแหน่งงาน',
        'visible' => Yii::$app->user->can('admin')
    ],
    [
        'icon' => 'fas fa-users-cog',
        'url' => ['/user/admin/sort-users'],
        'label' => 'จัดกลุ่มบุคลากร',
        'visible' => Yii::$app->user->can('admin')
    ],
    [
        'icon' => 'flaticon2-image-file',
        'url' => ['/settings/carousel/index'],
        'label' => 'สไลด์รูปภาพ',
        'visible' => Yii::$app->user->can('admin')
    ],

    [
        'icon' => 'flaticon-speech-bubble',
        'url' => ['/settings/text/index'],
        'label' => 'ข้อความ',
        'visible' => Yii::$app->user->can('admin')
    ],
    [
        'icon' => 'flaticon-folder-1',
        'url' => ['/file/storage/index'],
        'label' => 'file Storage',
        'visible' => Yii::$app->user->can('admin')
    ],
    [
        'icon' => 'flaticon-file-1',
        'url' => ['/file/file-manager/index'],
        'label' => 'File Manager',
        'visible' => Yii::$app->user->can('admin')
    ],
    [
        'icon' => 'flaticon-notes',
        'url' => ['/settings/news/index'],
        'label' => 'ข่าว',
        'visible' => Yii::$app->user->can('admin') || Yii::$app->user->can('news')
    ],
    [
        'icon' => 'flaticon-notes',
        'url' => ['/settings/news-category/index'],
        'label' => 'หมวดหมู่ข่าว',
        'visible' => Yii::$app->user->can('admin') || Yii::$app->user->can('news')
    ],
    [
        'icon' => 'far fa-images',
        'url' => ['/settings/events/index'],
        'label' => 'กิจกรรม',
        'visible' => Yii::$app->user->can('admin') || Yii::$app->user->can('news')
    ],
    [
        'icon' => 'far fa-calendar-alt',
        'url' => ['/settings/calendar/index'],
        'label' => 'ตารางกิจกรรม',
        'visible' => Yii::$app->user->can('admin') || Yii::$app->user->can('news')
    ],

];

?>

<div id="kt_quick_actions" class="offcanvas offcanvas-left p-10">
    <!--begin::Header-->
    <div class="offcanvas-header d-flex align-items-center justify-content-between pb-10">
        <h3 class="font-weight-bold m-0 ">
            ตั้งค่า
            <small class="text-muted font-size-sm ml-2"></small>
        </h3>
        <a href="#" class="btn btn-xs btn-icon btn-light btn-hover-primary" id="kt_quick_actions_close">
            <i class="ki ki-close icon-xs text-muted"></i>
        </a>
    </div>
    <!--end::Header-->
    <!--begin::Content-->
    <div class="offcanvas-content pr-5 mr-n5">
        <div class="row gutter-b">
            <?php foreach ($menus as $key => $menu) : ?>
                <!--begin::Item-->
                <?php if ($menu['visible']) { ?>
                    <div class="col-6 mb-4">
                        <a href="<?= Url::to($menu['url']) ?>" class="btn btn-block btn-light btn-hover-primary text-dark-50 text-center ">
                            <span class="svg-icon svg-icon-3x svg-icon-primary ">
                                <i class="<?= $menu['icon'] ?> fa-2x"></i>
                                <span class="d-block font-weight-bold mt-2"><?= $menu['label'] ?></span>
                        </a>
                    </div>
                <?php } ?>
                <!--end::Item-->
            <?php endforeach; ?>
        </div>
    </div>
    <!--end::Content-->
</div>