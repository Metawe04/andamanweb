<?php

/**
 * @var $this  yii\web\View
 * @var $model common\models\WidgetCarouselItem
 */

$this->title = 'แก้ไขรายการ #' . $model->id;

$this->params['breadcrumbs'][] = ['label' => 'Widget Carousel Items', 'url' => ['/widget/carousel/index']];
$this->params['breadcrumbs'][] = ['label' => $model->carousel->key, 'url' => ['/widget/carousel/update', 'id' => $model->carousel->id]];
$this->params['breadcrumbs'][] = $this->title;

?>

<?php echo $this->render('_form', [
    'model' => $model,
]) ?>
