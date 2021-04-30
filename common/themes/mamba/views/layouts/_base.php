<?php

use mamba\assets\MambaAsset;
use yii\helpers\Html;
use yii\web\YiiAsset;

/* @var $this \yii\web\View */
/* @var $content string */

MambaAsset::register($this);
$bundle = YiiAsset::register(Yii::$app->view);
$bundle->depends[] = 'frontend\assets\AppAsset';
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">

<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicons -->
    <link href="<?= Yii::getAlias('@web/images/favicon.ico'); ?>" rel="icon">
    <link href="<?= Yii::getAlias('@web/images/favicon.ico'); ?>" rel="apple-touch-icon">

    <?= Html::csrfMetaTags() ?>
    <title><?php echo Html::encode(!empty($this->title) ? strtoupper($this->title) . ' | ' . Yii::$app->name : Yii::$app->name); ?></title>
    <?php $this->head() ?>
</head>

<body>
    <?php $this->beginBody() ?>

    <?= $content ?>

    <?php $this->endBody() ?>
</body>

</html>
<?php $this->endPage() ?>