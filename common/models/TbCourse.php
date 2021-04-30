<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "tb_course".
 *
 * @property int $course_id รหัสหลักสูตร
 * @property string $course_name ชื่อหลักสูตร
 * @property int $department_id ภาควิชา
 */
class TbCourse extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tb_course';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['course_name', 'department_id'], 'required'],
            [['department_id'], 'integer'],
            [['course_name'], 'string', 'max' => 100],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'course_id' => 'รหัสหลักสูตร',
            'course_name' => 'ชื่อหลักสูตร',
            'department_id' => 'ภาควิชา',
        ];
    }
}
