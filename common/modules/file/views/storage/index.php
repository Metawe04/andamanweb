<?php

use yii\helpers\Html;
use kartik\grid\GridView;
use kartik\date\DatePicker;

/* @var $this yii\web\View */
/* @var $searchModel common\modules\file\models\search\FileStorageItemSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'File Storage Items');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="card card-custom">
    <div class="card-header">
        <div class="card-title">
            <span class="card-icon">
                <i class="flaticon2-image-file text-primary"></i>
            </span>
            <h3 class="card-label">
                <?= Html::encode($this->title); ?>
                <small></small>
            </h3>
        </div>
        <div class="card-toolbar">
            <dl class="mr-2">
                <dt>
                    <?php echo Yii::t('app', 'Used size') ?>: <span class="text-muted"><?php echo Yii::$app->formatter->asSize($totalSize); ?></span>
                </dt>
            </dl>
            <dl>
                <dt class="mr-2">
                    <?php echo Yii::t('app', 'Count') ?>: <span class="text-muted"><?php echo $dataProvider->totalCount ?></span>
                </dt>
            </dl>

        </div>
    </div>
    <div class="card-body">
        <?php echo GridView::widget([
            'dataProvider' => $dataProvider,
            'filterModel' => $searchModel,
            'pjax' => true,
            'options' => [
                'class' => 'grid-view table-responsive',
            ],
            'columns' => [
                ['class' => '\kartik\grid\SerialColumn'],

                [
                    'attribute' => 'component',
                    'filter' => $components,
                ],
                [
                    'attribute' => 'path',
                    'value' => function ($model, $key, $index) {
                        return $model->base_url . (str_replace('\\', '/', $model->path));
                    },
                    'format' => 'url'
                ],
                'type',
                'size:size',
                'name',
                'upload_ip',
                [
                    'attribute' => 'created_at',
                    'format' => 'datetime',
                    'filterType' => GridView::FILTER_DATE,
                    'filterWidgetOptions' => [
                        'type' => DatePicker::TYPE_INPUT,
                        'pluginOptions' => [
                            'autoclose' => true,
                            'format' => 'dd-mm-yyyy'
                        ]
                    ],
                ],

                [
                    'class' => '\kartik\grid\ActionColumn',
                    'template' => '{view} {delete}',
                ],
            ],
        ]); ?>
    </div>
</div>