<?php
/*
 * Created by VS Code.
 * User: Tanakorn Phompak
 * Date: Wed Jun 10 2020
 * Time: 06:20:21
 */
$urlRules = require __DIR__ . '/urlRules.php';

return [
    'class' => 'yii\web\UrlManager',
    'enablePrettyUrl' => true,
    'showScriptName' => false,
    'rules' => $urlRules,
];
