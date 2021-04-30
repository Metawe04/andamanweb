<?php

namespace common\models;

use common\behaviors\CacheInvalidateBehavior;
use trntv\filekit\behaviors\UploadBehavior;
use Yii;
use yii\behaviors\TimestampBehavior;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "widget_carousel_item".
 *
 * @property int $id
 * @property int $carousel_id
 * @property string|null $base_url
 * @property string|null $path
 * @property string|null $asset_url
 * @property string|null $type
 * @property string|null $url
 * @property string|null $caption
 * @property int $status
 * @property int|null $order
 * @property int|null $created_at
 * @property int|null $updated_at
 */
class WidgetCarouselItem extends \yii\db\ActiveRecord implements \dixonstarter\togglecolumn\ToggleActionInterface
{
    use \dixonstarter\togglecolumn\ToggleActionTrait;

    /**
     * @var array|null
     */
    public $image;

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'widget_carousel_item';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['carousel_id'], 'required'],
            [['carousel_id', 'status', 'order'], 'integer'],
            [['url', 'caption', 'base_url', 'path'], 'string', 'max' => 1024],
            [['type'], 'string', 'max' => 255],
            ['image', 'required', 'when' => function ($model) {
                return $model->getIsNewRecord();
            }],
            ['image', 'safe']
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'carousel_id' => 'Carousel ID',
            'base_url' => 'Base Url',
            'path' => 'Path',
            'asset_url' => 'Asset Url',
            'type' => 'Type',
            'url' => 'ลิงค์',
            'caption' => 'คำบรรยาย',
            'status' => 'สถานะ',
            'order' => 'ลำดับ',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

    /**
     * @return array
     */
    public function scenarios()
    {
        $scenarios = parent::scenarios();
        $key = array_search('carousel_id', $scenarios[self::SCENARIO_DEFAULT], true);
        $scenarios[self::SCENARIO_DEFAULT][$key] = '!carousel_id';
        return $scenarios;
    }

    /**
     * @return array
     */
    public function behaviors()
    {
        return [
            TimestampBehavior::class,
            [
                'class' => UploadBehavior::class,
                'filesStorage' => 'fileStorage',
                'attribute' => 'image',
                'pathAttribute' => 'path',
                'baseUrlAttribute' => 'base_url',
                'typeAttribute' => 'type'
            ],
            'cacheInvalidate' => [
                'class' => CacheInvalidateBehavior::class,
                'cacheComponent' => 'frontendCache',
                'keys' => [
                    function ($model) {
                        return [
                            WidgetCarousel::class,
                            $model->carousel->key
                        ];
                    }
                ]
            ]
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCarousel()
    {
        return $this->hasOne(WidgetCarousel::class, ['id' => 'carousel_id']);
    }

    public function getToggleItems()
    {
        return  [
            'on' => ['value' => 1, 'label' => 'Enabled'],
            'off' => ['value' => 0, 'label' => 'Disabled'],
        ];
    }
}
