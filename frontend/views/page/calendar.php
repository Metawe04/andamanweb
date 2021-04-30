<?php
$this->title = $page->seo('title', $page->model->title);
$this->registerMetaTag([
  'name' => 'description',
  'content' => $page->seo('description', $page->model->title)
]);

$this->registerCssFile("@web/static/fullcalendar/core/main.min.css", [
  'depends' => [\mamba\assets\MambaAsset::className()],
]);
$this->registerCssFile("@web/static/fullcalendar/daygrid/main.min.css", [
  'depends' => [\mamba\assets\MambaAsset::className()],
]);
$this->registerCssFile("@web/static/fullcalendar/timegrid/main.min.css", [
  'depends' => [\mamba\assets\MambaAsset::className()],
]);
$this->registerCssFile("@web/static/fullcalendar/list/main.min.css", [
  'depends' => [\mamba\assets\MambaAsset::className()],
]);
$this->registerCssFile("@web/css/calendar.min.css", [
  'depends' => [\mamba\assets\MambaAsset::className()],
]);
$this->registerCss(<<<CSS
.fc-day-grid-event .fc-content {
  white-space: normal !important;
  overflow: hidden;
}
.fc-title p,
.fc-list-item-title p {
  padding: 0;
  margin: 0;
}
CSS
);
?>
<section id="contact" class="contact">
  <div class="container">

    <div class="section-title">
      <h2>
        <?= $this->title ?>
      </h2>
    </div>

    <div class="row">
      <div class="col-md-12"  data-aos="fade-up">
        <div id='calendar'></div>
      </div>
      <div class="col-md-12">
      <div id="share" style="font-size: 12px;"></div>
      </div>
    </div>

  </div>
</section>

<?php
$this->registerJsFile(
  '@web/static/fullcalendar/core/main.min.js',
  ['depends' => [\mamba\assets\MambaAsset::className()]]
);
$this->registerJsFile(
  '@web/static/fullcalendar/daygrid/main.min.js',
  ['depends' => [\mamba\assets\MambaAsset::className()]]
);
$this->registerJsFile(
  '@web/static/fullcalendar/timegrid/main.min.js',
  ['depends' => [\mamba\assets\MambaAsset::className()]]
);
$this->registerJsFile(
  '@web/static/fullcalendar/list/main.min.js',
  ['depends' => [\mamba\assets\MambaAsset::className()]]
);
$this->registerJsFile(
  '@web/static/fullcalendar/interaction/main.min.js',
  ['depends' => [\mamba\assets\MambaAsset::className()]]
);
$this->registerJsFile(
  '@web/static/fullcalendar/core/locales/th.js',
  ['depends' => [\mamba\assets\MambaAsset::className()]]
);
$this->registerJs(<<<JS
var calendarEl = document.getElementById('calendar');

var calendar = new FullCalendar.Calendar(calendarEl, {
  plugins: [ 'dayGrid', 'timeGrid', 'list', 'interaction' ],
  locale: 'th',
  header: {
    left: 'prev,next today',
    center: 'title',
    right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
  },
  timeFormat: "HH:mm",
  displayEventEnd: true,
  eventSources: [
    {
      url: '/calendar/events',
      method: 'GET',
      extraParams: {},
      failure: function(err) {
        Swal.fire({
          icon: 'error',
          title: 'Oops...',
          text: err.message
        })
      },
    }
  ]
});

calendar.render();
JS
);
?>