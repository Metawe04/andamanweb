<?php

namespace metronic\widgets\bootstrap4;

use yii\bootstrap4\Carousel as BaseCarousel;

class Carousel extends BaseCarousel
{
    public $controls = [
        '<span class="carousel-control-prev-icon icofont-rounded-left" aria-hidden="true"></span><span class="sr-only">Previous</span>',
        '<span class="carousel-control-next-icon icofont-rounded-right" aria-hidden="true"></span><span class="sr-only">Next</span>'
    ];
}
