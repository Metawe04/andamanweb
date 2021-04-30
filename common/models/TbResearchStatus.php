<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "tb_research_status".
 *
 * @property int $research_status_id
 * @property string|null $research__status_name สถานะงานวิจัย
 */
class TbResearchStatus extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tb_research_status';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['research_status_id'], 'required'],
            [['research_status_id'], 'integer'],
            [['research__status_name'], 'string', 'max' => 255],
            [['research_status_id'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'research_status_id' => 'Research Status ID',
            'research__status_name' => 'สถานะงานวิจัย',
        ];
    }
}
