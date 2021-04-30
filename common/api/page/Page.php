<?php
namespace common\api\page;

use Yii;
use common\models\Page as PageModel;
use yii\helpers\Html;
use common\components\API;
use yii\web\NotFoundHttpException;
/**
 * Page module API
 * @package yii\easyii\modules\page\api
 *
 * @method static PageObject get(mixed $id_slug) Get page object by id or slug
 */

class Page extends API
{
    private $_pages = [];

    public function api_get($id_slug)
    {
        if(!isset($this->_pages[$id_slug])) {
            $this->_pages[$id_slug] = $this->findPage($id_slug);
        }
        return $this->_pages[$id_slug];
    }

    private function findPage($id_slug)
    {
        $page = PageModel::find()->where(['or', 'page_id=:id_slug', 'slug=:id_slug'], [':id_slug' => $id_slug])
        ->andWhere(['status' => PageModel::STATUS_PUBLISHED])
        ->one();

        if (!$page) {
            throw new NotFoundHttpException('Page not found');
        }

        return $page ? new PageObject($page) : $this->notFound($id_slug);
    }

    private function notFound($id_slug)
    {
        $page = new PageModel([
            'slug' => $id_slug
        ]);
        return new PageObject($page);
    }
}

