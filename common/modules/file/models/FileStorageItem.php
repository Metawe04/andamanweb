<?php

namespace common\modules\file\models;

use Yii;
use yii\behaviors\TimestampBehavior;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "file_storage_item".
 *
 * @property int $id
 * @property string $component
 * @property string $base_url
 * @property string $path
 * @property string $type
 * @property int $size
 * @property string $name
 * @property string $upload_ip
 * @property int $ref_id
 * @property int $created_at
 */
class FileStorageItem extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'file_storage_item';
    }

    public function behaviors()
    {
        return [
            [
                'class' => TimestampBehavior::className(),
                'attributes' => [
                    ActiveRecord::EVENT_BEFORE_INSERT => ['created_at'],
                ],
                // if you're using datetime instead of UNIX timestamp:
                'value' => time(),
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['component', 'base_url', 'path'], 'required'],
            [['size', 'ref_id', 'created_at'], 'integer'],
            [['component', 'type', 'name'], 'string', 'max' => 255],
            [['base_url', 'path'], 'string', 'max' => 1024],
            [['upload_ip'], 'string', 'max' => 15],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'component' => Yii::t('app', 'Component'),
            'base_url' => Yii::t('app', 'Base Url'),
            'path' => Yii::t('app', 'Path'),
            'type' => Yii::t('app', 'Type'),
            'size' => Yii::t('app', 'Size'),
            'name' => Yii::t('app', 'Name'),
            'upload_ip' => Yii::t('app', 'Upload Ip'),
            'ref_id' => Yii::t('app', 'Ref ID'),
            'created_at' => Yii::t('app', 'Created At'),
        ];
    }
}
