<?php
/*
 * Created by VS Code.
 * User: Tanakorn Phompak
 * Date: Thu Jun 11 2020
 * Time: 19:33:53
 */

namespace common\actions;

use yii\base\Action as BaseAction;
use yii\web\Response;
use yii\web\UploadedFile;
use Yii;

class EditorUploadAction extends BaseAction
{
    /**
     * @var string
     */
    public $fileparam = 'upload';

    /**
     * @var bool
     */
    public $disableCsrf = true;

    /**
     * @var string
     */
    public $responseFormat = Response::FORMAT_JSON;

    /**
     * @var string path where files would be stored
     */
    public $uploadPath = '';

    public $editor = 'ckeditor';

    /**
     *
     */
    public function init()
    {
        \Yii::$app->response->format = $this->responseFormat;

        if (\Yii::$app->request->get('upload')) {
            $this->fileparam = \Yii::$app->request->get('upload');
        }

        if (\Yii::$app->request->get('upload-path')) {
            $this->uploadPath = \Yii::$app->request->get('upload-path');
        }

        if ($this->disableCsrf) {
            \Yii::$app->request->enableCsrfValidation = false;
        }
    }

    /**
     * @return array
     * @throws \HttpException
     */
    public function run()
    {
        $uploadedFile = UploadedFile::getInstanceByName($this->fileparam);
        $fileName = md5($uploadedFile->baseName . time()) . '.' . $uploadedFile->extension;
        $path = Yii::getAlias('@storage/web') . '/' . $this->uploadPath . '/';
        if ($uploadedFile->saveAs($path  . $fileName)) {
            if($this->editor == 'ckeditor') {
                return [
                    'uploaded' => 1,
                    'fileName' => $fileName,
                    'url' => Yii::$app->params['storageUrl']. '/' . $fileName
                ];
            } else if($this->editor == 'tinymce') {
                return [
                    'uploaded' => 1,
                    'fileName' => $fileName,
                    'location' => Yii::$app->params['storageUrl']. '/' . $fileName
                ];
            }
        }
        return false;
    }
}
