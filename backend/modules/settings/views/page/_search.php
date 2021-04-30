<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\modules\settings\models\search\PageSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="page-search">
    
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

<?php /*
<div class="page-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'page_id') ?>

    <?= $form->field($model, 'slug') ?>

    <?= $form->field($model, 'title') ?>

    <?= $form->field($model, 'body') ?>

    <?= $form->field($model, 'view') ?>

    <?php // echo $form->field($model, 'status') ?>

    <?php // echo $form->field($model, 'created_at') ?>

    <?php // echo $form->field($model, 'updated_at') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
*/?>