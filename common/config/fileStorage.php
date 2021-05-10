<?php
/*
 * Created by VS Code.
 * User: Tanakorn Phompak
 * Date: Thu Jun 11 2020
 * Time: 06:42:41
 */
return [
  'class' => 'trntv\filekit\Storage',
  'baseUrl' => YII_ENV_DEV ? 'http://andaman-web.local/storage/source/' : 'http://159.65.131.194/storage/source/' ,
  'filesystem' => [
      'class' => 'common\components\filesystem\LocalFlysystemBuilder',
      'path' => '@storage/web/source'
  ],
  'as log' => [
      'class' => 'common\behaviors\FileStorageLogBehavior',
      'component' => 'fileStorage'
  ],
];