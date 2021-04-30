<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\search\TbResearchSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="tb-research-search">

<?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'options' => ['data-pjax' => true]
    ]); ?>

    <div class="form-group row no-margin">
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

<?php /*
    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'research_id') ?>

    <?= $form->field($model, 'research_name') ?>

    <?= $form->field($model, 'researc_type_id') ?>

    <?= $form->field($model, 'research_type_work_id') ?>

    <?= $form->field($model, 'research_year') ?>

    <?php // echo $form->field($model, 'research_date_begin') ?>

    <?php // echo $form->field($model, 'research_date_end') ?>

    <?php // echo $form->field($model, 'research_status') ?>

    <?php // echo $form->field($model, 'research_abstract') ?>

    <?php // echo $form->field($model, 'research_detail') ?>

    <?php // echo $form->field($model, 'created_by') ?>

    <?php // echo $form->field($model, 'created_at') ?>

    <?php // echo $form->field($model, 'updated_by') ?>

    <?php // echo $form->field($model, 'updated_at') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>
*/?>
</div>
