<?php

namespace common\api\events;

use common\models\Events as EventsModel;
use common\models\Tag;
use yii\data\ActiveDataProvider;
use yii\bootstrap4\LinkPager;

class Events extends \common\components\API
{
    private $_adp;
    private $_last;
    private $_items;
    private $_item = [];

    public function api_items($options = [])
    {
        if (!$this->_items) {
            $this->_items = [];

            $with = ['seo'];
            $with[] = 'tags';
            $query = EventsModel::find()->with($with)
                ->status(EventsModel::STATUS_PUBLISHED)
                ->andWhere('published_at <= CURRENT_DATE');



            if (!empty($options['author'])) {
                $query->andWhere(['created_by' => $options['author']]);
            }

            if (!empty($options['where'])) {
                $query->andFilterWhere($options['where']);
            }
            if (!empty($options['tags'])) {
                $query
                    ->innerJoinWith('tags', false)
                    ->andWhere([Tag::tableName() . '.name' => (new EventsModel)->filterTagValues($options['tags'])])
                    ->addGroupBy('events_id');
            }

            if (!empty($options['orderBy'])) {
                $query->orderBy($options['orderBy']);
            } else {
                $query->sortDate();
            }
            if (!empty($options['search'])) {
                $search = $options['search'];
                $query->andFilterWhere(['like', 'title', $search]);
            }

            $this->_adp = new ActiveDataProvider([
                'query' => $query,
                'pagination' => !empty($options['pagination']) ? $options['pagination'] : []
            ]);

            foreach ($this->_adp->models as $model) {
                $this->_items[] = new EventsObject($model);
            }
        }
        return $this->_items;
    }

    public function api_get($id_slug)
    {
        if (!isset($this->_item[$id_slug])) {
            $this->_item[$id_slug] = $this->findEvents($id_slug);
        }
        return $this->_item[$id_slug];
    }

    public function api_last($limit = 1)
    {
        if ($limit === 1 && $this->_last) {
            return $this->_last;
        }

        $with = ['seo'];
        $with[] = 'tags';
        $result = [];
        foreach (EventsModel::find()->with($with)->status(EventsModel::STATUS_PUBLISHED)->sortDate()->limit($limit)->all() as $item) {
            $result[] = new EventsObject($item);
        }

        if ($limit > 1) {
            return $result;
        } else {
            $this->_last = count($result) ? $result[0] : null;
            return $this->_last;
        }
    }

    public function api_pagination()
    {
        return $this->_adp ? $this->_adp->pagination : null;
    }

    public function api_pages()
    {
        return $this->_adp ? LinkPager::widget(['pagination' => $this->_adp->pagination]) : '';
    }

    private function findEvents($id_slug)
    {
        $news = EventsModel::find()->where(['or', 'events_id=:id_slug', 'slug=:id_slug'], [':id_slug' => $id_slug])->status(EventsModel::STATUS_PUBLISHED)->one();
        if ($news) {
            $news->updateCounters(['views' => 1]);
            return new EventsObject($news);
        } else {
            return null;
        }
    }
}
