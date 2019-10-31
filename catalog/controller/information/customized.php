<?php
 	/**
     * 
     * 定制 主页面  ; 获取添加定制产品控制器
     */
class ControllerInformationCustomized extends Controller {
	


	public function index()
	{
		$this->load->language('information/contact');
		$this->document->setTitle($this->language->get('heading_titles'));
		$this->load->model('catalog/customized');

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
			$this->response->setOutput($this->load->view('information/customized', $data));

	}
	// 显示pc端产品
	public function getaddproduct()
	{
		$this->load->language('information/contact');
		$this->document->setTitle($this->language->get('heading_titles'));
		$this->load->model('catalog/customized');
		$this->load->model('catalog/product');
		$this->load->model('tool/image');

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);
		// 制作一个产品的价格（$3.5）
		$single_price=$this->config->get('single_price');

		$totals=0;
		$colortotal=0;
		$qty=0;
		if($this->customer->isLogged()){
			// 已登录
			$resultdatas=$this->model_catalog_customized->getaddproduct();
			// print_r($resultdatas);exit;
			if(!empty($resultdatas)){
				
					foreach ($resultdatas as $key => $resultdata) {

						$product_info = $this->model_catalog_product->getProduct($resultdata['product_id']);
						if ($product_info['image']) {
		                	$thumb = $this->model_tool_image->resize($product_info['image'], 200, 200);
			            } else {
			                $thumb = '';
			            }

						$data['resultdata'][]=array(
					 			'custom_product_id'	=>$resultdata['custom_product_id'],
					 			'product_id'		=>$product_info['product_id'],
					 			'name'				=>$product_info['name'],
					 			'thumb'				=>$thumb,
					 			'status'			=>$resultdata['status'],
					 			'quantity'			=>$resultdata['quantity'],
					 			'option_name'		=>$resultdata['option_name'],
					 			'productprice'		=>$this->currency->format($resultdata['productprice'], $this->session->data['currency']),
					 			
					 			'total'				=>$this->currency->format($resultdata['total'], $this->session->data['currency'])
				 			);
						$totals+=$resultdata['total'];
						$qty+=$resultdata['quantity'];
						$colortotal+=$resultdata['quantity']*$single_price;
					}
				}else{
					// 未添加产品
					$data['resultdata']='';
				}
			}else{
				// 未登录
				$data['resultdata']='';
				
			}
			$data['qty']=$qty;

			$data['single_price']=$this->currency->format($single_price, $this->session->data['currency']);
			// 颜色价格
			$data['colortotal']=$this->currency->format($colortotal, $this->session->data['currency']);
			// 制作价格20美金（后台设置）
			$data['custom_total'] =$this->currency->format( $this->config->get('custom_total'), $this->session->data['currency']);

			$custom_total=$this->config->get('custom_total') ;
			// 总价=产品价格+颜色价格+制作价格
			$zongtotal=$totals+$colortotal+$custom_total;
			$data['zongtotal']=$this->currency->format($zongtotal, $this->session->data['currency']);

			// 定制属性
			$data['option_info'] = $this->model_catalog_customized->getOption();

		
			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
			

			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
			$this->response->setOutput($this->load->view('information/getaddproduct', $data));
	}
		// 显示移动端产品
		public function getydaddproduct()
			{
				$this->load->language('information/contact');
				$this->document->setTitle($this->language->get('heading_titles'));
				$this->load->model('catalog/customized');
				$this->load->model('catalog/product');
				$this->load->model('tool/image');

				$data['breadcrumbs'] = array();

				$data['breadcrumbs'][] = array(
					'text' => $this->language->get('text_home'),
					'href' => $this->url->link('common/home')
				);
				// 制作一个产品的价格（$3.5）
				$single_price=$this->config->get('single_price');

				$totals=0;
				$colortotal=0;
				$qty=0;
				if($this->customer->isLogged()){
					// 已登录
					$resultdatas=$this->model_catalog_customized->getaddproduct();
					if(!empty($resultdatas)){
						foreach ($resultdatas as $key => $resultdata) {

							$product_info = $this->model_catalog_product->getProduct($resultdata['product_id']);
							if ($product_info['image']) {
			                	$thumb = $this->model_tool_image->resize($product_info['image'], 200, 200);
				            } else {
				                $thumb = '';
				            }
							$data['ydresultdata'][]=array(
						 			'custom_product_id'	=>$resultdata['custom_product_id'],
						 			'product_id'		=>$product_info['product_id'],
						 			'name'				=>$product_info['name'],
						 			'thumb'				=>$thumb,
						 			'status'			=>$resultdata['status'],
						 			'quantity'			=>$resultdata['quantity'],
						 			'option_name'		=>$resultdata['option_name'],
						 			'productprice'		=>$this->currency->format($resultdata['productprice'], $this->session->data['currency']),
						 		
						 			'total'				=>$this->currency->format($resultdata['total'], $this->session->data['currency'])
					 			);
								$totals+=$resultdata['total'];
								$qty+=$resultdata['quantity'];
								$colortotal+=$resultdata['quantity']*$single_price;
						}
					}else{
						// 未添加产品
						$data['ydresultdata']='';
					}
				}else{
					// 未登录
					$data['ydresultdata']='';
					
				}
					$data['qty']=$qty;

					$data['single_price']=$this->currency->format($single_price, $this->session->data['currency']);
					// 颜色价格
					$data['colortotal']=$this->currency->format($colortotal, $this->session->data['currency']);
					// 制作价格20美金（后台设置）
					$data['custom_total'] =$this->currency->format( $this->config->get('custom_total'), $this->session->data['currency']);

					$custom_total=$this->config->get('custom_total');
					// 总价=产品价格+颜色价格+制作价格
					$zongtotal=$totals+$colortotal+$custom_total;
					$data['zongtotal']=$this->currency->format($zongtotal, $this->session->data['currency']);

					// 定制属性
					$data['option_info'] = $this->model_catalog_customized->getOption();
				// print_r($data['resultdata']);exit;
					$data['continue'] = $this->url->link('common/home');

					$data['column_left'] = $this->load->controller('common/column_left');
					

					$data['content_top'] = $this->load->controller('common/content_top');
					$data['content_bottom'] = $this->load->controller('common/content_bottom');
					$data['footer'] = $this->load->controller('common/footer');
					$data['header'] = $this->load->controller('common/header');
					$this->response->setOutput($this->load->view('information/getydaddproduct', $data));
			}
			// 删除添加的定制产品
			public function delcustom_del()
			{

				$json = array();

				if (isset($this->request->post['custom_product_id'])) {
					$custom_product_id = $this->request->post['custom_product_id'];
				} else {
					$custom_product_id = 0;
				}

				$this->load->model('catalog/customized');

				$this->model_catalog_customized->delcustom_del($custom_product_id);

				$json['success'] = "success";

				$this->response->addHeader('Content-Type: application/json');
				$this->response->setOutput(json_encode($json));
			}
			//更改数量
			public function edit_ajax() {
				$json = array();
				$this->load->model('catalog/customized');
				 // Update
			        if (!empty($this->request->post['num'])&&!empty($this->request->post['custom_product_id'])) {
			            $this->model_catalog_customized->update_custom($this->request->post['custom_product_id'], $this->request->post['num']);
			            $json['success'] = "success";
			          

			        }
			    $this->response->addHeader('Content-Type: application/json');
       			$this->response->setOutput(json_encode($json));
			}

}