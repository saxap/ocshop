<?php
// *	@copyright	OCSHOP.CMS \ ocshop.net 2011 - 2015.
// *	@demo	http://ocshop.net
// *	@blog	http://ocshop.info
// *	@forum	http://forum.ocshop.info
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class Event {
	private $data = array();
	private $registry;

	public function __construct($registry) {
		$this->registry = $registry;
	}

	public function register($key, $action, $priority = 0) {
		$this->data[$key][] = [
			'action' => $action,
			'priority' => (int)$priority,
		];
	}

	public function unregister($key, $action) {
		if (isset($this->data[$key])) {
			foreach ($this->data[$key] as $index => $event) {
				if ($event['action'] == $action) {
					unset($this->data[$key][$index]);
				}
			}
		}
	}

	public function trigger($key, &$arg = array()) {
		if (isset($this->data[$key])) {
			usort($this->data[$key], array("Event", "cmpByPriority"));
			foreach ($this->data[$key] as $event) {
				$action = $this->createAction($event['action'], $arg);
				$action->execute($this->registry);
			}
		}
	}

	protected static function cmpByPriority($a, $b) {
		if ($a['priority'] == $b['priority']) {
			return 0;
		}

		return ($a['priority'] > $b['priority']) ? -1 : 1;
	}

	protected function createAction($action, &$arg) {
		return new Action($action, $arg);
	}
}