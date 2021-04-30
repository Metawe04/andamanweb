<?php

namespace frontend\modules\settings\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Events;

/**
 * EventsSearch represents the model behind the search form of `common\models\Events`.
 */
class EventsSearch extends Events
{
    public $search;
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['events_id', 'views', 'status', 'created_by', 'updated_by', 'created_at', 'updated_at'], 'integer'],
            [['title', 'short', 'text', 'slug', 'image_base_url', 'image_path', 'published_at', 'view','search'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Events::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'events_id' => $this->events_id,
            'views' => $this->views,
            'status' => $this->status,
            'created_by' => $this->created_by,
            'updated_by' => $this->updated_by,
            'published_at' => $this->published_at,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ]);

        $query->orFilterWhere(['like', 'title', $this->search])
        ->orFilterWhere(['like', 'short', $this->search])
        ->orFilterWhere(['like', 'text', $this->search])
        ->orFilterWhere(['like', 'slug', $this->search])
        ->orFilterWhere(['like', 'view', $this->view]);

        // $query->andFilterWhere(['like', 'title', $this->title])
        //     ->andFilterWhere(['like', 'short', $this->short])
        //     ->andFilterWhere(['like', 'text', $this->text])
        //     ->andFilterWhere(['like', 'slug', $this->slug])
        //     ->andFilterWhere(['like', 'image_base_url', $this->image_base_url])
        //     ->andFilterWhere(['like', 'image_path', $this->image_path])
        //     ->andFilterWhere(['like', 'view', $this->view]);

        return $dataProvider;
    }
}
