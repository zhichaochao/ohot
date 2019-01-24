<?php
class ControllerAccountCoupon extends Controller {

	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/coupon', '', true);

			$this->response->redirect($this->url->link('account/login', '', true));
		}

		$this->load->language('account/vip');
		$this->load->model('account/order');
		$this->load->model('account/customer_group');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$data['heading_title'] = $this->language->get('heading_title');

		if (isset($this->session->data['coupon'])) {
		    $data['coupon'] = $this->session->data['coupon'];
		} else {
		    $data['coupon'] = '';
		}
		$data['coupons']=$this->url->link('account/coupon', '', true);


		$this->load->model('catalog/review');
		$resultcoupon = $this->model_catalog_review->getCustomerCoupon();
		// print_r($resultcoupon);exit;
		if($resultcoupon){
			foreach ($resultcoupon as $result) {
				// $time=time();
				$data['rescoupons'][] = array(
					'coupon_id'=>$result['coupon_id'],
					'name'=>$result['name'],
					// 'type'=>$result['type'],
					// 'usecoupon'=>$result['usecoupon'],
			 		// 'discountp' 			=>floatval($result['discount']),
			 		'discount' 		=>$this->currency->format(floatval($result['discount']),$this->session->data['currency']),
			 		'total' 	=> $this->currency->format(floatval($result['total']),$this->session->data['currency']),
					// 'status' =>  strtotime($result['date_end'])>$time ? 0:1,
					'date_end' => date($this->language->get('date_format_short'), strtotime($result['date_end']))
					);

			}
		}

		$resultcouponun = $this->model_catalog_review->getCustomerCouponun();
		// print_r($resultcouponun);exit;
		if($resultcouponun){
			foreach ($resultcouponun as $result) {
				// $time=time();
				$data['rescouponsun'][] = array(
					'coupon_id'=>$result['coupon_id'],
					'name'=>$result['name'],
					// 'type'=>$result['type'],
					// 'usecoupon'=>$result['usecoupon'],
			 		// 'discountp' 			=>floatval($result['discount']),
			 		'discount' 		=>$this->currency->format(floatval($result['discount']),$this->session->data['currency']),
			 		'total' 	=> $this->currency->format(floatval($result['total']),$this->session->data['currency']),
					// 'status' =>  strtotime($result['date_end'])>$time ? 0:1,
					'date_end' => date($this->language->get('date_format_short'), strtotime($result['date_end']))
					);

			}
		}
		// print_r($data['rescouponsun']);exit;
		//引入该页面的css样式
		// $this->document->addStyle('catalog/view/theme/default/stylesheet/account/account_address.css');
		
	 //    //用户名
		// if (empty($this->customer->getFirstName()) && empty($this->customer->getLastName())) {
		// 	$account_url = $this->url->link('account/account');
		// 	$data['user_name'] = '<a href="'.$account_url.'">Please complete personal information!</a>';
		// } else {
		// 	$data['user_name'] = 'Dear '.$this->customer->getFirstName().' '.$this->customer->getLastName().' Welcome to Hot Beauty Hair Vip Clup';
		// }
        
		// //所有支付成功历史订单的价格总计
		// $result = $this->model_account_order->getHistoryOrderTotals($this->customer->getId());
		// if (!isset($result['order_totals'])) {
		// 	$data['order_total_num'] = 0;
		// 	$data['order_totals'] = $this->currency->format(0, $this->config->get('config_currency'));
		// } else {
		// 	$data['order_total_num'] = $result['order_totals'];
		// 	$data['order_totals'] = $this->currency->format($result['order_totals'], $this->config->get('config_currency'));
		// }

		// $data['orders'] = $result['orders'];
		
		// //获取下一个等级的金额
		// $next_level = $this->model_account_customer_group->getNextCustomerGroups();
		// if(!empty($next_level)){
		// 	$data['next_level'] = $this->currency->format($next_level['total_order']-$result['order_totals'], $this->config->get('config_currency'));
		// }else{
		// 	$data['next_level'] = $this->language->get('no_such_level');
		// }
		
		// //用户等级
		// $this->load->model('account/customer_group');
		// $customer_group_info = $this->model_account_customer_group->getCustomerGroup($this->customer->getGroupId());
		// $data['grade'] = $customer_group_info['name'];
		
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['account_left'] = $this->load->controller('account/left');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		
		$this->response->setOutput($this->load->view('account/coupon', $data));
	}
}
