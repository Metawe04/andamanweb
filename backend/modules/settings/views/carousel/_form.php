<?php

use kartik\form\ActiveForm;
use yii\helpers\Html;

/**
 * @var $this  yii\web\View
 * @var $model common\models\WidgetCarousel
 */
$this->registerCss(<<<CSS
.form-group {
    margin-bottom: 1rem;
}
CSS
);
?>

<?php $form = ActiveForm::begin([
    'enableClientValidation' => false,
    'enableAjaxValidation' => true,
]) ?>
<div class="form-group row">
    <div class="col-lg-6">
        <?php echo $form->field($model, 'key')->textInput(['maxlength' => 1024]) ?>
    </div>
    <div class="col-lg-6">
    </div>
</div>

<div class="form-group row">
    <div class="col-lg-6">
        <?php echo $form->field($model, 'status', [
            'checkTemplate' => "<div class=\"checkbox-inline\">\n{beginLabel}\n{input}\n{labelTitle}\n<span></span>\n{endLabel}\n{error}\n{hint}\n</div>",
            'labelOptions' => ['class' => 'checkbox'],
        ])->checkbox([]) ?>
    </div>
</div>


<?php if (!Yii::$app->request->isAjax) : ?>
    <div class="form-group">
        <?php echo Html::submitButton($model->isNewRecord ? 'บันทึก' : 'บันทึก', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        <?= Html::a('ยกเลิก', ['/settings/carousel/index'], ['class' => 'btn btn-secondary font-weight-bolder']) ?>
    </div>
<?php endif; ?>

<?php ActiveForm::end() ?>