<?php

/*
 * This file is part of the Dektrium project
 *
 * (c) Dektrium project <http://github.com/dektrium>
 *
 * For the full copyright and license information, please view the LICENSE.md
 * file that was distributed with this source code.
 */

use kartik\form\ActiveForm;
use yii\helpers\Html;
use yii\web\JsExpression;
use trntv\filekit\widget\Upload;
use common\models\TbUsertype;
use yii\helpers\ArrayHelper;
use kartik\select2\Select2;
use common\models\TbAcademicposition;
use common\models\TbUserPosition;
use common\models\TbCourse;
use common\models\TbDepartment;
use common\models\TbFaculty;
use kartik\date\DatePicker;
use common\models\Race;
use common\models\Nationalrity;
use common\models\Country;
use common\models\Religion;
use common\models\TbUserTitleName;

/**
 * @var yii\web\View $this
 * @var dektrium\user\models\User $user
 * @var dektrium\user\models\Profile $profile
 */
$this->title = Yii::t('user', 'Profile details');
$this->params['breadcrumbs'][] = ['label' => Yii::t('user', 'Users'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;

?>

<?php $this->beginContent('@dektrium/user/views/admin/update.php', ['user' => $user]) ?>
<div class="card-body pt-4">
    <!--begin::Form-->
    <?php $form = ActiveForm::begin(['id' => 'form-profile' . $profile->formName(), 'options' => ['class' => 'form'], 'formConfig' => ['showLabels' => false]]); ?>
    <div class="row">
        <label class="col-xl-4"></label>
        <div class="col-lg-9 col-xl-6">
            <h5 class="font-weight-bold mb-6">
            </h5>
        </div>
    </div>

    <div class="form-group row">
        <label class="col-xl-4 col-lg-4 col-form-label text-right">
            <?= $profile->getAttributeLabel('avatar') ?>
        </label>
        <div class="col-lg-9 col-xl-8">
            <?= $form->field($profile, 'avatar')->widget(Upload::classname(), [
                'url' => ['upload-avatar'],
                'acceptFileTypes' => new JsExpression('/(\.|\/)(gif|jpe?g|png)$/i'),
            ])->label(false) ?>
        </div>
    </div>

    <div class="form-group row">
        <label class="col-xl-2 col-lg-2 col-form-label text-right">
            <?= $profile->getAttributeLabel('usertype_id') ?>
        </label>
        <div class="col-lg-4 col-xl-4">
            <?php
            echo $form->field($profile, 'usertype_id')->widget(Select2::classname(), [
                'data' => ArrayHelper::map(TbUsertype::find()->asArray()->all(), 'usertype_id', 'usertype'),
                'options' => ['placeholder' => 'เลือกประเภทผู้ใช้งาน...'],
                'pluginOptions' => [
                    'allowClear' => true
                ],

            ])->label(false);
            ?>
        </div>

        <label class="col-xl-2 col-lg-1 col-form-label text-right">
            <?= $profile->getAttributeLabel('user_profile_id') ?>
        </label>
        <div class="col-lg-4 col-xl-4">
            <?= $form->field($profile, 'user_profile_id')->textInput([
                'class' => 'form-control form-control-lg form-control-solid',
                'placeholder' => 'บันทึกข้อมูล',
            ])->label(false) ?>
        </div>

    </div>

    <div class="form-group row">
        <label class="col-xl-2 col-lg-2 col-form-label text-right">
            <?= $profile->getAttributeLabel('user_position_id') ?>
        </label>
        <div class="col-lg-8 col-xl-4">
            <?php
            echo $form->field($profile, 'user_position_id')->widget(Select2::classname(), [
                'data' => ArrayHelper::map(TbUserPosition::find()->asArray()->all(), 'user_position_id', 'user_position'),
                'options' => ['placeholder' => 'เลือกตำแหน่ง...'],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ])->label(false);
            ?>
        </div>

        <label class="col-xl-2 col-lg-1 col-form-label text-right">
            <?= $profile->getAttributeLabel('user_course') ?>
        </label>
        <div class="col-lg-8 col-xl-4">
            <?php
            echo $form->field($profile, 'user_course')->widget(Select2::classname(), [
                'data' => ArrayHelper::map(TbCourse::find()->asArray()->all(), 'course_id', 'course_name'),
                'options' => ['placeholder' => 'เลือกหลักสูตร...'],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ])->label(false);
            ?>
        </div>
    </div>

    <div class="form-group row">
        <label class="col-xl-2 col-lg-2 col-form-label text-right">
            <?= $profile->getAttributeLabel('user_department') ?>
        </label>
        <div class="col-lg-8 col-xl-4">
            <?php
            echo $form->field($profile, 'user_department')->widget(Select2::classname(), [
                'data' => ArrayHelper::map(TbDepartment::find()->asArray()->all(), 'department_id', 'department_name'),
                'options' => ['placeholder' => 'เลือกภาควิชา...'],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ])->label(false);
            ?>
        </div>

        <label class="col-xl-2 col-lg-1 col-form-label text-right">
            <?= $profile->getAttributeLabel('user_faculty') ?>
        </label>
        <div class="col-lg-8 col-xl-4">
            <?php
            echo $form->field($profile, 'user_faculty')->widget(Select2::classname(), [
                'data' => ArrayHelper::map(TbFaculty::find()->asArray()->all(), 'faculty_id', 'faculty_name'),
                'options' => ['placeholder' => 'เลือกคณะ...'],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ])->label(false);
            ?>
        </div>
    </div>

    <div class="form-group row">
        <label class="col-xl-2 col-lg-2 col-form-label text-right">
            <?= $profile->getAttributeLabel('user_birthdate') ?>
        </label>
        <div class="col-lg-8 col-xl-4">
            <?=
                $form->field($profile, 'user_birthdate', ['showLabels' => false])->widget(DatePicker::classname(), [
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
            <?= $profile->getAttributeLabel('user_title_name') ?>
        </label>
        <div class="col-lg-8 col-xl-4">
            <?php
            echo $form->field($profile, 'user_title_name')->widget(Select2::classname(), [
                'data' => ArrayHelper::map(TbUserTitleName::find()->asArray()->all(), 'user_title_name_id', 'user_title_name'),
                'options' => ['placeholder' => 'เลืกอกคำนำหน้า...'],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ])->label(false);
            ?>
        </div>

    </div>

    <div class="form-group row">
        <label class="col-xl-2 col-lg-2 col-form-label text-right">
        <?= Html::activeLabel($profile, 'user_fname_th', ['label' => 'ชื่อ(ไทย)']) ?>
        </label>
        <div class="col-lg-8 col-xl-4">
            <?= $form->field($profile, 'user_fname_th')->textInput([
                'class' => 'form-control form-control-lg form-control-solid',
                'placeholder' => 'บันทึกข้อมูล',
            ])->label(false) ?>
        </div>

        <label class="col-xl-2 col-lg-1 col-form-label text-right">
         <?= Html::activeLabel($profile, 'user_lname_th', ['label' => 'นามสกุล(ไทย)']) ?>
        </label>
        <div class="col-lg-8 col-xl-4">
            <?= $form->field($profile, 'user_lname_th')->textInput([
                'class' => 'form-control form-control-lg form-control-solid',
                'placeholder' => 'บันทึกข้อมูล',
            ])->label(false) ?>
        </div>
    </div>

    <div class="form-group row">
        <label class="col-xl-2 col-lg-2 col-form-label text-right">
            <?= Html::activeLabel($profile, 'user_fname_eng', ['label' => 'ชื่อ(อังกฤษ)']) ?>
        </label>
        <div class="col-lg-8 col-xl-4">
            <?= $form->field($profile, 'user_fname_eng')->textInput([
                'class' => 'form-control form-control-lg form-control-solid',
                'placeholder' => 'บันทึกข้อมูล',
            ])->label(false) ?>
        </div>

        <label class="col-xl-2 col-lg-1 col-form-label text-right">
            <?= Html::activeLabel($profile, 'user_lname_eng', ['label' => 'นามสกุล(อังกฤษ)']) ?>
        </label>
        <div class="col-lg-8 col-xl-4">
            <?= $form->field($profile, 'user_lname_eng')->textInput([
                'class' => 'form-control form-control-lg form-control-solid',
                'placeholder' => 'บันทึกข้อมูล',
            ])->label(false) ?>
        </div>
    </div>


    <div class="form-group row">
        <label class="col-xl-2 col-lg-2 col-form-label text-right">
            <?= $profile->getAttributeLabel('user_race_id') ?>
        </label>
        <div class="col-lg-8 col-xl-4">
            <?php
            echo $form->field($profile, 'user_race_id')->widget(Select2::classname(), [
                'data' => ArrayHelper::map(Race::find()->asArray()->all(), 'race_id', 'race_name'),
                'options' => ['placeholder' => 'เลือกเชื้อชาติ...'],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ])->label(false);
            ?>
        </div>

        <label class="col-xl-2 col-lg-1 col-form-label text-right">
            <?= $profile->getAttributeLabel('user_nationality_id') ?>
        </label>
        <div class="col-lg-8 col-xl-4">
            <?php
            echo $form->field($profile, 'user_nationality_id')->widget(Select2::classname(), [
                'data' => ArrayHelper::map(Nationalrity::find()->asArray()->all(), 'nationality_id', 'nationality_name'),
                'options' => ['placeholder' => 'เลือกสัญชาติ...'],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ])->label(false);
            ?>
        </div>
    </div>

    <div class="form-group row">
        <label class="col-xl-2 col-lg-2 col-form-label text-right">
            <?= $profile->getAttributeLabel('user_country_id') ?>
        </label>
        <div class="col-lg-8 col-xl-4">
            <?php
            echo $form->field($profile, 'user_country_id')->widget(Select2::classname(), [
                'data' => ArrayHelper::map(Country::find()->asArray()->all(), 'COUNTRYID', 'COUNTRY_NAME'),
                'options' => ['placeholder' => 'เลือกประเทศ...'],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ])->label(false);
            ?>
        </div>

        <label class="col-xl-2 col-lg-1 col-form-label text-right">
            <?= $profile->getAttributeLabel('user_religion_id') ?>
        </label>
        <div class="col-lg-8 col-xl-4">
            <?php
            echo $form->field($profile, 'user_religion_id')->widget(Select2::classname(), [
                'data' => ArrayHelper::map(Religion::find()->asArray()->all(), 'religion_id', 'religion_name'),
                'options' => ['placeholder' => 'เลือกศาสนา...'],
                'pluginOptions' => [
                    'allowClear' => true
                ],
            ])->label(false);
            ?>
        </div>
    </div>
</div>
<div class="card-footer p-4 text-right">
        <?= Html::submitButton(Yii::t('user', 'Update'), ['class' => 'btn btn-success ml-4']) ?>
        <?= Html::a('ยกเลิก', ['index'], ['class' => 'btn btn-secondary']); ?>
</div>
  

<?php ActiveForm::end(); ?>

    <?php /*
<?php $form = ActiveForm::begin([
    'layout' => 'horizontal',
    'enableAjaxValidation' => true,
    'enableClientValidation' => false,
    'fieldConfig' => [
        'horizontalCssClasses' => [
            'wrapper' => 'col-lg-12',
        ],
    ],
]); ?>
<div class="row">
    <label class="col-xl-3"></label>
    <div class="col-lg-9 col-xl-6">
        <h5 class="font-weight-bold mb-6">
        </h5>
    </div>
</div>

<div class="form-group row">
    <label class="col-xl-3 col-lg-3 col-form-label text-right">
        <?= $profile->getAttributeLabel('avatar') ?>
    </label>
    <div class="col-lg-9 col-xl-8">
        <?= $form->field($profile, 'avatar')->widget(Upload::classname(), [
            'url' => ['upload-avatar'],
            'acceptFileTypes' => new JsExpression('/(\.|\/)(gif|jpe?g|png)$/i'),
        ])->label(false) ?>
    </div>
</div>

<div class="form-group row">
    <label class="col-xl-3 col-lg-3 col-form-label text-right">
        <?= $profile->getAttributeLabel('name') ?>
    </label>
    <div class="col-lg-9 col-xl-6">
        <?= $form->field($profile, 'name')->textInput([
            'class' => 'form-control form-control-lg form-control-solid'
        ])->label(false) ?>
    </div>
</div>

<div class="form-group row">
    <label class="col-xl-3 col-lg-3 col-form-label text-right">
        <?= $profile->getAttributeLabel('public_email') ?>
    </label>
    <div class="col-lg-9 col-xl-6">
        <?= $form->field($profile, 'public_email')->textInput([
            'class' => 'form-control form-control-lg form-control-solid'
        ])->label(false) ?>
    </div>
</div>

<div class="form-group row">
    <label class="col-xl-3 col-lg-3 col-form-label text-right">
        <?= $profile->getAttributeLabel('website') ?>
    </label>
    <div class="col-lg-9 col-xl-6">
        <?= $form->field($profile, 'website')->textInput([
            'class' => 'form-control form-control-lg form-control-solid'
        ])->label(false) ?>
    </div>
</div>

<div class="form-group row">
    <label class="col-xl-3 col-lg-3 col-form-label text-right">
        <?= $profile->getAttributeLabel('location') ?>
    </label>
    <div class="col-lg-9 col-xl-6">
        <?= $form->field($profile, 'location')->textInput([
            'class' => 'form-control form-control-lg form-control-solid'
        ])->label(false) ?>
    </div>
</div>

<div class="form-group row">
    <label class="col-xl-3 col-lg-3 col-form-label text-right">
        <?= $profile->getAttributeLabel('gravatar_email') ?>
    </label>
    <div class="col-lg-9 col-xl-6">
        <?= $form->field($profile, 'gravatar_email')->textInput([
            'class' => 'form-control form-control-lg form-control-solid'
        ])->label(false) ?>
    </div>
</div>

<div class="form-group row">
    <label class="col-xl-3 col-lg-3 col-form-label text-right">
        <?= $profile->getAttributeLabel('bio') ?>
    </label>
    <div class="col-lg-9 col-xl-6">
        <?= $form->field($profile, 'bio')->textarea([
            'class' => 'form-control form-control-lg form-control-solid'
        ])->label(false) ?>
    </div>
</div>

<div class="form-group row">
    <label class="col-xl-3 col-lg-3 col-form-label text-right">
    </label>
    <div class="col-lg-9 col-xl-6">
        <?= Html::submitButton(Yii::t('user', 'Update'), ['class' => 'btn btn-success ml-4']) ?>
    </div>
</div>

<?php ActiveForm::end(); ?>

</div>*/ ?>
<?php $this->endContent() ?>