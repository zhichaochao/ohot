<?php
class ControllerCheckoutPaymentMethod extends Controller {
	public function index() {
		$this->load->language('checkout/checkout');

		if (isset($this->session->data['payment_address'])) {
			// Totals
			$totals = array();
			$taxes = $this->cart->getTaxes();
			$total = 0;

			// Because __call can not keep var references so we put them into an array.
			$total_data = array(
				'totals' => &$totals,
				'taxes'  => &$taxes,
				'total'  => &$total
			);

			$this->load->model('extension/extension');

			$sort_order = array();

			$results = $this->model_extension_extension->getExtensions('total');

			foreach ($results as $key => $value) {
				$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
			}

			array_multisort($sort_order, SORT_ASC, $results);

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('extension/total/' . $result['code']);

					// We have to put the totals in an array so that they pass by reference.
					$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
				}
			}

			// Payment Methods
			$method_data = array();

			$this->load->model('extension/extension');

			$results = $this->model_extension_extension->getExtensions('payment');

			$recurring = $this->cart->hasRecurringProducts();
			// print_r($this->session->data['shipping_address']);exit();
			$country_id=$this->session->data['shipping_address']['country_id'];
			// print_r($country_id);
			// print_r($results);exit();

			foreach ($results as $result) {
				// 只有尼日利亚才显示尼日利亚支付
				if ($this->config->get($result['code'] . '_status')&&($result['code']!='naria_account'||($result['code']=='naria_account'&&$country_id==156))) {
					$this->load->model('extension/payment/' . $result['code']);

					$method = $this->{'model_extension_payment_' . $result['code']}->getMethod($this->session->data['payment_address'], $total);

					if ($method) {
						if ($recurring) {
							if (property_exists($this->{'model_extension_payment_' . $result['code']}, 'recurringPayments') && $this->{'model_extension_payment_' . $result['code']}->recurringPayments()) {
								$method_data[$result['code']] = $method;
							}
						} else {
							$method_data[$result['code']] = $method;
						}
					}
				}
			}

			$sort_order = array();

			foreach ($method_data as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}

			array_multisort($sort_order, SORT_ASC, $method_data);

