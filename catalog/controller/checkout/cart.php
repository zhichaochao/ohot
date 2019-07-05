<?php
class ControllerCheckoutCart extends Controller {
	public function index() {
      
        $this->load->language('checkout/cart');

        $this->document->setTitle($this->language->get('heading_title'));

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'href' => $this->url->link('common/home'),
            'text' => $this->language->get('text_home')
        );

        $data['breadcrumbs'][] = array(
            'href' => $this->url->link('checkout/cart'),
            'text' => $this->language->get('heading_title')
        );

        if ($this->cart->hasProducts() || !empty($this->session->data['vouchers'])) {
            $data['heading_title'] = $this->language->get('heading_title');

            $data['text_recurring_item'] = $this->language->get('text_recurring_item');
            $data['text_next'] = $this->language->get('text_next');
            $data['text_next_choice'] = $this->language->get('text_next_choice');

            $data['column_image'] = $this->language->get('column_image');
            $data['column_name'] = $this->language->get('column_name');
            $data['column_model'] = $this->language->get('column_model');
            $data['column_quantity'] = $this->language->get('column_quantity');
            $data['column_price'] = $this->language->get('column_price');
            $data['column_total'] = $this->language->get('column_total');

            $data['button_update'] = $this->language->get('button_update');
            $data['button_remove'] = $this->language->get('button_remove');
            $data['button_shopping'] = $this->language->get('button_shopping');
            $data['button_checkout'] = $this->language->get('button_checkout');
        $data['vip'] = $this->url->link('account/vip', '', true);
        // $data['continueshopping'] = $this->url->link('product/category', '', true);
        if(isset($_SERVER['HTTP_REFERER'])){
            $data['continueshopping'] =$_SERVER['HTTP_REFERER'];
        }else{
            $data['continueshopping'] =$this->url->link('common/home');
        }
 // $data['error_warning']='';
            if (!$this->cart->hasStock() && (!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning'))) {
                $data['error_warning'] = $this->language->get('error_stock');
            } elseif (isset($this->session->data['error'])) {
                $data['error_warning'] = $this->session->data['error'];

                unset($this->session->data['error']);
            } else {
                $data['error_warning'] = '';
            }



            if ($this->config->get('config_customer_price') && !$this->customer->isLogged()) {
                $data['attention'] = sprintf($this->language->get('text_login'), $this->url->link('account/login'), $this->url->link('account/register'));
            } else {
                $data['attention'] = '';
            }

            if (isset($this->session->data['success'])) {
                $data['success'] = $this->session->data['success'];

                unset($this->session->data['success']);
            } else {
                $data['success'] = '';
            }

            //优惠券
            $data['coupon_url'] = $this->url->link('extension/total/coupon/coupon');
            if (isset($this->session->data['coupon'])) {
                $data['coupon'] = $this->session->data['coupon'];
            } else {
                $data['coupon'] = '';
            }

            $data['action'] = $this->url->link('checkout/cart/edit', '', true);

            if ($this->config->get('config_cart_weight')) {
                $data['weight'] = $this->weight->format($this->cart->getWeight(), $this->config->get('config_weight_class_id'), $this->language->get('decimal_point'), $this->language->get('thousand_point'));
            } else {
                $data['weight'] = '';
            }

            $this->load->model('tool/image');
            $this->load->model('tool/upload');
            $this->load->model('catalog/product');

            $data['products'] = array();

//            $products = $this->cart->getProducts();
//            var_dump($products);
            $products = $this->cart->getProducts();
         // print_r($products);die;
            $cart_total=0;
        
            foreach ($products as $product) {
                $product_total = 0;
                $cart_total+= $product['total'];

                foreach ($products as $product_2) {
                    if ($product_2['product_id'] == $product['product_id']) {
                        $product_total += $product_2['quantity'];
                    }
                }
               

                if ($product['minimum'] > $product_total) {
                    $data['error_warning'] = sprintf($this->language->get('error_minimum'), $product['name'], $product['minimum']);
                
                }

                // print_r($product['minimum'].'<br/>'.  $data['error_warning'] .$product['name'].'<br/>');

                if ($product['image']) {
                    $image = $this->model_tool_image->resize($product['image'], $this->config->get($this->config->get('config_theme') . '_image_cart_width'), $this->config->get($this->config->get('config_theme') . '_image_cart_height'));
                } else {
                    $image = '';
                }

                $option_data = array();

                foreach ($product['option'] as $option) {
                    if ($option['type'] != 'file') {
                        $value = $option['value'];
                    } else {
                        $upload_info = $this->model_tool_upload->getUploadByCode($option['value']);

                        if ($upload_info) {
                            $value = $upload_info['name'];
                        } else {
                            $value = '';
                        }
                    }

                    $option_data[] = array(
                        'name'  => $option['name'],
                        'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
                    );
                }

                // Display prices
                if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
                    $unit_price = $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'));
                    $original_price = $product['original_price']?($this->currency->format($product['original_price'], $this->session->data['currency'])):0;
                    $price = $this->currency->format($unit_price, $this->session->data['currency']);
                    $total = $this->currency->format($unit_price * $product['quantity'], $this->session->data['currency']);
                } else {
                    $price = false;
                    $original_price = false;
                    $total = false;
                }

                $recurring = '';

                if ($product['recurring']) {
                    $frequencies = array(
                        'day'        => $this->language->get('text_day'),
                        'week'       => $this->language->get('text_week'),
                        'semi_month' => $this->language->get('text_semi_month'),
                        'month'      => $this->language->get('text_month'),
                        'year'       => $this->language->get('text_year'),
                    );

                    if ($product['recurring']['trial']) {
                        $recurring = sprintf($this->language->get('text_trial_description'), $this->currency->format($this->tax->calculate($product['recurring']['trial_price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['trial_cycle'], $frequencies[$product['recurring']['trial_frequency']], $product['recurring']['trial_duration']) . ' ';
                    }

                    if ($product['recurring']['duration']) {
                        $recurring .= sprintf($this->language->get('text_payment_description'), $this->currency->format($this->tax->calculate($product['recurring']['price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['cycle'], $frequencies[$product['recurring']['frequency']], $product['recurring']['duration']);
                    } else {
                        $recurring .= sprintf($this->language->get('text_payment_cancel'), $this->currency->format($this->tax->calculate($product['recurring']['price'] * $product['quantity'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']), $product['recurring']['cycle'], $frequencies[$product['recurring']['frequency']], $product['recurring']['duration']);
                    }
                }
               $wishlist= $this->model_catalog_product->wishlistornot($product['product_id']);
                $data['products'][] = array(
                    'product_id'   => $product['product_id'],
                    'cart_id'   => $product['cart_id'],
                    'thumb'     => $image,
                    'name'      => $product['name'],
                    'model'     => $product['model'],
                    'option'    => $option_data,
                    'recurring' => $recurring,
                    'quantity'  => $product['quantity'],
                    'stock'     => $product['stock'] ? true : !(!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning')),
                    'reward'    => ($product['reward'] ? sprintf($this->language->get('text_points'), $product['reward']) : ''),
                    'price'     => $price,
                    'original_price' => $original_price,//原价
                    'total'     => $total,
                    'href'      => $this->url->link('product/product', 'product_id=' . $product['product_id']),
                    'wishlist'    =>$wishlist,
                
                );
            }
            // print_r(  $data['products']);exit();
            $data['wishlist_add'] = $this->url->link('account/wishlist/add', '', true);
            $data['delewishlist'] = $this->url->link('account/wishlist/delete', '', true);
            $data['information'] = $this->url->link('information/information','information_id=3');
            $data['return'] = $this->url->link('information/information','information_id=4');
            // Gift Voucher
            $data['vouchers'] = array();

            if (!empty($this->session->data['vouchers'])) {
                foreach ($this->session->data['vouchers'] as $key => $voucher) {
                    $data['vouchers'][] = array(
                        'key'         => $key,
                        'description' => $voucher['description'],
                        'amount'      => $this->currency->format($voucher['amount'], $this->session->data['currency']),
                        'remove'      => $this->url->link('checkout/cart', 'remove=' . $key)
                    );
                }
            }

          
            //$category_path=$this->get_category_path($nav['inside_id']);
            $data['url']=$this->url->link('product/category','', true);

            $data['continue'] = $this->url->link('common/home');

            $data['checkout'] = $this->url->link('checkout/checkout', '', true);

            $this->load->model('extension/extension');

            $data['modules'] = array();

            $files = glob(DIR_APPLICATION . '/controller/extension/total/*.php');


            if ($files) {
                foreach ($files as $file) {
                    $result = $this->load->controller('extension/total/' . basename($file, '.php'));

                    if ($result) {
                        $data['modules'][] = $result;
                    }
                }
            }


              $order_data = array();
            $totals = array();
            $taxes = $this->cart->getTaxes();
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
            $sort_order = array();
            foreach ($totals as $key => $value) {
                $sort_order[$key] = $value['sort_order'];
            }
            // print_r($totals);exit();
            array_multisort($sort_order, SORT_ASC, $totals);
            $order_data['totals'] = $totals;
            $data['totals'] = array();
            foreach ($order_data['totals'] as $total) {
                $data['totals'][] = array(
                    'title' => $total['title'],
                    'text'  => $this->currency->format($total['value'], $this->session->data['currency'])
                );
            }
            // print_r($products);exit;
            $this->load->model('checkout/addcart');
            $lowestAmount=$this->model_checkout_addcart->lowestAmount();
            if (ADD_CART&&$lowestAmount&&isset($lowestAmount['fullprice'])) {
                $data['fullprice']=$this->currency->format($lowestAmount['fullprice'],$this->session->data['currency']);
                $data['can_add']=$cart_total>$lowestAmount['fullprice']?true:false;
                $need_add=$lowestAmount['fullprice']-$cart_total;
                $data['need_add']=$this->currency->format( $need_add,$this->session->data['currency']);

            }

            $data['cart_total']=$this->currency->format($cart_total, $this->session->data['currency']);
          

            
            $this->session->data['cart_total']=$cart_total;
            $data['paypal_checkout'] = HTTP_SERVER.'index.php?route=extension/payment/pp_express/express';
            $data['step_cart'] = $this->language->get('step_cart');
            $data['step_checkout'] = $this->language->get('step_checkout');
            $data['step_payment'] = $this->language->get('step_payment');
            $data['text_update'] = $this->language->get('text_update');
            $data['text_cart_total'] = $this->language->get('text_cart_total');
            $data['text_back_to_shop'] = $this->language->get('text_back_to_shop');
            $data['proceed_to_checkout'] = $this->language->get('proceed_to_checkout');
            $data['text_cart_empty'] = $this->language->get('text_cart_empty');
            $data['checkout_title'] = $this->config->get('checkout_title');
            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');

           
            $this->response->setOutput($this->load->view('checkout/cart', $data));
         
        } else {
            // print_r('2');exit();
            $data['heading_title'] = $this->language->get('heading_title');

            $data['text_error'] = $this->language->get('text_empty');

            $data['button_continue'] = $this->language->get('button_continue');

            $data['continue'] = $this->url->link('product/category');
// $data['checkout_title'] = $this->config->get('checkout_title');
            unset($this->session->data['success']);
            $data['step_cart'] = $this->language->get('step_cart');
            $data['step_checkout'] = $this->language->get('step_checkout');
            $data['step_payment'] = $this->language->get('step_payment');
            $data['text_update'] = $this->language->get('text_update');
            $data['text_cart_total'] = $this->language->get('text_cart_total');
            $data['text_back_to_shop'] = $this->language->get('text_back_to_shop');
            $data['proceed_to_checkout'] = $this->language->get('proceed_to_checkout');
            $data['text_cart_empty'] = $this->language->get('text_cart_empty');
            $data['column_left'] = $this->load->controller('common/column_left');
            $data['column_right'] = $this->load->controller('common/column_right');
            $data['content_top'] = $this->load->controller('common/content_top');
            $data['content_bottom'] = $this->load->controller('common/content_bottom');
            $data['footer'] = $this->load->controller('common/footer');
            $data['header'] = $this->load->controller('common/header');
         
                $this->response->setOutput($this->load->view('checkout/cart_empty', $data));
           
        }
    }
    public function get_add_product() {

           
                    // $image = $this->model_tool_image->resize($addproduct['image'], $this->config->get($this->config->get('config_theme') . '_image_cart_width'), $this->config->get($this->config->get('config_theme') . '_image_cart_height'));
        $products = $this->cart->getProducts();
           $cart_total=0;
            foreach ($products as $key => $value) {
              $cart_total+=$value['total'];
           
            }

        $this->load->model('checkout/addcart');
          $lowestAmount=$this->model_checkout_addcart->lowestAmount();
         $products=array();
            if (ADD_CART&&$lowestAmount&&isset($lowestAmount['fullprice'])&&$cart_total>$lowestAmount['fullprice']) {

            $this->load->model('tool/image');
             $this->load->model('catalog/category');
            $products=$this->model_checkout_addcart->addcartproducts();
            if ($products) {
               foreach ($products as $key => $value) {
                   $products[$key]['image']=$this->model_tool_image->resize($value['image'], $this->config->get($this->config->get('config_theme') . '_image_cart_width'), $this->config->get($this->config->get('config_theme') . '_image_cart_height'));
                    $products[$key]['href'] =$this->url->link('product/product', 'product_id=' . $value['product_id']);
                    // 获取价格
                   $products[$key]['price']=$this->model_catalog_category->getAddProductPrices($value['product_id'],$cart_total);
                   $products[$key]['price']['addprice_format']=$this->currency->format( $products[$key]['price']['addprice'],$this->session->data['currency']); 
                    $products[$key]['price']['fullprice_format']=$this->currency->format( $products[$key]['price']['fullprice'],$this->session->data['currency']);
                    $products[$key]['price']['originalprice_format']=$this->currency->format( $products[$key]['price']['originalprice'],$this->session->data['currency']);


               }
            }
        }
        $data['products']=$products;

        // print_r($products);exit();

        $this->response->setOutput($this->load->view('checkout/add_product', $data));
             // print_r($data['addproducts']);exit;
    }

      public function getalltotal()
    {
        $products = $this->cart->getProducts();
           $cart_total=0;
            foreach ($products as $key => $value) {
              $cart_total+=$value['total'];
           
            }

        $this->load->model('checkout/addcart');
          $lowestAmount=$this->model_checkout_addcart->lowestAmount();
         $products=array();
            if (ADD_CART&&$lowestAmount&&isset($lowestAmount['fullprice'])&&$cart_total>$lowestAmount['fullprice']) {
               $add_total= $this->model_checkout_addcart->addcarttotal($cart_total);
              $cart_total+= $add_total['total'];
            }
           $json['total']=$this->currency->format(  $cart_total,$this->session->data['currency']);

             $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));

    }
// 删除加购购物车上的产品
    public function del_add_product()
    {
        $json=array();
         if (isset($this->request->post['cart_id'])) {
            $cart_id = (int)$this->request->post['cart_id'];
              $this->load->model('checkout/addcart');
              $this->model_checkout_addcart->del_add_product_by_cart_id( $cart_id );
        }
         $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));

    }


   
// 获取参与加购的产品
    public function add_product() {
             $this->load->model('checkout/addcart');
                $this->load->model('tool/image');
                 $this->load->model('catalog/category');
               $products = $this->cart->getProducts();
           $cart_total=0;
            foreach ($products as $key => $value) {
              $cart_total+=$value['total'];
           
            }

            $lowestAmount=$this->model_checkout_addcart->lowestAmount();
            if (ADD_CART&&$lowestAmount&&isset($lowestAmount['fullprice'])) {
                $data['fullprice']=$this->currency->format($lowestAmount['fullprice'],$this->session->data['currency']);
                $data['can_add']=$cart_total>$lowestAmount['fullprice']?true:false;
                $need_add=$lowestAmount['fullprice']-$cart_total;
                $data['need_add']=$this->currency->format( $need_add,$this->session->data['currency']);

            }
           
            $products=$this->model_catalog_category->getAddProduct(ADD_CART_CATEGPRY_ID,$cart_total);
            // print_r( $products);exit();
            if ($products) {
               foreach ($products as $key => $value) {
                    if (isset($value['price']['addprice'])) {

                        $products[$key]['image'] = $this->model_tool_image->resize($value['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                         $products[$key]['price']['addprice_format']=$this->currency->format( $products[$key]['price']['addprice'],$this->session->data['currency']); 
                         $products[$key]['price']['fullprice_format']=$this->currency->format( $products[$key]['price']['fullprice'],$this->session->data['currency']);
                         $products[$key]['price']['originalprice_format']=$this->currency->format( $products[$key]['price']['originalprice'],$this->session->data['currency']);
                         $products[$key]['href'] =$this->url->link('product/product', 'product_id=' . $value['product_id']);

                            //是否在购物车上
                         foreach ( $value['options'] as $k => $val) {
                         
                                $option=$this->getoptionbyoptionvalueid($value['product_id'],$val['product_option_value_id']);
                                $products[$key]['options'][$k]['num']=$this->model_checkout_addcart->product_in_cart($value['product_id'],$option)?$this->model_checkout_addcart->product_in_cart($value['product_id'],$option):0;
                            }
                         // 计算已经在加购购物车上的
                    }else{
                     
                        unset( $products[$key]);

                   }
                }
            }
            $data['products']=$products;
            $addcart_total=$this->model_checkout_addcart->addcarttotal($cart_total);
             $data['addcart_total']=$this->currency->format( $addcart_total['total'],$this->session->data['currency']);
               $data['quantity']=$addcart_total['quantity'];
            // print_r($products);exit();

             $this->response->setOutput($this->load->view('checkout/cart_add_product', $data));


    }
    // 补齐产品的option
        public function getoptionbyoptionvalueid($product_id,$product_option_value_id)
    {
            $this->load->model('catalog/product');
            $product_options = $this->model_catalog_product->getAddcartProductOptions($product_id,$product_option_value_id);
             foreach($product_options as $key=>$value){
                // foreach($value['product_option_value'] as $k=>$v){
                    $option[$value['product_option_id']] = $value['product_option_value']['product_option_value_id'];
                // }
            }
            return $option;
    }
     // 加购产品加入购车
    public function add_product_to_addcart() {
        $this->load->language('checkout/cart');

        $json = array();

        if (isset($this->request->post['product_id'])) {
            $product_id = (int)$this->request->post['product_id'];
        } else {
            $product_id = 0;
        }

        $this->load->model('catalog/product');
        $this->load->model('checkout/addcart');
        $product_info = $this->model_catalog_product->getProduct($product_id);
       $add_quantity= $this->model_checkout_addcart->addcartquantity();
        if ($add_quantity>ADD_CART_QUANTITY) {
            $json['error']='Up to '.ADD_CART_QUANTITY." products";
          
        }else{
                if ($product_info) {
                    if (isset($this->request->post['num']) && ((int)$this->request->post['num'] >= $product_info['minimum'])) {
                        $quantity = (int)$this->request->post['num'];
                    } else {
                        $quantity = $product_info['minimum'] ? $product_info['minimum'] : 1;
                    }
                    // print_r($this->request->post['quantity']);exit();
                     if (isset($this->request->post['product_option_value_id'])) {
                        $product_option_value_id = $this->request->post['product_option_value_id'];
                    } else {
                        $product_option_value_id = array();
                    }
                    $option=$this->getoptionbyoptionvalueid($product_id,$product_option_value_id);
                 
                    // print_r($option)

                if ($this->model_checkout_addcart->product_in_cart($product_id,$option)) {
                   $this->model_checkout_addcart->update_product_in_cart($product_id,$option,$this->request->post['num']);
                }else{
              
                    $this->cart->addproduct($this->request->post['product_id'], $quantity, $option);
                }

                    
                }

                $products = $this->cart->getProducts();
               $cart_total=0;
                foreach ($products as $key => $value) {
                  $cart_total+=$value['total'];
               
                }

                $json['most']=ADD_CART_QUANTITY;
                 $addcart_total=$this->model_checkout_addcart->addcarttotal($cart_total);
                 $json['addcart_total']=$this->currency->format( $addcart_total['total'],$this->session->data['currency']);
                $json['quantity']=$addcart_total['quantity'];
                // $json
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));

    }

    public function add() {
        // $products=$this->request->post['product_id'];
        // var_dump($products);die;
		$this->load->language('checkout/cart');

		$json = array();

		if (isset($this->request->post['product_id'])) {
			$product_id = (int)$this->request->post['product_id'];
		} else {
			$product_id = 0;
		}

		$this->load->model('catalog/product');

		$product_info = $this->model_catalog_product->getProduct($product_id);

		if ($product_info) {
			if (isset($this->request->post['quantity']) && ((int)$this->request->post['quantity'] >= $product_info['minimum'])) {
				$quantity = (int)$this->request->post['quantity'];
			} else {
				$quantity = $product_info['minimum'] ? $product_info['minimum'] : 1;
			}
            // print_r($this->request->post['quantity']);exit();

			if (isset($this->request->post['option'])) {
				$option = array_filter($this->request->post['option']);
			} else {
				$option = array();
			}

            $product_options = $this->model_catalog_product->getProductOptions($this->request->post['product_id']);

//			foreach ($product_options as $product_option) {
//				if ($product_option['required'] && empty($option[$product_option['product_option_id']])) {
//					$json['error']['option'][$product_option['product_option_id']] = sprintf($this->language->get('error_required'), $product_option['name']);
//				}
//			}

			if (isset($this->request->post['recurring_id'])) {
				$recurring_id = $this->request->post['recurring_id'];
			} else {
				$recurring_id = 0;
			}

			$recurrings = $this->model_catalog_product->getProfiles($product_info['product_id']);

			if ($recurrings) {
				$recurring_ids = array();

				foreach ($recurrings as $recurring) {
					$recurring_ids[] = $recurring['recurring_id'];
				}

				if (!in_array($recurring_id, $recurring_ids)) {
					$json['error']['recurring'] = $this->language->get('error_recurring_required');
				}
			}

 // print_r($option);exit();
			if (!$json) {

				$this->cart->add($this->request->post['product_id'], $quantity, $option, $recurring_id);

				$json['success'] = sprintf($this->language->get('text_success'), $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']), $product_info['name'], $this->url->link('checkout/cart'));

				// Unset all shipping and payment methods
				unset($this->session->data['shipping_method']);
				unset($this->session->data['shipping_methods']);
				unset($this->session->data['payment_method']);
				unset($this->session->data['payment_methods']);

				// Totals
				$this->load->model('extension/extension');

				$totals = array();
				$taxes = $this->cart->getTaxes();
				$total = 0;
		
				// Because __call can not keep var references so we put them into an array. 			
				$total_data = array(
					'totals' => &$totals,
					'taxes'  => &$taxes,
					'total'  => &$total
				);

				// Display prices
				if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
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

					$sort_order = array();

					foreach ($totals as $key => $value) {
						$sort_order[$key] = $value['sort_order'];
					}

					array_multisort($sort_order, SORT_ASC, $totals);
				}

				$json['total'] = sprintf($this->language->get('text_items'), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0), $this->currency->format($total, $this->session->data['currency']));
                $json['total'] = $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0);
			} else {
				$json['redirect'] = str_replace('&amp;', '&', $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']));
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

    public function edit_ajax() {
        $this->load->language('checkout/cart');

        $json = array();

        // Update
        if (!empty($this->request->post['num'])&&!empty($this->request->post['cart_id'])) {
            $this->cart->update($this->request->post['cart_id'], $this->request->post['num']);
            $this->session->data['success'] = $this->language->get('text_remove');
            unset($this->session->data['shipping_method']);
            unset($this->session->data['shipping_methods']);
            unset($this->session->data['payment_method']);
            unset($this->session->data['payment_methods']);
            unset($this->session->data['reward']);

        }
            $products = $this->cart->getProducts();
            $total=array();
            $total['total']=0;
            $k=0;
            foreach ($products as $key => $value) {
               $total[$k]['value']=$this->currency->format($value['total'], $this->session->data['currency']);
                $total[$k]['cart_id']=$value['cart_id'];
               $total['total']+=$value['total'];
               $k++;
            }
            $json['total']=$this->currency->format($total['total'], $this->session->data['currency']);
            $json['totals']=$total['total'];
            $this->load->model('checkout/addcart');
            $lowestAmount=$this->model_checkout_addcart->lowestAmount();
            if (ADD_CART&&$lowestAmount&&isset($lowestAmount['fullprice'])) {
                $json['fullprice']=$this->currency->format($lowestAmount['fullprice'],$this->session->data['currency']);
                $json['can_add']=$total['total']>$lowestAmount['fullprice']?true:false;
                $need_add=$lowestAmount['fullprice']-$total['total'];
                $json['need_add']=$this->currency->format( $need_add,$this->session->data['currency']);

            }


            unset($total['total']);
             $json['products']=$total;
             $this->session->data['cart_total']=$json['totals'];
$json['text_cart_items'] = $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0);
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
  
    public function edit_ajaxsx() {
        $this->load->language('checkout/cart');

        $json = array();

        // Update
        if (!empty($this->request->post['num'])&&!empty($this->request->post['cart_id'])) {
            $this->cart->update($this->request->post['cart_id'], $this->request->post['num']);
            $this->session->data['success'] = $this->language->get('text_remove');
            unset($this->session->data['shipping_method']);
            unset($this->session->data['shipping_methods']);
            unset($this->session->data['payment_method']);
            unset($this->session->data['payment_methods']);
            unset($this->session->data['reward']);

        }
            $this->load->model('extension/extension');

        $totals = array();
        $taxes = $this->cart->getTaxes();
        $total = 0;

        // Because __call can not keep var references so we put them into an array.
        $total_data = array(
            'totals' => &$totals,
            'taxes'  => &$taxes,
            'total'  => &$total
        );

        // Display prices
        if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
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

            $sort_order = array();

            foreach ($totals as $key => $value) {
                $sort_order[$key] = $value['sort_order'];
            }

            array_multisort($sort_order, SORT_ASC, $totals);
        }

        $data['atotals'] = array();

        foreach ($totals as $total) {
            $json['atotals'][] = array(
                'title' => $total['title'],
                'text'  => $this->currency->format($total['value'], $this->session->data['currency']),
            );
        }

            $products = $this->cart->getProducts();
            $total=array();
            $total['total']=0;
            $k=0;
            foreach ($products as $key => $value) {
               $total[$k]['value']=$this->currency->format($value['total'], $this->session->data['currency']);
                $total[$k]['cart_id']=$value['cart_id'];
               $total['total']+=$value['total'];
               $k++;
            }
            $json['total']=$this->currency->format($total['total'], $this->session->data['currency']);
            $json['totals']=$total['total'];
            unset($total['total']);
             // $json['products']=$total;
             $this->session->data['cart_total']=$json['totals'];
        $json['text_cart_items'] = $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0);
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }
    public function change_cart_id() {
        $this->load->language('checkout/cart');

        $json = array();

        // Update
        if (!empty($this->request->post['cart_id'])) {
           $json['cart_id']=$this->request->post['cart_id'];
           $this->session->data['cart_ids']=implode(',', $json['cart_id']);
            unset($this->session->data['shipping_method']);
            unset($this->session->data['shipping_methods']);
            unset($this->session->data['payment_method']);
            unset($this->session->data['payment_methods']);
            unset($this->session->data['reward']);

        }
            $products = $this->cart->getProducts( $this->session->data['cart_ids']);
            $total=array();
            $total['total']=0;
            $k=0;
            foreach ($products as $key => $value) {
               $total[$k]['value']=$this->currency->format($value['total'], $this->session->data['currency']);
                $total[$k]['cart_id']=$value['cart_id'];
               $total['total']+=$value['total'];
            }
            $json['total']=$this->currency->format($total['total'], $this->session->data['currency']);
            unset($total['total']);
             $json['products']=$total;
            

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

    public function edit() {
        $this->load->language('checkout/cart');

        $json = array();

        // Update
        if (!empty($this->request->post['quantity'])) {
            foreach ($this->request->post['quantity'] as $key => $value) {
                $this->cart->update($key, $value);
            }

            $this->session->data['success'] = $this->language->get('text_remove');

            unset($this->session->data['shipping_method']);
            unset($this->session->data['shipping_methods']);
            unset($this->session->data['payment_method']);
            unset($this->session->data['payment_methods']);
            unset($this->session->data['reward']);

            $this->response->redirect($this->url->link('checkout/cart'));
        }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }

	public function remove() {
		$this->load->language('checkout/cart');

		$json = array();

		// Remove
		if (isset($this->request->post['key'])) {

			//$this->cart->remove($this->request->post['key']);
			//unset($this->session->data['vouchers'][$this->request->post['key']]);

            //dyl改
            $key_array = explode(';',$this->request->post['key']);
            if(!empty($key_array[1])){      //多个值
              foreach($key_array as $v){
              	 $this->request->post['key'] = $v;
                 $this->cart->remove($this->request->post['key']);
			     unset($this->session->data['vouchers'][$this->request->post['key']]);
              }
            }else{                          //一个值
              $this->cart->remove($this->request->post['key']);
			  unset($this->session->data['vouchers'][$this->request->post['key']]);
            }
            //dyl改,end

			$json['success'] = $this->language->get('text_remove');

			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']);
			unset($this->session->data['reward']);

			// Totals
			$this->load->model('extension/extension');

			$totals = array();
			$taxes = $this->cart->getTaxes();
			$total = 0;

			// Because __call can not keep var references so we put them into an array.
			$total_data = array(
				'totals' => &$totals,
				'taxes'  => &$taxes,
				'total'  => &$total
			);

			// Display prices
			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
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

				$sort_order = array();

				foreach ($totals as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
				}

				array_multisort($sort_order, SORT_ASC, $totals);
			}

            $json['link'] = $this->url->link('checkout/cart','',true);   //dyl加
			$json['total'] = sprintf($this->language->get('text_items'), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0), $this->currency->format($total, $this->session->data['currency']));
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function arr_sort($array,$key,$order="asc"){  //asc是升序 desc是降序
        $arr_nums=$arr=array();
        foreach($array as $k=>$v){
          $arr_nums[$k]=$v[$key];
        }
        if($order=='asc'){
        asort($arr_nums);
        }else{
        arsort($arr_nums);
        }
        foreach($arr_nums as $k=>$v){
        $arr[$k]=$array[$k];
        }
        return $arr;
    }

    public function share(){
	    if(isset($this->request->post['option'])){
	        $option = $this->request->post['option'];
            $url = HTTP_SERVER.'index.php?route=product/product&product_id='.$this->request->post['product_id'].'&share='.json_encode($option);
        }else{
            $url = HTTP_SERVER.'index.php?route=product/product&product_id='.$this->request->post['product_id'];
        }
        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($url));
    }
}
