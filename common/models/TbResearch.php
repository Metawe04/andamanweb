<?php

namespace common\models;

use backend\modules\settings\behaviors\NewsUploadBehavior;
use Yii;
use dektrium\user\models\User;
use trntv\filekit\behaviors\UploadBehavior;
use yii\behaviors\BlameableBehavior;
use yii\behaviors\SluggableBehavior;
use yii\behaviors\TimestampBehavior;
use common\behaviors\Taggable;
use common\behaviors\SeoBehavior;
use yii\data\ActiveDataProvider;
use common\models\TbResearcherOnus;
use common\models\TbResearchUserOnus;
use metronic\user\models\Profile;
use common\behaviors\CoreMultiValueBehavior;
use yii\db\ActiveRecord;
use common\components\DateConvert;
use yii\db\Expression;
use common\models\TbResearchAttachment;
use common\models\TbResearchType;
use common\models\TbResearchTypeWork;
use metronic\helpers\Html;

/**
 * This is the model class for table "tb_research".
 *
 * @property int $research_id
 * @property string $research_name ชื่องานวิจัย
 * @property int $research_type_id ลักษณะงานวิจัย
 * @property int $research_type_work_id ประเภทงานวิจัย
 * @property int $research_year ปีที่พิมพ์
 * @property string $research_date_begin วันที่เริ่มทำ
 * @property string $research_date_end วันที่สื้นสุด
 * @property int $research_status สถานะงานวิจัย
 * @property string $research_abstract เนื้อหางานวิจัย
 * @property string|null $research_detail รายละเอียด
 * @property int|null $created_by ผู้บันทึก
 * @property string|null $created_at เวลาที่บันทึก
 * @property int|null $updated_by ผู้แก้ไข
 * @property string|null $updated_at เวลาที่แก้ไข
 */
class TbResearch extends \yii\db\ActiveRecord implements \dixonstarter\togglecolumn\ToggleActionInterface

{
    use \dixonstarter\togglecolumn\ToggleActionTrait;
    public $attachments;

    public $search;
    public $research_user;
    public $photo;

    const STATUS_PUBLISHED = 1;
    const STATUS_DRAFT     = 0;

    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tb_research';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['research_name', 'research_type_id', 'research_type_work_id', 'research_year', 'research_date_begin', 'research_date_end', 'research_status', 'research_detail','research_type_id','research_type_work_id'], 'required'],
            [['research_type_id', 'research_type_work_id', 'research_year', 'research_status', 'created_by', 'updated_by', 'research_user'], 'integer'],
            [['research_date_begin', 'research_date_end', 'created_at', 'updated_at'], 'safe'],
            [['research_detail'], 'string'],
            [['research_name', 'research_type_other'], 'string', 'max' => 255],
            [['attachments', 'search','photo'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'research_id' => 'Research ID',
            'research_name' => 'ชื่องานวิจัย',
            'research_type_id' => 'ลักษณะงานวิจัย',
            'research_type_work_id' => 'ประเภทงานวิจัย',
            'research_year' => 'ปีที่พิมพ์',
            'research_date_begin' => 'วันที่เริ่มทำ',
            'research_date_end' => 'วันที่สื้นสุด',
            'research_status' => 'สถานะงานวิจัย',
            'research_detail' => 'บทคัดย่อ',
            'research_type_other' => 'ลักษณะวิจัยอื่นๆ',
            'created_by' => 'ผู้บันทึก',
            'created_at' => 'เวลาที่บันทึก',
            'updated_by' => 'ผู้แก้ไข',
            'updated_at' => 'เวลาที่แก้ไข',
            'attachments' => 'ไฟล์แนบ',
            'search' => 'ค้นหา',
            'research_user' => 'ผู้ร่วมวิจัย',
            'photo' => 'รูปภาพ'
        ];
    }


