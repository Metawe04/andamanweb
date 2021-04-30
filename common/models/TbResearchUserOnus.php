<?php

namespace common\models;

use Yii;
use metronic\user\models\Profile;
use yii\data\ActiveDataProvider;

/**
 * This is the model class for table "tb_research_user_onus".
 *
 * @property int $researcher_name_ids
 * @property int|null $research_id รหัสงานวิจัย
 * @property string|null $researcher_user_id ผู้ทำวิจัย
 * @property int|null $researcher_onus_id ความรับผิดชอบ
 */
class TbResearchUserOnus extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tb_research_user_onus';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['researcher_user_id','researcher_onus_id'], 'required'],
            [['research_id', 'researcher_onus_id'], 'integer'],
            [['researcher_user_id'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'researcher_name_ids' => 'Researcher Name Ids',
            'research_id' => 'รหัสงานวิจัย',
            'researcher_user_id' => 'ผู้ทำวิจัย',
            'researcher_onus_id' => 'ความรับผิดชอบ',
        ];
    }


    public function getProfile() {
        return $this->hasOne(Profile::className(), ['user_id' => 'researcher_user_id']);
    }



}
