<?php
// use yii\bootstrap\BootstrapPluginAsset;
use yii\helpers\Html;

// BootstrapPluginAsset::register($this);

$labelOptions = ['class' => 'control-label'];
$inputOptions = ['class' => 'form-control'];
?>
<!-- <p>
    <a class="dashed-link collapsed" data-toggle="collapse" href="#seo-form" aria-expanded="false" aria-controls="seo-form">Seo texts</a>
</p> -->

<div class="collapse show" id="seo-form" aria-expanded="true">
    <div class="form-group">
        <?= Html::activeLabel($model, 'h1', $labelOptions) ?>
        <?= Html::activeTextInput($model, 'h1', $inputOptions) ?>
    </div>
    <div class="form-group">
        <?= Html::activeLabel($model, 'title', $labelOptions) ?>
        <?= Html::activeTextInput($model, 'title', $inputOptions) ?>
    </div>
    <div class="form-group">
        <?= Html::activeLabel($model, 'keywords', $labelOptions) ?>
        <?= Html::activeTextInput($model, 'keywords', $inputOptions) ?>
    </div>
    <div class="form-group">
        <?= Html::activeLabel($model, 'description', $labelOptions) ?>
        <?= Html::activeTextarea($model, 'description', $inputOptions) ?>
    </div>
</div>