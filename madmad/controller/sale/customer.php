<?php
class ControllerSaleCustomer extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('sale/customer');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/customer');

		$this->getList();
	}

	public function edit() {
		$this->load->language('sale/order');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('sale/customer');

		$this->getForm();
	}

	protected function getList() {
		if (isset($this->request->get['filter_name'])) {
			$filter_name = $this->request->get['filter_name'];
		} else {
			$filter_name = null;
		}

		if (isset($this->request->get['filter_email'])) {
			$filter_email = $this->request->get['filter_email'];
		} else {
			$filter_email = null;
		}

		if (isset($this->request->get['filter_customer_group_id'])) {
			$filter_customer_group_id = $this->request->get['filter_customer_group_id'];
		} else {
			$filter_customer_group_id = null;
		}

		if (isset($this->request->get['filter_status'])) {
			$filter_status = $this->request->get['filter_status'];
		} else {
			$filter_status = null;
		}

		
		if (isset($this->request->get['telephone'])) {
			$telephone = $this->request->get['telephone'];
		} else {
			$telephone = null;
		}

		if (isset($this->request->get['filter_date_added'])) {
			$filter_date_added = $this->request->get['filter_date_added'];
		} else {
			$filter_date_added = null;
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'c.date_added';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_customer_group_id'])) {
			$url .= '&filter_customer_group_id=' . $this->request->get['filter_customer_group_id'];
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}


		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], true)
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('customer/customer', 'token=' . $this->session->data['token'] . $url, true)
		);


		$data['customers'] = array();

		$filter_data = array(
			'filter_name'              => $filter_name,
			'filter_email'             => $filter_email,
			'filter_customer_group_id' => $filter_customer_group_id,
			'filter_status'            => $filter_status,
			'filter_date_added'        => $filter_date_added,
			'telephone'                => $telephone,
			'sort'                     => $sort,
			'order'                    => $order,
			'start'                    => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'                    => $this->config->get('config_limit_admin')
		);

		$customer_total = $this->model_sale_customer->getTotalCustomers($filter_data);

		$results = $this->model_sale_customer->getCustomers($filter_data);

		foreach ($results as $result) {

			//所有支付成功历史订单的价格总计
			$res= $this->model_sale_customer->getHistoryOrderTotals($result['customer_id']);
			//历史订单总消费
			if (!isset($res['order_totals'])) {
				$data['hisorder_totals'] = $this->currency->format(0,'USD');
			} else {
				$data['hisorder_totals'] = $this->currency->format($res['order_totals'], 'USD');
			}
			$data['ordersnum'] = $res['orders'];

			//获取下一个等级的金额
			$next_level = $this->model_sale_customer->getNextCustomerGroups($result['customer_id']);
// print_r($next_level);exit;
			if(!empty($next_level)){
				$data['next_level'] = $this->currency->format($next_level['total_order']-$res['order_totals'], $this->config->get('config_currency'));
			}else{
				$data['next_level'] = $this->language->get('no_such_level');
			}

			//获取上个月销售统计
			$last_month = $this->model_sale_customer->getlastCustomerOrdertotal($result['customer_id']);

			if(empty($last_month)){
				$data['lastmonth'] = $this->currency->format(0,'USD');
			}else{
				$data['lastmonth'] = $this->currency->format($last_month['numtotal'], 'USD');
			}

			$data['customers'][] = array(
				'customer_id'    => $result['customer_id'],
				'name'           => $result['name'],
				'email'          => $result['email'],
				'customer_group' => $result['customer_group'],
				'status'         => ($result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled')),
				'hisorder_totals'   => $data['hisorder_totals'],
				'ordersnum'  	 => $data['ordersnum'],
				'lastmonth'  	 => $data['lastmonth'],
				'nextlevel'  	 => $data['next_level'],
				'date_added'     => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'edit'           => $this->url->link('sale/customer/edit', 'token=' . $this->session->data['token'] . '&customer_id=' . $result['customer_id'] . $url, true)
			);
		}


		$data['text_list'] = $this->language->get('text_list');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_no_results'] = $this->language->get('text_no_results');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_email'] = $this->language->get('column_email');
		$data['column_customer_group'] = $this->language->get('column_customer_group');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_date_added'] = $this->language->get('column_date_added');

		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_email'] = $this->language->get('entry_email');
		$data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_date_added'] = $this->language->get('entry_date_added');

		$data['button_filter'] = $this->language->get('button_filter');

		$data['token'] = $this->session->data['token'];

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_customer_group_id'])) {
			$url .= '&filter_customer_group_id=' . $this->request->get['filter_customer_group_id'];
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}


		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_name'] = $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . '&sort=name' . $url, true);
		$data['sort_email'] = $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . '&sort=c.email' . $url, true);
		$data['sort_customer_group'] = $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . '&sort=customer_group' . $url, true);
		$data['sort_status'] = $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . '&sort=c.status' . $url, true);
		$data['sort_ip'] = $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . '&sort=c.ip' . $url, true);
		$data['sort_date_added'] = $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . '&sort=c.date_added' . $url, true);

		$url = '';

		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_customer_group_id'])) {
			$url .= '&filter_customer_group_id=' . $this->request->get['filter_customer_group_id'];
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}

	

		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $customer_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . $url . '&page={page}', true);

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($customer_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($customer_total - $this->config->get('config_limit_admin'))) ? $customer_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $customer_total, ceil($customer_total / $this->config->get('config_limit_admin')));

		$data['filter_name'] = $filter_name;
		$data['filter_email'] = $filter_email;
		$data['filter_customer_group_id'] = $filter_customer_group_id;
		$data['filter_status'] = $filter_status;
		$data['filter_date_added'] = $filter_date_added;

		$this->load->model('customer/customer_group');

		$data['customer_groups'] = $this->model_customer_customer_group->getCustomerGroups();

		$this->load->model('setting/store');

		$data['stores'] = $this->model_setting_store->getStores();

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('sale/customer_list', $data));
	}

	protected function getForm() {
		$data['heading_title'] = '全部订单';

		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');
		$data['text_missing'] = $this->language->get('text_missing');
		$data['text_loading'] = $this->language->get('text_loading');

		$data['column_order_id'] = $this->language->get('column_order_id');
		$data['column_order_no'] = 'Order No';
		$data['column_customer'] = $this->language->get('column_customer');
		$data['column_status'] = $this->language->get('column_status');
		$data['column_total'] = $this->language->get('column_total');
		$data['column_date_added'] = $this->language->get('column_date_added');
		$data['column_date_modified'] = $this->language->get('column_date_modified');
		$data['column_action'] = $this->language->get('column_action');
		$data['entry_payment_method'] = $this->language->get('entry_payment_method');


		if (isset($this->request->get['filter_name'])) {
			$filter_name = $this->request->get['filter_name'];
		} else {
			$filter_name = null;
		}

		if (isset($this->request->get['filter_email'])) {
			$filter_email = $this->request->get['filter_email'];
		} else {
			$filter_email = null;
		}

		if (isset($this->request->get['filter_customer_group_id'])) {
			$filter_customer_group_id = $this->request->get['filter_customer_group_id'];
		} else {
			$filter_customer_group_id = null;
		}

		if (isset($this->request->get['filter_status'])) {
			$filter_status = $this->request->get['filter_status'];
		} else {
			$filter_status = null;
		}

		
		if (isset($this->request->get['telephone'])) {
			$telephone = $this->request->get['telephone'];
		} else {
			$telephone = null;
		}

		if (isset($this->request->get['filter_date_added'])) {
			$filter_date_added = $this->request->get['filter_date_added'];
		} else {
			$filter_date_added = null;
		}

		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'c.date_added';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'DESC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		if (isset($this->request->get['customer_id'])) {
			$customer_id= $this->request->get['customer_id'];
		} else {
			$customer_id = 0;
		}

		$url = '';

		if (isset($this->request->get['customer_id'])) {
			$url .= '&customer_id=' . $this->request->get['customer_id'];
		}


		if (isset($this->request->get['filter_name'])) {
			$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_email'])) {
			$url .= '&filter_email=' . urlencode(html_entity_decode($this->request->get['filter_email'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['filter_customer_group_id'])) {
			$url .= '&filter_customer_group_id=' . $this->request->get['filter_customer_group_id'];
		}

		if (isset($this->request->get['filter_status'])) {
			$url .= '&filter_status=' . $this->request->get['filter_status'];
		}


		if (isset($this->request->get['filter_date_added'])) {
			$url .= '&filter_date_added=' . $this->request->get['filter_date_added'];
		}

		

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		$data['cancel'] = $this->url->link('sale/customer', 'token=' . $this->session->data['token'] . $url, true);

		$data['token'] = $this->session->data['token'];
		$data['url'] = $url;


	

		if (isset($this->request->get['filter_order_status'])) {
			$filter_order_status = $this->request->get['filter_order_status'];
		} else {
			$filter_order_status = null;
		}

		if (isset($this->request->get['filter_orderdate_added'])) {
			$filter_orderdate_added = $this->request->get['filter_orderdate_added'];
		} else {
			$filter_orderdate_added = null;
		}

		if (isset($this->request->get['filter_orderdate_end'])) {
			$filter_orderdate_end = $this->request->get['filter_orderdate_end'];
		} else {
			$filter_orderdate_end = null;
		}

		$filter_data = array(
			'customer_id'          => $customer_id,
			'filter_order_status'          => $filter_order_status,
			'filter_orderdate_added'        => $filter_orderdate_added,
			'filter_orderdate_end'        => $filter_orderdate_end
		);

		$last_monthorder = $this->model_sale_customer->getlastCustomerOrders($filter_data);
		$data['orders'] = array();
		$a=0;
			foreach ($last_monthorder as $result) {
			$data['orders'][] = array(
				'order_id'       => $result['order_id'],
				'order_no'       => $result['order_no'],   //订单号
				'customer'       => $result['customer'],
				'status'         => $result['status'],
				'orderstatus'    => $result['orderstatus'],  //order表的订单状态
				'total'          => $this->currency->format($result['total'], $result['currency_code'], $result['currency_value']),
				'date_added'     => date('Y-m-d H:i:s', strtotime($result['date_added'])),
				'date_modified'  => date('Y-m-d H:i:s', strtotime($result['date_modified'])),
				'shipping_code'  => $result['shipping_code'],
				'payment_method' => $result['payment_method'],
				'reading' => $result['reading'],
				'view'           => $this->url->link('sale/order/info', 'token=' . $this->session->data['token'] . '&order_id=' . $result['order_id'] , true)
			);
			$a+=$result['total'];
		}
		$data['zquantitys']=$a;
		$this->load->model('localisation/order_status');
		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
		// print_r($data['order_statuses']);exit;
		$a=explode(',',$filter_order_status);
		$data['filter_order_status'] = (array)$a;
		// $data['customer_id'] = $customer_id;
		$data['filter_orderdate_added'] = $filter_orderdate_added;
		$data['filter_orderdate_end'] = $filter_orderdate_end;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('sale/customerorder_list', $data));
	}



	public function autocomplete() {
		$json = array();

		if (isset($this->request->get['filter_name']) || isset($this->request->get['filter_email'])) {
			if (isset($this->request->get['filter_name'])) {
				$filter_name = $this->request->get['filter_name'];
			} else {
				$filter_name = '';
			}

			if (isset($this->request->get['filter_email'])) {
				$filter_email = $this->request->get['filter_email'];
			} else {
				$filter_email = '';
			}

			$this->load->model('customer/customer');

			$filter_data = array(
				'filter_name'  => $filter_name,
				'filter_email' => $filter_email,
				'start'        => 0,
				'limit'        => 5
			);

			$results = $this->model_customer_customer->getCustomers($filter_data);

			foreach ($results as $result) {
				$json[] = array(
					'customer_id'       => $result['customer_id'],
					'customer_group_id' => $result['customer_group_id'],
					'name'              => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
					'customer_group'    => $result['customer_group'],
					'firstname'         => $result['firstname'],
					'lastname'          => $result['lastname'],
					'email'             => $result['email'],
					'telephone'         => $result['telephone'],
					'fax'               => $result['fax'],
					'custom_field'      => json_decode($result['custom_field'], true),
					'address'           => $this->model_customer_customer->getAddresses($result['customer_id'])
				);
			}
		}

		$sort_order = array();

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	
}
