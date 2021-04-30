<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Events */

$this->title = 'บันทึกรายการ';
$this->params['breadcrumbs'][] = ['label' => 'Events', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="events-create">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
