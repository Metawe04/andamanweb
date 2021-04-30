<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "tb_department".
 *
 * @property int $department_id รหัสภาควิชา
 * @property string $department_name ชื่อภาควิชา
 * @property int $faculty_id คณะ
 */
class TbDepartment extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tb_department';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['department_name', 'faculty_id'], 'required'],
            [['faculty_id'], 'integer'],
            [['department_name'], 'string', 'max' => 100],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'department_id' => 'รหัสภาควิชา',
            'department_name' => 'ชื่อภาควิชา',
            'faculty_id' => 'คณะ',
        ];
    }
}
