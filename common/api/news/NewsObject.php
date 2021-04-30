<?php
namespace common\api\news;

use Yii;
use common\components\API;
use common\models\News as NewsModel;
use yii\helpers\Url;
use common\models\NewsAttachment;

class NewsObject extends \common\components\ApiObject
{
    public $slug;
    public $image;
    public $image_base_url;
    public $image_path;
    public $views;
    public $published_at;

    private $_photos;
    private $_files;

    public function getTitle(){
        return $this->model->title;
    }

    public function getShort(){
        return $this->model->short;
    }

    public function getText(){
        return $this->model->text;
    }

    public function getTags(){
        return $this->model->tagsArray;
    }

    public function getAuthor(){
        return $this->model->author->profile->name;
    }
    
    public function getCreateBy(){
        return $this->model->created_by;
    }
    
    public function getCategoryName(){
        return $this->model->category->title;
    }

    public function getImageUrl(){
        if(empty($this->model->image_path)) {
            return '';
        }
        return $this->model->image_base_url. str_replace('\\', '/', $this->model->image_path);
    }

    public function getDate(){
        return Yii::$app->formatter->asDate($this->published_at, 'php:d M');
    }

    public function getYear(){
        return Yii::$app->formatter->asDate($this->published_at, 'php:Y');
    }

    public function getPhotos()
    {
        if (!$this->_photos) {
            $this->_photos = [];

            foreach (NewsAttachment::find()->where(['news_id' => $this->model->news_id , 'ref_attribute' => 'photo'])->sort()->all() as $model) {
                $this->_photos[] = new PhotoObject($model);
            }
        }
        return $this->_photos;
    }

    public function getAttachments()
    {
        if (!$this->_files) {
            $this->_files = [];

            foreach (NewsAttachment::find()->where(['news_id' => $this->model->news_id, 'ref_attribute' => 'attachments'])->sort()->all() as $model) {
                $this->_files[] = new FileObject($model);
            }
        }
        return $this->_files;
    }

    public function  getEditLink(){
        return Url::to(['/admin/news/a/edit/', 'id' => $this->id]);
    }
}