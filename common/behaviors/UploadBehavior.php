<?php
namespace common\behaviors;

use trntv\filekit\behaviors\UploadBehavior as BaseUploadBehavior;
use Yii;

class UploadBehavior extends BaseUploadBehavior
{
    public $ref_table;
    
    public $ref_id;

    public $component = 'fileStorage';

    // public $pathAttribute    = 'path';
    // public $baseUrlAttribute = 'base_url';
    // public $typeAttribute    = 'type';
    // public $sizeAttribute    = 'size';
    // public $nameAttribute    = 'name';
    // public $orderAttribute   = 'order';

    protected function saveFilesToRelation($files)
    {
        $modelClass = $this->getUploadModelClass();
        foreach ($files as $file) {
            $model = new $modelClass;
            $model->ref_table = $this->ref_table;
            $model->ref_id = $this->ref_id;
            $model->component = $this->component;
            if (Yii::$app->request->getIsConsoleRequest() === false) {
                $model->upload_ip = Yii::$app->request->getUserIP();
            }
            $model->setScenario($this->uploadModelScenario);
            $model = $this->loadModel($model, $file);
            if ($this->getUploadRelation()->via !== null) {
                $model->save(false);
            }
            $this->owner->link($this->uploadRelation, $model);
        }
    }
}
