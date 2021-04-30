<?php

use kartik\form\ActiveForm;
use yii\helpers\Html;
use yii\web\JsExpression;
use yii\helpers\Url;
use wbraganca\dynamicform\DynamicFormWidget;
use common\models\TbGreduatedLevel;
use kartik\select2\Select2;
use yii\helpers\ArrayHelper;
use common\models\Country;


/**
 * @var yii\web\View $this
 * @var dektrium\user\models\User $user
 * @var dektrium\user\models\Profile $profile
 */

$this->title = Yii::t('user', 'ข้อมูลการศึกษา');
$this->params['breadcrumbs'][] = ['label' => Yii::t('user', 'Users'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;


?>
<?php $this->beginContent('@metronic/user/views/settings/_menu_left.php', ['model' => $profile]); ?>

<div class="card-body pt-4">
    <!--begin::Form-->
    <?php $form = ActiveForm::begin(['id' => '_form_greduated' . $profile->formName(), 'options' => ['class' => 'form'], 'formConfig' => ['showLabels' => false]]); ?>
    <div class="row">
        <label class="col-xl-4"></label>
        <div class="col-lg-9 col-xl-6">
            <h5 class="font-weight-bold mb-6">
            </h5>
        </div>
    </div>
    <div class="row">
        <label class="col-xl-12">
            <?= Html::activeHiddenInput($profile, 'user_id', []) ?>
        </label>
    </div>

    <!-- ################################ Dynamic Form ################################ -->
    <div class="form-group row">
        <div class="col-xl-12 ">
            <?php
            DynamicFormWidget::begin([
                'widgetContainer' => 'dynamicform_wrapper', // required: only alphanumeric characters plus "_" [A-Za-z0-9_]
                'widgetBody' => '.container-items', // required: css class selector
                'widgetItem' => '.item', // required: css class
                'limit' => 10, // the maximum times, an element can be cloned (default 999)
                'min' => 1, // 0 or 1 (default 1)
                'insertButton' => '.add-item', // css class
                'deleteButton' => '.remove-item', // css class
                'model' => $UserGreduateds[0],
                'formId' => '_form_greduated' . $profile->formName(),
                'formFields' => [
                    'user_greduated_ids',
                    'user_id',
                    'user_greduated_yr',
                    'user_greduated_level',
                    'user_greduated_degree',
                    'user_greduated_major',
                    'user_greduated_educational',
                    'user_greduated_country',
                    'user_gpa'

                ],
            ]);
            ?>

            <div class="card card-custom">
                <div class="card-header">
                    <div class="card-title">
                        <span class="card-icon">
                            <i class="fas fa-user-graduate  fa-3x text-primary"></i>
                        </span>
                        <h5>ประวัติการศึกษา</h5>
                    </div>
                    <div class="card-toolbar">
                        <a href="#" class="btn btn-sm btn-icon btn-light-success mr-2 add-item">
                            <i class="fas fa-plus-square fa-2x"></i>
                        </a>
                    </div>
                </div>
                <div class="card-body container-items no-padding">
                    <!-- widgetContainer -->
                    <?php foreach ($UserGreduateds as $i => $UserGreduated) : ?>
                        <div class="card card-custom item">
                            <div class="card-header">
                                <div class="card-title">
                                    <span class="card-icon">
                                        <i class="fas fa-user-graduate  text-primary"></i>
                                    </span>
                                    <h6 class="card-label card-label-title font-size-lg">ลำดับที่ <?= $i + 1 ?></h6>
                                </div>
                                <div class="card-toolbar">
                                    <a href="#" class="btn btn-sm btn-icon btn-light-success mr-2 add-item">
                                        <i class="fas fa-plus-square fa-2x"></i>
                                    </a>
                                    <a href="#" class="btn btn-sm btn-icon btn-light-danger mr-2 remove-item">
                                        <i class="fas fa-minus-square fa-2x"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="card-body card-body mr-2 p-2">
                                <?php
                                // necessary for update action.
                                if (!$UserGreduated->isNewRecord) {
                                    echo Html::activeHiddenInput($UserGreduated, "[{$i}]user_greduated_ids");
                                    
                                }
                                echo Html::activeHiddenInput($UserGreduated, "[{$i}]user_id", ['value' => $profile['user_id']]);
                                ?>

                                <div class="form-group row">
                                    <label class="col-xl-2 col-lg-2 col-form-label text-right">
                                        <?= Html::activeLabel($UserGreduated, "[{$i}]user_greduated_yr", ['label' => 'ปีที่จบการศึกษา']) ?>
                                    </label>
                                    <div class="col-lg-8 col-xl-4">
                                        <?= $form->field($UserGreduated, "[{$i}]user_greduated_yr")->textInput([
                                            'class' => 'form-control form-control-lg form-control-solid',
                                            'placeholder' => 'กรุณาระบุ ปี พ.ศ.',
                                        ])->label(false) ?>
                                    </div>

                                    <label class="col-xl-2 col-lg-1 col-form-label text-right">
                                        <?= Html::activeLabel($UserGreduated, "[{$i}]user_greduated_level", ['label' => 'ระดับการศึกษา']) ?>
                                    </label>
                                    <div class="col-lg-8 col-xl-4">
                                        <?php
                                        echo $form->field($UserGreduated, "[{$i}]user_greduated_level")->widget(Select2::classname(), [
                                            'data' => ArrayHelper::map(TbGreduatedLevel::find()->asArray()->all(), 'greduated_level_ids', 'greduated_level'),
                                            'options' => ['placeholder' => 'เลือกระดับการศึกษา...'],
                                            'pluginOptions' => [
                                                'allowClear' => true
                                            ],
                                            'bsVersion' => '4.x',
                                            'theme' => Select2::THEME_BOOTSTRAP,
                                        ])->label(false);
                                        ?>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-xl-2 col-lg-2 col-form-label text-right">
                                        <?= Html::activeLabel($UserGreduated, "[{$i}]user_greduated_degree") ?>
                                    </label>
                                    <div class="col-lg-8 col-xl-4">
                                        <?= $form->field($UserGreduated, "[{$i}]user_greduated_degree")->textInput([
                                            'class' => 'form-control form-control-lg form-control-solid',
                                            'placeholder' => 'เช่น หลักสูตรวิทยาศาสตรบัณฑิต',
                                        ])->label(false) ?>
                                    </div>

                                    <label class="col-xl-2 col-lg-1 col-form-label text-right">
                                        <?= Html::activeLabel($UserGreduated, "[{$i}]user_greduated_major") ?>
                                    </label>
                                    <div class="col-lg-8 col-xl-4">
                                        <?= $form->field($UserGreduated, "[{$i}]user_greduated_major")->textInput([
                                            'class' => 'form-control form-control-lg form-control-solid',
                                            'placeholder' => 'เช่น สาขาคณิตศาสตร์',
                                        ])->label(false) ?>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-xl-2 col-lg-2 col-form-label text-right">
                                        <?= Html::activeLabel($UserGreduated, "[{$i}]user_greduated_educational") ?>
                                    </label>
                                    <div class="col-lg-8 col-xl-4">
                                        <?= $form->field($UserGreduated, "[{$i}]user_greduated_educational")->textInput([
                                            'class' => 'form-control form-control-lg form-control-solid',
                                            'placeholder' => 'เช่น มหาวิทยาลัยเกษตรศาสตร์',
                                        ])->label(false) ?>
                                    </div>

                                    <label class="col-xl-2 col-lg-1 col-form-label text-right">
                                        <?= Html::activeLabel($UserGreduated, "[{$i}]user_greduated_country") ?>
                                    </label>
                                    <div class="col-lg-8 col-xl-4">
                                        <?php
                                        echo $form->field($UserGreduated, "[{$i}]user_greduated_country")->widget(Select2::classname(), [
                                            'data' => ArrayHelper::map(Country::find()->asArray()->all(), 'COUNTRYID', 'COUNTRY_NAME'),
                                            'options' => ['placeholder' => 'เลือกประเทศ...'],
                                            'pluginOptions' => [
                                                'allowClear' => true
                                            ],
                                            'bsVersion' => '4.x',
                                            'theme' => Select2::THEME_BOOTSTRAP,
                                        ])->label(false);
                                        ?>
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label class="col-xl-2 col-lg-2 col-form-label text-right">
                                        <?= Html::activeLabel($UserGreduated, "[{$i}]user_gpa") ?>
                                    </label>
                                    <div class="col-lg-8 col-xl-4">
                                        <?= $form->field($UserGreduated, "[{$i}]user_gpa")->textInput([
                                            'class' => 'form-control form-control-lg form-control-solid',
                                            'placeholder' => 'บันทึกข้อมูล',
                                        ])->label(false) ?>
                                    </div>

                                </div>
                            </div>
                            <!-- .row -->
                        </div>
                </div>
            <?php endforeach; ?>
            </div>
            <?php DynamicFormWidget::end(); ?>

        </div>
    </div>


    <!-- ################################ Dynamic Form ################################ -->
    <div class="form-group row">
        <div class="col-xl-12 col-form-label">
            <?php
            DynamicFormWidget::begin([
                'widgetContainer' => 'dynamicform_wrapper1', // required: only alphanumeric characters plus "_" [A-Za-z0-9_]
                'widgetBody' => '.container-items1', // required: css class selector
                'widgetItem' => '.item1', // required: css class
                'limit' => 10, // the maximum times, an element can be cloned (default 999)
                'min' => 1, // 0 or 1 (default 1)
                'insertButton' => '.add-item1', // css class
                'deleteButton' => '.remove-item1', // css class
                'model' => $UserExpertises[0],
                'formId' => '_form_greduated' . $profile->formName(),
                'formFields' => [
                    'user_expertise'
                ],
            ]);
            ?>
            <div class="card card-custom">
                <div class="card-header">
                    <div class="card-title">
                        <span class="card-icon">
                            <i class="fas fa-book-reader fa-2x text-primary"></i>
                        </span>
                        <h5>ความเชี่ยวชาญ</h5>
                    </div>
                    <div class="card-toolbar">
                        <a href="#" class="btn btn-sm btn-icon btn-light-success mr-2 add-item1">
                            <i class="fas fa-plus-square fa-2x"></i>
                        </a>
                    </div>
                </div>
                <div class="card-body container-items1 no-padding">
                    <!-- widgetContainer -->
                    <?php foreach ($UserExpertises as $i => $UserExpertise) : ?>
                        <div class="card card-custom item1">
                            <div class="card-header">
                                <div class="card-title">
                                    <span class="card-icon">
                                        <i class="fas fa-book-reader text-primary"></i>
                                    </span>
                                    <h6 class="card-label card-label-title1 font-size-lg">ลำดับที่ <?= $i + 1 ?></h6>
                                </div>
                                <div class="card-toolbar">
                                    <a href="#" class="btn btn-sm btn-icon btn-light-success mr-2 add-item1">
                                        <i class="fas fa-plus-square fa-2x"></i>
                                    </a>
                                    <a href="#" class="btn btn-sm btn-icon btn-light-danger mr-2 remove-item1">
                                        <i class="fas fa-minus-square fa-2x"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="card-body card-body mr-2 p-2">
                                <?php
                                // necessary for update action.
                                if (!$UserExpertise->isNewRecord) {
                                    echo Html::activeHiddenInput($UserExpertise, "[{$i}]user_expertise_id");
                                }
                                echo Html::activeHiddenInput($UserExpertise, "[{$i}]user_id", ['value' => $profile['user_id']]);
                                ?>
                                <div class="form-group row">
                                    <label class="col-xl-2 col-lg-2 col-form-label text-right">
                                        <?= Html::activeLabel($UserExpertise, "[{$i}]user_expertise") ?>
                                    </label>
                                    <div class="col-lg-2 col-xl-8">
                                        <?= $form->field($UserExpertise, "[{$i}]user_expertise")->textInput([
                                            'class' => 'form-control form-control-lg form-control-solid',
                                            'placeholder' => 'บันทึกข้อมูล',
                                        ])->label(false) ?>
                                    </div>
                                </div>
                            </div>
                        </div> 
                        <?php endforeach; ?>
                </div>
            </div>
            <?php DynamicFormWidget::end(); ?>
        </div>
    </div>


    <div class="card-footer p-4 text-right">
        <?= Html::submitButton(Yii::t('user', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>
    <?php ActiveForm::end(); ?>
</div>

<?php $this->endContent(); ?>

<?php
$this->registerJs(<<<JS
    jQuery(".dynamicform_wrapper").on("afterInsert", function(e, item) {
        jQuery(".dynamicform_wrapper .card-label-title").each(function(index) {
            jQuery(this).html("ลำดับที่ " + (index + 1))
        });
    });

    jQuery(".dynamicform_wrapper").on("afterDelete", function(e) {
        jQuery(".dynamicform_wrapper .card-label-title").each(function(index) {
            jQuery(this).html("ลำดับที่ " + (index + 1))
        });
    });
    jQuery(".dynamicform_wrapper1").on("afterInsert", function(e, item) {
        jQuery(".dynamicform_wrapper1 .card-label-title1").each(function(index) {
            jQuery(this).html("ลำดับที่ " + (index + 1))
        });
    });

    jQuery(".dynamicform_wrapper1").on("afterDelete", function(e) {
        jQuery(".dynamicform_wrapper1 .card-label-title1").each(function(index) {
            jQuery(this).html("ลำดับที่ " + (index + 1))
        });
    });
JS
);
?>