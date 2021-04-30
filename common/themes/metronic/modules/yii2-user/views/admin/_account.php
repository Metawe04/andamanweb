<?php

/*
 * This file is part of the Dektrium project
 *
 * (c) Dektrium project <http://github.com/dektrium>
 *
 * For the full copyright and license information, please view the LICENSE.md
 * file that was distributed with this source code.
 */

use yii\bootstrap\ActiveForm;
use yii\helpers\Html;

/**
 * @var yii\web\View $this
 * @var dektrium\user\models\User $user
 */
$this->title = Yii::t('user', 'Account details');
$this->params['breadcrumbs'][] = ['label' => Yii::t('user', 'Users'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<?php $this->beginContent('@dektrium/user/views/admin/update.php', ['user' => $user]) ?>

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

<?= $this->render('_user', ['form' => $form, 'user' => $user]) ?>

<div class="form-group row">
    <label class="col-xl-3 col-lg-3 col-form-label text-right">
    </label>
    <div class="col-lg-9 col-xl-6  text-right">
        <?= Html::submitButton(Yii::t('user', 'Update'), ['class' => 'btn btn-success ml-4']) ?>
        <?= Html::a('ยกเลิก', ['index'], ['class' => 'btn btn-secondary']); ?>
    </div>
</div>

<?php ActiveForm::end(); ?>

<?php $this->endContent() ?>