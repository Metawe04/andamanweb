<?php

/*
 * This file is part of the Dektrium project.
 *
 * (c) Dektrium project <http://github.com/dektrium>
 *
 * For the full copyright and license information, please view the LICENSE.md
 * file that was distributed with this source code.
 */

/**
 * @var yii\widgets\ActiveForm $form
 * @var dektrium\user\models\User $user
 */
$this->registerCss(<<<CSS
.form-group {
  margin-bottom: 1rem;
}
CSS
);
?>
<div class="row">
  <label class="col-xl-3"></label>
  <div class="col-lg-9 col-xl-6">
    <h5 class="font-weight-bold mb-6"></h5>
  </div>
</div>
<div class="form-group row">
  <label class="col-xl-3 col-lg-3 col-form-label text-right">
    <?= $user->getAttributeLabel('email') ?>
  </label>
  <div class="col-lg-9 col-xl-6">
    <?= $form->field($user, 'email')->textInput([
      'maxlength' => 255,
    ])->label(false) ?>
  </div>
</div>

<div class="form-group row">
  <label class="col-xl-3 col-lg-3 col-form-label text-right">
    <?= $user->getAttributeLabel('username') ?>
  </label>
  <div class="col-lg-9 col-xl-6">
    <?= $form->field($user, 'username')->textInput([
      'maxlength' => 255,
    ])->label(false) ?>
  </div>
</div>

<div class="form-group row">
  <label class="col-xl-3 col-lg-3 col-form-label text-right">
    <?= $user->getAttributeLabel('password') ?>
  </label>
  <div class="col-lg-9 col-xl-6">
    <?= $form->field($user, 'password')->passwordInput([
    ])->label(false) ?>
  </div>
</div>