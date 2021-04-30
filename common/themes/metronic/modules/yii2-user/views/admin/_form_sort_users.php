<?php

use yii\helpers\Html;
use dominus77\sweetalert2\assets\SweetAlert2Asset;
use yii\widgets\Pjax;

SweetAlert2Asset::register($this);

$this->title = 'จัดกลุ่มบุคลากร';
$this->params['breadcrumbs'][] = $this->title;

$style = <<<CSS
.sortable {
        width: 100%;
        /* max-width: 800px; */
        margin: 20px auto;
        padding: 5px 10px;
        list-style-type: none;
        text-align: center;
        transition: ease 0.2s;
      }

      .sortable li {
        display: inline-block;
        position: relative;
        width: 20%;
        height: 200px;
        margin: 10px;
        margin-bottom: 20px;
        padding: 5px;
        background: #ffffff;
        /* box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1), 0 3px 3px rgba(0, 0, 0, 0.12); */
        box-shadow: 0 0 30px rgba(214, 215, 216, 0.6);
      }

      .sortable li:hover {
        background: #f5f5f5;
      }

      .sortable li h2 {
        position: absolute;
        top: 50%;
        left: 50%;
        margin: 0;
        -webkit-transform: translate(-50%, -50%);
        -ms-transform: translate(-50%, -50%);
        -o-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
        color: #78909c;
      }

/*--------------------------------------------------------------
# Our Team
--------------------------------------------------------------*/
.team {
  background: #fff;
  padding: 60px 0 30px 0;
}

.team .member {
  text-align: center;
  margin-bottom: 80px;
  position: relative;
}

.team .member .pic {
  border-radius: 4px;
  overflow: hidden;
}

.team .member img {
  transition: all ease-in-out 0.4s;
}

.team .member:hover img {
  transform: scale(1.1);
}

.team .member .member-info {
  position: absolute;
  /* bottom: -48px;
  left: 20px;
  right: 20px; */
  right: 0;
  left: 0;
  background: linear-gradient(360deg, #5c768d 0%, rgba(92, 118, 141, 0.9) 35%, rgba(140, 167, 191, 0.8) 100%);
  padding: 15px 0;
  border-radius: 4px;
}

.team .member h4 {
  font-weight: 700;
  margin-bottom: 10px;
  font-size: 16px;
  color: #fff;
  position: relative;
  padding-bottom: 10px;
}

.team .member h4::after {
  content: '';
  position: absolute;
  display: block;
  width: 50px;
  height: 1px;
  background: #fff;
  bottom: 0;
  left: calc(50% - 25px);
}

.team .member span {
  font-style: italic;
  display: block;
  font-size: 13px;
  color: #fff;
}

.team .member .social {
  margin-top: 15px;
}

.team .member .social a {
  transition: color 0.3s;
  color: #fff;
}

.team .member .social a:hover {
  color: #9eccf4;
}

.team .member .social i {
  font-size: 16px;
  margin: 0 2px;
}
.team .member .pic img {
    width:100px;
}

@media (max-width: 992px) {
  .team .member {
    margin-bottom: 100px;
  }
}
CSS;
$this->registerCss($style);
// $this->registerCssFile("https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css", [
// ]);
?>
<div class="card card-custom">
  <div class="card-header flex-wrap border-0 pt-6 pb-0">
    <div class="card-title">
      <h3 class="card-label">
        <i class="fas fa-users-cog"></i>
        <?= Html::encode($this->title) ?>
        <span class="text-muted pt-2 font-size-sm d-block"></span>
      </h3>
    </div>
    <div class="card-toolbar">
      <!--begin::Button-->
      <?= Html::button('บันทึก', ['class' => 'btn btn-primary font-weight-bolder', 'id' => 'btn-save']) ?>
      <!--end::Button-->
    </div>
  </div>
  <div class="card-body team">
    <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
      <?php foreach ($usertypes as $key => $value) { ?>
        <li class="nav-item" role="presentation">
          <a class="nav-link <?= $key == 0 ?  'active' : '' ?>" id="pills-home-tab-<?= $key ?>" data-toggle="pill" href="#pills-tab-<?= $key ?>" role="tab" aria-controls="<?= 'pills-home-tab-' . $key ?>" aria-selected="true">
            <?php echo $value['usertype'] ?>
          </a>
        </li>
      <?php } ?>
    </ul>
    <?php
    Pjax::begin([
      'id' => 'pjax-user-order'
    ]); ?>
    <div class="tab-content" id="pills-tabContent">
      <div class="tab-pane fade active show" id="pills-tab-0" role="tabpanel" aria-labelledby="pills-home-tab-0">
        <ul class="sortable" id="sortable1">
          <?php foreach ($profiles2 as $key => $profile) { ?>
            <li id="<?= $profile['user_id'] ?>">
              <div class="member">
                <div class="pic"><img src="<?= $profile->pictureUrl ?>" class="img-fluid" alt=""></div>
                <div class="member-info mt-1">
                  <h4><?= $profile->fullname ?></h4>
                  <span><?= $profile->position ? $profile->position->user_position : 'ไม่พบข้อมูลตำแหน่งงาน' ?></span>
                </div>
              </div>
            </li>
          <?php } ?>
        </ul>
      </div>
      <div class="tab-pane fade " id="pills-tab-1" role="tabpanel" aria-labelledby="pills-home-tab-1">
        <ul class="sortable" id="sortable2">
          <?php foreach ($profiles3 as $key => $profile) { ?>
            <li id="<?= $profile['user_id'] ?>">
              <div class="member">
                <div class="pic"><img src="<?= $profile->pictureUrl ?>" class="img-fluid" alt=""></div>
                <div class="member-info mt-1">
                  <h4><?= $profile->fullname ?></h4>
                  <span><?= $profile->position ? $profile->position->user_position : 'ไม่พบข้อมูลตำแหน่งงาน' ?></span>
                </div>
              </div>
            </li>
          <?php } ?>
        </ul>
      </div>
    </div>
    <?php Pjax::end(); ?>

  </div>
</div>

<?php
$this->registerJsFile(
  'https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js',
  ['depends' => [\metronic\assets\MetronicAsset::className()]]
);
$script = <<<JS
$("#pjax-user-order").on("pjax:success", function() {
  init_handlers(); //reactivate links in grid after pjax update
});

function init_handlers(){
$("#pills-tab").tab();
  $("#sortable1").sortable({}).disableSelection();
  $("#sortable2").sortable({}).disableSelection();
}
init_handlers()

$('#btn-save').on('click', function(){
      var idsInOrder1 = $("#sortable1").sortable("toArray");
      var idsInOrder2 = $("#sortable2").sortable("toArray");
      $.ajax({
        method: "POST",
        url: "/admin/user/admin/sort-users",
        dataType: "json",
        data:{
          idsInOrder1: idsInOrder1,
          idsInOrder2: idsInOrder2,
        },
        success: function(resp){
          $.pjax.reload({container: '#pjax-user-order'});
          Swal.fire({
            icon: 'success',
            title: 'บันทึกสำเร็จ',
          })
        },
        error: function( jqXHR,  textStatus,  errorThrown){
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: errorThrown,
          })
        },
      });
  });
JS;
$this->registerJs($script);

?>