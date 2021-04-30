<?php

namespace backend\modules\settings\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\News;

/**
 * NewsSearch represents the model behind the search form of `common\models\News`.
 */
class NewsSearch extends News
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['news_id', 'views', 'status', 'created_by', 'updated_by', 'published_at', 'created_at', 'updated_at'], 'integer'],
            [['title', 'short', 'text', 'slug', 'image_base_url', 'image_path', 'view', 'search'], 'safe'],
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
        $query = News::find()->orderBy('published_at desc');

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
            'news_id' => $this->news_id,
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

        return $dataProvider;
    }
}
