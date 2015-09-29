<?php
class ControllerModuleManufacturerlistnojs extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/manufacturerlistnojs');

		$this->document->setTitle(strip_tags ($this->language->get('heading_title')));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('manufacturerlistnojs', $this->request->post);		
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');		$this->data['entry_enabled_module'] = $this->language->get('entry_enabled_module');
		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
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
			'href'      => $this->url->link('module/manufacturerlistnojs', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/manufacturerlistnojs', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		if (isset($this->request->post['manufacturerlistnojs_module_status'])) {			$this->data['manufacturerlistnojs_module_status'] = $this->request->post['manufacturerlistnojs_module_status'];		} else {			$this->data['manufacturerlistnojs_module_status'] = $this->config->get('manufacturerlistnojs_module_status');		}			        $this->data['manufacturerlistnojs_module_status'] = isset($this->data['manufacturerlistnojs_module_status']) && !is_null($this->data['manufacturerlistnojs_module_status']) ? $this->data['manufacturerlistnojs_module_status'] : 1;        		$this->data['modules'] = array();
		
		if (isset($this->request->post['manufacturerlistnojs_module'])) {
			$this->data['modules'] = $this->request->post['manufacturerlistnojs_module'];
		} elseif ($this->config->get('manufacturerlistnojs_module')) { 
			$this->data['modules'] = $this->config->get('manufacturerlistnojs_module');
		}	
				
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->template = 'module/manufacturerlistnojs.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/manufacturerlistnojs')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>