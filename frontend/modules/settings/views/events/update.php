<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Events */

$this->title = 'แก้ไขรายการ';
$this->params['breadcrumbs'][] = ['label' => 'Events', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->events_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="events-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
