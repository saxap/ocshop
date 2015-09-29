<div id="cart" class="btn-group btn-block">
	<?php if ($products) { ?>
	<!-- Button trigger modal -->
	<button type="button" class="btn btn-inverse btn-block btn-lg dropdown-toggle" data-toggle="modal" data-target="#cartModal"><i class="fa fa-shopping-cart"></i> <span id="cart-total"><?php echo $text_items; ?></span></button>
   <!-- Modal window -->
   					<div class="modal" id="cartModal" tabindex="-1" role="dialog" aria-labelledby="cartModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
						<div class="modal-content">
						  <div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<div class="modal-title" id="myModalLabel"><?php echo $heading_title; ?></div>
						  </div>
						  <div class="modal-body">
	<div class="table-responsive height-cart">
      <table class="table table-striped table-cart">
        <?php foreach ($products as $product) { ?>
        <tr>
          <td class="text-center"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
            <?php } ?></td>
          <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            <?php if ($product['option']) { ?>
            <br />
            <?php foreach ($product['option'] as $option) { ?>
            - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small><br />
            <?php } ?>
            <?php } ?></td>
          <td class="text-right">x <?php echo $product['quantity']; ?></td>
          <td class="text-right"><?php echo $product['total']; ?></td>
          <td class="text-center"><button type="button"  data-dismiss="modal" aria-hidden="true" onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $product['key']; ?>' : $('#cart').load('index.php?route=module/cart&remove=<?php echo $product['key']; ?>' + ' #cart > *');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
        </tr>
        <?php } ?>
      </table>
	  </div>
      <div>
        <table class="table table-bordered">
          <?php foreach ($totals as $total) { ?>
          <tr>
            <td class="text-right"><strong><?php echo $total['title']; ?></strong></td>
            <td class="text-right"><?php echo $total['text']; ?></td>
          </tr>
          <?php } ?>
        </table>
        <p class="text-right"><button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-repeat"></i> <?php echo $text_continue_shopping; ?></button>&nbsp;&nbsp;&nbsp;<a class="btn btn-primary" href="<?php echo $checkout; ?>"><strong><i class="fa fa-share"></i> <?php echo $text_checkout; ?></strong></a></p>
      </div>
	  </div>
						  
						</div>
					  </div>
					</div>
    <?php } else { ?>
	<button type="button" class="btn btn-inverse btn-block btn-lg dropdown-toggle" data-toggle="modal" data-target="#cartModalempty"><i class="fa fa-shopping-cart"></i> <span id="cart-total"><?php echo $text_items; ?></span></button>
    <div class="modal" id="cartModalempty" tabindex="-1" role="dialog" aria-labelledby="cartModalLabel" aria-hidden="true">
	<div class="modal-dialog bs-modal-lg" style="width:400px;">
	<div class="modal-content">
    <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    <div class="modal-title" id="myModalLabel"><?php echo $heading_title; ?></div>
    </div>
    <div class="modal-body">
	<p class="text-center"><?php echo $text_empty; ?></p>
    </div>
    <div class="modal-footer footer-cart">
    <button type="button" class="btn btn-default" data-dismiss="modal"><i class="fa fa-repeat"></i> <?php echo $text_continue_shopping; ?></button>
    </div>
    </div>
	</div>
    </div>
	<?php } ?>
</div>