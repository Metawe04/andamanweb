<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "tb_researcher_onus".
 *
 * @property int $researcher_onus_id
 * @property string|null $researcher_onus
 */
class TbResearcherOnus extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tb_researcher_onus';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['researcher_onus'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'researcher_onus_id' => 'Researcher Onus ID',
            'researcher_onus' => 'Researcher Onus',
        ];
    }
}
