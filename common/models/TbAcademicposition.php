<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "tb_academicposition".
 *
 * @property int $user_academicpositionid
 * @property string|null $user_academicposition ตัวย่อตำแหน่งทางวิชาการ
 * @property string|null $user_cademicposition_shortname ตำแหน่งทางวิชาการ
 */
class TbAcademicposition extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tb_academicposition';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_academicposition'], 'string', 'max' => 255],
            [['user_cademicposition_shortname'], 'string', 'max' => 50],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'user_academicpositionid' => 'User Academicpositionid',
            'user_academicposition' => 'ตัวย่อตำแหน่งทางวิชาการ',
            'user_cademicposition_shortname' => 'ตำแหน่งทางวิชาการ',
        ];
    }
}
