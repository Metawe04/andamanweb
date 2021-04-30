<?php 
namespace frontend\controllers;


use Yii;
use yii\web\NotFoundHttpException;
use common\api\page\Page;
use common\models\TbUserPosition;
use common\models\search\TbUserPositionSearch;
use common\models\TbUsertype;
use metronic\user\models\Profile;
use yii\filters\AccessControl;

class PersonnelController extends \yii\web\Controller
{
    /** @inheritdoc */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'rules' => [
                    [
                        'actions' => ['index'],
                        'allow' => true,
                        'roles' => ['?'],
                    ],
                    [
                        'actions' => ['index'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
        ];
    }

    public function actionIndex() {

    $usertypes = TbUsertype::find()->where(['usertype_id' => [2, 3]])->all();
    $profiles2 = Profile::find()->where(['usertype_id' => [2]])->orderBy('user_order ASC')->all();
    $profiles3 = Profile::find()->where(['usertype_id' => [3]])->orderBy('user_order ASC')->all();
    
        return $this->render('index', [
            'usertypes' => $usertypes,
            'profiles2' => $profiles2,
            'profiles3' => $profiles3
        ]);
    }

}