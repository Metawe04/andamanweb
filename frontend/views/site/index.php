<?php
/* @var $this yii\web\View */

use common\api\page\Page;
use common\api\news\News;
use metronic\helpers\Html;
use yii\helpers\Url;
use yii\widgets\Pjax;
use kartik\form\ActiveForm;
use yii\bootstrap4\Tabs;
use kartik\form\ActiveFormAsset;
use yii\widgets\ActiveFormAsset as WidgetsActiveFormAsset;

$this->title = 'หน้าหลัก';

$directoryAsset = Yii::$app->assetManager->getPublishedUrl('@mamba/assets/dist');

$pages = [
    'department',
    'technology'
];

foreach ($pages as $name) {
    $page = Page::get($name);
    echo $page->body;
}

$bundle = ActiveFormAsset::register(Yii::$app->view);
$bundle->depends[] = 'frontend\assets\AppAsset';

$bundle2 = WidgetsActiveFormAsset::register(Yii::$app->view);
$bundle2->depends[] = 'frontend\assets\AppAsset';
?>
<?php Pjax::begin(['id' => 'news-index-pjax']); ?>
<section id="news" class="news section-bg">
    <div class="container">

        <div class="section-title">
            <h2>
                Product and Service
            </h2>
        </div>
        <div class="row">
            <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
                <?php
                $items = [
                    [
                        'label' => Html::tag('i', '', ['class' => 'far fa-newspaper']) . ' ทั้งหมด',
                        'url' => Url::base(true),
                        'active' => true && $category == 'all'
                    ],
                ];

                foreach ($categories as $key => $cat) {
                    $items[] =  [
                        'label' => Html::tag('i', '', ['class' => $cat['icon']]) . ' ' . $cat['title'],
                        'url' => Url::to(['index', 'category' => $cat['category_id']]),
                        'active' => $cat['category_id'] == $category
                    ];
                }
                echo Tabs::widget([
                    'items' => $items,
                    'encodeLabels' => false
                ]);
                ?>
                <div class="row" style="order: 2">
                    <?php foreach ($news as $item) : ?>
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="news-box" data-aos="fade-up">
                                <div class="news-img-holder">
                                    <a href="<?= Url::to(['/news/view', 'slug' => $item->slug]) ?>" data-pjax="0">
                                        <?= Html::imgLazy($item->imageUrl, [
                                            'class' => 'img-responsive center-block img-news',
                                            'alt' => 'pic'
                                        ]) ?>
                                    </a>
                                    <!-- <ul class="news-date2">
                                        <li><i class="far fa-calendar-alt"></i> <?= $item->date ?></li>
                                        <li><?= $item->year ?></li>
                                    </ul> -->
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
                                    <?= Html::a('อ่านเพิ่มเติม... <i class="fas fa-arrow-circle-right"></i>', ['/news/view', 'slug' => $item->slug], ['data-pjax' => '0', 'class' => 'btn-readmore']) ?>
                                </div>

                            </div>
                            <div class="separator separator-dashed"></div>
                        </div>
                    <?php endforeach; ?>
                </div>
                <div class="row">
                    <div class="col-md-6" data-aos="fade-up">
                        <?= News::pages() ?>
                    </div>
                    <div class="col-md-6 text-right" data-aos="fade-up">
                        <?= Html::a('ดูทั้งหมด... <i class="fas fa-arrow-circle-right"></i>', ['/news'], ['data-pjax' => 0]) ?>
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
                                    <?= Html::input('text', 'search', Yii::$app->request->get('search'), [
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
                            <h3 class="sidebar-title">
                                <i class="fas fa-list-ul"></i> โครงการ
                            </h3>
                            <ul class="sidebar-categories">
                                <li>
                                    <a href="<?= Url::to(['/events']) ?>" data-pjax="0">
                                        <i class="far fa-images"></i> โครงการที่ดำเนินการแล้ว
                                    </a>
                                </li>
                                <li>
                                    <a href="<?= Url::to(['/page/view', 'slug' => 'activity']) ?>" data-pjax="0">
                                        <i class="far fa-calendar-alt"></i> ตารางงาน
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="fab fa-facebook-square"></i> Facebook
                                    </a>
                                    <div class="fb-page" data-href="https://www.facebook.com/andamanpattana" data-tabs="timeline" data-height="110" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="false"><blockquote cite="https://www.facebook.com/facebook" class="fb-xfbml-parse-ignore"><a href="https://www.facebook.com/facebook">Facebook</a></blockquote></div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="sidebar-box" data-aos="fade-up">
                        <div class="sidebar-box-inner">
                            <h3 class="sidebar-title">
                                <i class="fas fa-tags"></i> แท็ก
                            </h3>
                            <ul class="product-tags">
                                <?php foreach ($tags as $tag) : ?>
                                    <li class="<?= $tag['name'] == Yii::$app->request->get('tag') ? 'active' : '' ?>">
                                        <a href="<?= Url::to(['/site/index', 'tag' => $tag['name']]) ?>" class="label label-info"><?= $tag['name'] ?></a>
                                    </li>
                                <?php endforeach; ?>
                            </ul>
                        </div>
                    </div>
                    <div class="sidebar-box" data-aos="fade-up" style="order: 3">
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
                                                    <?= Html::imgLazy($item->imageUrl, [
                                                        'class' => 'img-responsive center-block img-news',
                                                        'alt' => 'pic',
                                                    ]) ?>
                                                </div>
                                                <div class="latest-research-content">
                                                    <!-- <h4>
                                                        <i class="far fa-calendar-alt"></i> <?= $item->date ?>, <?= $item->year ?>
                                                    </h4> -->
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
<?php Pjax::end(); ?>

<!-- <section id="team" class="team">
    <div class="container">

        <div class="section-title">
            <h2>บุคลากร</h2>
            <p></p>
        </div>

        <div class="row">

            <div class="col-xl-3 col-lg-4 col-md-6 aos-init aos-animate" data-aos="fade-up">
                <div class="member">
                    <div class="pic"><img src="<?= $directoryAsset ?>/img/team/team-1.jpg" class="img-fluid" alt=""></div>
                    <div class="member-info">
                        <h4>Walter White</h4>
                        <span>Chief Executive Officer</span>
                        <div class="social">
                            <a href=""><i class="icofont-twitter"></i></a>
                            <a href=""><i class="icofont-facebook"></i></a>
                            <a href=""><i class="icofont-instagram"></i></a>
                            <a href=""><i class="icofont-linkedin"></i></a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xl-3 col-lg-4 col-md-6 aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">
                <div class="member">
                    <div class="pic"><img src="<?= $directoryAsset ?>/img/team/team-2.jpg" class="img-fluid" alt=""></div>
                    <div class="member-info">
                        <h4>Sarah Jhonson</h4>
                        <span>Product Manager</span>
                        <div class="social">
                            <a href=""><i class="icofont-twitter"></i></a>
                            <a href=""><i class="icofont-facebook"></i></a>
                            <a href=""><i class="icofont-instagram"></i></a>
                            <a href=""><i class="icofont-linkedin"></i></a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xl-3 col-lg-4 col-md-6 aos-init aos-animate" data-aos="fade-up" data-aos-delay="200">
                <div class="member">
                    <div class="pic"><img src="<?= $directoryAsset ?>/img/team/team-3.jpg" class="img-fluid" alt=""></div>
                    <div class="member-info">
                        <h4>William Anderson</h4>
                        <span>CTO</span>
                        <div class="social">
                            <a href=""><i class="icofont-twitter"></i></a>
                            <a href=""><i class="icofont-facebook"></i></a>
                            <a href=""><i class="icofont-instagram"></i></a>
                            <a href=""><i class="icofont-linkedin"></i></a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xl-3 col-lg-4 col-md-6 aos-init aos-animate" data-aos="fade-up" data-aos-delay="300">
                <div class="member">
                    <div class="pic"><img src="<?= $directoryAsset ?>/img/team/team-4.jpg" class="img-fluid" alt=""></div>
                    <div class="member-info">
                        <h4>Amanda Jepson</h4>
                        <span>Accountant</span>
                        <div class="social">
                            <a href=""><i class="icofont-twitter"></i></a>
                            <a href=""><i class="icofont-facebook"></i></a>
                            <a href=""><i class="icofont-instagram"></i></a>
                            <a href=""><i class="icofont-linkedin"></i></a>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
</section> -->