<?php 
class ControllerSettingHowtosms extends Controller { 
	private $error = array();

	public function index() {		
		$this->language->load('setting/howtosms');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),       		
			'separator' => false
		);

		$this->data['breadcrumbs'][] = array(
			'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('setting/howtosms', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);

		$this->template = 'setting/howtosms.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}
}
?>