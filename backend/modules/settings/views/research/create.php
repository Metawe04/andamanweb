<?php

use yii\helpers\Html;
use common\models\TbResearchUserOnus;
/* @var $this yii\web\View */
/* @var $model common\models\TbResearch */

$this->title = 'บันทึกรายการ';
$this->params['breadcrumbs'][] = ['label' => 'Tb Researches', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="tb-research-create">

    <?= $this->render('_form', [
        'model' => $model,
        'researchUsers' => (empty($researchUsers)) ? [new TbResearchUserOnus] : $researchUsers
    ]) ?>

</div>
