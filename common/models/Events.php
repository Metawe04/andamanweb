<?php

namespace common\models;

use Yii;
use common\behaviors\CacheInvalidateBehavior;
use common\behaviors\SeoBehavior;
use dektrium\user\models\User;
use trntv\filekit\behaviors\UploadBehavior;
use yii\behaviors\BlameableBehavior;
use yii\behaviors\SluggableBehavior;
use yii\behaviors\TimestampBehavior;
use common\behaviors\Taggable;
/**
 * This is the model class for table "events".
 *
 * @property int $events_id
 * @property string $title
 * @property string|null $short
 * @property string $text
 * @property string|null $slug
 * @property int|null $views
 * @property int|null $status
 * @property string|null $image_base_url
 * @property string|null $image_path
 * @property int|null $created_by
 * @property int|null $updated_by
 * @property string|null $published_at
 * @property int|null $created_at
 * @property int|null $updated_at
 * @property string|null $view
 */
class Events extends \common\components\ActiveRecord implements \dixonstarter\togglecolumn\ToggleActionInterface
{
    use \dixonstarter\togglecolumn\ToggleActionTrait;

    const STATUS_PUBLISHED = 1;
    const STATUS_DRAFT     = 0;

    public $image;

    /**
     * @var array
     */
    public $attachments;

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'events';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['title', 'text'], 'required'],
            [['text'], 'string'],
            [['views', 'status', 'created_by', 'updated_by', 'created_at', 'updated_at'], 'integer'],
            [['published_at', 'image', 'attachments', 'tagNames'], 'safe'],
            [['title', 'slug'], 'string', 'max' => 128],
            [['short', 'image_base_url', 'image_path'], 'string', 'max' => 1024],
            [['view'], 'string', 'max' => 255],
            [['slug'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'events_id' => 'Events ID',
            'title' => 'ชื่อกิจกรรม',
            'short' => 'Short',
            'text' => 'รายละเอียดกิจกรรม',
            'slug' => 'Slug',
            'views' => 'Views',
            'status' => 'สถานะ',
            'image_base_url' => 'Image Base Url',
            'image_path' => 'Image Path',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
            'published_at' => 'วันที่เผยแพร่',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'view' => 'Page View',
            'image' => 'ภาพปกกิจกรรม',
            'attachments' => 'รูปภาพ',
            'tagNames' => 'Tags',
        ];
    }

    /**
     * @return array statuses list
     */
    public static function statuses()
    {
        return [
            self::STATUS_DRAFT => 'Draft',
            self::STATUS_PUBLISHED => 'Published'
        ];
    }

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            TimestampBehavior::class,
            BlameableBehavior::class,
            'taggabble' => Taggable::className(),
            'seoBehavior' => SeoBehavior::className(),
            'sluggable' => [
                'class' => SluggableBehavior::class,
                'attribute' => 'title',
                'immutable' => true,
                'ensureUnique' => true
            ],
            [
                'class' => UploadBehavior::class,
                'filesStorage' => 'fileStorage',
                'attribute' => 'attachments',
                'multiple' => true,
                'uploadRelation' => 'eventsAttachments',
                'pathAttribute' => 'path',
                'baseUrlAttribute' => 'base_url',
                'orderAttribute' => 'order',
                'typeAttribute' => 'type',
                'sizeAttribute' => 'size',
                'nameAttribute' => 'name',
            ],
            [
                'class' => UploadBehavior::class,
                'filesStorage' => 'fileStorage',
                'attribute' => 'image',
                'pathAttribute' => 'image_path',
                'baseUrlAttribute' => 'image_base_url',
            ],
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

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEventsAttachments()
    {
        return $this->hasMany(EventsAttachment::class, ['events_id' => 'events_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUserCreateBy()
    {
        return $this->hasOne(User::class, ['id' => 'created_by']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUpdater()
    {
        return $this->hasOne(User::class, ['id' => 'updated_by']);
    }

    public function getToggleItems()
    {
        return  [
            'on' => ['value' => 1, 'label' => 'Published'],
            'off' => ['value' => 0, 'label' => 'Draft'],
        ];
    }
}
