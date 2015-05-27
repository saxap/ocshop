<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <style>
  body {font-size: 14px;}
  p {margin-left: 20px;text-indent: 30px;}
  .content > img {width: 100%;}
  </style>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/log.png" alt="" /> <?php echo $heading_title; ?></h1>
    </div>
    <div class="content">
	  <p>Прежде чем настраивать SMS уведомления о новых заказах необходимо зарегистрироваться в сервисе <a href="http://smsc.ru/?ppocshop" target="_blank">smsc.ru</a></p>
	  <img src="view/image/howtosms/setting_tab_sms.png" width="1180" />
	  <p>В том случае если у вас остались вопросы задавайте их на нашем форуме.</p>
    </div>
  </div>
</div>
<?php echo $footer; ?>