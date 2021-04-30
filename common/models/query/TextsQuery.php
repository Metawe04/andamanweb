<?php

namespace common\models\query;

/**
 * This is the ActiveQuery class for [[\common\models\Texts]].
 *
 * @see \common\models\Texts
 */
class TextsQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * {@inheritdoc}
     * @return \common\models\Texts[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * {@inheritdoc}
     * @return \common\models\Texts|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
