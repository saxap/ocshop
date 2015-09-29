<div class="module_heading"><?php echo $heading_title; ?></div>
<div class="row product-layout module">
  <div>
  <?php foreach ($articles as $article) { ?>
  <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
    <div class="product-thumb transition">
	<div class="item">
      <div class="image"><a href="<?php echo $article['href']; ?>"><img src="<?php echo $article['thumb']; ?>" alt="<?php echo $article['name']; ?>" title="<?php echo $article['name']; ?>" class="img-responsive" /></a></div>
      <div class="caption">
        <div class="name"><a href="<?php echo $article['href']; ?>"><?php echo $article['name']; ?></a></div>
        <p class="mdescription"><?php echo $article['description']; ?></p>
        
        <div class="rating">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($article['rating'] < $i) { ?>
          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
        </div>
      </div>
      <div class="button-group">
        <button type="button" onclick="location.href = ('<?php echo $article['href']; ?>');"><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $button_more; ?></span></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $article["date_added"];?>" "><i class="fa fa-clock-o"></i></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $text_views; ?> <?php echo $article["viewed"];?>" "><i class="fa fa-eye"></i></button>
     </div>
    </div>
  </div>
   </div>
  <?php } ?>
</div>
</div>