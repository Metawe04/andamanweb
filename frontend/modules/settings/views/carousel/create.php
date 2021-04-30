<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model metronic\user\models\User */

$this->title = 'บันทึกรายการ';
$this->params['breadcrumbs'][] = ['label' => 'Users', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<?= $this->render('_form', [
    'model' => $model,
]) ?>
