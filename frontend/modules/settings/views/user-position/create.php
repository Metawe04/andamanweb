<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\TbUserPosition */

$this->title = 'บันทึกรายการ';
$this->params['breadcrumbs'][] = ['label' => 'ตำแหน่งงาน', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="tb-user-position-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
