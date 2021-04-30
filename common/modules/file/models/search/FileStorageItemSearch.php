<?php

namespace common\modules\file\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\modules\file\models\FileStorageItem;

/**
 * FileStorageItemSearch represents the model behind the search form of `common\modules\file\models\FileStorageItem`.
 */
class FileStorageItemSearch extends FileStorageItem
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'size', 'ref_id'], 'integer'],
            [['component', 'base_url', 'path', 'type', 'name', 'upload_ip', 'created_at'], 'safe'],
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
        $query = FileStorageItem::find();

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
            'id' => $this->id,
            'size' => $this->size,
            'ref_id' => $this->ref_id,
        ]);

        if ($this->created_at !== null) {
            $query->andFilterWhere(['between', 'created_at', strtotime($this->created_at), strtotime($this->created_at)  + 3600 * 24]);
        }

        $query->andFilterWhere(['like', 'component', $this->component])
            ->andFilterWhere(['like', 'base_url', $this->base_url])
            ->andFilterWhere(['like', 'path', $this->path])
            ->andFilterWhere(['like', 'type', $this->type])
            ->andFilterWhere(['like', 'name', $this->name])
            ->andFilterWhere(['like', 'upload_ip', $this->upload_ip]);

        return $dataProvider;
    }
}
