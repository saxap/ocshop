<?php
// *	@copyright	OPENCART.PRO 2011 - 2015.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerModuleAccount extends Controller {
	public function index() {
		$this->load->language('module/account');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_forgotten'] = $this->language->get('text_forgotten');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_password'] = $this->language->get('text_password');
		$data['text_address'] = $this->language->get('text_address');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_reward'] = $this->language->get('text_reward');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_newsletter'] = $this->language->get('text_newsletter');
		$data['text_recurring'] = $this->language->get('text_recurring');

		$data['logged'] = $this->customer->isLogged();
		$data['register'] = $this->url->ssl('account/register', '', true);
		$data['login'] = $this->url->ssl('account/login', '', true);
		$data['logout'] = $this->url->ssl('account/logout', '', true);
		$data['forgotten'] = $this->url->ssl('account/forgotten', '', true);
		$data['account'] = $this->url->ssl('account/account', '', true);
		$data['edit'] = $this->url->ssl('account/edit', '', true);
		$data['password'] = $this->url->ssl('account/password', '', true);
		$data['address'] = $this->url->ssl('account/address', '', true);
		$data['wishlist'] = $this->url->ssl('account/wishlist');
		$data['order'] = $this->url->ssl('account/order', '', true);
		$data['download'] = $this->url->ssl('account/download', '', true);
		$data['reward'] = $this->url->ssl('account/reward', '', true);
		$data['return'] = $this->url->ssl('account/return', '', true);
		$data['transaction'] = $this->url->ssl('account/transaction', '', true);
		$data['newsletter'] = $this->url->ssl('account/newsletter', '', true);
		$data['recurring'] = $this->url->ssl('account/recurring', '', true);

		return $this->load->view('module/account', $data);
	}
}