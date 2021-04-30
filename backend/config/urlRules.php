<?php
/*
 * Created by VS Code.
 * User: Tanakorn Phompak
 * Date: Wed Jun 10 2020
 * Time: 06:21:08
 */
return [
  // 'user2/update/<id:\d+>' => 'user2/update',
  '<controller:\w+>/<id:\d+>' => '<controller>',
  '<controller:\w+>/<action:\w+>/<id:\d+>' => '<controller>/<action>',
  '<controller:\w+>/<action:\w+>' => '<controller>/<action>',
];
