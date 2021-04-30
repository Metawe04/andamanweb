<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "calendar".
 *
 * @property int $id
 * @property string $title ชื่อกิจกรรม
 * @property string $date วันที่
 * @property string $start_time ตั้งแต่เวลา
 * @property string $end_time ถึงเวลา
 * @property string|null $url
 * @property string|null $text_color
 * @property string|null $background_color
 */
class Calendar extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'calendar';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['title', 'date', 'start_time', 'end_time'], 'required'],
            [['date', 'start_time', 'end_time'], 'safe'],
            [['title', 'url'], 'string', 'max' => 255],
            [['text_color', 'background_color'], 'string', 'max' => 100],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'title' => 'ชื่อกิจกรรม',
            'date' => 'วันที่',
            'start_time' => 'ตั้งแต่เวลา',
            'end_time' => 'ถึงเวลา',
            'url' => 'Url',
            'text_color' => 'สีตัวอักษร',
            'background_color' => 'สีพื้นหลัง',
        ];
    }

    /**
     * {@inheritdoc}
     * @return \common\models\query\CalendarQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new \common\models\query\CalendarQuery(get_called_class());
    }
}
