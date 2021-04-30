<?php

use yii\helpers\Html;
use metronic\assets\MetronicAsset;
use backend\assets\AppAsset;
use yii\web\YiiAsset;

/* @var $this \yii\web\View */
/* @var $content string */
MetronicAsset::register($this);
AppAsset::register($this);
$bundle = YiiAsset::register(Yii::$app->view);
$bundle->depends[] = 'metronic\assets\MetronicAsset';
?>
<?php $this->beginPage()?>
<!DOCTYPE html>
<html lang="<?=Yii::$app->language?>">

<head>
    <meta charset="<?=Yii::$app->charset?>">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="<?= Yii::getAlias('@web/images/favicon.ico'); ?>" rel="icon">
    <link href="<?= Yii::getAlias('@web/images/favicon.ico'); ?>" rel="apple-touch-icon">
    <?php $this->registerCsrfMetaTags() ?>
    <title><?php echo Html::encode(!empty($this->title) ? strtoupper($this->title) . ' | ' . Yii::$app->name : Yii::$app->name); ?></title>
    <?php $this->head()?>
</head>

<body class="<?= $bodyClass ?>">
    <?php $this->beginBody()?>

    <?=$content?>

    <?php $this->endBody()?>
</body>

</html>
<?php $this->endPage()?>