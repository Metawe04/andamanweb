<?php

/*
 * This file is part of the Dektrium project.
 *
 * (c) Dektrium project <http://github.com/dektrium>
 *
 * For the full copyright and license information, please view the LICENSE.md
 * file that was distributed with this source code.
 */

use common\models\Country;
use common\models\Nationalrity;
use common\models\Race;
use common\models\Religion;
use common\models\TbCourse;
use common\models\TbDepartment;
use common\models\TbFaculty;
use common\models\TbUserPosition;
use common\models\TbUserTitleName;
use common\models\TbUsertype;
use yii\helpers\Html;
use dektrium\user\helpers\Timezone;
use kartik\form\ActiveForm;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;;


use yii\web\JsExpression;
use trntv\filekit\widget\Upload;
use kartik\select2\Select2;
use kartik\date\DatePicker;

/**
 * @var yii\web\View $this
 * @var yii\widgets\ActiveForm $form
 * @var dektrium\user\models\Profile $model
 */

$this->title = Yii::t('user', 'Profile settings');
$this->params['breadcrumbs'][] = $this->title;

$action = Yii::$app->controller->action->id;
?>

<?= $this->render('/_alert', ['module' => Yii::$app->getModule('user')]) ?>

<?php $this->beginContent('@metronic/user/views/settings/_menu_left.php', ['model' => $model]); ?>
<?php $form = ActiveForm::begin([
    'id' => 'profile-form',
    'options' => ['class' => 'form-horizontal'],
    /* 'fieldConfig' => [
                    'template' => "{label}\n<div class=\"col-lg-9\">{input}</div>\n<div class=\"col-sm-offset-3 col-lg-9\">{error}\n{hint}</div>",
                    'labelOptions' => ['class' => 'col-lg-3 control-label'],
                ], */
    'enableAjaxValidation' => true,
    'enableClientValidation' => false,
    'validateOnBlur' => false,
]); ?>
<!--begin::Body-->
<div class="card-body">
    <div class="row">
        <label class="col-xl-3"></label>
        <div class="col-lg-9 col-xl-6">
            <h5 class="font-weight-bold mb-6"></h5>
        </div>
    </div>
    <div class="form-group row">
        <label class="col-xl-4 col-lg-4 col-form-label text-right">
            <?= $model->getAttributeLabel('avatar') ?>
        </label>
        <div class="col-lg-9 col-xl-6">
            <?= $form->field($model, 'avatar')->widget(Upload::classname(), [
                'url' => ['upload-avatar'],
                'acceptFileTypes' => new JsExpression('/(\.|\/)(gif|jpe?g|png)$/i'),
            ])->label(false) ?>
            <span class="form-text text-muted">Allowed file types: png, jpg, jpeg.</span>
        </div>
    </div>

    <div class="form-group row">
        <label class="col-xl-2 col-lg-2 col-form-label text-right">
            <?= $model->getAttributeLabel('usertype_id') ?>
        </label>
        <div class="col-lg-4 col-xl-4">
            <?php
            echo $form->field($model, 'usertype_id')->widget(Select2::classname(), [
                'data' => ArrayHelper::map(TbUsertype::find()->asArray()->all(), 'usertype_id', 'usertype'),
                'options' => ['placeholder' => 'เลือกประเภทผู้ใช้งาน...'],
                'pluginOptions' => [
                    'allowClear' => true
                ],
                'bsVersion' => '4.x',
                'theme' => Select2::THEME_BOOTSTRAP,
                'disabled' => true
            ])->label(false);
            ?>
        </div>

        <label class="col-xl-2 col-lg-1 col-form-label text-right">
            <?= $model->getAttributeLabel('user_profile_id') ?>
        </label>
        <div class="col-lg-4 col-xl-4">
            <?= $form->field($model, 'user_profile_id')->textInput([
                'class' => 'form-control form-control-lg form-control-solid',
                'placeholder' => 'บันทึกข้อมูล',
            ])->label(false) ?>
        </div>
    </div>

    <div class="form-group row">
        <label class="col-xl-2 col-lg-2 col-form-label text-right">
            <?= $model->getAttributeLabel('user_position_id') ?>
        </label>
        <div class="col-lg-8 col-xl-4">
            <?php
            echo $form->field($model, 'user_position_id')->widget(Select2::classname(), [
                'data' => ArrayHelper::map(TbUserPosition::find()->asArray()->all(), 'user_position_id', 'user_position'),
                'options' => ['placeholder' => 'เลือกตำแหน่ง...'],
                'pluginOptions' => [
                    'allowClear' => true
                ],
                'bsVersion' => '4.x',
                'theme' => Select2::THEME_BOOTSTRAP,
            ])->label(false);
            ?>
        </div>

        <label class="col-xl-2 col-lg-1 col-form-label text-right">
            <?= $model->getAttributeLabel('user_course') ?>
        </label>
        <div class="col-lg-8 col-xl-4">
            <?php
            echo $form->field($model, 'user_course')->widget(Select2::classname(), [
                'data' => ArrayHelper::map(TbCourse::find()->asArray()->all(), 'course_id', 'course_name'),
                'options' => ['placeholder' => 'เลือกหลักสูตร...'],
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
            <?= $model->getAttributeLabel('user_department') ?>
        </label>
        <div class="col-lg-8 col-xl-4">
            <?php
            echo $form->field($model, 'user_department')->widget(Select2::classname(), [
                'data' => ArrayHelper::map(TbDepartment::find()->asArray()->all(), 'department_id', 'department_name'),
                'options' => ['placeholder' => 'เลือกภาควิชา...'],
                'pluginOptions' => [
                    'allowClear' => true
                ],
                'bsVersion' => '4.x',
                'theme' => Select2::THEME_BOOTSTRAP,
            ])->label(false);
            ?>
        </div>

        <label class="col-xl-2 col-lg-1 col-form-label text-right">
            <?= $model->getAttributeLabel('user_faculty') ?>
        </label>
        <div class="col-lg-8 col-xl-4">
            <?php
            echo $form->field($model, 'user_faculty')->widget(Select2::classname(), [
                'data' => ArrayHelper::map(TbFaculty::find()->asArray()->all(), 'faculty_id', 'faculty_name'),
                'options' => ['placeholder' => 'เลือกคณะ...'],
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
            <?= $model->getAttributeLabel('user_birthdate') ?>
        </label>
        <div class="col-lg-8 col-xl-4">
            <?=
                $form->field($model, 'user_birthdate', ['showLabels' => false])->widget(DatePicker::classname(), [
                    'options' => [
                        'placeholder' => 'วันที่...',
                        'autocomplete' => 'off',
                        'readonly' => true
                    ],
                    'pluginOptions' => [
                        'autoclose' => true,
                        'todayHighlight' => true,
                        'format' => 'dd/mm/yyyy',
                    ],

                ]);
            ?>
        </div>

        <label class="col-xl-2 col-lg-1 col-form-label text-right">
            <?= $model->getAttributeLabel('user_title_name') ?>
        </label>
        <div class="col-lg-8 col-xl-4">
            <?php
            echo $form->field($model, 'user_title_name')->widget(Select2::classname(), [
                'data' => ArrayHelper::map(TbUserTitleName::find()->asArray()->all(), 'user_title_name_id', 'user_title_name'),
                'options' => ['placeholder' => 'เลืกอกคำนำหน้า...'],
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
            <?= Html::activeLabel($model, 'user_fname_th', ['label' => 'ชื่อ(ไทย)']) ?>
        </label>
        <div class="col-lg-8 col-xl-4">
            <?= $form->field($model, 'user_fname_th')->textInput([
                'class' => 'form-control form-control-lg form-control-solid',
                'placeholder' => 'บันทึกข้อมูล',
            ])->label(false) ?>
        </div>

        <label class="col-xl-2 col-lg-1 col-form-label text-right">
            <?= Html::activeLabel($model, 'user_lname_th', ['label' => 'นามสกุล(ไทย)']) ?>
        </label>
        <div class="col-lg-8 col-xl-4">
            <?= $form->field($model, 'user_lname_th')->textInput([
                'class' => 'form-control form-control-lg form-control-solid',
                'placeholder' => 'บันทึกข้อมูล',
            ])->label(false) ?>
        </div>
    </div>

    <div class="form-group row">
        <label class="col-xl-2 col-lg-2 col-form-label text-right">
            <?= Html::activeLabel($model, 'user_fname_eng', ['label' => 'ชื่อ(อังกฤษ)']) ?>
        </label>
        <div class="col-lg-8 col-xl-4">
            <?= $form->field($model, 'user_fname_eng')->textInput([
                'class' => 'form-control form-control-lg form-control-solid',
                'placeholder' => 'บันทึกข้อมูล',
            ])->label(false) ?>
        </div>

        <label class="col-xl-2 col-lg-1 col-form-label text-right">
            <?= Html::activeLabel($model, 'user_lname_eng', ['label' => 'นามสกุล(อังกฤษ)']) ?>
        </label>
        <div class="col-lg-8 col-xl-4">
            <?= $form->field($model, 'user_lname_eng')->textInput([
                'class' => 'form-control form-control-lg form-control-solid',
                'placeholder' => 'บันทึกข้อมูล',
            ])->label(false) ?>
        </div>
    </div>

    <div class="form-group row">
        <label class="col-xl-2 col-lg-2 col-form-label text-right">
            <?= $model->getAttributeLabel('user_race_id') ?>
        </label>
        <div class="col-lg-8 col-xl-4">
            <?php
            echo $form->field($model, 'user_race_id')->widget(Select2::classname(), [
                'data' => ArrayHelper::map(Race::find()->asArray()->all(), 'race_id', 'race_name'),
                'options' => ['placeholder' => 'เลือกเชื้อชาติ...'],
                'pluginOptions' => [
                    'allowClear' => true
                ],
                'bsVersion' => '4.x',
                'theme' => Select2::THEME_BOOTSTRAP,
            ])->label(false);
            ?>
        </div>

        <label class="col-xl-2 col-lg-1 col-form-label text-right">
            <?= $model->getAttributeLabel('user_nationality_id') ?>
        </label>
        <div class="col-lg-8 col-xl-4">
            <?php
            echo $form->field($model, 'user_nationality_id')->widget(Select2::classname(), [
                'data' => ArrayHelper::map(Nationalrity::find()->asArray()->all(), 'nationality_id', 'nationality_name'),
                'options' => ['placeholder' => 'เลือกสัญชาติ...'],
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
            <?= $model->getAttributeLabel('user_country_id') ?>
        </label>
        <div class="col-lg-8 col-xl-4">
            <?php
            echo $form->field($model, 'user_country_id')->widget(Select2::classname(), [
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

        <label class="col-xl-2 col-lg-1 col-form-label text-right">
            <?= $model->getAttributeLabel('user_religion_id') ?>
        </label>
        <div class="col-lg-8 col-xl-4">
            <?php
            echo $form->field($model, 'user_religion_id')->widget(Select2::classname(), [
                'data' => ArrayHelper::map(Religion::find()->asArray()->all(), 'religion_id', 'religion_name'),
                'options' => ['placeholder' => 'เลือกศาสนา...'],
                'pluginOptions' => [
                    'allowClear' => true
                ],
                'bsVersion' => '4.x',
                'theme' => Select2::THEME_BOOTSTRAP,
            ])->label(false);
            ?>
        </div>
    </div>


</div>
<!--end::Body-->

<div class="card-footer p-4 text-right">
    <?= Html::submitButton(Yii::t('user', 'Save'), ['class' => 'btn btn-success']) ?>
</div>
<?php ActiveForm::end(); ?>
<?php $this->endContent(); ?>