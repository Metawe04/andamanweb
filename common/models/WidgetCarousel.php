<?php

namespace common\models;

use common\behaviors\CacheInvalidateBehavior;
use Yii;

/**
 * This is the model class for table "widget_carousel".
 *
 * @property int $id
 * @property string $key
 * @property int|null $status
 */
class WidgetCarousel extends \yii\db\ActiveRecord implements \dixonstarter\togglecolumn\ToggleActionInterface
{
    use \dixonstarter\togglecolumn\ToggleActionTrait;

    const STATUS_DRAFT = 0;
    const STATUS_ACTIVE = 1;
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'widget_carousel';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['key'], 'required'],
            [['key'], 'unique'],
            [['status'], 'integer'],
            [['key'], 'string', 'max' => 255]
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ไอดี',
            'key' => 'Key',
            'status' => 'สถานะ',
        ];
    }

    /**
     * @return array statuses list
     */
    public static function statuses()
    {
        return [
            self::STATUS_DRAFT => 'Draft',
            self::STATUS_ACTIVE => 'Active',
        ];
    }

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'cacheInvalidate' => [
                'class' => CacheInvalidateBehavior::class,
                'cacheComponent' => 'frontendCache',
                'keys' => [
                    function ($model) {
                        return [
                            self::class,
                            $model->key
                        ];
                    }
                ]
            ]
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getItems()
    {
        return $this->hasMany(WidgetCarouselItem::class, ['carousel_id' => 'id']);
    }

    public function getToggleItems()
    {
        return  [
            'on' => ['value' => 1, 'label' => 'Enabled'],
            'off' => ['value' => 0, 'label' => 'Disabled'],
        ];
    }
}