    public function behaviors()
    {
        return [
            'taggabble' => Taggable::className(),
            [
                'class' => NewsUploadBehavior::class,
                'attribute' => 'attachments',
                'multiple' => true,
                'uploadRelation' => 'researchAttachment',
                'pathAttribute' => 'path',
                'baseUrlAttribute' => 'base_url',
                'orderAttribute' => 'order',
                'typeAttribute' => 'type',
                'sizeAttribute' => 'size',
                'nameAttribute' => 'name',
                'ref_attribute' => 'attachments'

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
                'class' => CoreMultiValueBehavior::className(),
                'attributes' => [
                    ActiveRecord::EVENT_BEFORE_INSERT => ['research_date_begin', 'research_date_end'],
                    ActiveRecord::EVENT_BEFORE_UPDATE => ['research_date_begin', 'research_date_end'],
                ],
                'value' => function ($event) {
                    return DateConvert::convertToDatabase($event->sender[$event->data], true);
                },
            ],
            [
                'class' => CoreMultiValueBehavior::className(),
                'attributes' => [
                    ActiveRecord::EVENT_AFTER_FIND => ['research_date_begin', 'research_date_end',],
                ],
                'value' => function ($event) {
                    return DateConvert::convertToDisplay($event->sender[$event->data],true);
                },
            ],
            [
                'class' => TimestampBehavior::className(),
                'attributes' => [
                    ActiveRecord::EVENT_BEFORE_INSERT => ['created_at', 'updated_at'],
                    ActiveRecord::EVENT_BEFORE_UPDATE => ['updated_at'],
                ],
                'value' => new Expression('NOW()'),
            ],
            [
                'class' => BlameableBehavior::className(),
                'createdByAttribute' => 'created_by',
                'updatedByAttribute' => 'updated_by',
            ],
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getResearchAttachment()
    {
        return $this->hasMany(TbResearchAttachment::class, ['research_id' => 'research_id'])->andOnCondition(['ref_attribute' => 'attachments']);
    }

    public function getPhotosAttachments()
    {
        return $this->hasMany(TbResearchAttachment::class, ['research_id' => 'research_id'])->andOnCondition(['ref_attribute' => 'photo']);
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

    public function getResearchType()
    {
        return $this->hasOne(TbResearchType::className(), ['research_type_id' => 'research_type_id']);
    }
    public function getResearchTypeWork()
    {
        return $this->hasOne(TbResearchTypeWork::className(), ['research_type_work_id' => 'research_type_work_id']);
    }

    public function getToggleItems()
    {
        return  [
            'on' => ['value' => 1, 'label' => 'เสร็จสิ้น'],
            'off' => ['value' => 0, 'label' => 'กำลังดำเนินการ'],
        ];
    }

    public function getProfile()
    {
        return $this->hasOne(Profile::className(), ['user_id' => 'research_user']);
    }

    public function getCreateUer()
    {
        return $this->hasOne(Profile::className(), ['user_id' => 'created_by']);
    }



    public function getResearcherUser()
    {
        return $this->hasMany(TbResearchUserOnus::className(), ['research_id' => 'research_id']);
    }

    public function getResearchUserName()
    {
        $users = [];
        if (is_array($this->researcherUser) && !empty($this->researcherUser)) {
            foreach ($this->researcherUser as $i => $u) {
                $users[] =  $u->profile ? Html::tag('li', $u->profile->fullname) : '';
            }
        }
        return Html::tag('ol', implode("\n", $users));
    }
    
    public function getAttachmentLinks()
    {
        $files = $this->researchAttachment;
        $li = [];
        foreach ($files as $file) {
            $icon = Html::tag('i', '', ['class' => $file->iconCss]);
            $li[] = Html::tag('li', Html::a($icon . ' ' . $file->name, $file->url, ['target' => '_blank', 'data-pjax' => '0']));
        }
        return Html::tag('ol', implode("\n", $li));
    }

    public function getAuthorResearch()
    {
        $author = TbResearchUserOnus::findOne(['research_id' => $this->research_id, 'researcher_onus_id' => 1]);
        return empty($author) || !$author->profile ? '' : $author->profile->fullname;
    }


    public function getTypename() //
    {
        $ResearchType = $this->researchType;
        if($ResearchType && $this->research_type_id == 10){
            return $this->research_type_other;
        }
        return $ResearchType ? $ResearchType->research_type_name : '';
    }

    public function getTypeworkname() //
    {
        $ResearchTypeWork = $this->researchTypeWork;
        if($ResearchTypeWork && $this->research_type_work_id == 7){
            return $this->research_type_work_other;
        }
        return $ResearchTypeWork ? $ResearchTypeWork->research_type_work_name : '';
    }
}
