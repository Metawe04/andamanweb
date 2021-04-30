<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "religion".
 *
 * @property int $religion_id
 * @property string|null $religion_name ศาสนา
 */
class Religion extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'religion';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['religion_name'], 'string', 'max' => 150],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'religion_id' => 'Religion ID',
            'religion_name' => 'Religion Name',
        ];
    }
}
