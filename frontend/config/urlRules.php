<?php
/*
 * Created by VS Code.
 * User: Tanakorn Phompak
 * Date: Wed Jun 10 2020
 * Time: 06:21:08
 */
return [
  /* '<controller:\w+>/<id:\d+>' => '<controller>',
  '<controller:\w+>/<action:\w+>/<id:\d+>' => '<controller>/<action>',
  '<controller:\w+>/<action:\w+>' => '<controller>/<action>', */

  'home' => 'site/index',
  'page/<slug>' => 'page/view',
  'news/view/<slug>' => 'news/view',
  'events/view/<slug>' => 'events/view',
];
