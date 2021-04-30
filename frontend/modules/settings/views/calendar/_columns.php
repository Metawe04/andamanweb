<?php

use metronic\helpers\Html;
use yii\helpers\Url;

return [
    /* [
        'class' => 'kartik\grid\CheckboxColumn',
        'width' => '20px',
    ], */
    [
        'class' => 'kartik\grid\SerialColumn',
        'width' => '30px',
    ],
    // [
    // 'class'=>'\kartik\grid\DataColumn',
    // 'attribute'=>'id',
    // ],
    [
        'class' => '\kartik\grid\DataColumn',
        'attribute' => 'title',
    ],
    [
        'class' => '\kartik\grid\DataColumn',
        'attribute' => 'date',
        'format' => ['date', 'php:d/m/Y'],
    ],
    [
        'class' => '\kartik\grid\DataColumn',
        'attribute' => 'start_time',
        'format' => ['date', 'php:H:i'],
    ],
    [
        'class' => '\kartik\grid\DataColumn',
        'attribute' => 'end_time',
        'format' => ['date', 'php:H:i'],
    ],
    [
        'class' => '\kartik\grid\DataColumn',
        'attribute' => 'url',
        'format' => 'url'
    ],
    // [
    // 'class'=>'\kartik\grid\DataColumn',
    // 'attribute'=>'text_color',
    // ],
    // [
    // 'class'=>'\kartik\grid\DataColumn',
    // 'attribute'=>'background_color',
    // ],
    [
        'class' => '\kartik\grid\ActionColumn',
        'noWrap' => true,
        'template' => '{update} {delete}',
        'buttons' => [
            'update' => function ($url, $model, $key) {
                return Html::a('<i class="flaticon2-pen"></i>', $url, [
                    'class' => 'btn btn-sm btn-outline-success btn-icon mr-2',
                    'title' => 'แก้ไข',
                    'role' => 'modal-remote'
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

];
