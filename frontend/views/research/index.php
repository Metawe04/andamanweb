<?php

use metronic\helpers\Html;
use metronic\widgets\bootstrap4\Breadcrumbs;
use yii\widgets\Pjax;

$this->title = 'งานวิจัยทั้งหมด';
$this->params['breadcrumbs'][] = ['label' => 'งานวิจัย', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;

$this->registerCss(<<<CSS
/*=======================================================================
[16] News and Event Area
=========================================================================*/
.news-event-area {
  padding: 88px 0 100px;
  background: #f5f5f5;
}
@media (min-width: 992px) and (max-width: 1199px) {
  .news-event-area {
    padding: 78px 0 60px;
  }
}
@media (min-width: 768px) and (max-width: 991px) {
  .news-event-area {
    padding: 68px 0 50px;
  }
}
@media (min-width: 480px) and (max-width: 767px) {
  .news-event-area {
    padding: 58px 0 40px;
  }
}
@media (min-width: 321px) and (max-width: 479px) {
  .news-event-area {
    padding: 48px 0 30px;
  }
}
@media only screen and (max-width: 320px) {
  .news-event-area {
    padding: 38px 0 20px;
  }
}
@media only screen and (max-width: 1199px) {
  .news-inner-area {
    margin-bottom: 30px;
  }
}
.news-inner-area .news-wrapper {
  background: #FFFFFF;
  padding: 20px 20px 15px;
}
.news-inner-area .news-wrapper li {
  background: #FFFFFF;
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-flex;
  display: -ms-flex;
  display: -o-flex;
  display: flex;
  border-bottom: 1px solid #f5f5f5;
  margin-bottom: 20px;
  padding-bottom: 20px;
  -webkit-transition: all 0.5s ease-out;
  -moz-transition: all 0.5s ease-out;
  -ms-transition: all 0.5s ease-out;
  -o-transition: all 0.5s ease-out;
  transition: all 0.5s ease-out;
}
@media only screen and (max-width: 1199px) {
  .news-inner-area .news-wrapper li {
    display: block;
  }
}
.news-inner-area .news-wrapper li .news-img-holder {
  -webkit-box-flex: 1;
  -moz-flex: 1;
  -webkit-flex: 1;
  flex: 1;
}
@media only screen and (max-width: 1199px) {
  .news-inner-area .news-wrapper li .news-img-holder {
    margin-bottom: 15px;
  }
}
.news-inner-area .news-wrapper li .news-content-holder {
  -webkit-box-flex: 2;
  -moz-flex: 2;
  -webkit-flex: 2;
  flex: 2;
}
.news-inner-area .news-wrapper li .news-content-holder h3 {
  font-weight: 500;
  font-size: 18px;
  margin-bottom: 0;
}
.news-inner-area .news-wrapper li .news-content-holder h3 a {
  color: #002147;
  -webkit-transition: all 0.3s ease-out;
  -moz-transition: all 0.3s ease-out;
  -ms-transition: all 0.3s ease-out;
  -o-transition: all 0.3s ease-out;
  transition: all 0.3s ease-out;
}
.news-inner-area .news-wrapper li .news-content-holder h3 a:hover {
  color: #fdc800;
  -webkit-transition: all 0.3s ease-out;
  -moz-transition: all 0.3s ease-out;
  -ms-transition: all 0.3s ease-out;
  -o-transition: all 0.3s ease-out;
  transition: all 0.3s ease-out;
}
.news-inner-area .news-wrapper li .news-content-holder .post-date {
  font-style: italic;
  font-size: 14px;
  margin: 5px 0;
  font-weight: 500;
  color: #fdc800;
}
.news-inner-area .news-wrapper li .news-content-holder p {
  margin-bottom: 0;
}
.news-inner-area .news-wrapper li:last-child {
  border-bottom: none;
  margin-bottom: 4px;
  padding-bottom: 0;
}
.news-inner-area .news-wrapper li:before {
  background: #fdc800;
  -webkit-transition: all 0.5s ease-out;
  -moz-transition: all 0.5s ease-out;
  -ms-transition: all 0.5s ease-out;
  -o-transition: all 0.5s ease-out;
  transition: all 0.5s ease-out;
}
@media only screen and (max-width: 1199px) {
  .news-inner-area .news-wrapper-responsive li {
    display: -webkit-box;
    display: -webkit-flex;
    display: -moz-flex;
    display: -ms-flex;
    display: -o-flex;
    display: flex;
  }
}
@media only screen and (max-width: 479px) {
  .news-inner-area .news-wrapper-responsive li {
    display: block;
  }
}
.news-inner-area .news-wrapper-responsive li .news-content-holder {
  -webkit-box-flex: 2;
  -moz-flex: 2;
  -webkit-flex: 2;
  flex: 2;
}
@media (min-width: 992px) and (max-width: 1199px) {
  .news-inner-area .news-wrapper-responsive li .news-content-holder {
    -webkit-box-flex: 4;
    -moz-flex: 4;
    -webkit-flex: 4;
    flex: 4;
  }
}
@media (min-width: 768px) and (max-width: 991px) {
  .news-inner-area .news-wrapper-responsive li .news-content-holder {
    -webkit-box-flex: 3;
    -moz-flex: 3;
    -webkit-flex: 3;
    flex: 3;
  }
}
.news-inner-area .news-btn-holder {
  margin-top: 45px;
  text-align: center;
}
.news-page-area {
  padding: 100px 0;
}
@media (min-width: 992px) and (max-width: 1199px) {
  .news-page-area {
    padding: 90px 0;
  }
}
@media (min-width: 768px) and (max-width: 991px) {
  .news-page-area {
    padding: 80px 0;
  }
}
@media (min-width: 480px) and (max-width: 767px) {
  .news-page-area {
    padding: 70px 0;
  }
}
@media (min-width: 321px) and (max-width: 479px) {
  .news-page-area {
    padding: 60px 0;
  }
}
@media only screen and (max-width: 320px) {
  .news-page-area {
    padding: 50px 0;
  }
}
.news-box {
  /* margin-bottom: 55px; */
  margin-top: 0;
  display: block;
}
.news-box h2 {
  margin-bottom: 12px;
}
.news-box p {
  margin-bottom: 30px;
}
.news-box .news-img-holder {
  margin-bottom: 25px;
  position: relative;
}
.news-date1 {
  position: absolute;
  bottom: 0;
  left: 0;
  z-index: 1;
}
.news-date1 li {
  width: 112px;
  height: 60px;
  font-size: 24px;
  text-align: center;
  line-height: 2.5;
}
@media (min-width: 480px) and (max-width: 991px) {
  .news-date1 li {
    height: 40px;
    font-size: 20px;
    width: 90px;
    line-height: 2;
  }
}
@media (min-width: 480px) and (max-width: 767px) {
  .news-date1 li {
    font-size: 18px;
    line-height: 2.3;
  }
}
@media only screen and (max-width: 479px) {
  .news-date1 li {
    height: 35px;
    font-size: 16px;
    width: 80px;
  }
}
.news-date1 li:nth-child(odd) {
  background: #002147;
  color: #FFFFFF;
  font-weight: 700;
}
.news-date1 li:nth-child(even) {
  background: #fdc800;
  color: #212121;
  font-weight: 500;
}
.news-date2 {
  position: absolute;
  bottom: 0;
  left: 0;
  z-index: 1;
}
.news-date2 li {
  width: 80px;
  height: 50px;
  font-size: 18px;
  text-align: center;
  line-height: 2.8;
}
@media (min-width: 480px) and (max-width: 991px) {
  .news-date2 li {
    height: 40px;
    font-size: 20px;
    width: 90px;
    line-height: 2;
  }
}
@media (min-width: 480px) and (max-width: 767px) {
  .news-date2 li {
    font-size: 18px;
    line-height: 2.3;
  }
}
@media only screen and (max-width: 479px) {
  .news-date2 li {
    height: 35px;
    font-size: 16px;
    width: 80px;
    line-height: 2.2;
  }
}
.news-date2 li:nth-child(odd) {
  background: #002147;
  color: #FFFFFF;
  font-weight: 700;
}
.news-date2 li:nth-child(even) {
  background: #fdc800;
  color: #212121;
  font-weight: 500;
}
.news-comments {
  /* margin-bottom: 35px; */
  padding-bottom: 10px;
}
.news-comments li {
  display: inline-block;
  margin-right: 20px;
}
@media (min-width: 992px) and (max-width: 1199px) {
  .news-comments li {
    margin-right: 8px;
  }
}
.news-comments li a {
  color: #b1b1b1;
}
.news-comments li a:hover {
  color: #002147;
}
.news-comments li a i {
  color: #fdc800;
  margin-right: 8px;
}
.news-comments li a span {
  color: #444444;
}
.news-details-page-area {
  padding: 100px 0;
}
@media (min-width: 992px) and (max-width: 1199px) {
  .news-details-page-area {
    padding: 90px 0;
  }
}
@media (min-width: 768px) and (max-width: 991px) {
  .news-details-page-area {
    padding: 80px 0;
  }
}
@media (min-width: 480px) and (max-width: 767px) {
  .news-details-page-area {
    padding: 70px 0;
  }
}
@media (min-width: 321px) and (max-width: 479px) {
  .news-details-page-area {
    padding: 60px 0;
  }
}
@media only screen and (max-width: 320px) {
  .news-details-page-area {
    padding: 50px 0;
  }
}
.news-details-page-inner .news-img-holder {
  margin-bottom: 25px;
  position: relative;
}
.news-details-page-inner .title-default-left-bold {
  margin-bottom: 20px;
}
.news-details-page-inner p span {
  font-style: italic;
  padding: 40px 50px 50px;
  background: #f5f5f5;
  display: block;
  position: relative;
  margin-bottom: 30px;
}
.news-details-page-inner p span:before {
  color: #fdc800;
  content: "\f10d";
  font-family: FontAwesome;
  font-size: 20px;
  left: 30px;
  position: absolute;
  top: 30px;
  z-index: 1;
}
.news-details-page-inner .news-social {
  margin-top: 10px;
  margin-bottom: 80px;
  display: inline-block;
}
.news-details-page-inner .news-social li {
  display: inline-block;
  margin-right: 5px;
}
.news-details-page-inner .news-social li a {
  background: #002147;
  width: 30px;
  height: 30px;
  display: block;
  text-align: center;
  line-height: 27px;
  -webkit-transition: all 0.3s ease-out;
  -moz-transition: all 0.3s ease-out;
  -ms-transition: all 0.3s ease-out;
  -o-transition: all 0.3s ease-out;
  transition: all 0.3s ease-out;
}
.news-details-page-inner .news-social li a i {
  color: #fdc800;
  font-size: 13px;
  -webkit-transition: all 0.3s ease-out;
  -moz-transition: all 0.3s ease-out;
  -ms-transition: all 0.3s ease-out;
  -o-transition: all 0.3s ease-out;
  transition: all 0.3s ease-out;
}
.news-details-page-inner .news-social li a:hover {
  background: #fdc800;
}
.news-details-page-inner .news-social li a:hover i {
  color: #002147;
}
.news-details-page-inner .news-social li:last-child {
  margin-right: 0;
}
.carousel-inner>.item>a>img, .carousel-inner>.item>img, .img-responsive, .thumbnail a>img, .thumbnail>img {
    display: block;
    max-width: 100%;
    height: auto;
}
.news-box .news-img-holder img {
    height: auto;
    width: 100%;
}
.title-default-left-bold {
    font-size: 20px;
    text-transform: capitalize;
    text-align: left;
    font-weight: 500;
    /* margin-bottom: 45px; */
    color: #002147;
}
.title-bar-high {
    position: relative;
}
.title-default-left-bold a {
    color: #002147;
    -webkit-transition: all 0.3s ease-out;
    -moz-transition: all 0.3s ease-out;
    -ms-transition: all 0.3s ease-out;
    -o-transition: all 0.3s ease-out;
    transition: all 0.3s ease-out;
}
.table td, .table th {
    padding: .75rem;
    vertical-align: top;
    border-top: 1px solid #ffffff;
}
.table thead th {
    vertical-align: bottom;
    border-bottom: 2px solid #ffffff;
}
.default-big-btn {
    color: #FFFFFF;
    padding: 15px 0;
    background: #5794d9;
    text-transform: uppercase;
    font-size: 14px;
    font-weight: 700;
    display: inline-block;
    border: none;
    width: 162px;
    text-align: center;
    -webkit-transition: all 0.5s ease-out;
    -moz-transition: all 0.5s ease-out;
    -ms-transition: all 0.5s ease-out;
    -o-transition: all 0.5s ease-out;
    transition: all 0.5s ease-out;
}
CSS
)
?>

<section>
    <div class="container">
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>

        <div class="section-title">
            <h2>
              <i class="fas fa-book"></i>
                <?= Html::encode($this->title); ?>
            </h2>
        </div>

        <?php Pjax::begin(['id' => 'research-pjax', 'timeout' => 5000]) ?>

        <?php echo $this->render('_search', ['model' => $searchModel]); ?>

        <?= yii\grid\GridView::widget([
            'dataProvider' => $dataProvider,
            'filterModel' => $searchModel,
            'showHeader' => false,
            'layout' => "{items}\n{pager}",
            'tableOptions' => ['class' => 'table'],
            'columns' => [
                [
                    'value' => function ($model, $key, $index) {
                        return  $this->render('_view', ['model' => $model]);
                    },
                    'format' => 'raw',
                    'contentOptions' => [
                        'style' => 'border-top: 1px solid #e9ecef;'
                    ]
                ],
                // [
                //     'header' => 'ชื่องานวิจัย',
                //     'attribute' => 'research_name',
                //     'value' => function($model, $key, $index){
                //         return $model['research_name'] . $model->getResearchUserName(); //เรื่อง
                //     },
                //     'format' => 'raw',

                // ],
                // [
                //     'header' => 'ชื่องานวิจัย',
                //     'attribute' => 'research_name',
                //     'value' => function ($model, $key, $index){
                //         return  Html::a('<i class="fas fa-bookmark"></i>'. ' '. $model['research_name'] , ['index'], [
                //         'data-pjax' => 0, 
                //         ]);
                //     },
                //     'format' => 'raw',
                // ],
                // [
                //     'header' => 'บทคัดย่อ',
                //     'attribute' => 'research_detail'
                // ],
                [
                    //'header' => 'ชื่องานวิจัย',
                    //'attribute' => 'attachments',
                    'value' => function ($model, $key, $index) {
                        return $model->attachmentLinks;
                    },
                    'format' => 'raw',
                    'contentOptions' => [
                        'style' => 'vertical-align: middle;border-top: 1px solid #e9ecef;'
                    ]
                ]

            ],
        ]) ?>
        <?php Pjax::end() ?>
</section>