<?php

use common\api\text\Text;
use yii\helpers\Html;
?>
<!-- ======= Footer ======= -->
<footer id="footer">
  <div class="footer-top">
    <div class="container">
      <div class="row">

        <div class="col-lg-6 footer-info">
          <h3 class="no-margin">Andaman Pattana</h3>
          <p>
              
          </p>
          <p>
            22/87 ซอยวิภาวดีรังสิต 33 แขวง สนามบิน เขตดอนเมือง กรุงเทพมหานคร 10210<br><br>
            
          </p>
          <div class="social-links mt-3">
            <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
            <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
            <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
            <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
            <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
          </div>
        </div>


        <div class="col-lg-6  footer-links">
          <h4>ติดต่อ</h4>
            <strong>โทรศัพท์:</strong> <?= Html::a(Yii::$app->params['fmTel'], 'tel:025613482', ['class' => 'text-white']) ?><br>
           
            <strong>อีเมล:</strong> <?= Html::mailto(Yii::$app->params['fmEmail'], '', ['class' => 'text-white']) ?><br>
        </div>


        <!-- <div class="col-lg-2 col-md-6 footer-links">
          <h4>หน่วยงานภายในคณะ</h4>
          <ul>
            <li><i class="bx bx-chevron-right"></i> <a href="#">สำนักงานเลขานุการ</a></li>
            <li><i class="bx bx-chevron-right"></i> <a href="#">ภาควิชากีฏวิทยา</a></li>
            <li><i class="bx bx-chevron-right"></i> <a href="#">ภาควิชาเกษตรกลวิธาน</a></li>
            <li><i class="bx bx-chevron-right"></i> <a href="#">ภาควิชาคหกรรมศาสตร์</a></li>
            <li><i class="bx bx-chevron-right"></i> <a href="#">ภาควิชาปฐพีวิทยา</a></li>
          </ul>
        </div>

        <div class="col-lg-3 col-md-6 footer-links">
          <h4>คณะ</h4>
          <ul>
            <li><i class="bx bx-chevron-right"></i> <a href="#">คณะครุศาสตร์</a></li>
            <li><i class="bx bx-chevron-right"></i> <a href="#">คณะวิทยาศาสตร์และเทคโนโลยี</a></li>
            <li><i class="bx bx-chevron-right"></i> <a href="#">คณะวิทยาการจัดการ</a></li>
            <li><i class="bx bx-chevron-right"></i> <a href="#">คณะมนุษยศาสตร์และสังคมศาสตร์</a></li>
            <li><i class="bx bx-chevron-right"></i> <a href="#">คณะพยาบาลศาสตร์</a></li>
          </ul>
        </div>

        <div class="col-lg-4 col-md-6 footer-newsletter">
          <h4>หน่วยงานที่รับผิดชอบ</h4>
          <p>
          ภาควิชาเกษตรกลวิธาน . คณะเกษตร มหาวิทยาลัยเกษตรศาสตร์
          </p>
        </div> -->

      </div>
    </div>
  </div>

  <div class="container">
    <div class="copyright">
      &copy; Copyright <strong><span>
          Andaman DEV
        <!-- </span></strong>. <?= Text::get('footer-title') ?> -->
    </div>
    <div class="credits">
      Designed by
      <a href="https://github.com/tanakorncode">
        Andaman Pattana.
      </a>
    </div>
  </div>
</footer><!-- End Footer -->

<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>


<!-- <h2>หลักสูตร วท.บ-เทคโนโลยีระบบเกษตร</h2><p>Bimply dummy text of the printing and typesetting istryrem Ipsum has been the industry's standard dummy text ever when an unknown printer.</p> -->