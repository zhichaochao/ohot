<?php
class ControllerExtensionPaymentGhanaBankTransfer extends Controller {
	/*
	 * GhanaBankTransfer 汇款方式
	 */

	private $error = array();

	public function index() {
		$this->load->language('extension/payment/ghanabanktransfer');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('ghanabanktransfer', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=payment', true));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_all_zones'] = $this->language->get('text_all_zones');

		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['entry_image'] = $this->language->get('entry_image');
		$data['entry_text'] = $this->language->get('entry_text');
		$data['entry_value'] = $this->language->get('entry_value');
		$data['entry_status'] = $this->language->get('entry_status');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_add'] = $this->language->get('button_add');
		$data['button_remove'] = $this->language->get('button_remove');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_extension'),
			'href' => $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=payment', true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('extension/payment/ghanabanktransfer', 'token=' . $this->session->data['token'], true)
		);

		$data['action'] = $this->url->link('extension/payment/ghanabanktransfer', 'token=' . $this->session->data['token'], true);

		$data['cancel'] = $this->url->link('extension/extension', 'token=' . $this->session->data['token'] . '&type=payment', true);

		if (isset($this->request->post['ghanabanktransfer_image'])) {
			$data['ghanabanktransfer_image'] = $this->request->post['ghanabanktransfer_image'];
		} else {
			$data['ghanabanktransfer_image'] = $this->config->get('ghanabanktransfer_image');
		}

		$this->load->model('tool/image');

		if (isset($this->request->post['ghanabanktransfer_image']) && is_file(DIR_IMAGE . $this->request->post['ghanabanktransfer_image'])) {
			$data['ghanabanktransfer_thumb'] = $this->model_tool_image->resize($this->request->post['ghanabanktransfer_image'], 100, 100);
		} elseif ($this->config->get('ghanabanktransfer_image') && is_file(DIR_IMAGE . $this->config->get('ghanabanktransfer_image'))) {
			$data['ghanabanktransfer_thumb'] = $this->model_tool_image->resize($this->config->get('ghanabanktransfer_image'), 100, 100);
		} else {
			$data['ghanabanktransfer_thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}

		if (isset($this->request->post['ghanabanktransfer_attributes'])) {
			$data['ghanabanktransfer_attributes'] = $this->request->post['ghanabanktransfer_attributes'];
		} elseif($this->config->get('ghanabanktransfer_attributes')) {
			$data['ghanabanktransfer_attributes'] = $this->config->get('ghanabanktransfer_attributes');
		} else {
			$data['ghanabanktransfer_attributes'] = [];
		}
// print_r($data['ghanabanktransfer_attributes']);exit;
		if (isset($this->request->post['ghanabanktransfer_sort_order'])) {
			$data['ghanabanktransfer_sort_order'] = $this->request->post['ghanabanktransfer_sort_order'];
		} else {
			$data['ghanabanktransfer_sort_order'] = $this->config->get('ghanabanktransfer_sort_order');
		}

		if (isset($this->request->post['ghanabanktransfer_status'])) {
			$data['ghanabanktransfer_status'] = $this->request->post['ghanabanktransfer_status'];
		} else {
			$data['ghanabanktransfer_status'] = $this->config->get('ghanabanktransfer_status');
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('extension/payment/ghanabanktransfer', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'extension/payment/ghanabanktransfer')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}