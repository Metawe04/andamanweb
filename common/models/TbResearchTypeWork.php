<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "tb_research_type_work".
 *
 * @property int $research_type_work_id รหัสประเภทผลงาน
 * @property string|null $research_type_work_name ชื่อประเภทผลงาน
 */
class TbResearchTypeWork extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tb_research_type_work';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['research_type_work_name'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'research_type_work_id' => 'รหัสประเภทผลงาน',
            'research_type_work_name' => 'ชื่อประเภทผลงาน',
        ];
    }
}
