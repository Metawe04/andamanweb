<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\NewsCategory */

$this->title = 'แก้ไขรายการ';
$this->params['breadcrumbs'][] = ['label' => 'News Categories', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->title, 'url' => ['view', 'id' => $model->category_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="news-category-update">

    <?= $this->render('_form', [
        'model' => $model,
        'categories' => $categories,
    ]) ?>

</div>
