<?php

use common\api\events\Events;
use common\api\page\Page;
use metronic\helpers\Html;
use metronic\widgets\bootstrap4\Breadcrumbs;
use yii\helpers\Url;
use yii\widgets\Pjax;
use kartik\form\ActiveForm;
use yii\helpers\ArrayHelper;

$page = Page::get('page-events');

$this->title = $page->seo('title', $page->model->title);
$this->params['breadcrumbs'][] = ['label' => 'กิจกรรม', 'url' => ['index']];
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
?>

<?php Pjax::begin(['id' => 'events-pjax']); ?>
<section>
  <div class="container">
    <?= Breadcrumbs::widget([
      'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
    ]) ?>

    <div class="section-title">
      <h2>
        <?= Html::encode($this->title); ?> <?= Yii::$app->request->get('tag') ? '#' . Yii::$app->request->get('tag') : '' ?>
      </h2>
    </div>

    <div class="row">
      <div class="col-lg-9 col-md-9 col-sm-8 col-xs-12 col-md-push-3">
        <div class="row">
          <!-- <div class="courses-box1">
              <div class="single-item-wrapper">
                <div class="courses-img-wrapper hvr-bounce-to-bottom">
                  <img class="img-responsive" src="https://www.radiustheme.com/demo/html/academics/academics/img/course/1.jpg" alt="courses">
                  <a href="#"><i class="fa fa-link" aria-hidden="true"></i></a>
                </div>
                <div class="courses-content-wrapper">
                  <h3 class="item-title"><a href="#">Basic Philosopphy</a></h3>
                  <p class="item-content">Rmply dummy text printing setting industry it’s free demo.</p>
                  <ul class="courses-info">
                    <li>7 Months
                      <br><span> Course</span></li>
                    <li>30
                      <br><span> Classes</span></li>
                    <li>10 pm - 11 pm
                      <br><span> Classes</span></li>
                  </ul>
                </div>
              </div>
            </div> -->
          <?php foreach ($events as $item) : ?>
            <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">

              <div class="single-item" data-aos="fade-up">
                <div class="item-img">
                  <a href="<?= Url::to(['/events/view', 'slug' => $item->slug]); ?>" data-pjax="0">
                    <?= Html::imgLazy($item->imageUrl, [
                      'class' => 'img-responsive center-block img-event',
                      'alt' => 'event',
                    ]) ?>
                  </a>
                </div>
                <div class="item-content">
                  <!-- <h3 class="sidebar-title"><a href="#"></a></h3> -->
                  <?= $item->title ?>
                  <ul class="event-info-block">
                    <li class="event-date"><i class="far fa-calendar-alt"></i> <?= $item->date ?>, <?= $item->year ?></li>
                  </ul>
                </div>
              </div>
            </div>
          <?php endforeach; ?>
        </div>
        <div class="row">
          <div class="col-md-6">
            <?= Events::pages() ?>
          </div>
          <div class="col-md-6 text-right">
            <div id="share" style="font-size: 12px;"></div>
          </div>
        </div>
      </div>
      <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12 col-md-pull-9">
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
                    'placeholder' => 'ค้นหา...'
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
              <h3 class="sidebar-title"><i class="fas fa-tags"></i> แท็ก</h3>
              <ul class="product-tags">
                <?php foreach ($tags as $tag) : ?>
                  <li>
                    <a href="<?= Url::to(['/events', 'tag' => $tag['name']]) ?>" class="label label-info"><?= $tag['name'] ?></a>
                  </li>
                <?php endforeach; ?>
              </ul>
            </div>
          </div>
          <div class="sidebar-box" data-aos="fade-up">
            <div class="sidebar-box-inner">
              <h3 class="sidebar-title">
                <i class="far fa-newspaper"></i> กิจกรรมล่าสุด
              </h3>
              <div class="sidebar-latest-research-area">
                <ul class="last-news">
                  <?php foreach (Events::last(5) as $key => $item) : ?>
                    <li data-aos="fade-up">
                      <a href="<?= Url::to(['/events/view', 'slug' => $item->slug]) ?>" data-pjax="0">
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
        </div>
      </div>
    </div>
  </div>
</section>
<?php Pjax::end(); ?>