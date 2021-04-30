<?php
/* @var $this yii\web\View */

use yii\helpers\Url;

$this->title = $page->seo('title', $page->model->title);
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
<section>
    <div class="container" data-aos="fade-up">

        <div class="section-title">
            <h2>
                <?= $page->model->title; ?>
            </h2>
            <p></p>
        </div>

        <?php echo $page->body; ?>

    </div>
</section>