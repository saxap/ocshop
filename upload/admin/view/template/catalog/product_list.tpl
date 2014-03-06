<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/product.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a href="<?php echo $insert; ?>" class="button"><?php echo $button_insert; ?></a><a onclick="$('#form').attr('action', '<?php echo $copy; ?>'); $('#form').submit();" class="button"><?php echo $button_copy; ?></a><a onclick="$('form').submit();" class="button"><?php echo $button_delete; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="list">
          <thead>
            <tr>
              <td width="1" style="text-align: center;"><input type="checkbox" onclick="$('input[name*=\'selected\']').attr('checked', this.checked);" /></td>
              <td class="center"><?php echo $column_image; ?></td>
              <td class="left"><?php if ($sort == 'pd.name') { ?>
                <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'p.model') { ?>
                <a href="<?php echo $sort_model; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_model; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_model; ?>"><?php echo $column_model; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'p.price') { ?>
                <a href="<?php echo $sort_price; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_price; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_price; ?>"><?php echo $column_price; ?></a>
                <?php } ?></td>
              <td class="right"><?php if ($sort == 'p.quantity') { ?>
                <a href="<?php echo $sort_quantity; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_quantity; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_quantity; ?>"><?php echo $column_quantity; ?></a>
                <?php } ?></td>
              <td class="left"><?php if ($sort == 'p.status') { ?>
                <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
                <?php } else { ?>
                <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
                <?php } ?></td>
              <td class="right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <tr class="filter">
              <td></td>
              <td></td>
              <td><input type="text" name="filter_name" value="<?php echo $filter_name; ?>" /></td>
              <td><input type="text" name="filter_model" value="<?php echo $filter_model; ?>" /></td>
              <td align="left"><input type="text" name="filter_price" value="<?php echo $filter_price; ?>" size="8"/></td>
              <td align="right"><input type="text" name="filter_quantity" value="<?php echo $filter_quantity; ?>" style="text-align: right;" /></td>
              <td><select name="filter_status">
                  <option value="*"></option>
                  <?php if ($filter_status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <?php } ?>
                  <?php if (!is_null($filter_status) && !$filter_status) { ?>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
              <td align="right"><a onclick="filter();" class="button"><?php echo $button_filter; ?></a></td>
            </tr>
            <?php if ($products) { ?>
            <?php foreach ($products as $product) { ?>
            <tr>
              <td style="text-align: center;"><?php if ($product['selected']) { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>" />
                <?php } ?></td>
              <td class="center"><img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" style="padding: 1px; border: 1px solid #DDDDDD;" /></td>
              <td class="left"><div id="<?php echo $product['product_id']; ?>" class="inlineEditn"><?php echo $product['name']; ?></div></td>
              <td class="left"><div id="<?php echo $product['product_id']; ?>" class="inlineEditm"><?php echo $product['model']; ?></div></td>
              <td class="left"><?php if ($product['special']) { ?>
                <span style="text-decoration: line-through;"><div id="<?php echo $product['product_id']; ?>" class="inlineEdit"><?php echo $product['price']; ?></div></span><br/>
                <span style="color: #b00;"><?php echo $product['special']; ?></span>
                <?php } else { ?>
                <div id="<?php echo $product['product_id']; ?>" class="inlineEdit"><?php echo $product['price']; ?></div>
                <?php } ?></td>
              <td class="right"><?php if ($product['quantity'] <= 0) { ?>
                <span style="color: #FF0000;"><div id="<?php echo $product['product_id']; ?>" class="inlineEditq"><?php echo $product['quantity']; ?></div></span>
                <?php } elseif ($product['quantity'] <= 5) { ?>
                <span style="color: #FFA500;"><div id="<?php echo $product['product_id']; ?>" class="inlineEditq"><?php echo $product['quantity']; ?></div></span>
                <?php } else { ?>
                <span style="color: #008000;"><div id="<?php echo $product['product_id']; ?>" class="inlineEditq"><?php echo $product['quantity']; ?></div></span>
                <?php } ?>
			  </td>
              <td class="left"><label><input type="checkbox" name="status" value="<?php echo $product['product_id']; ?>" <?php echo ($product['status'] == $text_enabled ? 'checked="checked"' : ''); ?> /><span><?php echo $product['status']; ?></span></label></td>
              <td class="right"><?php foreach ($product['action'] as $action) { ?>
                [ <a href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a> ]
                <?php } ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="center" colspan="8"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </form>
      <div class="pagination"><?php echo $pagination; ?></div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
function filter() {
	url = 'index.php?route=catalog/product&token=<?php echo $token; ?>';
	
	var filter_name = $('input[name=\'filter_name\']').attr('value');
	
	if (filter_name) {
		url += '&filter_name=' + encodeURIComponent(filter_name);
	}
	
	var filter_model = $('input[name=\'filter_model\']').attr('value');
	
	if (filter_model) {
		url += '&filter_model=' + encodeURIComponent(filter_model);
	}
	
	var filter_price = $('input[name=\'filter_price\']').attr('value');
	
	if (filter_price) {
		url += '&filter_price=' + encodeURIComponent(filter_price);
	}
	
	var filter_quantity = $('input[name=\'filter_quantity\']').attr('value');
	
	if (filter_quantity) {
		url += '&filter_quantity=' + encodeURIComponent(filter_quantity);
	}
	
	var filter_status = $('select[name=\'filter_status\']').attr('value');
	
	if (filter_status != '*') {
		url += '&filter_status=' + encodeURIComponent(filter_status);
	}	

	location = url;
}
//--></script> 
<script type="text/javascript"><!--
$('#form input').keydown(function(e) {
	if (e.keyCode == 13) {
		filter();
	}
});
//--></script> 
<script type="text/javascript"><!--
$('input[name=\'filter_name\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.name,
						value: item.product_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_name\']').val(ui.item.label);
						
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});

$('input[name=\'filter_model\']').autocomplete({
	delay: 500,
	source: function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_model=' +  encodeURIComponent(request.term),
			dataType: 'json',
			success: function(json) {		
				response($.map(json, function(item) {
					return {
						label: item.model,
						value: item.product_id
					}
				}));
			}
		});
	}, 
	select: function(event, ui) {
		$('input[name=\'filter_model\']').val(ui.item.label);
						
		return false;
	},
	focus: function(event, ui) {
      	return false;
   	}
});
//--></script>
<script type="text/javascript"><!--
  $(document).ready(function() {
        $('input[name=\'status\']').change(function() {
         $.post('index.php?route=catalog/product/status&token=<?php echo $token; ?>', 'status=' + ($(this).attr('checked') ? '1' : '0') + '&product_id=' + $(this).val());
         var text = $(this).next().text() == '<?php echo $text_disabled; ?>' ? '<?php echo $text_enabled; ?>' : '<?php echo $text_disabled; ?>';
          $(this).next().text(text);
    });

  }); 

  $(".inlineEdit").bind("click", updateText);
        function updateText() {
						$(".inlineEdit").unbind('click');
						OrigId = $(this).attr("id");
                        OrigText= $(this).html();
                        OrigId = $(this).attr("id");
                        Save = '<a class="save"><img src="view/image/add.png" alt="<?php echo $button_save; ?>" title="<?php echo $button_save; ?>" /></a>&nbsp;';
                        Revert= '<a class="revert"><img src="view/image/delete.png" alt="<?php echo $button_cancel; ?>" title="<?php echo $button_cancel; ?>" /></a>';
                        $(this).addClass("selected").html('<input type="text" name="price"  value=' + OrigText + ' size="10" id="price' + OrigId + '" /><br/>' + Save + Revert).unbind('click', updateText);
                };
   

        $(".revert").live("click", function () {
        $(this).parent().html(OrigText).removeClass("selected");
		$(".inlineEdit").bind("click", updateText);
    });        

                $(".save").live("click", function updatePrice(product_id) {                                
                var price = $('#price' + OrigId).val();
                $.post('index.php?route=catalog/product/price&token=<?php echo $token; ?>', 'price=' + price + '&product_id=' + OrigId);
            alert('<?php echo $text_new_price; ?>' + price);
        $(this).parent().html(price).removeClass("selected");
		$(".inlineEdit").bind("click", updateText);
});

