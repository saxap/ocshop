<?php
class ControllerModuleThememanager extends Controller {
	private $error = array();
	
	public function index() {   

		
		$this->load->model('setting/setting');
		$this->load->language('module/thememanager');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('thememanager', $this->request->post);		

			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('module/thememanager', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
		$this->document->addScript('view/javascript/jquery/picker/js/colpick.js');
		$this->document->addStyle('view/javascript/jquery/picker/css/colpick.css');
	

		$this->document->setTitle(strip_tags ($this->language->get('heading_title')));
				
		$this->data['heading_title'] = strip_tags($this->language->get('heading_title'));
		
		$this->data['column_description'] = $this->language->get('column_description');
		$this->data['column_action'] = $this->language->get('column_action');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		
		$this->data['tab_header_menu'] = $this->language->get('tab_header_menu');
		$this->data['tab_custom_footer'] = $this->language->get('tab_custom_footer');
		$this->data['tab_buttons'] = $this->language->get('tab_buttons');
		$this->data['tab_colors'] = $this->language->get('tab_colors');
		$this->data['tab_fonts'] = $this->language->get('tab_fonts');
		
		$this->data['text_main'] = $this->language->get('text_main');
		$this->data['text_header_top'] = $this->language->get('text_header_top');
		$this->data['text_breadcrumb'] = $this->language->get('text_breadcrumb');
		$this->data['text_category'] = $this->language->get('text_category');
		$this->data['text_product'] = $this->language->get('text_product');
		$this->data['text_modules'] = $this->language->get('text_modules');
		$this->data['text_main_fonts'] = $this->language->get('text_main_fonts');
		$this->data['text_top_fonts'] = $this->language->get('text_top_fonts');
		$this->data['text_breadcrumb_fonts'] = $this->language->get('text_breadcrumb_fonts');
		$this->data['text_category_fonts'] = $this->language->get('text_category_fonts');
		$this->data['text_product_fonts'] = $this->language->get('text_product_fonts');
		$this->data['text_modules_fonts'] = $this->language->get('text_modules_fonts');
		$this->data['text_buttons_main'] = $this->language->get('text_buttons_main');
		$this->data['text_buttons_product'] = $this->language->get('text_buttons_product');
		$this->data['text_buttons_modules'] = $this->language->get('text_buttons_modules');
		$this->data['text_main_modules'] = $this->language->get('text_main_modules');
		
		$this->data['entry_default'] = $this->language->get('entry_default');
		$this->data['entry_menu_box_height'] = $this->language->get('entry_menu_box_height');
		$this->data['entry_menu_box_line_height'] = $this->language->get('entry_menu_box_line_height');
		$this->data['entry_menu_background'] = $this->language->get('entry_menu_background');
		$this->data['entry_menu_border_color'] = $this->language->get('entry_menu_border_color');
		$this->data['entry_menu_font_size'] = $this->language->get('entry_menu_font_size');
		$this->data['entry_menu_font_color'] = $this->language->get('entry_menu_font_color');
		$this->data['entry_menu_border_radius'] = $this->language->get('entry_menu_border_radius');
		$this->data['entry_menu_box_children'] = $this->language->get('entry_menu_box_children');
		$this->data['entry_menu_children_border_color'] = $this->language->get('entry_menu_children_border_color');
		$this->data['entry_menu_box_opacity'] = $this->language->get('entry_menu_box_opacity');
		$this->data['entry_menu_active_category'] = $this->language->get('entry_menu_active_category');
		$this->data['entry_menu_children_font_size'] = $this->language->get('entry_menu_children_font_size');
		$this->data['entry_menu_children_font_color'] = $this->language->get('entry_menu_children_font_color');
		$this->data['entry_menu_children_bg_category'] = $this->language->get('entry_menu_children_bg_category');
		$this->data['entry_h1_color_product'] = $this->language->get('entry_h1_color_product');
		$this->data['entry_fonts_color_product_info'] = $this->language->get('entry_fonts_color_product_info');
		$this->data['entry_fonts_color_product_info_data'] = $this->language->get('entry_fonts_color_product_info_data');
		$this->data['entry_fonts_color_product_info_url'] = $this->language->get('entry_fonts_color_product_info_url');
		$this->data['entry_color_product_price'] = $this->language->get('entry_color_product_price');
		$this->data['entry_color_product_old_price'] = $this->language->get('entry_color_product_old_price');
		$this->data['entry_color_product_options'] = $this->language->get('entry_color_product_options');
		$this->data['entry_border_img_color_product'] = $this->language->get('entry_border_img_color_product');
		
		
		$this->data['entry_container_footer_bg'] = $this->language->get('entry_container_footer_bg');
		$this->data['entry_footer_border_top'] = $this->language->get('entry_footer_border_top');
		$this->data['entry_footer_border_bottom'] = $this->language->get('entry_footer_border_bottom');
		$this->data['entry_column_welcome_font_color'] = $this->language->get('entry_column_welcome_font_color');
		$this->data['entry_column_welcome_font_size'] = $this->language->get('entry_column_welcome_font_size');
		$this->data['entry_column_contacts_font_color'] = $this->language->get('entry_column_contacts_font_color');
		$this->data['entry_column_contacts_font_size'] = $this->language->get('entry_column_contacts_font_size');
		$this->data['entry_footer_font_color_h3'] = $this->language->get('entry_footer_font_color_h3');
		$this->data['entry_footer_font_size_h3'] = $this->language->get('entry_footer_font_size_h3');
		$this->data['entry_footer_font_color'] = $this->language->get('entry_footer_font_color');
		$this->data['entry_footer_font_color_hover'] = $this->language->get('entry_footer_font_color_hover');
		$this->data['entry_footer_font_size'] = $this->language->get('entry_footer_font_size');
		
		$this->data['entry_background'] = $this->language->get('entry_background');
		$this->data['entry_fonts_color'] = $this->language->get('entry_fonts_color');
		$this->data['entry_url_color'] = $this->language->get('entry_url_color');
		$this->data['entry_url_hover_color'] = $this->language->get('entry_url_hover_color');
		$this->data['entry_h1_color'] = $this->language->get('entry_h1_color');
		$this->data['entry_h2_color'] = $this->language->get('entry_h2_color');
		$this->data['entry_h3_color'] = $this->language->get('entry_h3_color');
		$this->data['entry_h4_color'] = $this->language->get('entry_h4_color');
		$this->data['entry_h5_color'] = $this->language->get('entry_h5_color');
		$this->data['entry_content_modules'] = $this->language->get('entry_content_modules');
		$this->data['entry_name_modules'] = $this->language->get('entry_name_modules');
		$this->data['entry_fonts_color_modules'] = $this->language->get('entry_fonts_color_modules');
		$this->data['entry_url_color_modules'] = $this->language->get('entry_url_color_modules');
		$this->data['entry_url_hover_color_modules'] = $this->language->get('entry_url_hover_color_modules');
		$this->data['entry_border_color_modules'] = $this->language->get('entry_border_color_modules');
		$this->data['entry_price_color_modules'] = $this->language->get('entry_price_color_modules');
		$this->data['entry_price_old_color_modules'] = $this->language->get('entry_price_old_color_modules');
		
		$this->data['entry_fonts_color_category'] = $this->language->get('entry_fonts_color_category');
		$this->data['entry_fonts_color_pcategory'] = $this->language->get('entry_fonts_color_pcategory');
		$this->data['entry_price_color_category'] = $this->language->get('entry_price_color_category');
		$this->data['entry_price_old_color_category'] = $this->language->get('entry_price_old_color_category');
		$this->data['entry_border_product_color_category'] = $this->language->get('entry_border_product_color_category');
		
		$this->data['entry_top_background'] = $this->language->get('entry_top_background');
		$this->data['entry_top_fonts_color'] = $this->language->get('entry_top_fonts_color');
		$this->data['entry_top_url_color'] = $this->language->get('entry_top_url_color');
		$this->data['entry_top_url_hover_color'] = $this->language->get('entry_top_url_hover_color');
		$this->data['entry_top_border'] = $this->language->get('entry_top_border');
		
		$this->data['entry_breadcrumb_background'] = $this->language->get('entry_breadcrumb_background');
		$this->data['entry_breadcrumb_fonts_color'] = $this->language->get('entry_breadcrumb_fonts_color');
		$this->data['entry_breadcrumb_url_color'] = $this->language->get('entry_breadcrumb_url_color');
		$this->data['entry_breadcrumb_url_hover_color'] = $this->language->get('entry_breadcrumb_url_hover_color');
		$this->data['entry_breadcrumb_border'] = $this->language->get('entry_breadcrumb_border');
		
		$this->data['entry_main_fonts_size'] = $this->language->get('entry_main_fonts_size');
		$this->data['entry_h1_fonts_size'] = $this->language->get('entry_h1_fonts_size');
		$this->data['entry_h2_fonts_size'] = $this->language->get('entry_h2_fonts_size');
		$this->data['entry_h3_fonts_size'] = $this->language->get('entry_h3_fonts_size');
		$this->data['entry_h4_fonts_size'] = $this->language->get('entry_h4_fonts_size');
		$this->data['entry_h5_fonts_size'] = $this->language->get('entry_h5_fonts_size');
		$this->data['entry_top_fonts_size'] = $this->language->get('entry_top_fonts_size');
		
		$this->data['entry_breadcrumb_fonts_size'] = $this->language->get('entry_breadcrumb_fonts_size');
		
		$this->data['entry_category_info_fonts_size'] = $this->language->get('entry_category_info_fonts_size');
		$this->data['entry_category_name_fonts_size'] = $this->language->get('entry_category_name_fonts_size');
		$this->data['entry_category_fonts_size'] = $this->language->get('entry_category_fonts_size');
		$this->data['entry_category_price_fonts_size'] = $this->language->get('entry_category_price_fonts_size');
		$this->data['entry_category_price_old_fonts_size'] = $this->language->get('entry_category_price_old_fonts_size');
		
		$this->data['entry_product_h1_fonts_size'] = $this->language->get('entry_product_h1_fonts_size');
		$this->data['entry_fonts_size_product_info'] = $this->language->get('entry_fonts_size_product_info');
		$this->data['entry_fonts_size_product_info_data'] = $this->language->get('entry_fonts_size_product_info_data');
		$this->data['entry_fonts_size_product_info_url'] = $this->language->get('entry_fonts_size_product_info_url');
		$this->data['entry_product_price_fonts_size'] = $this->language->get('entry_product_price_fonts_size');
		$this->data['entry_product_price_old_fonts_size'] = $this->language->get('entry_product_price_old_fonts_size');
		$this->data['entry_product_options_fonts_size'] = $this->language->get('entry_product_options_fonts_size');
		
		$this->data['entry_modules_name_fonts_size'] = $this->language->get('entry_modules_name_fonts_size');
		$this->data['entry_modules_category_url_fonts_size'] = $this->language->get('entry_modules_category_url_fonts_size');
		$this->data['entry_modules_name_product_fonts_size'] = $this->language->get('entry_modules_name_product_fonts_size');
		$this->data['entry_modules_product_fonts_size'] = $this->language->get('entry_modules_product_fonts_size');
		$this->data['entry_modules_price_fonts_size'] = $this->language->get('entry_modules_price_fonts_size');
		$this->data['entry_modules_price_old_fonts_size'] = $this->language->get('entry_modules_price_old_fonts_size');
		
		$this->data['entry_buttons_background'] = $this->language->get('entry_buttons_background');
		$this->data['entry_buttons_background_hover'] = $this->language->get('entry_buttons_background_hover');
		$this->data['entry_buttons_border_color'] = $this->language->get('entry_buttons_border_color');
		$this->data['entry_buttons_border_hover'] = $this->language->get('entry_buttons_border_hover');
		$this->data['entry_buttons_fonts_color'] = $this->language->get('entry_buttons_fonts_color');
		$this->data['entry_buttons_fonts_color_hover'] = $this->language->get('entry_buttons_fonts_color_hover');
		$this->data['entry_buttons_fonts_size'] = $this->language->get('entry_buttons_fonts_size');
		

		
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
       		'text'      => (strip_tags($this->language->get('heading_title'))),
			'href'      => $this->url->link('module/thememanager', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/thememanager', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['styles'] = array();
		$this->data['footers'] = array();
		
		if (isset($this->request->post['styles'])) {
			$this->data['styles'] = $this->request->post['styles'];
		} else {
			$this->data['styles'] = $this->config->get('styles');
		}
		
		if (isset($this->request->post['footers'])) {
			$this->data['footers'] = $this->request->post['footers'];
		} else {
			$this->data['footers'] = $this->config->get('footers');
		}
		
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}		
		
		$this->template = 'module/thememanager.tpl';
		$this->children = array(
			'common/header',	
			'common/footer'	
		);
		
		$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression'));
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/thememanager')) {
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