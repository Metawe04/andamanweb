<?php

/**
 * Eugine Terentev <eugine@terentev.net>
 */

namespace common\widgets;

use cheatsheet\Time;
use common\models\WidgetCarousel;
use common\models\WidgetCarouselItem;
use Yii;
use yii\base\InvalidConfigException;
use yii\bootstrap4\Carousel;
use yii\di\Instance;
use metronic\helpers\Html;
use yii\web\AssetManager;
use yii\helpers\ArrayHelper;

/**
 * Class DbCarousel
 * @package common\widgets
 */
class DbCarousel extends Carousel
{
    /**
     * @var
     */
    public $key;

    /**
     * @var string|array|callable|AssetManager
     */
    public $assetManager;

    /**
     * @var array
     */
    public $controls = [
        '<span class="carousel-control-prev-icon icofont-rounded-left" aria-hidden="true"></span><span class="sr-only">Previous</span>',
        '<span class="carousel-control-next-icon icofont-rounded-right" aria-hidden="true"></span><span class="sr-only">Next</span>'
    ];

    /**
     * @throws InvalidConfigException
     */
    public function init()
    {
        if (!$this->key) {
            throw new InvalidConfigException("key should be set");
        }
        $this->assetManager = Instance::ensure($this->assetManager, AssetManager::class);
        $cacheKey = [
            WidgetCarousel::class,
            $this->key
        ];
        // $items = Yii::$app->cache->get($cacheKey);
        // if ($items === false) {

        //     if (YII_ENV_PROD) {
        //         Yii::$app->cache->set($cacheKey, $items, Time::SECONDS_IN_AN_HOUR);
        //     }
        // }
        $items = [];
        $query = WidgetCarouselItem::find()
            ->joinWith('carousel')
            ->where([
                '{{%widget_carousel_item}}.status' => 1,
                '{{%widget_carousel}}.status' => WidgetCarousel::STATUS_ACTIVE,
                '{{%widget_carousel}}.key' => $this->key,
            ])
            ->orderBy(['order' => SORT_ASC]);
        foreach ($query->all() as $k => $item) {
            /** @var $item \common\models\WidgetCarouselItem */
            $link = '';
            if ($item->url) {
                $link = Html::a('รายละเอียด', $item->url, ['target' => '_blank', 'class' => 'btn-get-started']);
                // $items[$k]['content'] = Html::a($items[$k]['content'], $item->url, ['target' => '_blank']);
            }
            if ($item->path) {
                $url = $this->publishItem($item);
                $items[$k]['content'] = Html::imgLazy($url) .
                    Html::beginTag('div', ['class' => 'carousel-container']) .
                    Html::beginTag('div', ['class' => 'carousel-content container']) .
                    $item->caption .
                    $link .
                    Html::endTag('div') .
                    Html::endTag('div'); //Html::img($url);
            }
            /* if ($item->caption) {
                    $items[$k]['caption'] = $item->caption;
                } */
        }
        $this->items = $items;
        parent::init();
    }

    /**
     * Renders the widget.
     */
    public function run()
    {
        $this->registerPlugin('carousel');
        return implode("\n", [
            Html::beginTag('div', $this->options),
            $this->renderIndicators(),
            $this->renderItems(),
            $this->renderControls(),
            Html::endTag('div')
        ]) . "\n";
    }

    public function renderItem($item, $index)
    {
        if (is_string($item)) {
            $content = $item;
            $caption = null;
            $options = [];
        } elseif (isset($item['content'])) {
            $content = $item['content'];
            $caption = ArrayHelper::getValue($item, 'caption');
            if ($caption !== null) {
                $captionOptions = ArrayHelper::remove($item, 'captionOptions', []);
                Html::addCssClass($captionOptions, ['widget' => 'carousel-caption']);

                $caption = Html::tag('div', $caption, $captionOptions);
            }
            $options = ArrayHelper::getValue($item, 'options', []);
        } else {
            throw new InvalidConfigException('The "content" option is required.');
        }

        Html::addCssClass($options, ['widget' => 'carousel-item']);
        if ($index === 0) {
            Html::addCssClass($options, 'active');
        }

        return Html::tag('div', $content . "\n" . $caption, $options);
    }

    /**
     * @param WidgetCarouselItem $item
     *
     * @return string
     */
    protected function publishItem($item)
    {
        if (!$item->asset_url) {
            $url = \sprintf('%s/%s', $item->base_url,  $item->path);
            $item->updateAttributes([
                'asset_url' => $url
            ]);
        }

        return $item->asset_url;
    }
}
