<?php

use yii\helpers\Html;
use kartik\grid\GridView;
use johnitvn\ajaxcrud\CrudAsset;
use metronic\widgets\bootstrap4\Modal;

CrudAsset::register($this);

/* @var $this yii\web\View */
/* @var $searchModel common\models\search\TbUserPositionSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'ตำแหน่งงาน';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="card card-custom">
    <div class="card-header flex-wrap border-0 pt-6 pb-0">
        <div class="card-title">
            <h3 class="card-label">
            <i class="fas fa-user-tag"></i>
                <?= Html::encode($this->title) ?>
                <span class="text-muted pt-2 font-size-sm d-block"></span>
            </h3>
        </div>
        <div class="card-toolbar">
            <!--begin::Button-->
            <?= Html::a('<i class="flaticon2-plus"></i> เพิ่มรายการ', ['create'], ['class' => 'btn btn-primary font-weight-bolder', 'role' => 'modal-remote']) ?>
            <!--end::Button-->
        </div>
    </div>
    <div class="card-body">
        <?php // echo $this->render('_search', ['model' => $searchModel]); 
        ?>

        <?= GridView::widget([
            'id' => 'crud-datatable',
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
            /* 'toolbar' => [
            '{export}',
            '{toggleData}'
        ],
        'panel' => [
            'heading' => false,
        ], */
            'filterModel' => $searchModel,
            'columns' => [
                ['class' => '\kartik\grid\SerialColumn'],

                'user_position',
                /*[
                'class' => '\kartik\grid\DataColumn',
                'attribute' => 'name',
                'label' => 'name',
                'format' => 'text'
            ],*/
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
            ],
        ]); ?>

    </div>
</div>


<?php Modal::begin([
    "id" => "ajaxCrudModal",
    "footer" => "", // always need it for jquery plugin
]) ?>
<?php Modal::end(); ?>