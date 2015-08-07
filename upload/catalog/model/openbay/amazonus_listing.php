<?php
// *	@copyright	OCSHOP.CMS \ ocshop.net 2011 - 2015.
// *	@demo	http://ocshop.net
// *	@blog	http://ocshop.info
// *	@forum	http://forum.ocshop.info
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class ModelOpenbayAmazonusListing extends Model {
	public function listingSuccessful($product_id) {
		$this->db->query("UPDATE `" . DB_PREFIX . "amazonus_product` SET `status` = 'ok' WHERE product_id = " . (int)$product_id . " AND `version` = 3");
	}

	public function listingFailed($product_id, $messages) {
		$this->db->query("UPDATE `" . DB_PREFIX . "amazonus_product` SET `status` = 'error', `messages` = '" . $this->db->escape(json_encode($messages)) . "' WHERE product_id = " . (int)$product_id . " AND `version` = 3");
	}
}