<?php
// *	@copyright	OPENCART.PRO 2011 - 2015.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerModuleAffiliate extends Controller {
	public function index() {
		$this->load->language('module/affiliate');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_forgotten'] = $this->language->get('text_forgotten');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_password'] = $this->language->get('text_password');
		$data['text_payment'] = $this->language->get('text_payment');
		$data['text_tracking'] = $this->language->get('text_tracking');
		$data['text_transaction'] = $this->language->get('text_transaction');

		$data['logged'] = $this->affiliate->isLogged();
		$data['register'] = $this->url->ssl('affiliate/register', '', true);
		$data['login'] = $this->url->ssl('affiliate/login', '', true);
		$data['logout'] = $this->url->ssl('affiliate/logout', '', true);
		$data['forgotten'] = $this->url->ssl('affiliate/forgotten', '', true);
		$data['account'] = $this->url->ssl('affiliate/account', '', true);
		$data['edit'] = $this->url->ssl('affiliate/edit', '', true);
		$data['password'] = $this->url->ssl('affiliate/password', '', true);
		$data['payment'] = $this->url->ssl('affiliate/payment', '', true);
		$data['tracking'] = $this->url->ssl('affiliate/tracking', '', true);
		$data['transaction'] = $this->url->ssl('affiliate/transaction', '', true);

		return $this->load->view('module/affiliate', $data);
	}
}