<?php

use common\models\TbResearchTypeWork;
use yii\helpers\Html;
use kartik\form\ActiveForm;
use kartik\select2\Select2;
use common\models\TbResearchType;
use yii\helpers\ArrayHelper;
use kartik\date\DatePicker;
use yii\web\JsExpression;
use trntv\filekit\widget\Upload;
use yii\widgets\Pjax;
use kartik\grid\GridView;
use wbraganca\dynamicform\DynamicFormWidget;
use common\models\TbResearcherOnus;
use common\models\TbResearchAttachment;
use kartik\base\Widget;
use metronic\user\models\Profile;

/* @var $this yii\web\View */
/* @var $model common\models\TbResearch */
/* @var $form kartik\form\ActiveForm */

$this->registerCss(<<<CSS
    .font-size-lg {
        font-size: 1.08rem !important;
    }
    .no-padding{
        padding:0 !important;
    }
    .no-margin{
        margin:0 !important;
    }
    .card.card-custom .card-header {
        display: flex;
        justify-content: space-between;
        align-items: stretch;
        flex-wrap: wrap;
        min-height: 50px;
        padding-top: 0;
        padding-bottom: 0;
        background-color: transparent;
    }
    
CSS
);
$this->registerCssFile("@web/js/bootstrap-datepicker-thai/css/datepicker.css", [
    'depends' => [\yii\bootstrap\BootstrapAsset::className()],
]);
?>

