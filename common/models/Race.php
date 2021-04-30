<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "race".
 *
 * @property int $race_id
 * @property string|null $race_name เชื้อชาติ
 */
class Race extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'race';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['race_name'], 'string', 'max' => 150],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'race_id' => 'Race ID',
            'race_name' => 'เชื้อชาติ',
        ];
    }
}
