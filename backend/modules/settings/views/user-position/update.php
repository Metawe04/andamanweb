<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\TbUserPosition */

$this->title = 'แก้ไขรายการ';
$this->params['breadcrumbs'][] = ['label' => 'Tb User Positions', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->user_position_id, 'url' => ['view', 'id' => $model->user_position_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="tb-user-position-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
