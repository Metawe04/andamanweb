<?php

namespace frontend\controllers;

use Yii;
use backend\modules\settings\models\search\EventsSearch;
use common\api\events\Events;
use common\models\Events as ModelsEvents;
use yii\filters\AccessControl;
use yii\helpers\Json;

class EventsController extends \yii\web\Controller
{
    /** @inheritdoc */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['index','view'],
                        'allow' => true,
                        'roles' => ['?'],
                    ],
                    [
                        'actions' => ['index','view'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
        ];
    }

    public function actionIndex($tag = null, $create_by = null, $search = '')
    {
        $events = Events::items([
            'tags' => $tag,
            'author' => $create_by,
            'search' => $search,
            'pagination' => ['pageSize' => 10],
        ]);
        $tags = (new \yii\db\Query())
            ->select(['tags.`name`'])
            ->from('tags_assign')
            ->where("REPLACE ( tags_assign.class, '\\\', '/' ) LIKE :query")
            ->innerJoin('tags', 'tags_assign.tag_id = tags.tag_id')
            ->addParams([':query' => '%common/models/Events%'])
            ->groupBy('tags.`name`')
            ->orderBy('tags.frequency DESC')
            ->all();
        return $this->render('index', [
            'events' => $events,
            'search' => $search,
            'tags' => $tags
        ]);
    }

    public function actionView($slug)
    {
        $events = Events::get($slug);
        if (!$events) {
            throw new \yii\web\NotFoundHttpException('Events not found.');
        }

        $viewFile = $events->model->view ?: 'view';
        return $this->render($viewFile, ['events' => $events]);
    }
}
