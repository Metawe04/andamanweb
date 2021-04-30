<?php

namespace frontend\controllers;

use common\models\Calendar;
use Yii;
use yii\filters\AccessControl;

class CalendarController extends \yii\web\Controller
{
    /** @inheritdoc */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['events'],
                        'allow' => true,
                        'roles' => ['?'],
                    ],
                    [
                        'actions' => ['events'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
        ];
    }

    public function actionEvents($start, $end)
    {
        $response = Yii::$app->response;
        $response->format = \yii\web\Response::FORMAT_JSON;
        $start = Yii::$app->formatter->asDate($start, 'php:Y-m-d 00:00:00');
        $end = Yii::$app->formatter->asDate($end, 'php:Y-m-d 23:59:00');
        $query = Calendar::find()->where(['between', 'date', $start, $end])->all();
        $events = [];
        foreach ($query as $key => $item) {
            $events[] = [
                'title' => $item['title'],
                'start' =>  Yii::$app->formatter->asDate($item['date'] . ' ' . $item['start_time'], 'php:Y-m-d\TH:i:s'),
                'end' =>  Yii::$app->formatter->asDate($item['date'] . ' ' . $item['end_time'], 'php:Y-m-d\TH:i:s'),
                'textColor' => !empty($item['text_color']) ? $item['text_color'] : '#ffffff',
                'backgroundColor' => !empty($item['background_color']) ? $item['background_color'] : '#8950fc',
                'url' => !empty($item['url']) ? $item['url'] : 'javascript:void(0);'
            ];
        }
        return $events;
    }
}
