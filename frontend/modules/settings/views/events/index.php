<?php

use yii\helpers\Html;
use kartik\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel frontend\modules\settings\models\search\EventsSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'กิจกรรม';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="card card-custom">
    <div class="card-header flex-wrap border-0 pt-6 pb-0">
        <div class="card-title">

            <h3 class="card-label">
                <i class="far fa-images"></i> <?= Html::encode($this->title) ?>
                <span class="text-muted pt-2 font-size-sm d-block"></span>
            </h3>
            
        </div>
        <div class="card-toolbar">
            <!--begin::Button-->
            <?= Html::a('<i class="flaticon2-plus"></i> เพิ่มรายการ', ['create'], ['class' => 'btn btn-primary font-weight-bolder']) ?>
            <!--end::Button-->
        </div>
    </div>
    <div class="card-body">
        <?php // echo $this->render('_search', ['model' => $searchModel]); 
        ?>

        <?= GridView::widget([
            'id' => 'gridview',
            'dataProvider' => $dataProvider,
            'responsive' => true,
            'hover' => true,
            'striped' => false,
            'bordered' => false,
            'condensed' => true,
            'pjax' => true,
            'tableOptions' => [
                'class' => 'table table-head-custom table-head-bg table-borderless table-vertical-center'
            ],
            'panel' => [
                'heading' => false,
               'before' =>  $this->render('_search', ['model' => $searchModel]),
                'after' => '',
            ],
         //   'filterModel' => $searchModel,
            'columns' => [
                ['class' => '\kartik\grid\SerialColumn'],

//                'events_id',
                'title',
                'slug',
                [
                    'attribute' => 'published_at',
                    'format' => ['date', 'php:d-m-Y']
                ],
                [
                    'attribute' => 'status',
                    'class' => '\common\grid\ToggleColumn',
                    'options' => ['style' => 'width:100px;'],
                    'contentOptions' => [
                        'style' => 'white-space: nowrap;text-align: center;'
                    ],
                    'headerOptions' => [
                        'style' => 'white-space: nowrap;text-align: center;'
                    ],
                    'pjaxId' => 'gridview-pjax',
                    'linkTemplateOn' => '<a class="toggle-column btn btn-outline-success btn-sm btn-block" data-pjax="0" href="{url}"><i class="flaticon2-check-mark"></i> {label}</a>',
                    'linkTemplateOff' => '<a class="toggle-column btn btn-outline-danger btn-sm btn-block" data-pjax="0" href="{url}"><i class="flaticon2-delete"></i> {label}</a>'
                ],
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
$this->registerJS(<<<JS
yii.allowAction = function (\$e) {
    var message = \$e.data('confirm');
    return message === undefined || yii.confirm(message, \$e);
};
yii.confirm = function (message, \$e) {
    var url = $(this).attr('href');
    var method = $(this).data('method')
    Swal.fire({
        title: message,
        text: "",
        type: 'question',
        showCancelButton: true,
        confirmButtonText: 'ยืนยัน',
        cancelButtonText: 'ยกเลิก',
        showLoaderOnConfirm: true,
        allowOutsideClick: false,
        preConfirm: function() {
            return new Promise(function(resolve) {
                $.ajax({
                    method: method,
                    url: url,
                    dataType: "json",
                    success: function(res) {
                        resolve(res)
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                        Swal.fire({
                            type: 'error',
                            title: errorThrown,
                            showConfirmButton: false,
                            timer: 3000
                        })
                    }
                });
            })
        }
    }).then((result) => {
        if (result.value) {
            Swal.fire({
                type: 'success',
                title: result.value.message,
                showConfirmButton: false,
                timer: 3000
            });
            $.pjax.reload({container: '#gridview-pjax'});
        }
    });
    return false;
}
JS
);
?>