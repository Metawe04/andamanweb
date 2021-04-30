<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\TbResearch */

$this->title = 'แก้ไขรายการ';
$this->params['breadcrumbs'][] = ['label' => 'Tb Researches', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->research_id, 'url' => ['view', 'id' => $model->research_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="tb-research-update">

    <?= $this->render('_form', [
        'model' => $model,
        'researchUsers' => $researchUsers
    ]) ?>

</div>
