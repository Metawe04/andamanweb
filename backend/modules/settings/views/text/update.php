<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Text */

$this->title = 'แก้ไขรายการ';
$this->params['breadcrumbs'][] = ['label' => 'Texts', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->text_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="text-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
