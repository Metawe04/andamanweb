<?php

namespace metronic\widgets\bootstrap4;

use yii\bootstrap4\Modal as BaseModal;
use yii\helpers\Html;
use metronic\widgets\ajaxcrud\AjaxCrudAsset;

class Modal extends BaseModal
{
    /**
     * Initializes the widget.
     */
    public function init()
    {
        parent::init();

        $view = $this->getView();

        AjaxCrudAsset::register($view);
    }
}