$(".inlineEditq").bind("click", updateTextq);

function updateTextq() {
						$(".inlineEditq").unbind('click');
						OrigId = $(this).attr("id");
                        OrigTextq= $(this).html();
                        Saveq = '<a class="saveq"><img src="view/image/add.png" alt="<?php echo $button_save; ?>" title="<?php echo $button_save; ?>" /></a>&nbsp;';
                        Revertq= '<a class="revertq"><img src="view/image/delete.png" alt="<?php echo $button_cancel; ?>" title="<?php echo $button_cancel; ?>" /></a>';
                        $(this).addClass("selected").html('<input type="text" name="quantity"  size="10" id="quantity' + OrigId + '" value="' + OrigTextq +'" /><br/>' + Saveq + Revertq).unbind('click', updateTextq);                

				};
    
        $(".revertq").live("click", function () {
        $(this).parent().html(OrigTextq).removeClass("selected");
		$(".inlineEditq").bind("click", updateTextq);
    });                

                $(".saveq").live("click", function updateQuantity(product_id) {                                

                var quantity = $('#quantity' + OrigId).val();
                $.post('index.php?route=catalog/product/quantity&token=<?php echo $token; ?>', 'quantity=' + quantity + '&product_id=' + OrigId);
            alert('<?php echo $text_new_quantity; ?>' + quantity);
        $(this).parent().html(quantity).removeClass("selected");
		$(".inlineEditq").bind("click", updateTextq);
});

