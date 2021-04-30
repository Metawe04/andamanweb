<?php
/*
 * Created by VS Code.
 * User: Tanakorn Phompak
 * Date: Thu Jun 11 2020
 * Time: 18:57:38
 */
namespace metronic\widgets\tinymce;

use yii\web\AssetBundle;

class TinyMceAsset extends AssetBundle
{
    public $sourcePath = '@vendor/tinymce/tinymce';

    public $js = [
        'tinymce.min.js'
    ];
}