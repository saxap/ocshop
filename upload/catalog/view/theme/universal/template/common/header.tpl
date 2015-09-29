<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($robots) { ?>
<meta name="robots" content="<?php echo $robots; ?>" />
<?php } ?>
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/jquery/jquery-2.0.3.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" /><link rel="stylesheet" type="text/css" href="catalog/view/theme/universal/stylesheet/owl.carousel.css">
<script type="text/javascript" src="catalog/view/javascript/jquery/owl.carousel.min.js"></script><link href="catalog/view/theme/universal/stylesheet/stylesheet.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<style>
.letter {float:left; width:20px;}
.letters {width:80%; overflow:hidden; display:inline-block; vertical-align:top; margin-right:20px; margin-bottom:5px;}
.mlist {position:absolute; z-index:999}
.visible {display:none;}
.mlist ul {margin:0;padding:0;list-style:none;border:1px solid #ddd;padding:4px;background:white;}
.mlist ul li{margin:5px}
</style>
<script src="catalog/view/javascript/common20.js" type="text/javascript"></script>
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<!-- <body class="<?php //echo $class; ?>"> -->
<body>
<div class="headerbg">
<nav id="top">
  <div class="container">
    <div class="pull-left"><?php echo $currency; ?></div>
    <div class="pull-left"><?php echo $language; ?></div>
	<?php if ($this->config->get('config_menu_brands')) { ?>
	<div class="pull-left">
	<div class="btn-group">
	<button class="btn btn-link dropdown-toggle" data-toggle="dropdown">
	<i class="fa fa-certificate"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_brands; ?></span> <i class="fa fa-caret-down"></i>
	</button>
	<ul class="dropdown-menu">
	<?php $manufacturer = array_slice($manufacturer , 0, 20); ?>
	<?php foreach($manufacturer as $manufacturers){ ?>
	<li><a href="<?php echo $manufacturers['href']; ?>"><?php echo $manufacturers['name']; ?></a></li>
	<?php } ?>
	<li><a href="<?php echo $brands; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $text_brands; ?></a></li>
	</ul>
	</div>
	</div>
	<?php } ?>
	<?php if ($this->config->get('config_blog_header_menu')) { ?>
	<div id="top-links-left" class="pull-left"><a href="<?php echo $blog; ?>"><i class="fa fa-book"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_blog; ?></span></a></div>
	<?php } ?>
    <div id="top-links" class="pull-right"><a href="tel:<?php echo $telephone; ?>"><span class="hidden-lg"><i class="fa fa-phone"></i></span></a> <a href="<?php echo $account; ?>"><i class="fa fa-user"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_account; ?></span></a> <a href="<?php echo $wishlist; ?>" id="wishlist-total"><i class="fa fa-heart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_wishlist; ?></span></a> <a href="<?php echo $shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_shopping_cart; ?></span></a> <a href="<?php echo $checkout; ?>"><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span></a></div>
  </div>
</nav>
<header>
  <div class="container">
    <div class="row">
      <div class="col-sm-2">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div class="col-sm-4"><?php echo $search; ?></div>
	  <div class="col-sm-3"><span class="phone hidden-xs hidden-sm hidden-md"><i class="fa fa-phone fa-2x"></i> <?php echo $telephone; ?> <?php if ($fax) { ?>, <?php echo $fax; ?><?php } ?></span></div>
      <div class="col-sm-3"><?php echo $cart; ?></div>
    </div>
  </div>
</header>
<?php if ($categories) { ?>
<div class="container">
  <nav id="menu" class="navbar">
    <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
      <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
    </div>
    <div class="collapse navbar-collapse navbar-ex1-collapse">
      <ul class="nav navbar-nav">
        <?php foreach ($categories as $category) { ?>
        <?php if ($category['children']) { ?>
        <li class="dropdown">
		<?php if ($category['active']) { ?>
		<a href="<?php echo $category['href']; ?>" class="dropdown-toggle active" data-toggle="dropdown"><?php echo $category['name']; ?></a>
		<?php } else { ?>
		<a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
		<?php } ?>
          <div class="dropdown-menu">
            <div class="dropdown-inner">
              <?php for ($i = 0; $i < count($category['children']);) { ?>
        <ul class="list-unstyled">
          <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
          <?php for (; $i < $j; $i++) { ?>
          <?php if (isset($category['children'][$i])) { ?>
          <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a>
          <?php if($category['children'][$i]['subchildren']) { ?>
          <?php foreach ($category['children'][$i]['subchildren'] as $child) { ?>
          <li><a href="<?php echo $child['href']; ?>"> &raquo; <?php echo $child['name']; ?></a></li>
          <?php } ?>
          <?php } ?>
          </li>
          <?php } ?>
          <?php } ?>
        </ul>
        <?php } ?>
            </div>
            <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
        </li>
        <?php } else { ?>
        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
        <?php } ?>
		<?php if ($this->config->get('config_menu_special')) { ?>
	<li class="dropdown"><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
	<?php } ?>
	<?php if ($this->config->get('config_menu_latest')) { ?>
	<li class="dropdown"><a href="<?php echo $latest; ?>"><?php echo $text_latest; ?></a></li>
	<?php } ?>
      </ul>
    </div>
  </nav>
</div>
<?php } ?>
</div>