<?php

use yii\helpers\Html;
use kartik\form\ActiveForm;
use metronic\widgets\tinymce\TinyMce;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;
use common\widgets\SeoForm;

/* @var $this yii\web\View */
/* @var $model common\models\Page */
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
.tox-tinymce {
    min-height: 500px!important;
}
CSS
);
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
        <?= $form->errorSummary($model) ?>
        
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
                <?= $model->getAttributeLabel('slug') ?>:
            </label>
            <div class="col-lg-9 col-xl-8">
                <?= $form->field($model, 'slug', ['showLabels' => false])->textInput(['maxlength' => true]) ?>
                <span class="form-text text-muted"></span>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-xl-2 col-lg-2 col-form-label text-right">
                <?= $model->getAttributeLabel('body') ?>:
            </label>
            <div class="col-lg-9 col-xl-8">
                <section id="ipad" class="silver">
                    <div class="wrap">
                        <div class="marvel-device ipad silver">
                            <div class="camera"></div>
                            <div class="screen">
                                <?= $form->field($model, 'body', ['showLabels' => false])->widget(TinyMce::className(), [
                                    'options' => ['rows' => 6],
                                    'language' => 'th_TH',
                                    'clientOptions' => ArrayHelper::merge(Yii::$app->params['tinymceOptions'], [
                                        'images_upload_url' => '/settings/page/editor-upload',
                                        'content_css' =>  Url::base(true) . '/css/codepen.min.css'
                                    ])
                                ]); ?>
                            </div>
                            <div class="home"></div>
                        </div>
                    </div>
                </section>
                <span class="form-text text-muted"></span>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-xl-2 col-lg-2 col-form-label text-right">
                <?= $model->getAttributeLabel('view') ?>:
            </label>
            <div class="col-lg-9 col-xl-8">
                <?= $form->field($model, 'view', ['showLabels' => false])->textInput(['maxlength' => true]) ?>
                <span class="form-text text-muted"></span>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-xl-2 col-lg-2 col-form-label text-right"></label>
            <div class="col-lg-9 col-xl-8">
                <?= SeoForm::widget(['model' => $model]) ?>
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