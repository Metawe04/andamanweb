<?php
/*
 * Created by VS Code.
 * User: Tanakorn Phompak
 * Date: Thu Jun 11 2020
 * Time: 18:59:18
 */
namespace metronic\widgets\tinymce;

use yii\web\AssetBundle;

class TinyMceLangAsset extends AssetBundle
{
    public $sourcePath = '@metronic/widgets/tinymce/assets';

    public $depends = [
        'metronic\widgets\tinymce\TinyMceAsset'
    ];
}