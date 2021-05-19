<?php

namespace common\api\events;

use Yii;
use common\components\API;
use common\models\Events as EventsModel;
use yii\helpers\Url;
use common\models\EventsAttachment;

class EventsObject extends \common\components\ApiObject
{
  public $slug;
  public $image;
  public $image_base_url;
  public $image_path;
  public $views;
  public $published_at;

  private $_photos;

  public function getTitle()
  {
    return $this->model->title;
  }

  public function getShort()
  {
    return $this->model->short;
  }

  public function getText()
  {
    return $this->model->text;
  }

  public function getTags()
  {
    return $this->model->tagsArray;
  }

  public function getAuthor()
  {
    return $this->model->userCreateBy->profile->name;
  }

  public function getCreateBy()
  {
    return $this->model->created_by;
  }

  public function getImageUrl()
  {
    if (empty($this->model->image_path)) {
      return '';
    }
    return Url::base(true) . '/storage/source/' . str_replace('\\', '/', $this->model->image_path);
  }

  public function getDate()
  {
    return Yii::$app->formatter->asDate($this->published_at, 'php:d M');
  }

  public function getYear()
  {
    return Yii::$app->formatter->asDate($this->published_at, 'php:Y');
  }

  public function getPhotos()
  {
    if (!$this->_photos) {
      $this->_photos = [];

      foreach (EventsAttachment::find()->where(['events_id' => $this->model->events_id])->sort()->all() as $model) {
        $this->_photos[] = new PhotoObject($model);
      }
    }
    return $this->_photos;
  }

  public function  getEditLink()
  {
    return Url::to(['/admin/settings/events/update', 'id' => $this->id]);
  }
}
