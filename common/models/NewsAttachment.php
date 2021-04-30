<?php

namespace common\models;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "news_attachment".
 *
 * @property int $id
 * @property int $news_id
 * @property string $path
 * @property string|null $base_url
 * @property string|null $type
 * @property int|null $size
 * @property string|null $name
 * @property int|null $created_at
 * @property int|null $order
 */
class NewsAttachment extends \common\components\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'news_attachment';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['news_id', 'path'], 'required'],
            [['news_id', 'size', 'created_at', 'order'], 'integer'],
            [['path', 'base_url', 'type', 'name'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'news_id' => 'News ID',
            'path' => 'Path',
            'base_url' => 'Base Url',
            'type' => 'Type',
            'size' => 'Size',
            'name' => 'Name',
            'created_at' => 'Created At',
            'order' => 'Order',
        ];
    }

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            [
                'class' => TimestampBehavior::class,
                'updatedAtAttribute' => false
            ]
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getNews()
    {
        return $this->hasOne(News::class, ['id' => 'news_id']);
    }

    public function getUrl()
    {
        return $this->base_url. str_replace('\\', '/', $this->path);
    }

    public function getIcon()
    {
        $icons = [
            'application/pdf' => 'pdf.png',
            'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' => 'xls-file-format.png',
            'application/vnd.openxmlformats-officedocument.wordprocessingml.document' => 'doc.png',
            'application/vnd.openxmlformats-officedocument.presentationml.presentation' => 'infographic.png'
        ];
        return ArrayHelper::getValue($icons, $this->type, 'info.png');
    }
}
