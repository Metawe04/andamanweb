<?php

use yii\helpers\Html;
use kartik\form\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Text */
/* @var $form kartik\form\ActiveForm */
?>


<div class="card card-custom">
    <div class="card-header">
        <h3 class="card-title">
            <i class="flaticon-list mr-2"></i> <?= Html::encode($this->title) ?>
        </h3>
        <div class="card-toolbar"></div>
    </div>
    <!--begin::Form-->
    <?php $form = ActiveForm::begin([
        'id' => 'form-' . $model->formName(),
        'options' => ['class' => 'form'],
        // 'formConfig' => ['showLabels' => false]
    ]); ?>
    <div class="card-body">
        <div class="form-group row">
            <label class="col-xl-2 col-lg-2 col-form-label text-right">
                <?= $model->getAttributeLabel('slug') ?>:
            </label>
            <div class="col-lg-9 col-xl-8">
                <?= $form->field($model, 'slug', ['showLabels' => false])->textInput(['maxlength' => true]) ?>
                <span class="form-text text-muted"></span>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-xl-2 col-lg-2 col-form-label text-right">
                <?= $model->getAttributeLabel('title') ?>:
            </label>
            <div class="col-lg-9 col-xl-8">
                <?= $form->field($model, 'title', ['showLabels' => false])->textInput(['maxlength' => true]) ?>
                <span class="form-text text-muted"></span>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-xl-2 col-lg-2 col-form-label text-right">
                <?= $model->getAttributeLabel('body') ?>:
            </label>
            <div class="col-lg-9 col-xl-8">
                <?= $form->field($model, 'body', ['showLabels' => false])->textarea(['rows' => 6]) ?>
                <span class="form-text text-muted"></span>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-xl-2 col-lg-2 col-form-label text-right">
                <?= $model->getAttributeLabel('status') ?>:
            </label>
            <div class="col-lg-9 col-xl-8">
                <?php echo $form->field($model, 'status', [
                    'checkTemplate' => "<div class=\"checkbox-inline\">\n{beginLabel}\n{input}\n{labelTitle}\n<span></span>\n{endLabel}\n{error}\n{hint}\n</div>",
                    'labelOptions' => ['class' => 'checkbox'],
                ])->checkbox([])->label(false) ?>
                <span class="form-text text-muted"></span>
            </div>
        </div>
    </div>
    <div class="card-footer text-right">
        <?= Html::submitButton('บันทึก', ['class' => 'btn btn-primary mr-2']); ?>
        <?= Html::a('ยกเลิก', ['index'], ['class' => 'btn btn-secondary']); ?>
    </div>
    <?php ActiveForm::end(); ?>
    <!--end::Form-->
</div>