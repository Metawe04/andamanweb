<?php

use common\grid\EnumColumn;
use kartik\grid\GridView;
use yii\helpers\Html;

/**
 * @var $this                  yii\web\View
 * @var $model                 common\models\WidgetCarousel
 * @var $carouselItemsProvider yii\data\ArrayDataProvider
 */

$this->title = 'แก้ไขรายการ #' . $model->key;

$this->params['breadcrumbs'][] = ['label' => 'Widget Carousels', 'url' => ['index']];
$this->params['breadcrumbs'][] = 'แก้ไข';

?>
<div class="card card-custom ">
    <div class="card-header flex-wrap border-0 pt-6 pb-0">
        <div class="card-title">
            <h3 class="card-label">
                <?= Html::encode($this->title) ?>
            </h3>
        </div>
        <div class="card-toolbar">
            <!--begin::Button-->

            <!--end::Button-->
        </div>
    </div>
    <div class="card-body">
        <?php echo $this->render('_form', [
            'model' => $model,
        ]) ?>
        <div class="separator separator-dashed mt-8 mb-5"></div>
        <p>
            <?php echo Html::a('<i class="flaticon2-image-file"></i> อัพโหลดรูปภาพสไลด์', ['carousel-item/create', 'carousel_id' => $model->id], ['class' => 'btn btn-success']) ?>
        </p>

        <?php echo GridView::widget([
            'id' => 'gridview',
            'dataProvider' => $carouselItemsProvider,
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
                    'attribute' => 'order',
                    'options' => ['style' => 'width: 5%'],
                    'hAlign' => 'center'
                ],
                [
                    'label' => 'รูปภาพ',
                    'attribute' => 'path',
                    'format' => 'raw',
                    'value' => function ($model, $key, $index) {
                        return Html::img($model['base_url'].str_replace('\\', '/', $model['path']), ['alt' => 'Pic' ,'width' => '150px']);
                    },
                ],
                'url:url',
                [
                    'attribute' => 'caption',
                    'format' => 'html',
                ],
                [
                    'attribute' => 'status',
                    'class' => '\common\grid\ToggleColumn',
                    'options' => ['style' => 'width:100px;'],
                    'contentOptions' => [
                        'style' => 'white-space: nowrap;'
                    ],
                    'action' => 'toggle-update-item',
                    'pjaxId' => 'gridview-pjax',
                    'linkTemplateOn' => '<a class="toggle-column btn btn-outline-success btn-sm btn-block" data-pjax="0" href="{url}"><i class="flaticon2-check-mark"></i> {label}</a>',
                    'linkTemplateOff' => '<a class="toggle-column btn btn-outline-danger btn-sm btn-block" data-pjax="0" href="{url}"><i class="flaticon2-delete"></i> {label}</a>'
                ],
                /* [
                    'class' => EnumColumn::class,
                    'attribute' => 'status',
                    'enum' => [
                        'Disabled',
                        'Enabled',
                    ],
                ], */
                [
                    'class' => '\kartik\grid\ActionColumn',
                    'controller' => '/settings/carousel-item',
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