<div class="card card-custom">
    <div class="card-header">
        <h3 class="card-title">
            <i class="flaticon-list mr-2"></i> <?= Html::encode($this->title) ?>
        </h3>
        <div class="card-toolbar"></div>
    </div>
    <!--begin::Form-->
    <?php $form = ActiveForm::begin(['id' => 'form-research' . $model->formName(), 'options' => ['class' => 'form'], 'formConfig' => ['showLabels' => false]]); ?>
    <?php echo Html::activeHiddenInput($model, 'research_id'); ?>
    <div class="card-body">
        <div class="form-group row">

            <label class="col-xl-2 col-lg-1 col-form-label text-right">
                <?= $model->getAttributeLabel('research_name') ?>
            </label>
            <div class="col-lg-9 col-xl-8">
                <?= $form->field($model, 'research_name')->textInput(['placeholder' => 'ชื่องานวิจัย', 'maxlength' => true]) ?>
                <span class="form-text text-muted"></span>
            </div>
        </div>

        <div class="form-group row">
            <?= Html::activeLabel($model, 'research_date_begin', ['label' => 'วันที่เริ่มวิจัย', 'class' => 'col-sm-2 control-label', 'style' => 'text-align: right;']) ?>
            <div class="col-lg-3 col-xl-3">
                <?= $form->field($model, 'research_date_begin', [
                    'addon' => [
                        'data-date-language' => 'th-th',
                        'prepend' => ['content' => '<i class="fas fa-calendar-alt"></i>'],
                    ],
                ])->textInput([
                    'autocomplete' => 'off',
                    'placeholder' => 'เลือกวันที่...',
                ]) ?>
            </div>

            <?= Html::activeLabel($model, 'research_date_end', ['label' => 'วันที่สิ้นสุด', 'class' => 'col-sm-2 control-label', 'style' => 'text-align: right;']) ?>
            <div class="col-lg-3 col-xl-3">
                <?= $form->field($model, 'research_date_end', [
                    'addon' => [
                        'data-date-language' => 'th-th',
                        'prepend' => ['content' => '<i class="fas fa-calendar-alt"></i>'],
                    ]
                ])->textInput([
                    'autocomplete' => 'off',
                    'placeholder' => 'เลือกวันที่...',
                ]) ?>
            </div>

        </div>

        <div class="form-group row">
            <?= Html::activeLabel($model, 'research_type_id', ['label' => 'ลักษณะผลงาน', 'class' => 'col-sm-2 control-label', 'style' => 'text-align: right;']) ?>
            <div class="col-lg-3 col-xl-3">
                <?php
                echo $form->field($model, 'research_type_id')->widget(Select2::classname(), [
                    'data' => ArrayHelper::map(TbResearchType::find()->asArray()->all(), 'research_type_id', 'research_type_name'),
                    'options' => ['placeholder' => 'เลือกลักษณะผลงาน...'],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                    'pluginEvents' => [
                        'change' => 'function(){onChangeType( $(this).val());}'
                    ]
                ]);
                ?>
            </div>

            <?= Html::activeLabel($model, 'research_type_other', [
                'label' => 'อื่นๆ',
                'class' => 'col-sm-2 control-label research_type_other text-right',
                'style' => $model['research_type_id'] == 10 ? '' : 'display:none;'
            ]) ?>
            <div class="col-sm-3">
                <?= $form->field($model, 'research_type_other', ['showLabels' => false])->textInput([
                    'placeholder' => 'ลักษณะผลงานอื่นๆ',
                    'class' => 'form-control animated research_type_other',
                    'style' => $model['research_type_id'] == 10 ? '' : 'display:none;'
                ]);
                ?>
            </div>
        </div>

        <div class="form-group row">
            <?= Html::activeLabel($model, 'research_type_work_id', ['label' => 'ประเภทงานวิจัย', 'class' => 'col-sm-2 control-label', 'style' => 'text-align: right;']) ?>
            <div class="col-lg-3 col-xl-3">
                <?php
                echo $form->field($model, 'research_type_work_id')->widget(Select2::classname(), [
                    'data' => ArrayHelper::map(TbResearchTypeWork::find()->asArray()->all(), 'research_type_work_id', 'research_type_work_name'),
                    'options' => [
                        'placeholder' => 'ประเภทงานวิจัย...'
                    ],
                    'pluginOptions' => [
                        'allowClear' => true
                    ],
                    'pluginEvents' => [
                        'change' => 'function(){onChangeTypeWork( $(this).val());}'
                    ]
                ]);
                ?>
            </div>

            <?= Html::activeLabel($model, 'research_type_work_other', [
                'label' => 'อื่นๆ',
                'class' => 'col-sm-2 control-label research_type_work_other text-right',
                'style' => $model['research_type_work_id'] == 7 ? '' : 'display:none;'
            ]) ?>
            <div class="col-sm-3">
                <?= $form->field($model, 'research_type_work_other', ['showLabels' => false])->textInput([
                    'placeholder' => 'ประเภทงานวิจัยอื่นๆ',
                    'class' => 'form-control animated research_type_work_other',
                    'style' => $model['research_type_work_id'] == 7 ? '' : 'display:none;'
                ]);
                ?>
            </div>
        </div>
 
        <!-- ################################ Dynamic Form ################################ -->
        <div class="form-group row">
            <div class="col-md-8 offset-2">
                <?php
                DynamicFormWidget::begin([
                    'widgetContainer' => 'dynamicform_wrapper', // required: only alphanumeric characters plus "_" [A-Za-z0-9_]
                    'widgetBody' => '.container-items', // required: css class selector
                    'widgetItem' => '.item', // required: css class
                    'limit' => 10, // the maximum times, an element can be cloned (default 999)
                    'min' => 1, // 0 or 1 (default 1)
                    'insertButton' => '.add-item', // css class
                    'deleteButton' => '.remove-item', // css class
                    'model' => $researchUsers[0],
                    'formId' => 'form-research' . $model->formName(),
                    'formFields' => [
                        'researcher_user_id',
                        'researcher_onus_id'
                    ],
                ]);
                ?>

                <div class="card card-custom">
                    <div class="card-header">
                        <div class="card-title">
                            <span class="card-icon">
                                <i class="fas fa-users text-primary"></i>
                            </span>
                            <h5>รายชื่อผู้วิจัย</h5>
                        </div>
                        <div class="card-toolbar">
                            <a href="#" class="btn btn-sm btn-icon btn-light-success mr-2 add-item">
                                <i class="fas fa-user-plus"></i>
                            </a>
                        </div>
                    </div>
                    <div class="card-body container-items no-padding">
                        <!-- widgetContainer -->
                        <?php foreach ($researchUsers as $i => $researchUser) : ?>
                            <div class="card card-custom item">
                                <div class="card-header">
                                    <div class="card-title">
                                        <span class="card-icon">
                                            <i class="fas fa-user-alt text-primary"></i>
                                        </span>
                                        <h6 class="card-label card-label-title font-size-lg">ลำดับที่ <?= $i + 1 ?></h6>
                                    </div>
                                    <div class="card-toolbar">
                                        <a href="#" class="btn btn-sm btn-icon btn-light-success mr-2 add-item">
                                            <i class="fas fa-user-plus"></i>
                                        </a>
                                        <a href="#" class="btn btn-sm btn-icon btn-light-danger mr-2 remove-item">
                                            <i class="fas fa-user-times"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="card-body card-body mr-2 p-2">
                                    <?php
                                    // necessary for update action.
                                    if (!$researchUser->isNewRecord) {
                                        echo Html::activeHiddenInput($researchUser, "[{$i}]researcher_name_ids");
                                    }
                                    ?>

                                    <div class="row">
                                        <div class="col-sm-6">
                                            <?php
                                            echo $form->field($researchUser, "[{$i}]researcher_user_id")->widget(Select2::classname(), [
                                                'data' => ArrayHelper::map((new \yii\db\Query())
                                                    ->select(['`profile`.user_id', 'CONCAT(IFNULL(tb_user_title_name.user_title_name,\'\'),\' \',IFNULL(`profile`.user_fname_th,\'\'),\' \',IFNULL(`profile`.user_lname_th,\'\')) AS fullname'])
                                                    ->from('`profile`')
                                                    ->leftJoin('tb_user_title_name', 'tb_user_title_name.user_title_name_id = `profile`.user_title_name COLLATE utf8_general_ci')
                                                    ->where(['`profile`.usertype_id' => [2, 8]])
                                                    ->all(), 'user_id', 'fullname'),
                                                'options' => ['placeholder' => 'เลือกชื่อ...'],
                                                'pluginOptions' => [
                                                    'allowClear' => true
                                                ],
                                            ]);
                                            ?>
                                        </div>
                                        <div class="col-sm-6">
                                            <?php
                                            echo $form->field($researchUser, "[{$i}]researcher_onus_id")->widget(Select2::classname(), [
                                                'data' => ArrayHelper::map(TbResearcherOnus::find()->asArray()->all(), 'researcher_onus_id', 'researcher_onus'),
                                                'options' => ['placeholder' => 'เลือกความรับผิดชอบ...'],
                                                'pluginOptions' => [
                                                    'allowClear' => true
                                                ],

                                            ]);
                                            ?>
                                        </div>
                                    </div><!-- .row -->
                                </div>
                            </div>
                        <?php endforeach; ?>
                    </div>
                </div>
                <?php DynamicFormWidget::end(); ?>
            </div>
        </div>


        <div class="form-group row">
            <label class="col-xl-2 col-lg-3 col-form-label text-right">
                <?= $model->getAttributeLabel('research_detail') ?>
            </label>
            <div class="col-lg-9 col-xl-8">
                <?= $form->field($model, 'research_detail')->textarea(['rows' => 6]) ?>
                <span class="form-text text-muted"></span>
            </div>
        </div>

        <div class="form-group row">
            <?= Html::activeLabel($model, 'research_year', ['label' => 'ปีที่เผยแพร่', 'class' => 'col-sm-2 control-label', 'style' => 'text-align: right;']) ?>
            <div class="col-lg-2 col-xl-3">
                <?= $form->field($model, 'research_year', [])->textInput(['placeholder' => 'กรอกข้อมูล ปีที่เผยแพร่',]) ?>

                <span class="form-text text-muted"></span>
            </div>

            <?= Html::activeLabel($model, 'research_status', ['label' => 'สถานะงานวิจัย', 'class' => 'col-sm-2 control-label', 'style' => 'text-align: right;']) ?>
            <div class="col-lg-2 col-xl-3">
                <?= $form->field($model, 'research_status', ['showLabels' => false])->widget(Select2::classname(), [
                    'data' => [
                        0 => 'กำลังดำเนินการ',
                        1 => 'เสร็จสิ้น',
                    ],
                    'options' => [
                        'placeholder' => 'สถานะงานวิจัย...',
                        'value' => $model->isNewRecord ? 0 : $model['research_status'],
                    ],
                    'pluginOptions' => [
                        'allowClear' => true,
                    ],
                ]);
                ?>
            </div>
        </div>
        
        <div class="form-group row">
                <?= Html::activeLabel($model, 'photo', ['label' => 'รูปภาพ', 'class' => 'col-sm-2 control-label', 'style' => 'text-align: right;']) ?>
                <div class="col-lg-3 col-xl-7">
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

        <div class="form-group row">
                <?= Html::activeLabel($model, 'attachments', ['label' => 'ไฟล์แนบ', 'class' => 'col-sm-2 control-label', 'style' => 'text-align: right;']) ?>
            <div class="col-lg-3 col-xl-7">
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
        
