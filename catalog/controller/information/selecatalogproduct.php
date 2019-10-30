<?php
	/**
     * 
     * 获取 PC和移动端 产品列表控制器
     */
class ControllerInformationSelecatalogproduct extends Controller {
		// 获取PC端 子分类 产品列表
		public function index()
		{
			$this->load->language('information/contact');
			$this->document->setTitle($this->language->get('heading_titles'));
			$this->load->model('catalog/customized');
			$this->load->model('tool/image');
			 if (isset($this->request->get['inside_id'])) {
			 	$category_id=$this->request->get['inside_id'];
			 	$data['value_status']=$this->request->get['value_status'];

			 	$filter_data = array(
				'filter_category_id' => $category_id,
				'filter_sub_category' => true,      
				'filter_filter'      => '',
				'sort'               => 'p.sort_order',
				'order'              => 'ASC'
			);
			 	$results = $this->model_catalog_customized->getProducts($filter_data);
			 	// print_r($results);exit;
			 	foreach ($results as $result) {
			 		// 产品照片
			 		if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
					}
					// 产品属性
					$data['options'] = array();
		            $options=$this->model_catalog_customized->getProductOptions($result['product_id']);
			 		$data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'price'       => $this->currency->format($result['price'],$this->session->data['currency']),
					'special'     => $result['special']>0? $this->currency->format($result['special'],$this->session->data['currency']) : '',
					'options'       => $options
					);
			 	}
			 	// print_r($data['products']);exit;
			 }
			$data['breadcrumbs'] = array();

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_home'),
				'href' => $this->url->link('common/home')
			);
			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
			

			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
			$this->response->setOutput($this->load->view('information/selecatalogproduct', $data));
			
			}
		// 获取移动端 子分类 产品列表
		public function ydselecatalogproduct()
		{
			$this->load->language('information/contact');
			$this->document->setTitle($this->language->get('heading_titles'));
			$this->load->model('catalog/customized');
			$this->load->model('tool/image');
			 if (isset($this->request->get['inside_id'])) {
			 	$category_id=$this->request->get['inside_id'];
			 	$data['value_status']=$this->request->get['value_status'];

			 	$filter_data = array(
				'filter_category_id' => $category_id,
				'filter_sub_category' => true,       
				'filter_filter'      => '',
				'sort'               => 'p.sort_order',
				'order'              => 'ASC'
			);
			 	$results = $this->model_catalog_customized->getProducts($filter_data);
			 	// print_r($results);exit;
			 	foreach ($results as $result) {
			 		// 产品照片
			 		if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
					} else {
						$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
					}
			 		$data['products'][] = array(
					'product_id'  => $result['product_id'],
					'thumb'       => $image,
					'name'        => $result['name'],
					'price'       => $this->currency->format($result['price'],$this->session->data['currency']),
					'special'     => $result['special']>0? $this->currency->format($result['special'],$this->session->data['currency']) : ''
					
					);
			 	}
			 }
			$data['breadcrumbs'] = array();

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_home'),
				'href' => $this->url->link('common/home')
			);
			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
			

			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
			$this->response->setOutput($this->load->view('information/ydselecatalogproduct', $data));
			
		}
		// 获取移动端端 子分类 产品详情
		public function getydcatalogproduct()
		{
			if(!$this->customer->isLogged()){

                $this->session->data['redirect']=$this->url->link('information/customized', '', true);
         	}else{
                $data['logins']=1;               
            }
             $data['login'] = $this->url->link('account/login');
			$this->load->language('information/contact');
			$this->document->setTitle($this->language->get('heading_titles'));
			$this->load->model('catalog/customized');
			$this->load->model('tool/image');
			$this->load->model('catalog/product');
			 if (isset($this->request->get['product_id'])) {
			 	$product_id=$this->request->get['product_id'];
			 	$sp= $this->model_catalog_product->getProductSpecialPrice($product_id);
		        // print_r($sp);exit();
		        if (!$sp) {
		            $sp= $this->model_catalog_product->getProductMinPrice($product_id);
		        }
			 	if(isset($this->request->get['share'])&&$this->request->get['share']!='{}'){

	           		$share = trim($this->request->get['share'],'{}');
		        }else{

		            $share=trim($sp['share'],'{}');
		        }

	            $shareoption = [];
	            foreach (explode(',',$share) as $item){

	                $temp = explode(':',$item);
	                $shareoption[preg_replace('/\D/s', '', $temp[0])] = preg_replace('/\D/s', '', $temp[1]);
	            }

	            $data['shareoption'] = $shareoption;

			 	$data['product_id']=$this->request->get['product_id'];

			 	$data['value_status']=$this->request->get['value_status'];

       			 $product_info = $this->model_catalog_product->getProduct($product_id);
       			 if ($product_info) {

       			 	$data['options'] = array();
            		$options=$this->model_catalog_product->getProductOptions($this->request->get['product_id']);
           
		            foreach ( $options as $option) {
		                $product_option_value_data = array();
		                foreach ($option['product_option_value'] as $option_value) {
		                    if (!$option_value['subtract'] || ($option_value['quantity'] >= 0)) {
		                        if ((($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) && (float)$option_value['price']) {
		                            $price = $this->currency->format($this->tax->calculate($option_value['price'], $product_info['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $this->session->data['currency']);
		                        } else {
		                            $price = false;
		                        }

		                        $product_option_value_data[] = array(
		                            'product_option_value_id' => $option_value['product_option_value_id'],
		                            'option_value_id'         => $option_value['option_value_id'],
		                            'name'                    => $option_value['name'],
		                            'quantity'                    => $option_value['quantity'],
		                            'image'                   => $this->model_tool_image->resize($option_value['image'], 50, 50),
		                            'price'                   => $price,
		                            'price_prefix'            => $option_value['price_prefix']
		                        );
		                    }
		                }

		                $data['options'][] = array(
		                    'product_option_id'    => $option['product_option_id'],
		                    'product_option_value' => $product_option_value_data,
		                    'option_id'            => $option['option_id'],
		                    'name'                 => $option['name'],
		                    'type'                 => $option['type'],
		                    'image'                 =>$this->model_tool_image->resize($option['image'], 50, 50),
		                    'value'                => $option['value'],
		                    'required'             => $option['required']
		                );
		            }
		            $data['heading_title'] = $product_info['name'];
		            if ($product_info['image']) {
	                	$data['thumb'] = $this->model_tool_image->resize($product_info['image'], 200, 200);
		            } else {
		                $data['thumb'] = '';
		            }
		            $data['price']=$this->currency->format($product_info['price'], $this->session->data['currency']);
	                if ($product_info['special']>0) {
	                     $data['special']=$this->currency->format($product_info['special'], $this->session->data['currency']);
	                }

       			 }

			 }
			
			$data['breadcrumbs'] = array();

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_home'),
				'href' => $this->url->link('common/home')
			);
			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
			
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
			$this->response->setOutput($this->load->view('information/getydcatalogproduct', $data));
			
	}	
	/**
     * 产品变化价格
     */
    public function getprice() {

        $json = array();

        if (isset($this->request->get['product_id'])) {
            $product_id = (int)$this->request->get['product_id'];
        } else {
            $product_id = 0;
        }
        $options=$this->request->post['option'];

        $this->load->model('catalog/product');

        $price=  $this->model_catalog_product->getProductPricebyOptions($product_id,$options);
        $price_c= $this->currency->format($price['price'], $this->session->data['currency']);
      	$json=$price;
	     if ($price['special']>0) {
	          $price_s= $this->currency->format($price['special'], $this->session->data['currency']);
	           $json['html']= '<span>'.$price_s.'</span>';
	      }else{
	            $json['html']= '<span>'. $price_c.'</span>';  
	        }

     $this->response->addHeader('Content-Type: application/json');
     $this->response->setOutput(json_encode($json));
        
    }
  //添加定制产品
	  public function addproduct() {
	  		$json = array();
	  	

        if (isset($this->request->post['product_id'])) {
            $product_id = (int)$this->request->post['product_id'];
            $value_status = (int)$this->request->post['value_status'];
        } else {
            $product_id = 0;
            $value_status = 0;
        }

       $this->load->model('catalog/customized');
         $this->load->model('catalog/product');

        $product_info = $this->model_catalog_product->getProduct($product_id);
        if($product_info){

        	 $quantity = (int)$this->request->post['quantity'];
        	 
        	 if (isset($this->request->post['option'])) {
                $option = array_filter($this->request->post['option']);
            } else {
                $option = array();
            }

            $this->model_catalog_customized->addproduct($product_id,$quantity,$option,$value_status);
           
            $json['success'] ="success";
            
            $this->response->addHeader('Content-Type: application/json');
    		$this->response->setOutput(json_encode($json));
            
        }
	}
	public function addcarts() {
			$json = array();
			$this->load->model('catalog/customized');

			if (isset($this->request->post['color'])) {
            $data['color'] =$this->request->post['color'];
	        } else {
	        $data['color'] = '';
	        }

	        if (isset($this->request->post['message'])) {
            $data['message'] = $this->request->post['message'];
	        } else {
	        $data['message'] = '';
	        }

	        if (isset($this->request->post['custom_option'])) {
	         $a=explode(',',$this->request->post['custom_option']);		

	         $data['custom_sise'] =$a[0];
	         $data['custom_parting'] =$a[1];
	        } else {
	        $data['custom_sise'] = '';
	        $data['custom_parting'] = '';
	        }

	        if(!empty($_FILES['file1'])){

	        	$file['file']=$_FILES['file1'];

	        	$extend = pathinfo($file['file']['name']); //获取文件名数组

                $extend = strtolower($extend["extension"]);                //获取文件的扩展名
								// 
                $filename = date("YmdHis").substr(md5(mt_rand(0,1000)),0,2).".".$extend;              //文件的新名称
                           
                $directory = DIR_IMAGE . 'custompictures/';
                             
                $data['path'] = '../image/custompictures/' . $filename;
						
                $moveRes= move_uploaded_file($_FILES['file1']['tmp_name'],$directory.$filename);
	        	
	        }else{
	        	 $data['path'] = '';
	        }
			
			$this->model_catalog_customized->addcartproduct($data);
			
			$json['success'] ="success";
            
            $this->response->addHeader('Content-Type: application/json');
    		$this->response->setOutput(json_encode($json));
	}
}