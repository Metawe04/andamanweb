<?php
/*
 * Created by VS Code.
 * User: Tanakorn Phompak
 * Date: Wed Jun 10 2020
 * Time: 07:05:43
 */

namespace metronic\user\models;

use Yii;
use dektrium\user\models\Profile as BaseProfile;
use trntv\filekit\behaviors\UploadBehavior;
use yii\helpers\Html;
use yii\behaviors\TimestampBehavior;
use common\components\DateConvert;
use yii\db\ActiveRecord;
use common\behaviors\CoreMultiValueBehavior;
use common\models\TbUserPosition;
use common\models\TbUserTitleName;
use yii\behaviors\BlameableBehavior;
use metronic\user\models\UserSearch;


class Profile extends BaseProfile
{
    public $avatar;

    public function rules()
    {
        $rules = parent::rules();
        $rules[] = [['avatar', 'avatar_path', 'avatar_base_url', 'user_birthdate'], 'safe'];
        $rules[] = [['usertype_id', 'user_course', 'user_department', 'user_faculty', 'user_sex_id', 'user_academicprostion_id', 'user_province_id', 'user_country_id', 'user_position_id', 'user_parentid', 'user_order'], 'integer'];
        $rules[] = [['user_specialist'], 'string', 'max' => 255];
        $rules[] = [['user_profile_id', 'user_title_name', 'user_nationality_id', 'user_religion_id'], 'string', 'max' => 50];
        $rules[] = [['user_fname_th', 'user_lname_th', 'user_fname_eng', 'user_lname_eng', 'user_race_id'], 'string', 'max' => 100];
        return $rules;
    }


    public function behaviors()
    {
        return [
            'avatar-profile' => [
                'class' => UploadBehavior::className(),
                'filesStorage' => 'fileStorage',
                'attribute' => 'avatar',
                'pathAttribute' => 'avatar_path',
                'baseUrlAttribute' => 'avatar_base_url'
            ],
            /* [
                'class' => CoreMultiValueBehavior::className(),
                'attributes' => [
                    ActiveRecord::EVENT_BEFORE_INSERT => ['user_birthdate'],
                    ActiveRecord::EVENT_BEFORE_UPDATE => ['user_birthdate'],
                ],
                'value' => function ($event) {
                    return DateConvert::convertToDatabase($event->sender[$event->data]);
                },
            ],
            [
                'class' => CoreMultiValueBehavior::className(),
                'attributes' => [
                    ActiveRecord::EVENT_AFTER_FIND => ['user_birthdate'],
                ],
                'value' => function ($event) {
                    return DateConvert::convertToDisplay($event->sender[$event->data]);
                },
            ], */
        ];
    }

    public function attributeLabels()
    {
        $labels = parent::attributeLabels();
        $labels['avatar'] = 'รูปประจำตัว';
        $labels['usertype_id'] = 'ประเภทผู้ใช้งาน';
        $labels['user_profile_id'] = 'หมายเลขประจำตัว';
        $labels['user_course'] = 'หลักสูตร';
        $labels['user_department'] = 'ภาควิชา';
        $labels['user_faculty'] = 'คณะ';
        $labels['user_sex_id'] = 'เพศ';
        $labels['user_title_name'] = 'คำนำหน้า';
        $labels['user_academicprostion_id'] = 'ตำแหน่งวิชาการ';
        $labels['user_fname_th'] = 'ชื่อ';
        $labels['user_lname_th'] = 'นามสกุล';
        $labels['user_fname_eng'] = 'ชื่อ';
        $labels['user_lname_eng'] = 'นามสกุล';
        $labels['user_birthdate'] = 'ว/ด/ปี เกิด';
        $labels['user_province_id'] = 'จังหวัด';
        $labels['user_country_id'] = 'ประเทศ';
        $labels['user_nationality_id'] = 'สัญชาติ';
        $labels['user_race_id'] = 'เชื้อชาติ';
        $labels['user_religion_id'] = 'ศาสนา';
        $labels['user_position_id'] = 'ตำแหน่ง';
        $labels['user_specialist'] = 'ความเชี่ยวชาญ';
        $labels['user_parentid'] = 'อยู่ภายใต้';
        $labels['user_order'] = 'ลำดับ';

        return $labels;
    }

    public function getImageAvatar()
    {
        if ($this->avatar_path) {
            return Html::img($this->getPictureUrl(), ['alt' => 'image']);
        } else {
            return Html::img($this->getPictureUrl(), ['alt' => 'image']);
        }
    }

    public function getPictureUrl()
    {
        if ($this->avatar_path) {
            return $this->avatar_base_url . str_replace('\\', '/', $this->avatar_path);
        } else {
            // $directoryAsset = Yii::$app->assetManager->getPublishedUrl('@metronic/assets/dist');
            // return $directoryAsset . '/media/users/default.jpg';
            $baseUrl = Yii::$app->params['baseUrl'];
            return $baseUrl . '/images/default.jpg';
        }
    }

    public function getFullname()
    {
        if ($this->user_title_name) {
            return $this->titleName->user_title_name .  $this->user_fname_th . ' ' . $this->user_lname_th;
        }
        return $this->user_fname_th . ' ' . $this->user_lname_th;
    }

    public function getTitleName()
    {
        return $this->hasOne(TbUserTitleName::className(), ['user_title_name_id' => 'user_title_name']);
    }

    public function getPosition()
    {
        return $this->hasOne(TbUserPosition::className(), ['user_position_id' => 'user_position_id']);
    }

    public function getFullnameEN()
    {
        return  $this->user_fname_eng . ' ' . $this->user_lname_eng;
       
    }

}
