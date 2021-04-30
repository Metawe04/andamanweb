<?php
namespace frontend\modules\settings\behaviors;

use trntv\filekit\behaviors\UploadBehavior as BaseUploadBehavior;
use Yii;

class NewsUploadBehavior extends BaseUploadBehavior
{
    public $ref_attribute;

    public $component = 'fileStorage';

    protected function saveFilesToRelation($files)
    {
        $modelClass = $this->getUploadModelClass();
        foreach ($files as $file) {
            $model = new $modelClass;
            $model->ref_attribute = $this->ref_attribute;
            // if (Yii::$app->request->getIsConsoleRequest() === false) {
            //     $model->upload_ip = Yii::$app->request->getUserIP();
            // }
            $model->setScenario($this->uploadModelScenario);
            $model = $this->loadModel($model, $file);
            if ($this->getUploadRelation()->via !== null) {
                $model->save(false);
            }
            $this->owner->link($this->uploadRelation, $model);
        }
    }
}
