<?php
/*
 * Created by VS Code.
 * User: Tanakorn Phompak
 * Date: Fri Jun 12 2020
 * Time: 11:41:58
 */

namespace metronic\helpers;

use yii\helpers\BaseHtml;
use yii\helpers\Url;

class Html extends BaseHtml
{
    public static function imgLazy($src, $options = [])
    {
        $options['src'] = Url::to($src);

        if (isset($options['srcset']) && is_array($options['srcset'])) {
            $srcset = [];
            foreach ($options['srcset'] as $descriptor => $url) {
                $srcset[] = Url::to($url) . ' ' . $descriptor;
            }
            $options['srcset'] = implode(',', $srcset);
        }

        if (!isset($options['alt'])) {
            $options['alt'] = '';
        }

        $options['class'] = 'lazyload img-responsive';
        $options['data-src'] = Url::base(true) . Url::to($src);
        $options['data-srcset'] = Url::base(true) . Url::to($src);
        $options['loading'] = 'lazy';

        return static::tag('img', '', $options);
    }
}
