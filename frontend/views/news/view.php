<?php

use common\api\news\News;
use yii\helpers\Url;
use metronic\helpers\Html;
use yii\bootstrap4\Breadcrumbs;

$this->title = $news->seo('title', $news->model->title);
$this->params['breadcrumbs'][] = ['label' => 'ข่าว', 'url' => ['/news/index']];
$this->params['breadcrumbs'][] = $news->model->title;

$this->registerMetaTag([
    'property' => 'og:site_name',
    'content' => Yii::$app->name
]);
$this->registerMetaTag([
    'property' => 'og:type',
    'content' => 'website'
]);
$this->registerMetaTag([
    'property' => 'og:title',
    'content' => $news->seo('title', $news->model->title)
]);
$this->registerMetaTag([
    'property' => 'og:url',
    'content' => Url::base(true) . Yii::$app->request->url
]);
$this->registerMetaTag([
    'name' => 'description',
    'content' => $news->seo('description', '')
]);
$this->registerMetaTag([
    'property' => 'twitter:site',
    'content' => Yii::$app->name
]);
$this->registerMetaTag([
    'property' => 'twitter:title',
    'content' => $this->title
]);
$this->registerMetaTag([
    'property' => 'twitter:description',
    'content' => $news->seo('description', '')
]);
if ($news->imageUrl) {
    $this->registerMetaTag([
        'property' => 'og:image',
        'content' => $news->imageUrl
    ]);
}
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
                <div class="row news-details-page-inner data-aos=" fade-up">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <?php if ($news->imageUrl) : ?>
                            <div class="news-img-holder" data-aos="fade-up">
                                <?= Html::img($news->imageUrl, ['class' => 'img-responsive', 'alt' => 'pic', 'style' => 'min-width: 100%;max-height: 400px;']) ?>
                                <!-- <ul class="news-date1">
                                    <li>
                                        <?= $news->date ?>
                                    </li>
                                    <li>
                                        <?= $news->year ?>
                                    </li>
                                </ul> -->
                            </div>
                        <?php endif; ?>
                        <h4 class="title-default-left-bold-lowhight" data-aos="fade-up">
                            <a href="#"><?= $news->title ?></a>
                        </h4>
                        <ul class="title-bar-high news-comments" data-aos="fade-up">
                            <li>
                                <a href="#"><i class="fa fa-user" aria-hidden="true">
                                    </i><span>By</span> <?= $news->author ?>
                                </a>
                            </li>

                            <li>
                                <?php foreach ($news->tags as $index => $tag) : ?>
                                    <a href="<?= Url::to(['/news', 'tag' => $tag]) ?>" class="label label-info">
                                        <?php if ($index === 0) : ?>
                                            <i class="fa fa-tags" aria-hidden="true"></i>
                                        <?php endif; ?>
                                        <?= $tag ?>
                                        <?php if ($index + 1 < count($news->tags)) : ?>
                                            ,
                                        <?php endif; ?>
                                    </a>
                                <?php endforeach; ?>
                            </li>

                            <li><a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i><span>(<?= $news->views ?>)</span> อ่าน</a></li>
                        </ul>
                        <div class="news-details-content" data-aos="fade-up">
                            <?= $news->text ?>

                            <?php if (count($news->attachments)) : ?>
                                <div>
                                    <h4>ไฟล์แนบ:</h4>
                                    <ul class="attachments" style="list-style: outside none none;">
                                        <?php foreach ($news->attachments as $file) : ?>
                                            <li>
                                                <?= $file->link() ?>
                                            </li>
                                        <?php endforeach; ?>
                                    </ul>
                                </div>
                                <br />
                            <?php endif; ?>

                            <?php if (count($news->photos)) : ?>
                                <h4> อัลบั้มภาพ: </h4>
                                <div class="row counts">
                                    <?php foreach ($news->photos as $file) : ?>
                                        <div class="col-lg-3 col-md-6 text-center aos-init aos-animate no-padding" data-aos="fade-up">
                                            <div class="count-box" style="padding: 5px;margin-bottom: 10px;">
                                                <?= $file->box(150, 150) ?>
                                            </div>
                                        </div>
                                    <?php endforeach; ?>
                                </div>
                            <?php endif; ?>

                            <div class="small-muted">Views: <?= $news->views ?></div>
                        </div>
                        <div id="share" style="font-size: 12px;"></div>
                        <!-- <div class="fb-share-button" data-href="<?= Yii::$app->request->url ?>" data-layout="button" data-size="small"></div> -->
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
                <div class="sidebar">
                    <div class="sidebar-box" data-aos="fade-up">
                        <div class="sidebar-box-inner">
                            <h3 class="sidebar-title"><i class="fas fa-list"></i> หมวดหมู่</h3>
                            <ul class="sidebar-categories">
                                <?php foreach ($categories as $key => $cat) : ?>
                                    <li class="<?= Yii::$app->request->get('category') == $cat['category_id'] ? 'active' : '' ?>">
                                        <?= Html::a($cat['title'], ['index', 'category' => $cat['category_id']]) ?>
                                    </li>
                                <?php endforeach; ?>
                            </ul>
                        </div>
                    </div>
                    <div class="sidebar-box" data-aos="fade-up">
                        <div class="sidebar-box-inner">
                            <h3 class="sidebar-title">
                                <i class="far fa-newspaper"></i> ข่าวล่าสุด
                            </h3>
                            <div class="sidebar-latest-research-area">
                                <ul class="last-news">
                                    <?php foreach (News::last(5) as $key => $item) : ?>
                                        <li data-aos="fade-up">
                                            <a href="<?= Url::to(['/news/view', 'slug' => $item->slug]) ?>" data-pjax="0">
                                                <div class="latest-research-img">
                                                    <?= Html::imgLazy($item->thumb(80, 62), [
                                                        'class' => 'img-responsive center-block img-news',
                                                        'alt' => 'pic',
                                                    ]) ?>
                                                </div>
                                                <div class="latest-research-content">
                                                    <!-- <h4><?= $item->date ?>, <?= $item->year ?></h4> -->
                                                    <?= $item->title ?>
                                                </div>
                                            </a>
                                        </li>
                                    <?php endforeach; ?>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>