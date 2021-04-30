<?php

use common\grid\EnumColumn;
use common\models\WidgetCarousel;
use kartik\grid\GridView;
use yii\helpers\Html;
use metronic\widgets\bootstrap4\Modal;

/**
 * @var $this                  yii\web\View
 * @var $searchModel           \frontend\modules\widget\models\search\CarouselSearch
 * @var $dataProvider          yii\data\ActiveDataProvider
 * @var $model                 common\models\WidgetCarousel
 */

$this->title = 'ตั้งค่าสไลด์รูปภาพ';

$this->params['breadcrumbs'][] = $this->title;

?>
<div class="card card-custom">
    <div class="card-header">
        <div class="card-title">
            <h3 class="card-label">
                <?= Html::encode($this->title); ?>
            </h3>
        </div>
        <div class="card-toolbar">
            <!--begin::Button-->
            <?php // Html::a('<i class="flaticon2-plus"></i> เพิ่มรายการ', ['/settings/carousel/create'], ['class' => 'btn btn-success font-weight-bolder', 'role' => 'modal-remote']) 
            ?>
            <!--end::Button-->
        </div>
    </div>
    <div class="card-body">
        <div class="accordion accordion-solid accordion-toggle-plus" id="accordionExample3">
            <div class="card">
                <div class="card-header" id="headingOne3">
                    <div class="card-title collapsed btn btn-success" data-toggle="collapse" data-target="#collapseOne3" aria-expanded="false">
                        บันทึกรายการ
                    </div>
                </div>
                <div id="collapseOne3" class="collapse" data-parent="#accordionExample3">
                    <div class="card-body">
                        <?php echo $this->render('_form', [
                            'model' => $model,
                        ]) ?>
                    </div>
                </div>
            </div>
        </div>

        <?php echo GridView::widget([
            'id' => 'gridview',
            'dataProvider' => $dataProvider,
            'filterModel' => $searchModel,
            'responsive' => true,
            'hover' => true,
            'striped' => false,
            'bordered' => false,
            'condensed' => true,
            'pjax' => true,
            'tableOptions' => [
                'class' => 'table table-borderless table-vertical-center'
            ],
            'columns' => [
                [
                    'attribute' => 'id',
                    'options' => ['style' => 'width: 5%'],
                ],
                [
                    'attribute' => 'key',
                    'value' => function ($model) {
                        return Html::a($model->key, ['update', 'id' => $model->id], ['data-pjax' => 0]);
                    },
                    'format' => 'raw',
                ],
                [
                    'attribute' => 'status',
                    'class' => '\common\grid\ToggleColumn',
                    'options' => ['style' => 'width:100px;'],
                    'contentOptions' => [
                        'style' => 'white-space: nowrap;'
                    ],
                    'pjaxId' => 'gridview-pjax',
                    'linkTemplateOn' => '<a class="toggle-column btn btn-outline-success btn-sm btn-block" data-pjax="0" href="{url}"><i class="flaticon2-check-mark"></i> {label}</a>',
                    'linkTemplateOff' => '<a class="toggle-column btn btn-outline-danger btn-sm btn-block" data-pjax="0" href="{url}"><i class="flaticon2-delete"></i> {label}</a>'
                ],
                /* [
                    'class' => EnumColumn::class,
                    'attribute' => 'status',
                    'options' => ['style' => 'width: 10%'],
                    'enum' => WidgetCarousel::statuses(),
                    'filter' => WidgetCarousel::statuses(),
                ], */
                [
                    'class' => '\kartik\grid\ActionColumn',
                    'noWrap' => true,
                    'template' => '{update} {delete}',
                    'buttons' => [
                        'update' => function ($url, $model, $key) {
                            return Html::a('<i class="flaticon2-pen"></i>', $url, [
                                'class' => 'btn btn-sm btn-outline-success btn-icon mr-2',
                                'title' => 'แก้ไข',
                                'data-pjax' => 0
                            ]);
                        },
                        'delete' => function ($url, $model, $key) {
                            return Html::a('<i class="fas fa-trash-alt"></i>', $url, [
                                'class' => 'btn btn-sm btn-outline-danger btn-icon',
                                'title' => 'ลบ',
                                'data-pjax' => 0,
                                'data-confirm' => Yii::t('yii', 'Are you sure you want to delete this item?'),
                                'data-method' => 'post',
                            ]);
                        },
                    ]
                ],
            ],
        ]); ?>
    </div>
</div>
<?php
Modal::begin([
    'title' => '',
    "id" => "ajaxCrudModal",
    "footer" => "",
]);
Modal::end();
?>