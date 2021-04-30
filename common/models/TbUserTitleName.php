<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "tb_user_title_name".
 *
 * @property string $user_title_name_id
 * @property string|null $user_title_name
 * @property int|null $user_sex_id
 */
class TbUserTitleName extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tb_user_title_name';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_title_name_id'], 'required'],
            [['user_sex_id'], 'integer'],
            [['user_title_name_id'], 'string', 'max' => 11],
            [['user_title_name'], 'string', 'max' => 20],
            [['user_title_name_id'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'user_title_name_id' => 'User Title Name ID',
            'user_title_name' => 'User Title Name',
            'user_sex_id' => 'User Sex ID',
        ];
    }
}
