<?php
// *	@copyright	OCSHOP.CMS \ ocshop.net 2011 - 2015.
// *	@demo	http://ocshop.net
// *	@blog	http://ocshop.info
// *	@forum	http://forum.ocshop.info
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerModuleEbayListing extends Controller {
	public function index() {
		if ($this->config->get('ebay_status') == 1) {
			$this->load->language('module/ebay');
			
			$this->load->model('tool/image');
			$this->load->model('openbay/ebay_product');

			$data['heading_title'] = $this->language->get('heading_title');

			$data['products'] = array();

			$products = $this->cache->get('ebay_listing.' . md5(serialize($products)));

			if (!$products) {
				$products = $this->model_openbay_ebay_product->getDisplayProducts();
				
				$this->cache->set('ebay_listing.' . md5(serialize($products)), $products);
			}

			foreach($products['products'] as $product) {
				if (isset($product['pictures'][0])) {
					$image = $this->model_openbay_ebay_product->resize($product['pictures'][0], $this->config->get('ebay_listing_width'), $this->config->get('ebay_listing_height'));
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $this->config->get('ebay_listing_width'), $this->config->get('ebay_listing_height'));
				}

				$data['products'][] = array(
					'thumb' => $image, 
					'name'  => base64_decode($product['Title']), 
					'price' => $this->currency->format($product['priceGross']), 
					'href' => (string)$product['link']
				);
			}

			$data['tracking_pixel'] = $products['tracking_pixel'];

			return $this->load->view('module/ebay.tpl', $data);
		}
	}
}