			$this->session->data['payment_methods'] = $method_data;
			if (!isset($this->session->data['payment_method']['code']) || !isset($method_data[$this->session->data['payment_method']['code']]))
			    $this->session->data['payment_method'] = current($method_data);
		}

		$data['text_payment_method'] = $this->language->get('text_payment_method');
		$data['text_comments'] = $this->language->get('text_comments');
		$data['text_loading'] = $this->language->get('text_loading');

		$data['button_continue'] = $this->language->get('button_continue');

		if (empty($this->session->data['payment_methods'])) {
			$data['error_warning'] = sprintf($this->language->get('error_no_payment'), $this->url->link('information/contact'));
		} else {
			$data['error_warning'] = '';
		}
		// print_r($this->session->data['payment_methods']);exit();

		if (isset($this->session->data['payment_methods'])) {
			$data['payment_methods'] = $this->session->data['payment_methods'];
		} else {
			$data['payment_methods'] = array();
		}

		if (isset($this->session->data['payment_method']['code'])) {
			$data['code'] = $this->session->data['payment_method']['code'];
			$this->session->data['payment_code'] = $this->session->data['payment_method']['code'];
		} else {
			$data['code'] = '';
		}

		if(isset($this->session->data['is_paypal_creditcard'])){
		    $data['is_paypal_creditcard'] = $this->session->data['is_paypal_creditcard'];
		}else{
		    $data['is_paypal_creditcard'] = 0;
		}

		$data['scripts'] = $this->document->getScripts();

		if ($this->config->get('config_checkout_id')) {
			$this->load->model('catalog/information');

			$information_info = $this->model_catalog_information->getInformation($this->config->get('config_checkout_id'));

			if ($information_info) {
				$data['text_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information/information/agree', 'information_id=' . $this->config->get('config_checkout_id'), true), $information_info['title'], $information_info['title']);
			} else {
				$data['text_agree'] = '';
			}
		} else {
			$data['text_agree'] = '';
		}
		$data['checkout']=$this->url->link('checkout/checkout');
		$this->response->setOutput($this->load->view('checkout/payment_method', $data));
	}

	public function wap() {
		$this->load->language('checkout/checkout');
		if ((!$this->cart->hasProducts() && empty($this->session->data['payment_address'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
			$this->response->redirect($this->url->link('checkout/checkout'));
		}
		$this->session->data['shipping_address']['cart_ids']=$this->session->data['cart_ids'];
         $data['cart_ids']= $this->session->data['cart_ids'];
        // print_r($this->session->data['cart_ids']);exit;
		if (isset($this->session->data['payment_address'])) {
			// Totals
			$totals = array();
			$taxes = $this->cart->getTaxes();
			$total = 0;

			// Because __call can not keep var references so we put them into an array.
			$total_data = array(
				'totals' => &$totals,
				'taxes'  => &$taxes,
				'total'  => &$total
			);

			$this->load->model('extension/extension');

			$sort_order = array();

			$results = $this->model_extension_extension->getExtensions('total');

			foreach ($results as $key => $value) {
				$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
			}

			array_multisort($sort_order, SORT_ASC, $results);

			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('extension/total/' . $result['code']);

					// We have to put the totals in an array so that they pass by reference.
					$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
				}
			}

			// Payment Methods
			$method_data = array();

			$this->load->model('extension/extension');

			$results = $this->model_extension_extension->getExtensions('payment');

			$recurring = $this->cart->hasRecurringProducts();
			// print_r($this->session->data['shipping_address']);exit();
			$country_id=$this->session->data['shipping_address']['country_id'];
			// print_r($country_id);
			// print_r($results);exit();

			foreach ($results as $result) {
				// 只有尼日利亚才显示尼日利亚支付
				if ($this->config->get($result['code'] . '_status')&&($result['code']!='naria_account'||($result['code']=='naria_account'&&$country_id==156))) {
					$this->load->model('extension/payment/' . $result['code']);

					$method = $this->{'model_extension_payment_' . $result['code']}->getMethod($this->session->data['payment_address'], $total);

					if ($method) {
						if ($recurring) {
							if (property_exists($this->{'model_extension_payment_' . $result['code']}, 'recurringPayments') && $this->{'model_extension_payment_' . $result['code']}->recurringPayments()) {
								$method_data[$result['code']] = $method;
							}
						} else {
							$method_data[$result['code']] = $method;
						}
					}
				}
			}

			$sort_order = array();

			foreach ($method_data as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}

			array_multisort($sort_order, SORT_ASC, $method_data);

			$this->session->data['payment_methods'] = $method_data;
			if (!isset($this->session->data['payment_method']['code']) || !isset($method_data[$this->session->data['payment_method']['code']]))
			    $this->session->data['payment_method'] = current($method_data);
		}

		$data['text_payment_method'] = $this->language->get('text_payment_method');
		$data['text_comments'] = $this->language->get('text_comments');
		$data['text_loading'] = $this->language->get('text_loading');

		$data['button_continue'] = $this->language->get('button_continue');

		if (empty($this->session->data['payment_methods'])) {
			$data['error_warning'] = sprintf($this->language->get('error_no_payment'), $this->url->link('information/contact'));
		} else {
			$data['error_warning'] = '';
		}
		// print_r($this->session->data['payment_methods']);exit();

		if (isset($this->session->data['payment_methods'])) {
			$data['payment_methods'] = $this->session->data['payment_methods'];
		} else {
			$data['payment_methods'] = array();
		}

		if (isset($this->session->data['payment_method']['code'])) {
			$data['code'] = $this->session->data['payment_method']['code'];
			$this->session->data['payment_code'] = $this->session->data['payment_method']['code'];
		} else {
			$data['code'] = '';
		}

		if(isset($this->session->data['is_paypal_creditcard'])){
		    $data['is_paypal_creditcard'] = $this->session->data['is_paypal_creditcard'];
		}else{
		    $data['is_paypal_creditcard'] = 0;
		}

		$data['scripts'] = $this->document->getScripts();

		if ($this->config->get('config_checkout_id')) {
			$this->load->model('catalog/information');

			$information_info = $this->model_catalog_information->getInformation($this->config->get('config_checkout_id'));

			if ($information_info) {
				$data['text_agree'] = sprintf($this->language->get('text_agree'), $this->url->link('information/information/agree', 'information_id=' . $this->config->get('config_checkout_id'), true), $information_info['title'], $information_info['title']);
			} else {
				$data['text_agree'] = '';
			}
		} else {
			$data['text_agree'] = '';
		}
		   $data['header'] = $this->load->controller('common/header');
		$data['checkout']=$this->url->link('checkout/checkout');
		 $total = 0;
		    
		    $total_data = array(
		        'totals' => &$totals,
		        'taxes'  => &$taxes,
		        'total'  => &$total
		    );
		    // print_r($total_data);exit();
		    $this->load->model('extension/extension');
		    $sort_order = array();
		    $results = $this->model_extension_extension->getExtensions('total');
		    
		    foreach ($results as $key => $value) {
		        $sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
		    }

		    array_multisort($sort_order, SORT_ASC, $results);
		       // print_r($results);exit();
		    foreach ($results as $result) {
		        if ($this->config->get($result['code'] . '_status')) {
		            $this->load->model('extension/total/' . $result['code']);
		            // We have to put the totals in an array so that they pass by reference.

		            $this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
		        }
		    }
		    $total=0;
		    // $sort_order = array();
		    foreach ($totals as $key => $value) {
		        $sort_order[$key] = $value['sort_order'];
		        if ($value['code']=='sub_total') {
		        	$total=$value['value'];
		        }
		    }
		    	        // 加购购物车
	        $this->load->model('checkout/addcart');
			$lowestAmount=$this->model_checkout_addcart->lowestAmount();
			$add_cart=false;
            if (ADD_CART&&$lowestAmount&&isset($lowestAmount['fullprice'])&&$total>$lowestAmount['fullprice']) {
    		$add_cart=true;
				$add_total=$this->model_checkout_addcart->addcarttotal($total);
				
				$totals[]=array(
					'code'=>'addcart',
					'title'=>'Value+ Products Total',
					'value'=>$add_total['total'],
					'sort_order'=>2,
				);
				foreach ($totals as $key => $value) {
		    
		            if ($value['code']=='total') {
		            	$totals[$key]['value']+=$add_total['total'];
		            }
		        
		        }

				$total+=$add_total['total'];

            }



		    // print_r($totals);exit();
		    // array_multisort($sort_order, SORT_ASC, $totals);
		   // $totals;
		   $data['total']= $this->currency->format($total, $this->session->data['currency']);
$data['checkoutdas']=$this->url->link('checkout/checkout', '',true);
	$data['shipping_method_url'] = $this->url->link('checkout/shipping_method/wap', '', true);
$data['comment'] = isset($this->session->data['comment'])?$this->session->data['comment']:'';

		$this->response->setOutput($this->load->view('checkout/payment_method_wap', $data));
	}


	public function total() {
		$this->load->language('checkout/checkout');

		$json = array();
				 $total = 0;
		    
		    $total_data = array(
		        'totals' => &$totals,
		        'taxes'  => &$taxes,
		        'total'  => &$total
		    );
		    // print_r($total_data);exit();
		    $this->load->model('extension/extension');
		    $sort_order = array();
		    $results = $this->model_extension_extension->getExtensions('total');
		    
		    foreach ($results as $key => $value) {
		        $sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
		    }

		    array_multisort($sort_order, SORT_ASC, $results);
		       // print_r($results);exit();
		    foreach ($results as $result) {
		        if ($this->config->get($result['code'] . '_status')) {
		            $this->load->model('extension/total/' . $result['code']);
		            // We have to put the totals in an array so that they pass by reference.

		            $this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
		        }
		    }
		    $total=0;
		    // $sort_order = array();
		    foreach ($totals as $key => $value) {
		        $sort_order[$key] = $value['sort_order'];
		        if ($value['code']=='sub_total') {
		        	$total=$value['value'];
		        }
		    }
		    // 加购购物车
		   $this->load->model('checkout/addcart');
			$lowestAmount=$this->model_checkout_addcart->lowestAmount();
			$add_cart=false;
            if (ADD_CART&&$lowestAmount&&isset($lowestAmount['fullprice'])&&$total>$lowestAmount['fullprice']) {
    		$add_cart=true;
				$add_total=$this->model_checkout_addcart->addcarttotal($total);
				
				$totals[]=array(
					'code'=>'addcart',
					'title'=>'Value+ Products Total',
					'value'=>$add_total['total'],
					'sort_order'=>2,
				);
				foreach ($totals as $key => $value) {
		    
		            if ($value['code']=='total') {
		            	$totals[$key]['value']+=$add_total['total'];
		            }
		        
		        }

				$total+=$add_total['total'];

            }

		    // print_r($totals);exit();
		    // array_multisort($sort_order, SORT_ASC, $totals);
		   // $totals;
		   $json['total']= $this->currency->format($total, $this->session->data['currency']);
		   $payment_type = isset($this->session->data['payment_type'])?$this->session->data['payment_type']:'';
		   $cart_ids=isset($this->session->data['cart_ids'])?$this->session->data['cart_ids']:'';
		
		   if ($payment_type=='Express') {
		   		$json['url']='index.php?route=extension/payment/pp_express/expressComplete&cart_ids='.$cart_ids;
		   }else{
		   	 	$json['url']='index.php?route=checkout/confirm/save&cart_ids='.$cart_ids;
		   }
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));

	}


	public function save() {
		$this->load->language('checkout/checkout');

		$json = array();

		// Validate if payment address has been set.
		if (!isset($this->session->data['payment_address'])) {
			$json['redirect'] = $this->url->link('checkout/checkout', '', true);
		}

		// Validate cart has products and has stock.
		if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
			$json['redirect'] = $this->url->link('checkout/cart');
		}

		// Validate minimum quantity requirements.
		$products = $this->cart->getProducts();

		foreach ($products as $product) {
			$product_total = 0;

			foreach ($products as $product_2) {
				if ($product_2['product_id'] == $product['product_id']) {
					$product_total += $product_2['quantity'];
				}
			}

			if ($product['minimum'] > $product_total) {
				$json['redirect'] = $this->url->link('checkout/cart');

				break;
			}
		}

		if (!isset($this->request->post['payment_method'])) {
			$json['error']['warning'] = $this->language->get('error_payment');
		} elseif (!isset($this->session->data['payment_methods'][$this->request->post['payment_method']])) {
			$json['error']['warning'] = $this->language->get('error_payment');
		}

// 		if ($this->config->get('config_checkout_id')) {
// 			$this->load->model('catalog/information');

// 			$information_info = $this->model_catalog_information->getInformation($this->config->get('config_checkout_id'));

// 			if ($information_info && !isset($this->request->post['agree'])) {
// 				$json['error']['warning'] = sprintf($this->language->get('error_agree'), $information_info['title']);
// 			}
// 		}

		if (!$json) {
			$this->session->data['payment_method'] = $this->session->data['payment_methods'][$this->request->post['payment_method']];
			$this->session->data['payment_code'] = $this->session->data['payment_method']['code'];
			$this->session->data['is_paypal_creditcard'] = $this->request->post['is_paypal_creditcard'];
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}

