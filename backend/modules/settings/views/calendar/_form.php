<?php

use yii\helpers\Html;
use kartik\form\ActiveForm;
use kartik\date\DatePicker;
use kartik\widgets\TimePicker;
use kartik\color\ColorInput;

/* @var $this yii\web\View */
/* @var $model common\models\Calendar */
/* @var $form yii\widgets\ActiveForm */

?>

<div class="calendar-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'date')->widget(DatePicker::classname(), [
        'options' => ['placeholder' => 'วันที่...'],
        'pluginOptions' => [
            'autoclose' => true,
            'format' => 'yyyy-mm-dd',
            'todayHighlight' => true,
        ]
    ]); ?>

    <?= $form->field($model, 'start_time')->widget(TimePicker::classname(), [
        'pluginOptions' => [
            'showSeconds' => false,
            'showMeridian' => false,
            'minuteStep' => 1,
            'secondStep' => 5,
        ]
    ]); ?>

    <?= $form->field($model, 'end_time')->widget(TimePicker::classname(), [
        'pluginOptions' => [
            'showSeconds' => false,
            'showMeridian' => false,
            'minuteStep' => 1,
            'secondStep' => 5,
        ]
    ]); ?>
    <?= $form->field($model, 'url')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'text_color')->widget(ColorInput::classname(), [
        'options' => ['placeholder' => 'Select color ...'],
    ]); ?>

    <?= $form->field($model, 'background_color')->widget(ColorInput::classname(), [
        'options' => ['placeholder' => 'Select color ...'],
    ]); ?>


    <?php if (!Yii::$app->request->isAjax) { ?>
        <div class="form-group">
            <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        </div>
    <?php } ?>

    <?php ActiveForm::end(); ?>

</div>

<?php
$this->registerCssFile("@web/static/spectrum/spectrum.css", [
    'depends' => [\metronic\assets\MetronicAsset::className()],
]);
$this->registerJsFile(
    '@web/static/spectrum/spectrum.js',
    ['depends' => [\metronic\assets\MetronicAsset::className()]]
);
$this->registerJs(<<<JS
$('.bootstrap-timepicker-hour').removeClass('form-control is-valid');
$('.bootstrap-timepicker-minute').removeClass('form-control is-valid');

/* $("#calendar-background_color").spectrum({
    showInput: true,
    showPaletteOnly: true,
    togglePaletteOnly: true,
    togglePaletteMoreText: 'more',
    togglePaletteLessText: 'less',
    color: 'blanchedalmond',
    palette: [
        ["#000","#444","#666","#999","#ccc","#eee","#f3f3f3","#fff"],
        ["#f00","#f90","#ff0","#0f0","#0ff","#00f","#90f","#f0f"],
        ["#f4cccc","#fce5cd","#fff2cc","#d9ead3","#d0e0e3","#cfe2f3","#d9d2e9","#ead1dc"],
        ["#ea9999","#f9cb9c","#ffe599","#b6d7a8","#a2c4c9","#9fc5e8","#b4a7d6","#d5a6bd"],
        ["#e06666","#f6b26b","#ffd966","#93c47d","#76a5af","#6fa8dc","#8e7cc3","#c27ba0"],
        ["#c00","#e69138","#f1c232","#6aa84f","#45818e","#3d85c6","#674ea7","#a64d79"],
        ["#900","#b45f06","#bf9000","#38761d","#134f5c","#0b5394","#351c75","#741b47"],
        ["#600","#783f04","#7f6000","#274e13","#0c343d","#073763","#20124d","#4c1130"]
    ]
}); */
JS
);
?>