<?php /*
        <div class="form-group row">
            <?= Html::activeLabel($model, 'attachments', ['label' => 'ไฟล์แนบ', 'class' => 'col-sm-2 control-label', 'style' => 'text-align: right;']) ?>
            <div class="col-lg-3 col-xl-7">
                <?php echo $form->field($model, 'attachments', ['showLabels' => false])->widget(
                    Upload::class,
                    [
                        'url' => ['/file/storage/upload'],
                        'sortable' => true,
                        'maxFileSize' => 10000000, // 10 MB
                        'maxNumberOfFiles' => 10,
                        'acceptFileTypes' => new JsExpression('/(\.|\/)(doc|docx|pdf|zip|rar|xls|xlsx|ppt|pptx)$/i'),
                    ]
                )->hint('<span class="text-danger">**ขนาดไฟล์: ไม่เกิน 10MB/ไฟล์ แนบไฟล์ได้สูงสุด 10 ไฟล์</span> ,ชนิดไฟล์:doc, docx, pdf, zip, rar, xls, xlsx, ppt, pptx');
                ?>
            </div>
        </div>
*/?>
    </div>

    <div class="card-footer text-right">
        <?= Html::submitButton('บันทึก', ['class' => 'btn btn-primary mr-2']); ?>
        <?= Html::a('ยกเลิก', ['index'], ['class' => 'btn btn-secondary']); ?>
    </div>
    <?php ActiveForm::end(); ?>
    <!--end::Form-->
