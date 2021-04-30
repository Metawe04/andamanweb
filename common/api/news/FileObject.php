<?php

namespace common\api\news;

use Yii;
use common\components\API;
use yii\helpers\Html;
use yii\helpers\Url;

class FileObject extends \common\components\ApiObject
{
    public $file;
    public $description;

    public function link()
    {
        if ($this->model->type == 'application/pdf') {
            return Html::a(Html::img('/storage/images/' . $this->model->icon, ['alt' => 'icon', 'style' => 'max-width: 30px;']) . ' ' . $this->model->name, $this->model->url, [
                'data-fancybox' => 'files',
                'class' => 'files-box',
                'data-caption' => $this->model->name,
                'style' => 'text-decoration: none;font-size: 14px;'
            ]);
        }
        return Html::a(Html::img('/storage/images/' . $this->model->icon, ['alt' => 'icon', 'style' => 'max-width: 30px;']) . ' ' . $this->model->name, ['/file/storage/news-download', 'id' => $this->model->id], [
            'class' => 'files-box',
            'style' => 'text-decoration: none;font-size: 14px;'
        ]);
        // $a = Html::a($this->model->name, ['/file/storage/news-download', 'id' => $this->model->news_id], [
        //     'rel' => 'news-' . $this->model->news_id,
        //     'title' => $this->model->name
        // ]);

        // return $a;
    }

    public function url()
    {
        return $this->model->url;
    }

    public function getEditLink()
    {
        return Url::to(['/admin/news/a/photos', 'id' => $this->model->news_id]) . '#photo-' . $this->id;
    }
}
