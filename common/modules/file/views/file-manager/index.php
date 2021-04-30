<?php

/**
 * Created by PhpStorm.
 * User: Tanakorn Phompak
 * Date: 1/11/2562
 * Time: 11:01
 */
$this->title = Yii::t('app', 'File Manager');

$this->params['breadcrumbs'][] = $this->title;

?>
<h4>Web</h4>
<div class="row">
    <div class="col-md-12">
        <?php echo alexantr\elfinder\ElFinder::widget([
            'connectorRoute' => ['connector'],
            'settings' => [
                'height' => '500px',
                'width' => '100%'
            ],
            'buttonNoConflict' => true,
        ]) ?>
    </div>
</div>