<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\News */

$this->title = 'แก้ไขรายการ';
$this->params['breadcrumbs'][] = ['label' => 'News', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->news_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="news-update">

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
