<?php

namespace common\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\TbUserPosition;

/**
 * TbUserPositionSearch represents the model behind the search form of `common\models\TbUserPosition`.
 */
class TbUserPositionSearch extends TbUserPosition
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_position_id', 'user_position_parentid', 'user_position_order'], 'integer'],
            [['user_position'], 'safe'],
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
        $query = TbUserPosition::find();

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
            'user_position_id' => $this->user_position_id,
            'user_position_parentid' => $this->user_position_parentid,
            'user_position_order' => $this->user_position_order,
        ]);

        $query->andFilterWhere(['like', 'user_position', $this->user_position]);

        return $dataProvider;
    }
}
