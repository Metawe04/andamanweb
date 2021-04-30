<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "tb_user_expertise".
 *
 * @property int $user_expertise_id
 * @property int $user_id
 * @property string $user_expertise ความเชี่ยวชาญ
 */
class TbUserExpertise extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tb_user_expertise';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_id'], 'integer'],
            [['user_expertise'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'user_expertise_id' => 'User Expertise ID',
            'user_id' => 'User ID',
            'user_expertise' => 'ความเชี่ยวชาญ',
        ];
    }
}
