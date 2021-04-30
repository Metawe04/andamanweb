<?php
namespace common\widgets;

use dosamigos\selectize\SelectizeTextInput;

class TagsInput extends SelectizeTextInput
{
    public $options = ['class' => 'form-control'];
    public $loadUrl = ['/settings/news/tags'];
    public $clientOptions = [
        'plugins' => ['remove_button'],
        'valueField' => 'name',
        'labelField' => 'name',
        'searchField' => ['name'],
        'create' => true,
    ];
}