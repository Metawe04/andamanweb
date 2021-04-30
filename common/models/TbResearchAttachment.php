<?php

namespace common\models;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "tb_research_attachment".
 *
 * @property int $id
 * @property int $research_id รหัสงานวิจัย
 * @property string $path
 * @property string|null $base_url
 * @property string|null $type
 * @property int|null $size
 * @property string|null $name
 * @property int|null $created_at
 * @property int|null $order
 */
class TbResearchAttachment extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tb_research_attachment';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['research_id', 'path'], 'required'],
            [['research_id', 'size', 'created_at', 'order'], 'integer'],
            [['path', 'base_url', 'type', 'name'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'attachment_id' => 'Attachment Id',
            'research_id' => 'รหัสงานวิจัย',
            'path' => 'Path',
            'base_url' => 'Base Url',
            'type' => 'Type',
            'size' => 'Size',
            'name' => 'Name',
            'created_at' => 'Created At',
            'order' => 'Order',
        ];
    }

    public function behaviors()
    {
        return [
            [
                'class' => TimestampBehavior::class,
                'updatedAtAttribute' => false
            ]
        ];
        
    }
    public function getNews()
    {
        return $this->hasOne(TbResearchAttachment::class, ['attachment_id' => 'research_id']);
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

    public function getIconCss()
    {
        $icons = [
            'application/pdf' => 'fa-2x fa fa-file-pdf-o text-danger',
            'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' => 'fa-2x fa fa-file-excel text-success',
            'application/vnd.openxmlformats-officedocument.wordprocessingml.document' => 'fa-2x fa fa-file-word text-info',
            'application/vnd.openxmlformats-officedocument.presentationml.presentation' => 'fa-2x fa fa-file-powerpoint text-danger'
        ];
        return ArrayHelper::getValue($icons, $this->type, 'fa-2x fa fa-file-alt');
    }
}
