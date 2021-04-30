<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "tags_assign".
 *
 * @property string $class
 * @property int $item_id
 * @property int $tag_id
 */
class TagAssign extends \common\components\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tags_assign';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['class', 'item_id', 'tag_id'], 'required'],
            [['item_id', 'tag_id'], 'integer'],
            [['class'], 'string', 'max' => 128],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'class' => 'Class',
            'item_id' => 'Item ID',
            'tag_id' => 'Tag ID',
        ];
    }
}
