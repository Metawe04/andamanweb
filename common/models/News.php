<?php

namespace common\models;

use backend\modules\settings\behaviors\NewsUploadBehavior;
use common\behaviors\CacheInvalidateBehavior;
use common\behaviors\SeoBehavior;
use dektrium\user\models\User;
use Yii;
use trntv\filekit\behaviors\UploadBehavior;
use yii\behaviors\BlameableBehavior;
use yii\behaviors\SluggableBehavior;
use yii\behaviors\TimestampBehavior;
use common\behaviors\Taggable;
use metronic\user\models\Profile;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "news".
 *
 * @property int $news_id
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
 * @property int|null $published_at
 * @property int|null $created_at
 * @property int|null $updated_at
 * @property string|null $view
 */
class News extends \common\components\ActiveRecord implements \dixonstarter\togglecolumn\ToggleActionInterface
{
    use \dixonstarter\togglecolumn\ToggleActionTrait;

    public $search;

    const STATUS_PUBLISHED = 1;
    const STATUS_DRAFT     = 0;

    public $image;
    public $photo;


    /**
     * @var array
     */
    public $attachments;

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'news';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['title', 'text', 'category_id'], 'required'],
            [['text'], 'string'],
            [['category_id'], 'exist', 'targetClass' => NewsCategory::class, 'targetAttribute' => 'category_id'],
            /* [['published_at'], 'default', 'value' => function () {
                return date(DATE_ISO8601);
            }],
            [['published_at'], 'filter', 'filter' => 'strtotime', 'skipOnEmpty' => true], */
            [['views', 'status', 'created_by', 'updated_by', 'created_at', 'updated_at', 'category_id'], 'integer'],
            [['title'], 'string', 'max' => 128],
            ['slug', 'match', 'pattern' => '/^[0-9a-z-]{0,128}$/', 'message' => 'Slug can contain only 0-9, a-z and "-" characters (max: 128).'],
            [['short', 'image_base_url', 'image_path'], 'string', 'max' => 1024],
            [['view'], 'string', 'max' => 255],
            [['slug'], 'unique'],
            [['attachments', 'image', 'published_at', 'search', 'photo'], 'safe'],
            ['tagNames', 'safe']
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'news_id' => 'ไอดีข่าว',
            'title' => 'ชื่อเรื่อง',
            'category_id' => 'หมวดหมู่',
            'short' => 'เนื้อหาย่อ',
            'text' => 'เนื้อหา',
            'slug' => 'Slug Url',
            'views' => 'จำนวนที่เปิดอ่าน',
            'status' => 'สถานะ',
            'image_base_url' => 'Image Base Url',
            'image_path' => 'Image Path',
            'created_by' => 'Created By',
            'updated_by' => 'Updated By',
            'published_at' => 'วันที่เผยแพร่',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'view' => 'Page View',
            'tagNames' => 'Tags',
            'image' => 'ภาพปกข่าว',
            'attachments' => 'ไฟล์แนบ',
            'search' => 'ค้นหา',
            'photo' => 'รูปภาพ'

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
                'uploadRelation' => 'newsAttachments',
                'pathAttribute' => 'path',
                'baseUrlAttribute' => 'base_url',
                'orderAttribute' => 'order',
                'typeAttribute' => 'type',
                'sizeAttribute' => 'size',
                'nameAttribute' => 'name',
            ],
            [
                'class' => NewsUploadBehavior::class,
                'filesStorage' => 'fileStorage',
                'attribute' => 'photo',
                'multiple' => true,
                'uploadRelation' => 'photosAttachments',
                'pathAttribute' => 'path',
                'baseUrlAttribute' => 'base_url',
                'orderAttribute' => 'order',
                'typeAttribute' => 'type',
                'sizeAttribute' => 'size',
                'nameAttribute' => 'name',
                'ref_attribute' => 'photo',
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
    public function getNewsAttachments()
    {
        return $this->hasMany(NewsAttachment::class, ['news_id' => 'news_id'])->andOnCondition(['ref_attribute' => 'attachments']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPhotosAttachments()
    {
        return $this->hasMany(NewsAttachment::class, ['news_id' => 'news_id'])->andOnCondition(['ref_attribute' => 'photo']);
    }
     /**
     * @return \yii\db\ActiveQuery
     */
    public function getAuthor()
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

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCategory()
    {
        return $this->hasOne(NewsCategory::class, ['category_id' => 'category_id']);
    }

    public function getToggleItems()
    {
        return  [
            'on' => ['value' => 1, 'label' => 'Published'],
            'off' => ['value' => 0, 'label' => 'Draft'],
        ];
    }

}
