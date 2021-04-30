<?php

use yii\helpers\Html;
use kartik\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel metronic\user\models\UserSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Users';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="card card-custom">
    <div class="card-header flex-wrap border-0 pt-6 pb-0">
        <div class="card-title">
            <h3 class="card-label">
                <?= Html::encode($this->title) ?>
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
            'dataProvider' => $dataProvider,
            'responsive' => true,
            'hover' => true,
            'striped' => false,
            'bordered' => false,
            'condensed' => true,
            'pjax' => true,
            'filterModel' => $searchModel,
            'tableOptions' => [
                'class' => 'table table-head-custom table-head-bg table-borderless table-vertical-center'
            ],
            /* 'toolbar' => [
                '{export}',
                '{toggleData}'
            ],
            'panel' => [
                'heading' => false,
            ], */
            'columns' => [
                ['class' => '\kartik\grid\SerialColumn'],

                'id',
                'username',
                'email:email',
                'password_hash',
                'auth_key',
                //'confirmed_at',
                //'unconfirmed_email:email',
                //'blocked_at',
                //'registration_ip',
                //'created_at',
                //'updated_at',
                //'flags',
                //'last_login_at',

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