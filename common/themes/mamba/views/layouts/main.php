<?php
$directoryAsset = Yii::$app->assetManager->getPublishedUrl('@mamba/assets/dist');
$ctrl = Yii::$app->controller->id;
$action = Yii::$app->controller->action->id;
?>
<?php $this->beginContent('@mamba/views/layouts/_base.php', ['directoryAsset' => $directoryAsset]); ?>

<?= $this->render('_header.php', ['directoryAsset' => $directoryAsset]) ?>
<?php if ($ctrl == 'site' && $action == 'index') : ?>
    <?= $this->render('_hero.php', ['directoryAsset' => $directoryAsset]) ?>
<?php endif; ?>

<main id="main">
    <?= $content ?>
</main>

<?= $this->render('_footer.php', ['directoryAsset' => $directoryAsset]) ?>
<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v7.0&appId=1469390719775625&autoLogAppEvents=1" nonce="3hbTTiXE"></script>
<?php $this->endContent(); ?>