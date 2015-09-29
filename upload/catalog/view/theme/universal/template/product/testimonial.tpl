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
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <div class="row">
        <div class="col-sm-4">
	<?php if (!$single)	 { ?>
		<div id="filter">
		<div class="btn-group">
		<span class="btn btn-default" <?php if ($active == 'all') echo 'class="active"';?>><a href="<?php echo $showall_url;?>"><?php echo $text_rating_all; ?>(<?php echo $total;?>)</a></span>
		<span class="btn btn-default" <?php if ($active == 'good') echo 'class="active"';?>><a href="<?php echo $good;?>"><?php echo $text_rating_good; ?>(<?php echo $total_good;?>)</a></span>
		<span class="btn btn-default" <?php if ($active == 'bad') echo 'class="active"';?>><a href="<?php echo $bad;?>"><?php echo $text_rating_bad; ?>(<?php echo $total_bad;?>)</a></span>
		</div>
		</div>
	<?php } ?>
		  
		  
        </div>
      </div>
      <br />
      <div class="row">  
        <?php foreach ($testimonials as $testimonial) { ?>     
        <div class="product-layout product-list col-xs-12">
          <div class="product-thumb">
            <div class="col-sm-12">
              <div class="name"><?php echo $testimonial['title']; ?></div>
              <p class="description"><?php echo $testimonial['description']; ?></p>
              
              <div class="rating">
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($testimonial['rating'] < $i) { ?>
                <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                <?php } else { ?>
                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                <?php } ?>
                <?php } ?>
				<div class="author"><?php echo $testimonial['name'].' '.$testimonial['city'].' '.$testimonial['date_added']; ?></div>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <!-- <div class="col-sm-6 text-right"><?php //echo $results; ?></div> -->
      </div>
      <div class="buttons">
		<div class="pull-right" align="right"><a class="btn btn-primary" href="<?php echo $write_url;?>" title="<?php echo $write;?>"><span><?php echo $write;?></span></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>