</div>



<?php
$this->registerJsFile(
    '@web/js/bootstrap-datepicker-thai/js/bootstrap-datepicker.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);
$this->registerJsFile(
    '@web/js/bootstrap-datepicker-thai/js/bootstrap-datepicker-thai.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);
$this->registerJsFile(
    '@web/js/bootstrap-datepicker-thai/js/locales/bootstrap-datepicker.th.js',
    ['depends' => [\yii\web\JqueryAsset::className()]]
);


$js = <<<JS
    
function onChangeType(type_id){
    if(type_id == 10){
        $('.research_type_other').css('display','');
    }else{
        $('.research_type_other').css('display','none');
    }
}
function onChangeTypeWork(type_id){
    if(type_id == 7){
        $('.research_type_work_other').css('display','');
    }else{
        $('.research_type_work_other').css('display','none');
    }
}
jQuery(".dynamicform_wrapper").on("afterInsert", function(e, item) {
    jQuery(".dynamicform_wrapper .card-label-title").each(function(index) {
        jQuery(this).html("ลำดับ " + (index + 1))
    });
});

jQuery(".dynamicform_wrapper").on("afterDelete", function(e) {
    jQuery(".dynamicform_wrapper .card-label-title").each(function(index) {
        jQuery(this).html("ลำดับ " + (index + 1))
    });
});

$('#tbresearch-research_date_begin').datepicker({
    format: 'dd/mm/yyyy',
    todayHighlight: true,
    language: "th-th",
    autoclose: true,

});
$('#tbresearch-research_date_end').datepicker({
    format: 'dd/mm/yyyy',
    todayHighlight: true,
    language: "th-th",
    autoclose: 'true'
});
JS;
$this->registerJs($js);
?>