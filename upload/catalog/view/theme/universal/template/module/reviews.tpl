<div class="module_heading"><?php if ($header) {?><div class="box-heading"><?php echo $header; ?></div><?}?></div>
<div class="row product-layout module">
  <div>
  <?php foreach ($reviews as $review) { ?>
  <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
    <div class="product-thumb transition">
	<div class="item">
      <div class="image"><?php echo $review['sticker']; ?><a href="<?php echo $review['prod_href']; ?>"><img src="<?php echo $review['prod_thumb']; ?>" alt="<?php echo $review['prod_name']; ?>" title="<?php echo $review['prod_name']; ?>"/></a></div>
      <div class="caption">
        <div class="name"><a href="<?php echo $review['prod_href']; ?>"><?php echo $review['prod_name']; ?></a></div>
        <p class="mdescription"><?php echo $review['description']; ?> <a href="<?php echo $review['href']?>">...&raquo;</a></p>
        <div class="author"><?php echo $review['author']?></div>
        <div class="rating">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($review['rating'] < $i) { ?>
          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
        </div>
        
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
<div class="col-xs-12"><a class="btn btn-primary btn-lg btn-block" href="<?php echo $link_all_reviews; ?>"><?php echo $text_all_reviews;?></a></div>
</div>