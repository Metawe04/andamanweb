<?php

use yii\helpers\Html;
use kartik\form\ActiveForm;
use kartik\select2\Select2;
use yii\web\JsExpression;
use yii\web\View;
/* @var $this yii\web\View */
/* @var $model common\models\NewsCategory */
/* @var $form kartik\form\ActiveForm */

$format = <<< SCRIPT
function format(state) {
    if (!state.id) return state.text; // optgroup
    return '<i class="'+state.text+'"></i> ' + state.text;
}
SCRIPT;
$escape = new JsExpression("function(m) { return m; }");
$this->registerJs($format, View::POS_HEAD);
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
        //'formConfig' => ['showLabels' => false]
    ]); ?>
    <div class="card-body">
        <div class="form-group row">
            <label class="col-xl-3 col-lg-3 col-form-label text-right">
                <?= $model->getAttributeLabel('slug') ?>:
            </label>
            <div class="col-lg-9 col-xl-8">
                <?= $form->field($model, 'slug', ['showLabels' => false])->textInput(['maxlength' => true]) ?>
                <span class="form-text text-muted"></span>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-xl-3 col-lg-3 col-form-label text-right">
                <?= $model->getAttributeLabel('order_num') ?>:
            </label>
            <div class="col-lg-9 col-xl-8">
                <?= $form->field($model, 'order_num', ['showLabels' => false])->textInput(['maxlength' => true]) ?>
                <span class="form-text text-muted"></span>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-xl-3 col-lg-3 col-form-label text-right">
                <?= $model->getAttributeLabel('title') ?>:
            </label>
            <div class="col-lg-9 col-xl-8">
                <?= $form->field($model, 'title', ['showLabels' => false])->textInput(['maxlength' => true]) ?>
                <span class="form-text text-muted"></span>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-xl-3 col-lg-3 col-form-label text-right">
                <?= $model->getAttributeLabel('icon') ?>:
            </label>
            <div class="col-lg-9 col-xl-8">
                <?= $form->field($model, 'icon', ['showLabels' => false])->widget(Select2::classname(), [
                    'options' => ['placeholder' => 'เลือกรายการ...'],
                    'pluginOptions' => [
                        'allowClear' => true,
                        'templateResult' => new JsExpression('format'),
                        'templateSelection' => new JsExpression('format'),
                        'escapeMarkup' => $escape,
                    ],
                ]); ?>
                <span class="form-text text-muted"></span>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-xl-3 col-lg-3 col-form-label text-right">
                <?= $model->getAttributeLabel('parent_id') ?>:
            </label>
            <div class="col-lg-9 col-xl-8">
                <?= $form->field($model, 'parent_id', ['showLabels' => false])->widget(Select2::classname(), [
                    'data' => $categories,
                    'options' => ['placeholder' => 'เลือกรายการ...'],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                ]); ?>
                <span class="form-text text-muted"></span>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-xl-3 col-lg-3 col-form-label text-right">
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

<?php
$this->registerCssFile("@web/static/fontawesome/css/all.min.css", []);
$this->registerJs(<<<JS
$.getJSON("/admin/static/icons.json", function(json) {
    $.each(json, function(index, icon){
        $('#newscategory-icon').append(
            '<option value="' + icon.name+ '">'+ icon.name + '</option>'
        );
    });
});
JS
);
?>