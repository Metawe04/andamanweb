<?php

namespace common\models;

use common\models\query\NewsCategoryQuery;
use Yii;
use yii\behaviors\TimestampBehavior;

/**
 * This is the model class for table "news_categories".
 *
 * @property int $category_id
 * @property string $slug
 * @property string $title
 * @property int|null $parent_id
 * @property int $status
 * @property int|null $created_at
 * @property int|null $updated_at
 */
class NewsCategory extends \yii\db\ActiveRecord implements \dixonstarter\togglecolumn\ToggleActionInterface
{
    use \dixonstarter\togglecolumn\ToggleActionTrait;

    const STATUS_ACTIVE = 1;
    const STATUS_DRAFT  = 0;
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'news_categories';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['slug', 'title'], 'required'],
            [['parent_id', 'status', 'created_at', 'updated_at', 'order_num'], 'integer'],
            [['slug'], 'string', 'max' => 255],
            [['title'], 'string', 'max' => 512],
            [['slug'], 'unique'],
            [['icon'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'category_id' => 'Category ID',
            'slug' => 'Slug Url',
            'title' => 'ชื่อ',
            'icon' => 'ไอคอน',
            'parent_id' => 'Parent ID',
            'status' => 'สถานะการแสดง',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'order_num' => 'ลำดับ',
        ];
    }

    public function getToggleItems()
    {
        return  [
            'on' => ['value' => 1, 'label' => 'Published'],
            'off' => ['value' => 0, 'label' => 'Draft'],
        ];
    }

    public function behaviors()
    {
        return [
            TimestampBehavior::class,
        ];
    }

    /**
     * @return NewsCategoryQuery
     */
    public static function find()
    {
        return new NewsCategoryQuery(get_called_class());
    }

    /**
     * @return array statuses list
     */
    public static function statuses()
    {
        return [
            self::STATUS_DRAFT => Yii::t('common', 'Draft'),
            self::STATUS_ACTIVE => Yii::t('common', 'Active'),
        ];
    }
}
