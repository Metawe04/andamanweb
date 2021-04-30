<div class="news-box">
    <!-- ชื่องานวิจัย -->
    <h3 class="title-default-left-bold">
        <a href="#">
            <?php echo $model['research_name'] ?>
        </a>
    </h3>
    <ul class="title-bar-high news-comments">
        <li><a href="#"><i class="fa fa-user" aria-hidden="true"></i><span>ผู้วิจัย</span> <?php echo $model->authorResearch ?></a></li>
        <!-- ประเภทงานวิจัย -->
        <li><a href="#"><i class="fa fa-tags" aria-hidden="true"></i><?php echo $model->researchTypeWork->research_type_work_name ?></a></a></li>

    </ul>
    <p style="color: #91979e;">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <?php echo $model['research_detail'] ?>
    </p>
    <?php echo  yii\helpers\Html::a('<i class="far fa-hand-point-right"> </i> อ่านเพิ่มเติม...', ['/research/view', 'id' => $model['research_id']], ['class' => 'default-big-btn', 'data-pjax' => 0]) ?>

</div>