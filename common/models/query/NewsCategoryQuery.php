<?php

namespace common\models\query;

use common\models\NewsCategory;
use yii\db\ActiveQuery;

class NewsCategoryQuery extends ActiveQuery
{
    /**
     * @return $this
     */
    public function active()
    {
        $this->andWhere(['status' => NewsCategory::STATUS_ACTIVE]);

        return $this;
    }

    /**
     * @return $this
     */
    public function noParents()
    {
        $this->andWhere('{{%news_categories}}.parent_id IS NULL');

        return $this;
    }
}
