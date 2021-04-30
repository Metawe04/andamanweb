<?php

namespace common\models;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\db\ActiveRecord;
use yii\db\Expression;

/**
 * This is the model class for table "tb_user_greduated".
 *
 * @property int $user_greduated_ids
 * @property int|null $user_id เลขประจำตัวผู้ใช้งาน
 * @property string|null $user_greduated_yr ปีจบการศึกษา(พ.ศ.)
 * @property string|null $user_greduated_level ระดับการศึกษา
 * @property string|null $user_greduated_degree วุฒิการศึกษา
 * @property string|null $user_greduated_major สาขาวิชา
 * @property string|null $user_greduated_educational สถาบันการศึกษา
 * @property int|null $user_greduated_country ประเทศ
 * @property string|null $create_at วันที่บันทึก
 * @property string|null $update_at วันที่แก้ไข
 * @property float|null $user_gpa เกรดเฉลี่ยสะสม
 */
class TbUserGreduated extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tb_user_greduated';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_greduated_ids', 'user_id', 'user_greduated_country'], 'integer'],
            [['create_at', 'update_at'], 'safe'],
            [['user_gpa'], 'number'],
            [['user_greduated_yr'], 'string', 'max' => 4],
            [['user_greduated_level', 'user_greduated_degree', 'user_greduated_major', 'user_greduated_educational'], 'string', 'max' => 100],
            [['user_greduated_ids'], 'unique'],
        ];
    }
    public function behaviors()
    {
        return [[
                'class' => TimestampBehavior::className(),
                'attributes' => [
                    ActiveRecord::EVENT_BEFORE_INSERT => ['create_at', 'update_at'],
                    ActiveRecord::EVENT_BEFORE_UPDATE => ['update_at'],
                ],
                'value' => new Expression('NOW()'),
            ],
          
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'user_greduated_ids' => 'User Greduated Ids',
            'user_id' => 'เลขประจำตัวผู้ใช้งาน',
            'user_greduated_yr' => 'ปีจบการศึกษา(พ.ศ.)',
            'user_greduated_level' => 'ระดับการศึกษา',
            'user_greduated_degree' => 'หลักสูตร',
            'user_greduated_major' => 'สาขาวิชา',
            'user_greduated_educational' => 'สถาบันการศึกษา',
            'user_greduated_country' => 'ประเทศ',
            'create_at' => 'วันที่บันทึก',
            'update_at' => 'วันที่แก้ไข',
            'user_gpa' => 'เกรดเฉลี่ยสะสม',
        ];
    }
}
