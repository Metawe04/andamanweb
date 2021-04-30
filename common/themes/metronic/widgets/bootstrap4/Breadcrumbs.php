<?php

namespace metronic\widgets\bootstrap4;

use yii\bootstrap4\Breadcrumbs as BaseWidget;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\base\InvalidConfigException;

class Breadcrumbs extends BaseWidget
{
    protected function renderItem($link, $template)
    {
        $encodeLabel = ArrayHelper::remove($link, 'encode', $this->encodeLabels);
        if (array_key_exists('label', $link)) {
            $label = $encodeLabel ? Html::encode($link['label']) : $link['label'];
        } else {
            throw new InvalidConfigException('The "label" element is required for each link.');
        }
        if (isset($link['template'])) {
            $template = $link['template'];
        }
        if (isset($link['url'])) {
            $options = $link;
            unset($options['template'], $options['label'], $options['url']);
            $link = Html::a($label, $link['url'], ArrayHelper::merge($options, ['data-pjax' => 0]));
        } else {
            $link = $label;
        }

        return strtr($template, ['{link}' => $link]);
    }
}
