<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb hidden-xs">
    <?php foreach ($breadcrumbs as $i=> $breadcrumb) { ?>
	<?php if($i+1<count($breadcrumbs)) { ?><?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a><?php } else { ?><?php echo $breadcrumb['separator']; ?><?php echo $breadcrumb['text']; ?><?php } ?>
	<?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> showcase-list"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <?php echo $description; ?><?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?> 