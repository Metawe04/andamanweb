<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "tb_research_type".
 *
 * @property int $research_type_id
 * @property string|null $research_type_name ลักษณะงานวิจัย
 */
class TbResearchType extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tb_research_type';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['research_type_name'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'research_type_id' => 'Researc Type ID',
            'research_type_name' => 'ลักษณะงานวิจัย',
        ];
    }
}
