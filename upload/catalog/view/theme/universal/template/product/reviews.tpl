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
    <div id="content" class="<?php echo $class; ?> showcase-list">
      <h1><?php echo $heading_title; ?></h1>
	  <?php echo $content_top; ?>
      <?php if ($reviews) { ?>
      <div class="row">
        <?php foreach ($reviews as $review) { ?>
        <div class="product-layout product-list col-xs-12">
          <div class="product-thumb">
            <div class="image"><a href="<?php echo $review['prod_href']; ?>"><img src="<?php echo $review['prod_thumb']; ?>" alt="<?php echo $review['prod_name']; ?>" title="<?php echo $review['prod_name']; ?>" class="img-responsive" /></a></div>
            <div>
              <div class="caption">
                <div class="name"><a href="<?php echo $review['prod_href']; ?>"><?php echo $review['prod_name']; ?></a></div>
                <p class="description"><?php echo $review['description']; ?></p>
                
                <div class="rating">
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($review['rating'] < $i) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } ?>
                  <?php } ?>
                </div>
               <div><?php echo $review["date_added"];?><span style="font-weight:bold; margin-left:10px;"><?php echo $review["author"];?></span></div>
              </div>
              <div class="button-group">
				<button type="button" onclick="window.location=('<?php echo $review['prod_href']; ?>');"><i class="fa fa-comment"></i> <?php echo $text_more;?></button>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="addToWishList('<?php echo $review['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                <button type="button" data-toggle="tooltip" title="<?php echo $button_compare; ?>" onclick="addToCompare('<?php echo $review['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
      </div>
      <?php } ?>
      <?php if (!$reviews && !$reviews) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>