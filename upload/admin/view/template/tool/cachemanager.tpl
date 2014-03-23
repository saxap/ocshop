<?php echo $header; ?>
<div id="content">
<div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
  <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
</div>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>
<div class="box">
  <div class="left"></div>
  <div class="right"></div>
  <div class="heading">
	<h1><img src="view/image/category.png" alt="" /> <?php echo $heading_title; ?></h1>
  </div>
  <div class="content">
      <table class="list">
        <thead>
          <tr>
            <td class="left"><?php echo $column_description; ?></td>
			<td class="left"><?php echo $column_action;?></td>
   		</tr>
        </thead>
        <tbody>
          <tr>
            <td class="left"><?php echo $image_description; ?></td>
			<td class="left"><div class="buttons"><a href="<?php echo $clearcache; ?>" class="button"><?php echo $button_clearcache; ?></a></div></td>
   		</tr>
		<tr>
            <td class="left"><?php echo $system_description; ?></td>
			<td class="left"><div class="buttons"><a href="<?php echo $clearsystemcache; ?>" class="button"><?php echo $button_clearsystemcache; ?></a></div></td>
   		</tr>
		<tr>
            <td class="left"><?php echo $vqmod_description; ?></td>
			<td class="left"><div class="buttons"><a href="<?php echo $clearvqmodcache; ?>" class="button"><?php echo $button_clearvqmodcache; ?></a></div></td>
   		</tr>
        </tbody>
      </table>
  </div>
</div>
</div>
<?php echo $footer; ?>