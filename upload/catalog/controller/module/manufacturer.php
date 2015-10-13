<?php
// *	@copyright	OCSHOP.CMS \ ocshop.net 2011 - 2015.
// *	@demo	http://ocshop.net
// *	@blog	http://ocshop.info
// *	@forum	http://forum.ocshop.info
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerModuleMAnufacturer extends Controller {
	public function index($setting) {
		$this->language->load('module/manufacturer');

		$data['heading_title'] = $this->language->get('heading_title');

		if (isset($this->request->get['manufacturer_id'])) {
			$data['manufacturer_id'] =  (string)$this->request->get['manufacturer_id'];
		} else {
			$data['manufacturer_id'] = array();
		}

		

		$this->load->model('catalog/manufacturer');

		$this->load->model('catalog/product');

		$data['manufacturer'] = array();

		$manufacturers = $this->model_catalog_manufacturer->getManufacturers();

		foreach ($manufacturers as $manufacturer) {
			
		

			

			$data['manufacturers'][] = array(
				'manufacturer_id' => $manufacturer['manufacturer_id'],
				'name'        => $manufacturer['name'] ,
				'href'        => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $manufacturer['manufacturer_id'])
			);
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/manufacturer.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/manufacturer.tpl', $data);
		} else {
			return $this->load->view('default/template/module/manufacturer.tpl', $data);
		}
	}
}