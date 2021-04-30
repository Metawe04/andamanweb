<?php
namespace common\api\text;

use Yii;
use common\components\API;
use common\helpers\Data;
use yii\helpers\Url;
use common\models\Text as TextModel;
use yii\helpers\Html;

/**
 * Text module API
 * @package yii\easyii\modules\text\api
 *
 * @method static get(mixed $id_slug) Get text block by id or slug
 */
class Text extends API
{
    private $_texts = [];

    public function init()
    {
        parent::init();

        $this->_texts = Data::cache(TextModel::CACHE_KEY, 3600, function(){
            return TextModel::find()->where(['status' => TextModel::STATUS_ACTIVE])->asArray()->all();
        });
    }

    public function api_get($id_slug)
    {
        if(($text = $this->findText($id_slug)) === null){
            return $this->notFound($id_slug);
        }
        return $text['body'];
    }

    private function findText($id_slug)
    {
        foreach ($this->_texts as $item) {
            if($item['slug'] == $id_slug || $item['text_id'] == $id_slug){
                return $item;
            }
        }
        return null;
    }

    private function notFound($id_slug)
    {
        $text = '';

        if(!Yii::$app->user->isGuest && preg_match(TextModel::$SLUG_PATTERN, $id_slug)){
            $text = Html::a('Create text', ['/admin/settings/text/create', 'slug' => $id_slug], ['target' => '_blank']);
        }

        return $text;
    }
}