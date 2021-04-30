<?php

namespace common\models;

use Yii;
use yii\behaviors\SluggableBehavior;
use yii\behaviors\TimestampBehavior;
use common\behaviors\SeoBehavior;

/**
 * This is the model class for table "pages".
 *
 * @property int $page_id
 * @property string|null $slug
 * @property string $title
 * @property string $body
 * @property string|null $view
 * @property int $status
 * @property int|null $created_at
 * @property int|null $updated_at
 */
class Page extends \common\components\ActiveRecord implements \dixonstarter\togglecolumn\ToggleActionInterface
{
    use \dixonstarter\togglecolumn\ToggleActionTrait;

    const STATUS_DRAFT = 0;
    const STATUS_PUBLISHED = 1;

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'pages';
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
            [['slug', 'title'], 'string', 'max' => 128],
            ['slug', 'match', 'pattern' => '/^[0-9a-z-]{0,128}$/', 'message' => 'Slug can contain only 0-9, a-z and "-" characters (max: 128).'],
            ['slug', 'default', 'value' => null],
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
            'page_id' => 'เพจไอดี',
            'slug' => 'Slug',
            'title' => 'ชื่อเพจ',
            'body' => 'เนื้อหา',
            'view' => 'Page View',
            'status' => 'สถานะ',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

    public function behaviors()
    {
        return [
            'seoBehavior' => SeoBehavior::className(),
            TimestampBehavior::class,
            'slug' => [
                'class' => SluggableBehavior::class,
                'attribute' => 'title',
                'ensureUnique' => true,
                'immutable' => true
            ]
        ];
    }

    public function getToggleItems()
    {
        return  [
            'on' => ['value' => 1, 'label' => 'Enabled'],
            'off' => ['value' => 0, 'label' => 'Disabled'],
        ];
    }
}
