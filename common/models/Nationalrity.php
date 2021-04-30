<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "nationalrity".
 *
 * @property int $nationality_id รหัสสัญชาติ
 * @property string|null $nationality_name ชื่อสัญชาติ
 */
class Nationalrity extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'nationalrity';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nationality_name'], 'string', 'max' => 250],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'nationality_id' => 'รหัสสัญชาติ',
            'nationality_name' => 'ชื่อสัญชาติ',
        ];
    }
}
