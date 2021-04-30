<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "tb_usertype".
 *
 * @property int $usertype_id รหัสประเภทผู้ใช้งาน
 * @property string|null $usertype ประเภทผู้ใช้งาน
 */
class TbUsertype extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tb_usertype';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['usertype'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'usertype_id' => 'รหัสประเภทผู้ใช้งาน',
            'usertype' => 'ประเภทผู้ใช้งาน',
        ];
    }
}
