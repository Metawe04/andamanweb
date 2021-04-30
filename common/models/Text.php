<?php

namespace common\models;

use Yii;
use common\behaviors\CacheInvalidateBehavior;
use yii\behaviors\TimestampBehavior;
use yii\db\ActiveRecord;
use common\behaviors\CacheFlush;

/**
 * This is the model class for table "texts".
 *
 * @property int $text_id
 * @property string|null $slug
 * @property string $title
 * @property string $body
 * @property int|null $status
 * @property int|null $created_at
 * @property int|null $updated_at
 */
class Text extends \common\components\ActiveRecord implements \dixonstarter\togglecolumn\ToggleActionInterface
{
    use \dixonstarter\togglecolumn\ToggleActionTrait;

    const CACHE_KEY = 'yii_text';
    const STATUS_ACTIVE = 1;
    const STATUS_DRAFT = 0;
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'texts';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['title', 'body'], 'required'],
            [['body'], 'string'],
            [['status', 'created_at', 'updated_at'], 'integer'],
            ['slug', 'match', 'pattern' => '/^[0-9a-z-]{0,128}$/', 'message' => 'Slug can contain only 0-9, a-z and "-" characters (max: 128).'],
            [['title'], 'string', 'max' => 255],
            [['slug'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'text_id' => 'Text ID',
            'slug' => 'Slug',
            'title' => 'Title',
            'body' => 'ข้อความ',
            'status' => 'Status',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
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
            CacheFlush::class,
            TimestampBehavior::class,
            'cacheInvalidate' => [
                'class' => CacheInvalidateBehavior::class,
                'cacheComponent' => 'frontendCache',
                'keys' => [
                    function ($model) {
                        return [
                            self::class,
                            $model->slug
                        ];
                    }
                ]
            ]
        ];
    }

    public function getToggleItems()
    {
        return  [
            'on' => ['value' => 1, 'label' => 'Active'],
            'off' => ['value' => 0, 'label' => 'Draft'],
        ];
    }
}
