<?php
// *	@copyright	OPENCART.PRO 2011 - 2015.
// *	@forum	http://forum.opencart.pro
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ControllerOpenbayEbay extends Controller {
	public function eventAddOrder($route, $data) {

	}

	public function eventAddOrderHistory($route, $order_id, $order_status_id, $comment = '', $notify = false, $override = false) {
		if (!empty($order_id)) {
			$this->load->model('openbay/ebay_order');

			$this->model_openbay_ebay_order->addOrderHistory($order_id);
		}
	}
}