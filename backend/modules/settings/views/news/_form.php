<?php

use yii\helpers\Html;
use kartik\form\ActiveForm;
use metronic\widgets\tinymce\TinyMce;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;
use kartik\date\DatePicker;
use trntv\filekit\widget\Upload;
use kartik\select2\Select2;
use common\models\NewsCategory;
use yii\web\JsExpression;
use common\widgets\TagsInput;
use common\widgets\SeoForm;
/* @var $this yii\web\View */
/* @var $model common\models\News */
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
        //'formConfig' => ['showLabels' => false]
    ]); ?>
    <div class="card-body">
        <?= $form->errorSummary($model) ?>
        <div class="form-group row">
            <label class="col-xl-1 col-lg-1 col-form-label text-right">
                <?= $model->getAttributeLabel('image') ?>:
            </label>
            <div class="col-lg-11 col-xl-11">
                <?php echo $form->field($model, 'image', ['showLabels' => false])->widget(
                    Upload::class,
                    [
                        'url' => ['/file/storage/upload'],
                        'maxFileSize' => 5000000, // 5 MiB,
                        'acceptFileTypes' => new JsExpression('/(\.|\/)(gif|jpe?g|png)$/i'),
                    ]
                );
                ?>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-xl-1 col-lg-1 col-form-label text-right">
                <?= $model->getAttributeLabel('title') ?>:
            </label>
            <div class="col-lg-11 col-xl-11">
                <?= $form->field($model, 'title', ['showLabels' => false])->textInput(['maxlength' => true]) ?>
                <span class="form-text text-muted"></span>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-xl-1 col-lg-1 col-form-label text-right">
                <?= $model->getAttributeLabel('category_id') ?>:
            </label>
            <div class="col-lg-11 col-xl-11">
                <?= $form->field($model, 'category_id', ['showLabels' => false])->widget(Select2::classname(), [
                    'data' => ArrayHelper::map(NewsCategory::find()->where(['status' => 1])->asArray()->all(), 'category_id', 'title'),
                    'options' => ['placeholder' => 'เลือกหมวดหมู่...'],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                ]); ?>
                <span class="form-text text-muted"></span>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-xl-1 col-lg-1 col-form-label text-right">
                <?= $model->getAttributeLabel('short') ?>:
            </label>
            <div class="col-lg-11 col-xl-11">
                <?= $form->field($model, 'short', ['showLabels' => false])->textarea([
                    'maxlength' => true,
                    'rows' => 6
                    ]) ?>
                <span class="form-text text-muted"></span>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-xl-1 col-lg-1 col-form-label text-right">
                <?= $model->getAttributeLabel('text', ['showLabels' => false]) ?>:
            </label>
            <div class="col-lg-11 col-xl-11">
                <section id="ipad" class="silver">
                    <div class="wrap">
                        <div class="marvel-device ipad silver">
                            <div class="camera"></div>
                            <div class="screen">
                                <?= $form->field($model, 'text', ['showLabels' => false])->widget(TinyMce::className(), [
                                    'options' => ['rows' => 6],
                                    'language' => 'th_TH',
                                    'clientOptions' => ArrayHelper::merge(Yii::$app->params['tinymceOptions'], [
                                        'images_upload_url' =>  Url::base(true) . '/settings/page/editor-upload',
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
            <label class="col-xl-1 col-lg-1 col-form-label text-right">
                <?= $model->getAttributeLabel('attachments') ?>:
            </label>
            <div class="col-lg-11 col-xl-11">
                <?php echo $form->field($model, 'attachments', ['showLabels' => false])->widget(
                        Upload::class,
                        [
                            'url' => ['/file/storage/upload'],
                            'sortable' => true,
                            'maxFileSize' => 10000000, // 10 MiB
                            'maxNumberOfFiles' => 10,//จำนวนไฟล์ที่ upload
                            'acceptFileTypes' => new JsExpression('/(\.|\/)(doc|docx|pdf|zip|rar|xls|xlsx|ppt|pptx)$/i'),
                        ]
                    )->hint('<span class="text-danger">**ขนาดไฟล์: ไม่เกิน 10MB/ไฟล์ แนบไฟล์ได้สูงสุด 25 ไฟล์</span> ,ชนิดไฟล์:doc, docx, pdf, zip, rar, xls, xlsx, ppt, pptx');
                    ?>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-xl-1 col-lg-1 col-form-label text-right">
                <?= $model->getAttributeLabel('photo') ?>:
            </label>
            <div class="col-lg-11 col-xl-11">
                <?php echo $form->field($model, 'photo', ['showLabels' => false])->widget(
                    Upload::class,
                    [
                        'id' => 'photo',
                        'url' => ['/file/storage/upload'],
                        'sortable' => true,
                        'maxFileSize' => 2 * 1024 * 1024, // 2 MiB  ไฟล์ภาพ
                        'maxNumberOfFiles' => 25,//จำนวนไฟล์ที่ upload
                        'acceptFileTypes' => new JsExpression('/(\.|\/)(gif|jpe?g|png)$/i'),
                    ]
                )->hint('<span class="text-danger">**ขนาดไฟล์: ไม่เกิน 2MB/ไฟล์ แนบไฟล์ได้สูงสุด 25 ไฟล์</span> ,ชนิดไฟล์:gif, jpg, jpeg, png');
                ?>
            </div>
        </div>

        <?php /*
        <div class="form-group row">
            <label class="col-xl-1 col-lg-1 col-form-label text-right">
                <?= $model->getAttributeLabel('attachments') ?>:
            </label>
            <div class="col-lg-11 col-xl-11">
                <?php echo $form->field($model, 'attachments', ['showLabels' => false])->widget(
                    Upload::class,
                    [
                        'url' => ['/file/storage/upload'],
                        'sortable' => true,
                        'maxFileSize' => 10000000, // 10 MiB
                        'maxNumberOfFiles' => 10,
                        'acceptFileTypes' => new JsExpression('/(\.|\/)(doc|docx|pdf|zip|rar|xls|xlsx|ppt|pptx)$/i'),
                    ]
                )->hint('<span class="text-danger">**ขนาดไฟล์: ไม่เกิน 10MB/ไฟล์ แนบไฟล์ได้สูงสุด 10 ไฟล์</span> ,ชนิดไฟล์:doc, docx, pdf, zip, rar, xls, xlsx, ppt, pptx');
                ?>
            </div>
        </div>
            */?>
        <div class="form-group row">
            <label class="col-xl-1 col-lg-1 col-form-label text-right">
                <?= $model->getAttributeLabel('slug') ?>:
            </label>
            <div class="col-lg-4 col-xl-4">
                <?= $form->field($model, 'slug', ['showLabels' => false])->textInput(['maxlength' => true]) ?>
                <span class="form-text text-muted">If you leave this field empty, the slug will be generated automatically</span>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-xl-1 col-lg-1 col-form-label text-right">
                <?= $model->getAttributeLabel('tagNames') ?>:
            </label>
            <div class="col-lg-4 col-xl-4">
                <?= $form->field($model, 'tagNames', ['showLabels' => false])->widget(TagsInput::class) ?>
                <span class="form-text text-muted">
                Ex. Tag1, Tag2, Tag3
                </span>
            </div>
        </div>

        <div class="form-group row">
            <label class="col-xl-1 col-lg-1 col-form-label text-right">
                <?= $model->getAttributeLabel('published_at') ?>:
            </label>
            <div class="col-lg-4 col-xl-4">
                <?= $form->field($model, 'published_at', ['showLabels' => false])->widget(DatePicker::classname(), [
                    'options' => ['placeholder' => 'เลือกวันที่...'],
                    'pluginOptions' => [
                        'autoclose' => true,
                        'format' => 'yyyy-mm-dd',
                        'todayHighlight' => true,
                        'todayBtn' => true,
                    ]
                ]); ?>
                <span class="form-text text-muted"></span>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-xl-1 col-lg-1 col-form-label text-right">
                <?= $model->getAttributeLabel('view') ?>:
            </label>
            <div class="col-lg-4 col-xl-4">
                <?= $form->field($model, 'view', ['showLabels' => false])->textInput(['maxlength' => true]) ?>
                <span class="form-text text-muted">
                Custom page view
                </span>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-xl-1 col-lg-1 col-form-label text-right">
            </label>
            <div class="col-lg-9 col-xl-8">
                <?= SeoForm::widget(['model' => $model]) ?>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-xl-1 col-lg-1 col-form-label text-right">
                <?= $model->getAttributeLabel('status') ?>:
            </label>
            <div class="col-lg-11 col-xl-11">
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