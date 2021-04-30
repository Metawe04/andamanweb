<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "tb_user_position".
 *
 * @property int $user_position_id
 * @property string|null $user_position
 * @property int|null $user_position_parentid
 * @property int|null $user_position_order
 */
class TbUserPosition extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tb_user_position';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_position_parentid', 'user_position_order'], 'integer'],
            [['user_position'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'user_position_id' => 'User Position ID',
            'user_position' => 'ตำแหน่ง',
            'user_position_parentid' => 'User Position Parentid',
            'user_position_order' => 'User Position Order',
        ];
    }
}
