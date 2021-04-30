<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "tags".
 *
 * @property int $tag_id
 * @property string $name
 * @property int|null $frequency
 */
class Tag extends \common\components\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tags';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name'], 'required'],
            [['frequency'], 'integer'],
            [['name'], 'string', 'max' => 128],
            [['name'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'tag_id' => 'Tag ID',
            'name' => 'Name',
            'frequency' => 'Frequency',
        ];
    }
}
