<?php

use yii\helpers\Url;
use yii\helpers\Html;
use yii\widgets\Menu;
?>

<!-- ======= Top Bar ======= -->
<section id="topbar" class="d-none d-lg-block">
    <div class="container clearfix">
        <div class="contact-info float-left">
            <i class="icofont-envelope"></i>
            <?= Html::mailto(Yii::$app->params['fmEmail'], Yii::$app->params['fmEmail']) ?>
            <i class="fas fa-phone-alt"></i> <?= Html::a(Yii::$app->params['fmTel'], 'tel:025334548 ', []) ?>
            <?php /* Html::img(Yii::getAlias('@web') . '/images/fax-edit.png', [
                'width' => '20px', 'class' => 'ml-2 lazyload',
                'data-src' => Yii::getAlias('@web') . '/images/fax-edit.png'
            ]) */ ?> 
            <i class="fas fa-fax"></i> <?= Yii::$app->params['fmFax'] ?>
        </div>
        <div class="social-links float-right">
            <?php /*
<a class="twitter-share-button twitter" href="https://twitter.com/intent/tweet">&nbsp;</a>
<div class="fb-share-button" data-href="<?=Url::base(true)?>" data-layout="button" data-size="small"><a target="_blank" href="<?=Url::base(true)?>" class="fb-xfbml-parse-ignore">แชร์</a></div>
 */ ?>
        </div>
    </div>
</section>

<!-- ======= Header ======= -->
<header id="header">
    <div class="container">

        <div class="logo float-left">
            <a href="<?= Url::base(true) ?>" style="font-size: 23px; padding-left: 10%;">
            Andaman Pattana LP
            </a>
            <h1 class="text-light">
                <a href="<?= Url::base(true) ?>">
                    <span>
                        ห้างหุ้นส่วนจำกัดอันดามันพัฒนา
                    </span>
                </a>
            </h1>
            <!-- Uncomment below if you prefer to use an image logo -->
            <!-- <a href="<?php // Url::base(true)
                            ?>"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
        </div>

        <nav class="nav-menu float-right d-none d-lg-block">
            <?php
            echo Menu::widget([
                'items' => [
                    ['label' => 'About Us', 'url' => ['/page/view', 'slug' => 'about']],
                    // [
                    //     'label' => 'หลักสูตร', 'url' => '#',
                    //     'options' => [
                    //         'class' => 'drop-down'
                    //     ],
                    //     'items' => [
                    //         ['label' => 'วท.บ-เทคโนโลยีระบบเกษตร', 'url' => ['/page/view', 'slug' => 'curriculum']],
                    //         ['label' => 'วท.ม-เทคโนโลยีระบบเกษตร', 'url' => ['/page/view', 'slug' => 'masterscience']],
                    //     ]
                    // ],
                    // ['label' => 'งานวิจัย', 'url' =>['/research']],
                    ['label' => 'Product and Service', 'url' => ['/news']],
                    // ['label' => 'บุคลากร', 'url' => ['/personnel']],
                    ['label' => 'Contact Us', 'url' => ['/page/view', 'slug' => 'contact']],
                    // ['label' => 'Login', 'url' => ['site/login'], 'visible' => Yii::$app->user->isGuest],
                ],
            ]);
            ?>

        </nav><!-- .nav-menu -->

    </div>
</header><!-- End Header -->