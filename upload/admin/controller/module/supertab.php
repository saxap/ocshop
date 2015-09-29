<?php
class ControllerModuleSuperTab extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->language->load('module/supertab');

		$this->document->setTitle(strip_tags ($this->language->get('heading_title')));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('supertab', $this->request->post);		
			
			$this->cache->delete('product');
			
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		
		$this->data['entry_limit'] = $this->language->get('entry_limit');
		$this->data['entry_image'] = $this->language->get('entry_image');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['entry_bestseller'] = $this->language->get('entry_bestseller');
		$this->data['entry_special'] = $this->language->get('entry_special');
		$this->data['entry_latest'] = $this->language->get('entry_latest');

		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
		$this->data['token'] = $this->session->data['token'];
		
		$language = (int)$this->config->get('config_language_id');
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		if (isset($this->error['image'])) {
			$this->data['error_image'] = $this->error['image'];
		} else {
			$this->data['error_image'] = array();
		}
		
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/supertab', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/supertab', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['modules'] = array();
		
		if (isset($this->request->post['supertab_module'])) {
			$this->data['modules'] = $this->request->post['supertab_module'];
		} elseif ($this->config->get('supertab_module')) { 
			$this->data['modules'] = $this->config->get('supertab_module');
		}			
		
		$this->load->model('catalog/category');
		
		if (isset($this->request->post['bestseller_categories'])) {
			$categories = $this->request->post['bestseller_categories'];
		} elseif ($this->config->get('bestseller_categories')) { 
			$categories = $this->config->get('bestseller_categories');
		} else {
			$categories = array();
		}
		
		$this->data['bestseller_categories'] = array();
		
		foreach ($categories as $category_id) {
			if (VERSION > '1.5.5') {
				$category_info = $this->model_catalog_category->getCategory($category_id);
				$name = $category_info['name'];
			} else {
				$category_info = $this->model_catalog_category->getCategoryDescriptions($category_id);
				$name = $category_info[$language]['name'];
			}
			if ($category_info) {
				$this->data['bestseller_categories'][] = array(
					'category_id' => $category_id,
					'name'        => $name
				);
			}
		}		
		
		if (isset($this->request->post['special_categories'])) {
			$categories = $this->request->post['special_categories'];
		} elseif ($this->config->get('special_categories')) { 
			$categories = $this->config->get('special_categories');
		} else {
			$categories = array();
		}
		
		$this->data['special_categories'] = array();

		foreach ($categories as $category_id) {
			if (VERSION > '1.5.5') {
				$category_info = $this->model_catalog_category->getCategory($category_id);
				$name = $category_info['name'];
			} else {
				$category_info = $this->model_catalog_category->getCategoryDescriptions($category_id);
				$name = $category_info[$language]['name'];
			}
			if ($category_info) {
				$this->data['special_categories'][] = array(
					'category_id' => $category_id,
					'name'        => $name
				);
			}
		}		
		
		if (isset($this->request->post['latest_categories'])) {
			$categories = $this->request->post['latest_categories'];
		} elseif ($this->config->get('latest_categories')) { 
			$categories = $this->config->get('latest_categories');
		} else {
			$categories = array();
		}
		
		$this->data['latest_categories'] = array();

		foreach ($categories as $category_id) {
			if (VERSION > '1.5.5') {
				$category_info = $this->model_catalog_category->getCategory($category_id);
				$name = $category_info['name'];
			} else {
				$category_info = $this->model_catalog_category->getCategoryDescriptions($category_id);
				$name = $category_info[$language]['name'];
			}
			if ($category_info) {
				$this->data['latest_categories'][] = array(
					'category_id' => $category_id,
					'name'        => $name
				);
			}
		}

		
	
 
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->template = 'module/supertab.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/supertab')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (isset($this->request->post['supertab_module'])) {
			foreach ($this->request->post['supertab_module'] as $key => $value) {
				if (!$value['image_width'] || !$value['image_height']) {
					$this->error['image'][$key] = $this->language->get('error_image');
				}
			}
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>