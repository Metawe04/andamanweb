<?php

use common\api\page\Page;
use metronic\helpers\Html;
use metronic\widgets\bootstrap4\Breadcrumbs;
use yii\helpers\Url;
use yii\widgets\Pjax;
use kartik\form\ActiveForm;
use yii\helpers\ArrayHelper;


$this->title = 'บุคลากร';
$this->params['breadcrumbs'][] = ['label' => 'บุคลากร', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;

$this->registerCss(<<<CSS
.sortable {
        width: 90%;
        max-width: 800px;
        margin: 20px auto;
        padding: 5px 10px;
        list-style-type: none;
        text-align: center;
        transition: ease 0.2s;
      }

      .sortable li {
        display: inline-block;
        position: relative;
        width: 170px;
        height: 170px;
        margin: 10px;
        margin-bottom: 20px;
        padding: 5px;
        background: #ffffff;
        box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1), 0 3px 3px rgba(0, 0, 0, 0.12);
      }

      .sortable li:hover {
        background: #f5f5f5;
      }

      .sortable li h2 {
        position: absolute;
        top: 50%;
        left: 50%;
        margin: 0;
        -webkit-transform: translate(-50%, -50%);
        -ms-transform: translate(-50%, -50%);
        -o-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
        color: #78909c;
      }

/*--------------------------------------------------------------
# Our Team
--------------------------------------------------------------*/
.team {
    background: inherit;
  padding: 0;
  /* padding: 10px 0 30px 0; */
}

.team .member {
  text-align: center;
  /* margin-bottom: 80px; */
  position: relative;
}

.team .member .pic {
  border-radius: 4px;
  overflow: hidden;
}

.team .member img {
  transition: all ease-in-out 0.4s;
}

.team .member:hover img {
  transform: scale(1.1);
}

.team .member .member-info {
    position: absolute;
    bottom: -110px;
    left: 0;
    right: 0;
    background: linear-gradient(360deg, #5c768d 0%, rgba(92, 118, 141, 0.9) 35%, rgba(140, 167, 191, 0.8) 100%);
    padding: 0px 0;
    border-radius: 15px;
    width: 100%;
    margin-left: 0;
    /* width: 200%; */
    /* margin-left: -100px; */
}
.team .member h4 {
  font-weight: 700;
  margin-bottom: 10px;
  font-size: 16px;
  color: #fff;
  position: relative;
  padding-bottom: 10px;
}

.team .member h4::after {
  content: '';
  position: absolute;
  display: block;
  width: 50px;
  height: 1px;
  background: #fff;
  bottom: 0;
  left: calc(50% - 25px);
}

.team .member span {
  font-style: italic;
  display: block;
  font-size: 13px;
  color: #fff;
}

.team .member .social {
  margin-top: 0px;
}

.team .member .social a {
  transition: color 0.3s;
  color: #fff;
}

.team .member .social a:hover {
  color: #9eccf4;
}

.team .member .social i {
  font-size: 16px;
  margin: 0 2px;
}

@media (max-width: 992px) {
  .team .member {
    margin-bottom: 100px;
  }
}
.img-fluid, .img-thumbnail {
    max-width: 45%;
    height: auto;
}
CSS
)
?>
<!-- ======= Our Portfolio Section ======= -->
<section id="portfolio" class="portfolio section-bg">
    <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="section-title">
            <h2>บุคลากร</h2>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <ul id="portfolio-flters">
                    <!-- <li data-filter="*" class="filter-active">คณาจารย์</li> -->
                    <li id="filter-app" class="filter-active" data-filter=".filter-app">คณาจารย์</li>
                    <li data-filter=".filter-web">สายสนับสุน</li>
                </ul>
            </div>
        </div>
        <div class="row portfolio-container">
            <?php foreach ($profiles2 as $profile) : ?>
                <div class="col-lg-3 col-md-6 portfolio-item filter-app">
                    <div class="team">
                        <div class="member">

                            <div class="pic">
                                <?=Html::img($profile->pictureUrl,['class' => 'img-fluid','alt' => 'avatar'])?>
                                <img src="" class="img-fluid" alt="">
                            </div>
                            <div class="member-info">
                                <h6>
                                    <?= $profile->fullname ?>
                                </h6>
                                <h6>
                                    <?= $profile->fullnameEN ?>
                                </h6>
                                <span>
                                    ตำแหน่ง : <?= $profile->position->user_position ?>
                                </span>
                                <div class="social">
                                    <?= Html::mailto($profile->user->email, $profile->user->email) ?>
                                </div>
                                <span>
                                    รหัส :  <?= $profile->user_profile_id ?>
                                </span>
                            </div>

                        </div>
                    </div>
                </div>
            <?php endforeach; ?>

            <?php foreach ($profiles3 as $profile) : ?>
                <div class="col-lg-3 col-md-6 portfolio-item filter-web">
                    <div class="team">
                        <div class="member">

                            <div class="pic">
                                <?=Html::img($profile->pictureUrl,['class' => 'img-fluid','alt' => 'avatar'])?>
                                <img src="" class="img-fluid" alt="">
                            </div>
                            <div class="member-info">
                                <h6>
                                    <?= $profile->fullname ?>
                                </h6>
                                <h6>
                                    <?= $profile->fullnameEN ?>
                                </h6>
                                <span>
                                    ตำแหน่ง : <?= $profile->position->user_position ?>
                                </span>
                                <div class="social">
                                    <?= Html::mailto($profile->user->email, $profile->user->email) ?>
                                </div>
                                <span>
                                    รหัส :  <?= $profile->user_profile_id ?>
                                </span>
                            </div>

                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
</section>
<!-- End Our Portfolio Section -->

<?php
$script = <<<JS
var portfolioIsotope = $('.portfolio-container').isotope({
    itemSelector: '.portfolio-item',
    layoutMode: 'fitRows'
});
$('#portfolio-flters li').on('click', function() {
    $("#portfolio-flters li").removeClass('filter-active');
    $(this).addClass('filter-active');

    portfolioIsotope.isotope({
        filter: $(this).data('filter')
    });
});
portfolioIsotope.isotope({
    filter: $('#filter-app').data('filter')
});
JS;
$this->registerJs($script);
?>