<?php

use metronic\helpers\Html;
use kartik\form\ActiveForm;
use yii\bootstrap4\Breadcrumbs;
use yii\helpers\Url;

$this->title = $model['research_name'];
$this->params['breadcrumbs'][] = ['label' => 'งานวิจัย', 'url' => ['/research']];
$this->params['breadcrumbs'][] = $this->title;

$css = <<<CSS
.news-comments li {
    display: block;
    margin-right: 20px;
}
.news-comments li a {
    color: #007bff;
    font-size: 13px;
}
CSS;
$this->registerCss($css);
$style = <<<CSS
.news-img-holder{
    height: 400px;
    width: 100%;
}
.news-img-holder img {
    max-width: 100%;
    max-height: 100%;
    margin: auto;
    display: block;
}

.count-box a:hover .demo-gallery-poster {
    background-color: rgba(0, 0, 0, 0.5);
}
.count-box .demo-gallery-poster {
    /* background-color: rgba(0, 0, 0, 0.1); */
    border-radius: .48rem;
    bottom: 0;
    left: 0;
    position: absolute;
    right: 0;
    top: 0;
    -webkit-transition: background-color 0.15s ease 0s;
    -o-transition: background-color 0.15s ease 0s;
    transition: background-color 0.15s ease 0s;
}
.count-box .demo-gallery-poster > img {
    left: 50%;
    margin-left: -10px;
    margin-top: -10px;
    opacity: 0;
    position: absolute;
    top: 50%;
    -webkit-transition: opacity 0.3s ease 0s;
    -o-transition: opacity 0.3s ease 0s;
    transition: opacity 0.3s ease 0s;
}
.count-box  a:hover > img {
    -webkit-transform: scale3d(1.1, 1.1, 1.1);
    transform: scale3d(1.1, 1.1, 1.1);
}
.count-box a:hover .demo-gallery-poster > img {
    opacity: 1;
}
CSS;
$this->registerCss($style);
?>
<section>
    <div class="container">
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>



        <div class="row">
            <div class="col-lg-9 col-md-9 col-sm-8 col-xs-12">
                <h1 class="title-default-left-bold-lowhight">
                    <a href="#">
                        <?= $model['research_name'] ?>
                    </a>
                </h1>
                <ul class="title-bar-high news-comments">
                    <li>
                        <a href="#">
                            <i class="fa fa-user" aria-hidden="true">
                            </i>
                            <span>รายชื่อผู้ทำวิจัย : </span>
                            <?= $model->researchUserName ?>
                        </a>
                    </li>
                    <li><a href="#">
                            <i class="fa fa-tags" aria-hidden="true">
                            </i>
                            <span>ประเภทงานวิจัย :</span> <?php echo $model->researchTypeWork->research_type_work_name ?>
                        </a>
                    </li>
                    <li><a href="#">
                            <i class="fa fa-tags" aria-hidden="true">
                            </i>
                            <span>ลักษณะงานวิจัย :</span> <?php echo $model->researchType->research_type_name ?>
                        </a>
                    </li>
                    <li><a href="#">
                            <i class="far fa-calendar-alt" aria-hidden="true">
                            </i>
                            <span>ช่วงเวลาที่ทำวิจัย :</span> <?= $model['research_date_begin'] ?> - <?= $model['research_date_end'] ?>
                        </a>
                    </li>

                </ul>
                <br>
                <h5>
                    บทคัดย่อ :
                </h5>
                <P>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <?= $model['research_detail'] ?>
                </P>
                <br>
                <?php if (count($model->photosAttachments)) : ?>
                    <div class="row counts">
                        <?php foreach ($model->photosAttachments as $file) : ?>
                            <div class="col-lg-3 col-md-6 text-center aos-init aos-animate no-padding" data-aos="fade-up">
                                <div class="count-box" style="padding: 5px;margin-bottom: 10px;">
                                    <a class="gallery-box" href="<?= $file->url ?>" data-fancybox="gallery" data-caption="<?= $file->name ?>">
                                        <img class="img-responsive center-block" src="<?= $file->url ?>" alt="event" style="width: 100%;height: 120px;">
                                        <div class="demo-gallery-poster">
                                            <img src="/images/zoom.png" alt="">
                                        </div>
                                    </a>
                                </div>
                            </div>
                        <?php endforeach; ?>
                    </div>
                <?php endif; ?>
                <br>
                <h5>
                    <i class="far fa-file-alt fa-1x"></i> ไฟล์แนบ
                </h5>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <?php echo $model->researchAttachment ? $model->attachmentLinks : '<p class="text-danger" style ="font-size:12pt;"><i class="far fa-times-circle"></i> ไม่พบไฟล์แนบ</p>' ?>
                <br>

                <?php /*
                <h4>
                    <i class="far fa-file-alt fa-1x"></i> ไฟล์แนบ
                </h4>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <?php echo empty($model->attachmentLinks) ? $model->attachmentLinks : '<p class="text-danger" style ="font-size:12pt;"><i class="far fa-times-circle"></i> ไม่พบไฟล์แนบ</p>' ?>
             */ ?>
                <br>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
                <div class="sidebar-box">
                    <div class="sidebar-box-inner">
                        <h3 class="sidebar-title">งานวิจัยที่เกี่ยวข้อง</h3>
                        <div class="sidebar-latest-research-area">
                            <ul class="p-0">
                                <?php foreach ($models as $model) : ?>
                                    <li>
                                        <div class="latest-research-content">
                                            <?php echo Html::a('<p>' . $model->research_name . '</p>', ['/research/view', 'id' => $model['research_id']], []) ?>
                                        </div>
                                    </li>
                                <?php endforeach ?>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <?php echo Html::a('<i class="fas fa-arrow-circle-left"></i> กลับไปหน้างานวิจัย', ['/research/index'], ['style' => 'font-size:18px;', 'data-pjax' => 0]) ?>

    </div>


</section>