<!-- ======= Hero Section ======= -->
<section id="hero">
  <div class="hero-container">
    <?php echo \common\widgets\DbCarousel::widget([
      'key' => 'index',
      'assetManager' => Yii::$app->getAssetManager(),
      'options' => [
        'id' => 'heroCarousel',
        'class' => 'carousel slide carousel-fade',
        'data-ride' => 'carousel'
      ],
    ]) ?>
  </div>
</section><!-- End Hero -->