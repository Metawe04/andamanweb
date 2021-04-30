<?php
/*
 * Created by VS Code.
 * User: Tanakorn Phompak
 * Date: Wed Jun 10 2020
 * Time: 21:38:45
 */

$directoryAsset = Yii::$app->assetManager->getPublishedUrl('@metronic/assets/dist');
?>

<?php $this->beginContent('@metronic/views/layouts/_base.php', ['directoryAsset' => $directoryAsset, 'bodyClass' => 'header-mobile-fixed subheader-enabled aside-enabled aside-fixed aside-secondary-enabled']); ?>

<div class="d-flex flex-column flex-root">
    <?= $content ?>
</div>

<?php $this->endContent(); ?>