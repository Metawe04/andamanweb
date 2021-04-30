<?php

namespace frontend\controllers;

use Yii;
use backend\modules\settings\models\search\NewsSearch;
use common\api\news\News;
use common\models\News as ModelsNews;
use yii\helpers\Json;
use common\models\NewsCategory;
use yii\filters\AccessControl;

class NewsController extends \yii\web\Controller
{
    /** @inheritdoc */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['index', 'view'],
                        'allow' => true,
                        'roles' => ['?'],
                    ],
                    [
                        'actions' => ['index', 'view'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
        ];
    }

    public function actionIndex($tag = null, $create_by = null, $category = null, $search = '')
    {
        $categories = NewsCategory::find()->where(['status' => NewsCategory::STATUS_ACTIVE])->orderBy('order_num ASC')->all();
        $news = News::items([
            'tags' => $tag,
            'author' => $create_by,
            'search' => $search,
            'pagination' => ['pageSize' => 10],
            'category' => $category
        ]);
        $category_name = '';
        if (!empty($category)) {
            $modelCat = NewsCategory::findOne($category);
            $category_name = $modelCat['title'];
        }
        $tags = (new \yii\db\Query())
            ->select(['tags.`name`'])
            ->from('tags_assign')
            ->where("REPLACE ( tags_assign.class, '\\\', '/' ) LIKE :query")
            ->innerJoin('tags', 'tags_assign.tag_id = tags.tag_id')
            ->addParams([':query' => '%common/models/News%'])
            ->groupBy('tags.`name`')
            ->orderBy('tags.frequency DESC')
            ->all();
        return $this->render('index', [
            'news' => $news,
            'search' => $search,
            'categories' => $categories,
            'category_name' => $category_name,
            'tags' => $tags
        ]);
    }

    public function actionView($slug)
    {
        $categories = NewsCategory::find()->where(['status' => NewsCategory::STATUS_ACTIVE])->orderBy('order_num ASC')->all();
        $news = News::get($slug);
        if (!$news) {
            throw new \yii\web\NotFoundHttpException('News not found.');
        }

        $viewFile = $news->model->view ?: 'view';
        return $this->render($viewFile, ['news' => $news, 'categories' => $categories]);
    }
}
