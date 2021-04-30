<?php

namespace common\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\TbResearch;

/**
 * TbResearchSearch represents the model behind the search form of `common\models\TbResearch`.
 */
class TbResearchSearch extends TbResearch
{
    public $search;
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['research_id', 'research_type_id', 'research_type_work_id', 'research_year', 'research_status', 'created_by', 'updated_by'], 'integer'],
            [[
                'research_name', 'research_date_begin', 'research_date_end',
                'research_detail', 'created_at', 'updated_at', 'search'
            ], 'safe'],
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
        $query = TbResearch::find()->orderBy('research_id DESC');

        $query->joinWith('createUer');

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
            'research_id' => $this->research_id,
            'research_type_id' => $this->research_type_id,
            'research_type_work_id' => $this->research_type_work_id,
            'research_year' => $this->research_year,
            'research_date_begin' => $this->research_date_begin,
            'research_date_end' => $this->research_date_end,
            'research_status' => $this->research_status,
            'created_by' => $this->created_by,
            'created_at' => $this->created_at,
            'updated_by' => $this->updated_by,
            'updated_at' => $this->updated_at,
        ]);

        $query->orFilterWhere(['like', 'research_name', $this->search])
            ->orFilterWhere(['like', 'research_detail', $this->search])
            ->orFilterWhere(['like', 'createUer.user_fname_th', $this->search]);

        return $dataProvider;
    }
}