$(".inlineEditm").bind("click", updateTextm);

function updateTextm() {
						$(".inlineEditm").unbind('click');
						OrigId = $(this).attr("id");
                        OrigTextm= $(this).html();
						Savem = '<a class="savem"><img src="view/image/add.png" alt="<?php echo $button_save; ?>" title="<?php echo $button_save; ?>" /></a>&nbsp;';
                        Revertm= '<a class="revertm"><img src="view/image/delete.png" alt="<?php echo $button_cancel; ?>" title="<?php echo $button_cancel; ?>" /></a>';
                        $(this).addClass("selected").html('<input type="text" name="model"  size="20" id="model' + OrigId + '" value="' + OrigTextm +'" /><br/>' + Savem + Revertm).unbind('click', updateTextm);

				};      

        $(".revertm").live("click", function () {
        $(this).parent().html(OrigTextm).removeClass("selected");
		$(".inlineEditm").bind("click", updateTextm);
    });        

                $(".savem").live("click", function updateModel(product_id) {                               

                var model = $('#model' + OrigId).val();
			  $.post('index.php?route=catalog/product/model&token=<?php echo $token; ?>', 'model=' + model + '&product_id=' + OrigId);
            alert('<?php echo $text_new_model; ?>' + model);
        $(this).parent().html(model).removeClass("selected");
		$(".inlineEditm").bind("click", updateTextm);
});

$(".inlineEditn").bind("click", updateTextn);

function updateTextn() {
						$(".inlineEditn").unbind('click');
						OrigId = $(this).attr("id");
                        OrigTextn= $(this).html();
                        Saven = '<a class="saven"><img src="view/image/add.png" alt="<?php echo $button_save; ?>" title="<?php echo $button_save; ?>" /></a>&nbsp;';
                        Revertn= '<a class="revertn"><img src="view/image/delete.png" alt="<?php echo $button_cancel; ?>" title="<?php echo $button_cancel; ?>" /></a>'
                        $(this).addClass("selected").html('<input type="text" name="name"  size="55" id="name' + OrigId + '" value="' + OrigTextn +'" /><br/>' + Saven + Revertn).unbind('click', updateTextn);
				};
    

        $(".revertn").live("click", function () {
        $(this).parent().html(OrigTextn).removeClass("selected");
		$(".inlineEditn").bind("click", updateTextn);
    });
                
                $(".saven").live("click", function updateName(product_id) {
                                

                var name = $('#name' + OrigId).val();

                  $.post('index.php?route=catalog/product/name&token=<?php echo $token; ?>', 'name=' + name + '&product_id=' + OrigId);
            alert('<?php echo $text_new_name; ?>' + name);
        $(this).parent().html(name).removeClass("selected");
		$(".inlineEditn").bind("click", updateTextn);
});
//--></script> 
<?php echo $footer; ?>