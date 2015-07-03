<form id="ocshop-search" class="navbar-form" role="search">
  <div class="input-group">
    <div class="input-group-btn">
      <a class="btn btn-default dropdown-toggle" data-toggle="dropdown" href="#">
        <i class="fa fa-search"></i>
        <span class="caret"></span>
      </a>
      <ul class="dropdown-menu dropdown-menu-left alerts-dropdown">
        <li class="dropdown-header"><?php echo $text_search_options; ?></li>
        <li><a onclick="setOption('catalog', '<?php echo $text_catalog_placeholder; ?>'); return false;"><i class="fa fa-book"></i><span><?php echo $text_catalog; ?></span></a></li>
        <li><a onclick="setOption('customers', '<?php echo $text_customers_placeholder; ?>'); return false;"><i class="fa fa-group"></i><span><?php echo $text_customers; ?></span></a></li>
        <li><a onclick="setOption('orders', '<?php echo $text_orders_placeholder; ?>'); return false;"><i class="fa fa-credit-card"></i><span><?php echo $text_orders; ?></span></a></li>
      </ul>
    </div>
    <input id="ocshop-search-input" type="text" class="form-control" placeholder="<?php echo $text_search_placeholder; ?>" name="query" autocomplete="off" />
    <input id="ocshop-search-option" type="hidden" name="search-option" value="catalog" />
    <div id="loader-search"><img src="view/image/loader-search.gif" alt="" /></div>
  </div>
</form>
<div id="ocshop-search-result"></div>
<script type="text/javascript">
    function setOption(option, text) {
        jQuery('#ocshop-search-option').val(option);
        jQuery('#ocshop-search-input').attr('placeholder', text);
    }

    jQuery('#ocshop-search-input').keyup(function(){
        var option = jQuery('#ocshop-search-option').val();
        var length = 3;

        if(option == 'orders') {
            length = 1;
        }

        if(this.value.length < length) {
            return false;
        }

        if(jQuery.support.leadingWhitespace == false) {
              return false;
        }

        jQuery('#loader-search').css('display', 'block');

        jQuery.ajax({
            type: 'get',
            url: '<?php echo html_entity_decode($search_link); ?>',
            data: jQuery('#ocshop-search').serialize(),
            dataType: 'json',
            success:function(json){
                jQuery('#ocshop-search-result').css('display', 'block');
                jQuery('#loader-search').css('display', 'none');

                if(json['error']) {
                    jQuery('#ocshop-search-result').html(json['error'])
                    return;
                }

                jQuery('#ocshop-search-result').html(json['result'])
            }
        });
    });

    jQuery(document).mouseup(function (e) {
        var container = jQuery('#ocshop-search-result');

        if (!container.is(e.target) && container.has(e.target).length === 0) {
            container.hide();
        }
    });

    jQuery('#ocshop-search').submit(function(e) {
        e.preventDefault();
    });
</script>
