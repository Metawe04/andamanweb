<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\NewsCategory */

$this->title = 'บันทึกรายการ';
$this->params['breadcrumbs'][] = ['label' => 'News Categories', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="news-category-create">

    <?= $this->render('_form', [
        'model' => $model,
        'categories' => $categories,
    ]) ?>

</div>
