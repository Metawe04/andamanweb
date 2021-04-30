<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Calendar */
?>
<div class="calendar-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'title',
            'date',
            'start_time',
            'end_time',
            'url:url',
            'text_color',
            'background_color',
        ],
    ]) ?>

</div>
