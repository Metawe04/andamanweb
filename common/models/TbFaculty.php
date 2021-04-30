<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "tb_faculty".
 *
 * @property int $faculty_id รหัสคณะ
 * @property string $faculty_name ชื่อคณะ
 * @property int $u_id รหัสมหาวิทยาลัย
 */
class TbFaculty extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tb_faculty';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['faculty_name', 'u_id'], 'required'],
            [['u_id'], 'integer'],
            [['faculty_name'], 'string', 'max' => 100],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'faculty_id' => 'รหัสคณะ',
            'faculty_name' => 'ชื่อคณะ',
            'u_id' => 'รหัสมหาวิทยาลัย',
        ];
    }
}
