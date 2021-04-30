<?php

use common\api\news\News;
use common\api\page\Page;
use metronic\helpers\Html;
use metronic\widgets\bootstrap4\Breadcrumbs;
use yii\helpers\Url;
use yii\widgets\Pjax;
use kartik\form\ActiveForm;
use yii\helpers\ArrayHelper;

$page = Page::get('page-news');

$this->title = $category_name ? $category_name : $page->seo('title', $page->model->title);
$this->params['breadcrumbs'][] = ['label' => 'ข่าว', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;

$this->registerMetaTag([
    'property' => 'og:site_name',
    'content' => Yii::$app->name
]);
$this->registerMetaTag([
    'property' => 'og:title',
    'content' => $this->title
]);
$this->registerMetaTag([
    'property' => 'og:url',
    'content' => Url::base(true) . Yii::$app->request->url
]);
$this->registerMetaTag([
    'name' => 'description',
    'content' => $page->seo('description', '')
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
    'content' => $page->seo('description', '')
]);
$this->registerMetaTag([
    'property' => 'twitter:image:width',
    'content' => '120'
]);
$this->registerMetaTag([
    'property' => 'twitter:image:height',
    'content' => '120'
]);
?>

<?php Pjax::begin(['id' => 'news-pjax']); ?>
<section>
    <div class="container">
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>

        <div class="section-title">
            <h2>
                <?= Html::encode($this->title); ?>
            </h2>
        </div>
        <div class="row">
            <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
                <div class="row">
                    <?php foreach ($news as $item) : ?>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="news-box" data-aos="fade-up">
                                <div class="news-img-holder">

                                <a href="<?= Url::to(['/news/view', 'slug' => $item->slug]) ?>" data-pjax="0">
                                        <?= Html::imgLazy($item->thumb(100), [
                                            'class' => 'img-responsive center-block img-news',
                                            'alt' => 'pic',
                                        ]) ?>
                                    </a>

                                    <ul class="news-date2">
                                        <li><?= $item->date ?></li>
                                        <li><?= $item->year ?></li>
                                    </ul>
                                </div>
                                <div class="news-content">
                                    <p class="title-news-left-bold no-margin">
                                        <?= Html::a($item->title, ['/news/view', 'slug' => $item->slug], ['data-pjax' => '0']) ?>
                                    </p>
                                    <ul class="title-bar-high news-comments">
                                        <li>
                                            <a href="<?= Url::to(['/news', 'create_by' => $item->createBy]); ?>"><i class="fa fa-user" aria-hidden="true"></i><span>By</span> <?= $item->author ?></a>
                                        </li>
                                        <?php if (count($item->tags) > 0) : ?>
                                            <li>
                                                <?php foreach ($item->tags as $index => $tag) : ?>
                                                    <a href="<?= Url::to(['/news', 'tag' => $tag]) ?>" class="label label-info">
                                                        <?php if ($index === 0) : ?>
                                                            <i class="fa fa-tags" aria-hidden="true"></i>
                                                        <?php endif; ?>
                                                        <?= $tag ?>
                                                        <?php if ($index + 1 < count($item->tags)) : ?>
                                                            ,
                                                        <?php endif; ?>
                                                    </a>
                                                <?php endforeach; ?>
                                            </li>
                                        <?php endif; ?>
                                        <li><a href="#"><i class="fa fa-eye" aria-hidden="true"></i><span>(<?= $item->views ?>)</span> เปิดอ่าน</a></li>
                                    </ul>
                                    <div class="new-short">
                                        <?= $item->short ?>
                                    </div>
                                    <?= Html::a('อ่านเพิ่มเติม...', ['/news/view', 'slug' => $item->slug], ['data-pjax' => '0']) ?>
                                </div>

                            </div>
                            <div class="separator separator-dashed"></div>
                        </div>
                    <?php endforeach; ?>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <?= News::pages() ?>
                    </div>
                    <div class="col-md-6 text-right">
                        <div id="share" style="font-size: 12px;"></div>
                    </div>
                </div>

            </div>
            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                <div class="sidebar">
                    <div class="sidebar-box" data-aos="fade-up">
                        <div class="sidebar-box-inner">
                            <h3 class="sidebar-title"><i class="fas fa-search"></i> ค้นหา</h3>
                            <div class="sidebar-find-course">
                                <?php
                                $form = ActiveForm::begin([
                                    'id' => 'form-search',
                                    'type' => ActiveForm::TYPE_VERTICAL,
                                    'method' => 'get',
                                    'action' => ['index'],
                                    'options' => ['data-pjax' => true]
                                ]);
                                ?>
                                <div class="form-group">
                                    <?= Html::input('text', 'search', $search, [
                                        'class' => 'form-control',
                                        'placeholder' => 'ค้นหาข่าว...'
                                    ]) ?>
                                </div>
                                <div class="form-group">
                                    <?= Html::submitButton('ค้นหา', ['class' => 'btn btn-dark']) ?>
                                    <?= Html::a('ล้าง', ['index'], ['class' => 'btn btn-secondary']) ?>
                                </div>
                                <?php ActiveForm::end(); ?>
                            </div>
                        </div>
                    </div>
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
                                                    <h4><?= $item->date ?>, <?= $item->year ?></h4>
                                                    <?= $item->title ?>
                                                </div>
                                            </a>
                                        </li>
                                    <?php endforeach; ?>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="sidebar-box" data-aos="fade-up">
                        <div class="sidebar-box-inner">
                            <h3 class="sidebar-title"><i class="fas fa-tags"></i> แท็ก</h3>
                            <ul class="product-tags">
                                <?php foreach ($tags as $tag) : ?>
                                    <li>
                                        <a href="<?= Url::to(['/news', 'tag' => $tag['name']]) ?>" class="label label-info"><?= $tag['name'] ?></a>
                                    </li>
                                <?php endforeach; ?>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<?php Pjax::end(); ?>

<?php
$this->registerJs(<<<JS
$("#news-pjax").on("pjax:success", function() {
    $('html, body').animate({
      scrollTop: 0
    }, 1500, 'easeInOutExpo');
});
JS
);
?>