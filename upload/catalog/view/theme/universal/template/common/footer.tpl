<footer>
  <div class="container">  
    <div class="row">
	<div class="col-sm-3">
	<img class="img-responsive" src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
	<?php echo $welcome; ?>
	</div>
	<div class="col-sm-3 column-contacts">
	<ul>
		<li><i class="fa fa-phone"></i> <?php echo $telephone; ?></li>
		<?php if ($fax) { ?><li><i class="fa fa-phone"></i> <?php echo $fax; ?></li><?php } ?>
		<li><i class="fa fa-envelope"></i> <?php echo $email; ?></li>
		<li class="footer-address"><i class="fa fa-home"></i> <?php echo $address; ?></li>
		<li class="footer-time"><i class="fa fa-clock-o fa-lg"></i></li>
		<li><?php echo $time; ?></li>
		<li><i class="fa fa-share"></i> <a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
	</ul>
	</div>
	<div class="col-sm-2">
      <?php if ($informations) { ?>
	  <div class="btn-group">
	<button class="btn btn-link dropdown-toggle" data-toggle="dropdown">
     <div class="divh5"><?php echo $text_information; ?> <i class="fa fa-caret-down"></i></div>
	 </button>
       <ul class="dropdown-menu">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
        </ul>
	</div>
      <?php } ?>
	  <div class="btn-group">
	  <button class="btn btn-link dropdown-toggle" data-toggle="dropdown">
	  <div class="divh5"><?php echo $text_service; ?> <i class="fa fa-caret-down"></i></div>
      </button>  
		<ul class="dropdown-menu">
          <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
		  <li><a href="<?php echo $abuses; ?>"><?php echo $text_abuses; ?></a></li>
		  <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
		  <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
		  <li><a href="<?php echo $testimonial; ?>"><?php echo $text_testimonial; ?></a></li>
		  <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
        </ul>
      </div>
	  <div class="btn-group">
	  <button class="btn btn-link dropdown-toggle" data-toggle="dropdown">
	  <div class="divh5"><?php echo $text_extra; ?> <i class="fa fa-caret-down"></i></div>
      </button>  
		<ul class="dropdown-menu">
		  <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
		  <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
		  <li><a href="<?php echo $bestseller; ?>"><?php echo $text_bestseller; ?></a></li>
		  <li><a href="<?php echo $mostviewed; ?>"><?php echo $text_mostviewed; ?></a></li>
		  <li><a href="<?php echo $latest; ?>"><?php echo $text_latest; ?></a></li>
        </ul>
      </div>
	  <div class="btn-group">
	  <button class="btn btn-link dropdown-toggle" data-toggle="dropdown">
	  <div class="divh5"><?php echo $text_account; ?> <i class="fa fa-caret-down"></i></div>
      </button>  
		<ul class="dropdown-menu">
	       <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
        </ul>
      </div>
	  </div>
	  <div class="col-sm-4 column-maps">
	<ul>
		<li><?php echo $maps; ?></li>
	</ul>
	  </div>
    </div>
    <hr>
    <p class="powered"><?php echo $powered; ?></p>
	<div id="social">
	   <?php if ($vk) { ?><a target="_blank" href="<?php echo $vk; ?>"><i class="fa fa-vk"></i></a><?php } ?>
	   <?php if ($fb) { ?><a target="_blank" href="<?php echo $fb; ?>"><i class="fa fa-facebook"></i></a><?php } ?>
	   <?php if ($googleplus) { ?><a target="_blank" href="<?php echo $googleplus; ?>"><i class="fa fa-google-plus"></i></a><?php } ?>
	   <?php if ($youtube) { ?><a target="_blank" href="<?php echo $youtube; ?>"><i class="fa fa-youtube"></i></a><?php } ?>
	   <?php if ($twitter) { ?><a target="_blank" href="<?php echo $twitter; ?>"><i class="fa fa-twitter"></i></a><?php } ?>
</div>
  </div>
</footer>
</body></html>