<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "tb_greduated_level".
 *
 * @property int $greduated_level_ids
 * @property string|null $greduated_level ระดับการศึกษา
 */
class TbGreduatedLevel extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tb_greduated_level';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['greduated_level'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'greduated_level_ids' => 'Greduated Level Ids',
            'greduated_level' => 'ระดับการศึกษา',
        ];
    }
}
