<?php
// *	@copyright	OCSHOP.CMS \ ocshop.net 2011 - 2015.
// *	@demo	http://ocshop.net
// *	@blog	http://ocshop.info
// *	@forum	http://forum.ocshop.info
// *	@source		See SOURCE.txt for source and other copyright.
// *	@license	GNU General Public License version 3; see LICENSE.txt

class Template {
	private $template;

  	public function __construct($driver) {
	    $class = 'Template\\' . $driver;

		if (class_exists($class)) {
			$this->template = new $class($expire);
		} else {
			exit('Error: Could not load template driver ' . $driver . '!');
		}
	}

	public function set($key, $value) {
		$this->template->set($key, $value);
	}

	public function render($template) {
		return $this->template->render($template);
	}
}
