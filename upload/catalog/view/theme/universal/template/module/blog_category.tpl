<div class="list-group">
  <?php foreach ($categories as $news) { ?>
  <?php if ($news['news_id'] == $news_id) { ?>
  <a href="<?php echo $news['href']; ?>" class="list-group-item active"><?php echo $news['name']; ?></a>
  <?php if ($news['children']) { ?>
  <?php foreach ($news['children'] as $child) { ?>
  <?php if ($child['news_id'] == $child_id) { ?>
  <a href="<?php echo $child['href']; ?>" class="list-group-item active">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
  <?php } else { ?>
  <a href="<?php echo $child['href']; ?>" class="list-group-item">&nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?></a>
  <?php } ?>
  <?php } ?>
  <?php } ?>
  <?php } else { ?>
  <a href="<?php echo $news['href']; ?>" class="list-group-item"><?php echo $news['name']; ?></a>
  <?php } ?>
  <?php } ?>
</div>
