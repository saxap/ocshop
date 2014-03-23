<?php
class ControllerToolCachemanager extends Controller {
	private $error = array();

	public function __construct($registry) {
		parent::__construct($registry);

		// Paths and Files
		$this->base_dir = substr_replace(DIR_SYSTEM, '/', -8);
		$this->vqcache_dir = substr_replace(DIR_SYSTEM, '/vqmod/vqcache/', -8);
		$this->vqcache_files = substr_replace(DIR_SYSTEM, '/vqmod/vqcache/vq*', -8);
		$this->vqmod_modcache = substr_replace(DIR_SYSTEM, '/vqmod/mods.cache', -8); // VQMod 2.2.0

		clearstatcache();
	}
	
	public function index() {   
		$this->load->language('tool/cachemanager');

		$this->document->setTitle($this->language->get('heading_title'));
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['column_description'] = $this->language->get('column_description');
		$this->data['column_action'] = $this->language->get('column_action');
		
		$this->data['image_description'] = $this->language->get('image_description');
		$this->data['system_description'] = $this->language->get('system_description');
		$this->data['vqmod_description'] = $this->language->get('vqmod_description');
		
		$this->data['button_clearcache'] = $this->language->get('button_clearcache');
		$this->data['button_clearsystemcache'] = $this->language->get('button_clearsystemcache');
		$this->data['button_clearvqmodcache'] = $this->language->get('button_clearvqmodcache');
		
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
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('tool/cachemanager', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['clearcache'] = (HTTPS_SERVER . 'index.php?route=tool/cachemanager/clearcache&token=' . $this->session->data['token']);
		$this->data['clearsystemcache'] = (HTTPS_SERVER . 'index.php?route=tool/cachemanager/clearsystemcache&token=' . $this->session->data['token']);
		$this->data['clearvqmodcache'] = (HTTPS_SERVER . 'index.php?route=tool/cachemanager/clearvqmodcache&token=' . $this->session->data['token']);
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['modules'] = array();
		
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}
		
		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		$this->template = 'tool/cachemanager.tpl';
		$this->children = array(
			'common/header',	
			'common/footer'	
		);
		
		$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
	}
	
	public function clearsystemcache() {
		$this->load->language('tool/cachemanager');
		$files = glob(DIR_CACHE . 'cache.*');
		foreach($files as $file){
			$this->deldir($file);
		}
                
		$this->session->data['success'] = $this->language->get('text_success');
		
        $this->redirect(HTTPS_SERVER . 'index.php?route=tool/cachemanager&token=' . $this->session->data['token']);		
		}
	
	public function clearvqmodcache($return = false) {
		$this->load->language('tool/cachemanager');
		
			$files = glob($this->vqcache_files);

			if ($files) {
				foreach ($files as $file) {
					if (is_file($file)) {
						unlink($file);
					}
				}
			}

			if (is_file($this->vqmod_modcache)) {
				unlink($this->vqmod_modcache);
			}

			if ($return) {
				return;
			}

			$this->session->data['success'] = $this->language->get('text_success');
		

		$this->redirect(HTTPS_SERVER . 'index.php?route=tool/cachemanager&token=' . $this->session->data['token']);	
	}
        
	public function clearcache() {
		$this->load->language('tool/cachemanager');
                $imgfiles = glob(DIR_IMAGE . 'cache/*');
              foreach($imgfiles as $imgfile){
                     $this->deldir($imgfile);
		}
		$this->session->data['success'] = $this->language->get('text_success');
		
        $this->redirect(HTTPS_SERVER . 'index.php?route=tool/cachemanager&token=' . $this->session->data['token']);		
		}
        public function deldir($dirname){         
		if(file_exists($dirname)) {
			if(is_dir($dirname)){
                            $dir=opendir($dirname);
                            while($filename=readdir($dir)){
                                    if($filename!="." && $filename!=".."){
                                        $file=$dirname."/".$filename;
					$this->deldir($file); 
                                    }
                                }
                            closedir($dir);  
                            rmdir($dirname);
                        }
			else {@unlink($dirname);}			
		}
	}
}
?>