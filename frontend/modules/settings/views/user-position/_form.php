<?php

use yii\helpers\Html;
use kartik\form\ActiveForm;
use yii\bootstrap\Modal;

/* @var $this yii\web\View */
/* @var $model common\models\TbUserPosition */
/* @var $form kartik\form\ActiveForm */
?>
<?php if (!Yii::$app->request->isAjax) { ?>
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
            'formConfig' => ['showLabels' => false]
        ]); ?>
        <div class="card-body">
            <div class="form-group row">
                <label class="col-xl-3 col-lg-3 col-form-label text-right">
                    <?= $model->getAttributeLabel('user_position') ?>:
                </label>
                <div class="col-lg-9 col-xl-8">
                    <?= $form->field($model, 'user_position')->textInput(['maxlength' => true]) ?>
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


<?php } else { ?>
    <?php $form = ActiveForm::begin([
        'id' => 'form-' . $model->formName(),
        'options' => ['class' => 'form'],
        'formConfig' => ['showLabels' => false]
    ]); ?>
    
    <div class="form-group row">
        <?= Html::activeLabel($model, 'user_position', ['label' => 'ชื่อตำแหน่งงาน', 'class' => 'col-xl-3 col-lg-3 col-form-label', 'style' => 'text-align: right']) ?>
        <div class="col-lg-9 col-xl-8">
            <?= $form->field($model, 'user_position')->textInput(['maxlength' => true]) ?>
            <span class="form-text text-muted"></span>
        </div>
    </div>
    
    <?php ActiveForm::end(); ?>
<?php } ?>