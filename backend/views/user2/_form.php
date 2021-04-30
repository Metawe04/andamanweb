<?php

use yii\helpers\Html;
use kartik\form\ActiveForm;
use dosamigos\ckeditor\CKEditor;
use metronic\widgets\tinymce\TinyMce;
use yii\helpers\Url;
use yii\helpers\ArrayHelper;

/* @var $this yii\web\View */
/* @var $model metronic\user\models\User */
/* @var $form kartik\form\ActiveForm */
?>
<?php
$this->registerCss(<<<CSS
.marvel-device.ipad {
    width: 90%;
    height: auto;
}
.marvel-device .screen {
    border-radius: 10px;
}
.tox-fullscreen .tox.tox-tinymce.tox-fullscreen {
  height: 100% !important;
}
/* .tox-tinymce {
    min-height: 800px!important;
} */
CSS
);
?>

<div class="card card-custom">
    <div class="card-header">
        <h3 class="card-title">
            <i class="flaticon-list"></i> <?= Html::encode($this->title) ?>
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
                <?= $model->getAttributeLabel('username') ?>:
            </label>
            <div class="col-lg-9 col-xl-8">
                <?= $form->field($model, 'username')->widget(CKEditor::className(), [
                    'options' => ['rows' => 6],
                    'preset' => 'full',
                    'clientOptions' => [
                        'extraPlugins' => 'uploadimage, imagebase, uploadfile, uploadwidget, widget, preview',
                        'uploadUrl' => 'upload',
                        'imageUploadUrl' => 'upload',
                        'filebrowserImageUploadUrl' => 'upload',
                    ]
                ]) ?>
                <span class="form-text text-muted"></span>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-xl-2 col-lg-2 col-form-label text-right">
                <?= $model->getAttributeLabel('email') ?>:
            </label>
            <div class="col-lg-8 col-xl-8">
                <section id="ipad" class="silver">
                    <div class="wrap">
                        <div class="marvel-device ipad silver">
                            <div class="camera"></div>
                            <div class="screen">
                                <?= $form->field($model, 'email')->widget(TinyMce::className(), [
                                    'options' => ['rows' => 6],
                                    'language' => 'th_TH',
                                    'clientOptions' => ArrayHelper::merge(Yii::$app->params['tinymceOptions'], [
                                        'content_css' =>  Url::base(true) . '/css/codepen.min.css'
                                    ])
                                ]); ?>
                            </div>
                            <div class="home"></div>
                        </div>
                    </div>
                </section>
                <!-- <div id="laptop-container" class="laptop-container">

                </div> -->
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