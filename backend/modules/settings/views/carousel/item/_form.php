<?php

use kartik\form\ActiveForm;
use yii\helpers\Html;

/**
 * @var $this  yii\web\View
 * @var $model common\models\WidgetCarouselItem
 * @var $form  yii\bootstrap\ActiveForm
 */

?>
<div class="card card-custom">
    <div class="card-header">
        <div class="card-title">
            <h3 class="card-label">
                <?= Html::encode($this->title) ?>
            </h3>
        </div>
    </div>
    <div class="card-body">
        <?php $form = ActiveForm::begin() ?>

        <?php echo $form->errorSummary($model) ?>

        <?php echo $form->field($model, 'image')->widget(
            \trntv\filekit\widget\Upload::class,
            [
                'url' => ['/file/storage/upload'],
            ]
        ) ?>

        <?php echo $form->field($model, 'order')->textInput() ?>

        <?php echo $form->field($model, 'url')->textInput(['maxlength' => 1024]) ?>

        <?=
            $form->field($model, 'caption')->widget(\vova07\imperavi\Widget::className(), [
                'settings' => [
                    'lang' => 'th',
                    'minHeight' => 200,
                    'plugins' => [
                        'fullscreen', 'fontcolor', 'video'
                    ],
                    'clips' => [
                        ['Lorem ipsum...', 'Lorem...'],
                        ['red', '<span class="label-red">red</span>'],
                        ['green', '<span class="label-green">green</span>'],
                        ['blue', '<span class="label-blue">blue</span>'],
                    ],
                    'buttonSource' => true,
                    'convertDivs' => false,
                    'removeEmptyTags' => true,
                ],
            ]);
        ?>
        <?php echo $form->field($model, 'status', [
            'checkTemplate' => "<div class=\"checkbox-inline\">\n{beginLabel}\n{input}\n{labelTitle}\n<span></span>\n{endLabel}\n{error}\n{hint}\n</div>",
            'labelOptions' => ['class' => 'checkbox'],
        ])->checkbox([]) ?>

        <div class="form-group">
            <?php echo Html::submitButton($model->isNewRecord ? 'บันทึก' : 'บันทึก', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
            <?= Html::a('ยกเลิก', ['/settings/carousel/update', 'id' => $model->carousel_id], ['class' => 'btn btn-secondary font-weight-bolder']) ?>
        </div>

        <?php ActiveForm::end() ?>
    </div>
</div>