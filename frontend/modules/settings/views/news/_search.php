<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model frontend\modules\settings\models\search\NewsSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="news-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'options' => ['data-pjax' => true]
    ]); ?>

    <div class="form-group row">
        <div class="col-lg-4">
            <label>ค้นหา :</label> 
            <?= $form->field($model, 'search')->label(false) ?>
        </div>
        
        <div class="col-lg-6 mt-2">
            <br>
            <?= Html::submitButton('ค้นหา', ['class' => 'btn btn-primary']) ?>
            <?= Html::a('เคลียร์', ['index'], ['class' => 'btn btn-outline-secondary']) ?>
        </div>
    </div>

    <?php ActiveForm::end(); ?>

</div>