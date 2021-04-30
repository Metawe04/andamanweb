<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\search\TbUserPositionSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="tb-user-position-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'user_position_id') ?>

    <?= $form->field($model, 'user_position') ?>

    <?= $form->field($model, 'user_position_parentid') ?>

    <?= $form->field($model, 'user_position_order') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
