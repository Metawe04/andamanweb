<?php

use yii\helpers\Url;
use yii\helpers\Html;
use yii\bootstrap4\Modal;
use kartik\grid\GridView;
use kartik\color\ColorInputAsset;
use metronic\widgets\ajaxcrud\AjaxCrudAsset;

/* @var $this yii\web\View */
/* @var $searchModel frontend\modules\settings\models\search\CalendarSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'ตารางกิจกรรม';
$this->params['breadcrumbs'][] = $this->title;

AjaxCrudAsset::register($this);
ColorInputAsset::register($this);

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
            <?= Html::a('<i class="flaticon2-plus"></i> เพิ่มรายการ', ['create'], [
                'class' => 'btn btn-primary font-weight-bolder',
                'role' => 'modal-remote'
            ]) ?>
            <!--end::Button-->
        </div>
    </div>
    <div class="card-body">
        <div class="calendar-index">
            <div id="ajaxCrudDatatable">
                <?= GridView::widget([
                    'id' => 'crud-datatable',
                    'dataProvider' => $dataProvider,
                    'filterModel' => $searchModel,
                    'pjax' => true,
                    'columns' => require(__DIR__ . '/_columns.php'),
                    'toolbar' => [
                        ['content' => Html::a(
                            '<i class="glyphicon glyphicon-repeat"></i>',
                            [''],
                            ['data-pjax' => 1, 'class' => 'btn btn-default', 'title' => 'Reset Grid']
                        ) .
                            '{toggleData}' .
                            '{export}'],
                    ],
                    'striped' => true,
                    'condensed' => true,
                    'responsive' => true,
                    // 'panel' => [
                    //     'type' => 'primary',
                    //     'heading' => '<i class="glyphicon glyphicon-list"></i> Calendars listing',
                    //     'before' => '<em>* Resize table columns just like a spreadsheet by dragging the column edges.</em>',
                    //     'after' => BulkButtonWidget::widget([
                    //         'buttons' => Html::a(
                    //             '<i class="glyphicon glyphicon-trash"></i>&nbsp; Delete All',
                    //             ["bulk-delete"],
                    //             [
                    //                 "class" => "btn btn-danger btn-xs",
                    //                 'role' => 'modal-remote-bulk',
                    //                 'data-confirm' => false, 'data-method' => false, // for overide yii data api
                    //                 'data-request-method' => 'post',
                    //                 'data-confirm-title' => 'Are you sure?',
                    //                 'data-confirm-message' => 'Are you sure want to delete this item'
                    //             ]
                    //         ),
                    //     ]) .
                    //         '<div class="clearfix"></div>',
                    // ]
                ]) ?>
            </div>
        </div>
    </div>
</div>

<?php Modal::begin([
    "id" => "ajaxCrudModal",
    "footer" => "", // always need it for jquery plugin
    "size" => "modal-lg"
]) ?>
<?php Modal::end(); ?>

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
            $.pjax.reload({container: '#crud-datatable-pjax'});
        }
    });
    return false;
}
JS
);
?>