<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "country".
 *
 * @property int $COUNTRYID
 * @property string|null $COUNTRY_NAME
 * @property string|null $COUNTRY_CODE ตัวย่อ
 */
class Country extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'country';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['COUNTRYID'], 'required'],
            [['COUNTRYID'], 'integer'],
            [['COUNTRY_NAME'], 'string', 'max' => 150],
            [['COUNTRY_CODE'], 'string', 'max' => 2],
            [['COUNTRYID'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'COUNTRYID' => 'Countryid',
            'COUNTRY_NAME' => 'Country Name',
            'COUNTRY_CODE' => 'Country Code',
        ];
    }
}
