<?php

namespace common\api\page;

use Yii;
use yii\helpers\Html;
use yii\helpers\Url;

class PageObject extends \common\components\ApiObject
{
    public $slug;

    public function getTitle()
    {
        if ($this->model->isNewRecord) {
            return $this->createLink;
        } else {
            return $this->model->title;
        }
    }

    public function getBody()
    {
        if ($this->model->isNewRecord) {
            return $this->createLink;
        } else {
            return $this->model->body;
        }
    }

    public function getView()
    {
        if ($this->model->isNewRecord) {
            return $this->createLink;
        } else {
            return $this->model->view;
        }
    }

    public function getEditLink()
    {
        return Url::to(['/admin/settings/page/update', 'id' => $this->id]);
    }

    public function getCreateLink()
    {
        return Html::a('Create page', ['/admin/settings/page/create', 'slug' => $this->slug], ['target' => '_blank']);
    }
}
