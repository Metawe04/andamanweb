<?php
namespace common\api\news;

use Yii;
use common\components\API;
use yii\helpers\Html;
use yii\helpers\Url;

class PhotoObject extends \common\components\ApiObject
{
    public $image;
    public $description;
    public $image_base_url;
    public $image_path;

    public function box($width, $height){
        // $img = Html::img($this->thumb($width, $height));
        $img = Html::img($this->model->url, ['class' => 'img-responsive center-block', 'alt' => 'event', 'style'  => 'width: 100%;height: 120px;']);
        // $a = Html::a($img, $this->model->url, [
        //     'data-fancybox' => 'gallery',
        //     'class' => 'gallery-box',
        //     'rel' => 'news-'.$this->model->news_id,
        //     'title' => $this->description
        // ]);
        $a = Html::a($img.'<div class="demo-gallery-poster"><img src="/images/zoom.png" alt=""></div>', $this->model->url, [
            'data-fancybox' => 'gallery',
            'class' => 'gallery-box',
            'rel' => 'news-'.$this->model->news_id,
            'data-caption' => $this->model->name
        ]);
        return $a;
    }

    public function getEditLink(){
        return Url::to(['/admin/news/a/photos', 'id' => $this->model->news_id]).'#photo-'.$this->id;
    }
}