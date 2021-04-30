<?php
/*
 * Created by VS Code.
 * User: Tanakorn Phompak
 * Date: Wed Jun 10 2020
 * Time: 07:13:51
 */
namespace metronic\user\controllers;

use dektrium\user\controllers\SecurityController as BaseSecurityController;
use yii\filters\AccessControl;
use yii\filters\VerbFilter;

class SecurityController extends BaseSecurityController
{
     /** @inheritdoc */
     public function behaviors()
     {
         return [
             'access' => [
                 'class' => AccessControl::className(),
                 'rules' => [
                     ['allow' => true, 'actions' => ['login', 'auth'], 'roles' => ['?']],
                     ['allow' => true, 'actions' => ['login', 'auth', 'logout'], 'roles' => ['@']],
                 ],
             ],
             'verbs' => [
                 'class' => VerbFilter::className(),
                 'actions' => [
                     'logout' => ['post'],
                 ],
             ],
         ];
     }

     /**
     * Logs the user out and then redirects to the homepage.
     *
     * @return Response
     */
    public function actionLogout()
    {
        $event = $this->getUserEvent(\Yii::$app->user->identity);

        $this->trigger(self::EVENT_BEFORE_LOGOUT, $event);

        \Yii::$app->getUser()->logout();

        $this->trigger(self::EVENT_AFTER_LOGOUT, $event);

        return $this->goHome();
    }
}
