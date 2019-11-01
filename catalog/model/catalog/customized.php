<?php
class ModelCatalogCustomized extends Model {
	// 获取分类子分类
	public function getcustomizedFiristNavs($category_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "nav` o LEFT JOIN " . DB_PREFIX . "nav_description od ON (o.nav_id = od.nav_id) WHERE  o.inside_id = '".(int)$category_id."' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "'  ORDER BY sort_order ASC");

		return $query->rows;
	}
	public function getChildNavs($nav_id) {
		$query = $this->db->query("SELECT o.*,od.*,c.m_image FROM `" . DB_PREFIX . "nav` o LEFT JOIN " . DB_PREFIX . "nav_description od ON (o.nav_id = od.nav_id) left join " . DB_PREFIX . "category c on c.category_id=o.inside_id  WHERE  o.parent_id =  '".(int)$nav_id."' AND c.status=1 ORDER BY o.sort_order ASC");

		return $query->rows;
	}

	public function getProducts($data = array()) {
	//	var_dump($data);die;
		$sql = "SELECT p.product_id,
				(SELECT AVG(rating) AS total FROM " . DB_PREFIX . "review r1 WHERE r1.product_id = p.product_id AND r1.status = '1' GROUP BY r1.product_id) AS rating
				
			    ";
	
		

		if (!empty($data['filter_category_id'])) {
			if (!empty($data['filter_sub_category'])) {
				$sql .= " FROM " . DB_PREFIX . "category_path cp LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (cp.category_id = p2c.category_id)";
			} else {
				$sql .= " FROM " . DB_PREFIX . "product_to_category p2c";
				$sql .= " LEFT JOIN " . DB_PREFIX . "category c ON (c.category_id = p2c.category_id)";  //dyl add
			}

			if (!empty($data['filter_filter'])) {
				$sql .= " LEFT JOIN " . DB_PREFIX . "product_filter pf ON (p2c.product_id = pf.product_id) LEFT JOIN " . DB_PREFIX . "product p ON (pf.product_id = p.product_id)";
			} else {
				$sql .= " LEFT JOIN " . DB_PREFIX . "product p ON (p2c.product_id = p.product_id)";
			}
		} else {
			$sql .= " FROM " . DB_PREFIX . "product p";
		}

		$sql .= " LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "' ";

		if (!empty($data['filter_category_id'])) {
			if (!empty($data['filter_sub_category'])) {
				$sql .= " AND cp.path_id = '" . (int)$data['filter_category_id'] . "'";
			} else {
				//$sql .= " AND p2c.category_id = '" . (int)$data['filter_category_id'] . "'";

                //dyl add
				$sql .= " AND ( (c.parent_id=0 AND c.category_id=".(int)$data['filter_category_id'].")
						     OR (c.parent_id!=0 AND (c.category_id=".(int)$data['filter_category_id']." OR c.parent_id=".(int)$data['filter_category_id']."))
						     OR (c.parent_id!=0 AND c.category_id=".(int)$data['filter_category_id'].") ) ";
			}

		}

		

		$sql .= " GROUP BY p.product_id";

		$sort_data = array(
			'pd.name',
			'p.model',
			'p.quantity',
			'p.price',
			'rating',
			'p.sort_order',
			'p.date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			if ($data['sort'] == 'pd.name' || $data['sort'] == 'p.model') {
				$sql .= " ORDER BY LCASE(" . $data['sort'] . ")";
			// } elseif ($data['sort'] == 'p.price') {
			// 	$sql .= " ORDER BY  p.price END)";
			} else {
				$sql .= " ORDER BY " . $data['sort'];
			}
		} else {
			$sql .= " ORDER BY p.sort_order";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC, LCASE(pd.name) DESC";
		} else {
			$sql .= " ASC, LCASE(pd.name) ASC";
		}

		$product_data = array();
		$query = $this->db->query($sql);
		// print_r($query->rows);exit();
		$this->load->model('catalog/product');
		foreach ($query->rows as $result) {
			$product_data[$result['product_id']] = $this->model_catalog_product->getProduct($result['product_id']);
		}

		return $product_data;
	}
	// 根据产品ID获取属性
		public function getProductOptions($product_id) {
		$product_option_data = array();

		$product_option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE po.product_id = '" . (int)$product_id . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "'  AND (o.option_id=14 OR o.option_id=26 OR o.option_id=25 OR o.option_id=27)  ORDER BY o.type,o.sort_order");
// print_r($product_option_query);exit;
		foreach ($product_option_query->rows as $product_option) {
			$product_option_value_data = array();

			$product_option_value_query = $this->db->query("SELECT *   FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_id = '" . (int)$product_id . "' AND pov.product_option_id = '" . (int)$product_option['product_option_id'] . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY ov.sort_order");
		
		
				foreach ($product_option_value_query->rows as $product_option_value) {
					$product_option_value_data[] = array(
						'product_option_value_id' => $product_option_value['product_option_value_id'],
						'option_value_id'         => $product_option_value['option_value_id'],
						'option_name'                    => $product_option_value['name'],
						'quantity'                => $product_option_value['quantity'],
						'subtract'                => $product_option_value['subtract']
					);
				}
				// print_r($product_option);exit();
			$option_value_query= $this->db->query("SELECT *   FROM  " . DB_PREFIX . "option_value ov  WHERE  ov.option_value_id = '" . (int)$product_option['option_value_id'] . "'");
			if($option_value_query->row){$image=$option_value_query->row['image'];	}else{$image='';}


			$product_option_data[] = array(
				'product_option_id'    => $product_option['product_option_id'],
				'product_option_value' => $product_option_value_data,
				'option_id'            => $product_option['option_id'],
				'product_option_name'  => $product_option['name'],
				'type'                 => $product_option['type'],
				'required'             => $product_option['required']
			);
		}
		// print_r($product_option_data);exit();

		return $product_option_data;
	}
	// 属性结束
	

	// 添加定制产品
	public function addproduct($product_id, $quantity, $option = array(), $value_status) {
		// $selectquery = $this->db->query("SELECT * FROM " . DB_PREFIX . "custom_products WHERE customer_id = '" . (int)$this->customer->getId() . "'  AND status = '" . (int)$value_status . "'");

		
		// if($selectquery->num_rows==0||$selectquery->row['product_id']==$product_id ){
	
			$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "custom_products WHERE customer_id = '" . (int)$this->customer->getId() . "' AND product_id = '" . (int)$product_id . "' AND `option` = '" . $this->db->escape(json_encode($option)) . "'AND status = '" . (int)$value_status . "'");

	        if (!$query->row['total']) {
	        	
	            $sql = "INSERT " . DB_PREFIX . "custom_products SET customer_id = '" . (int)$this->customer->getId() . "', product_id = '" . (int)$product_id . "', `option` = '" . $this->db->escape(json_encode($option)) . "', quantity = '" . (int)$quantity . "', date_added = NOW(),status = '" . (int)$value_status . "'";
	            $this->db->query($sql);
	        } else {
	            $sql = "UPDATE " . DB_PREFIX . "custom_products SET quantity = (quantity + " . (int)$quantity . ") WHERE customer_id = '" . (int)$this->customer->getId() . "'  AND product_id = '" . (int)$product_id . "' AND `option` = '" . $this->db->escape(json_encode($option)) . "' AND status = '" . (int)$value_status . "'";
	            $this->db->query($sql);
	        }
				
		// }else{
		// 	print_r($selectquery);exit;
		// 	// $selectquery->row['total']
		// 	// return 
		// }
        
    }

    //获取定制产品
    
    public function getaddproduct()
     {
     	 $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "custom_products WHERE customer_id='" . (int)$this->customer->getId() . "' ");

     	 if (!empty($query->row)) {
			foreach ($query->rows as $key => $values) {

						$price_type=$this->customer->isLogged()?(int)$this->config->get('config_customer_group_id'):'';

						$option_price = 0;
						$option_data = array();
				        $product_option_value_ids='0';
						 foreach (json_decode($values['option']) as $product_option_id => $value) {
						$product_option_value_ids.=','.$value;
				                    $option_query = $this->db->query("SELECT po.product_option_id, po.option_id, od.name, o.type FROM " . DB_PREFIX . "product_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE po.product_option_id = '" . (int)$product_option_id . "' AND po.product_id = '" . (int)$values['product_id'] . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "'");         
				 				if ($option_query->num_rows) {
									if ($option_query->row['type'] == 'select' || $option_query->row['type'] == 'radio') {
				                            $option_value_query = $this->db->query("SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price".$price_type." as price, pov.price_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$value . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "' ");
				                            if ($option_value_query->num_rows) {

				                            	$option_price += $option_value_query->row['price'];

				                            	$price = $option_price ;
				                                $values['option_name'][] = array(
				                                    'product_option_id'       => $product_option_id,
				                                    'product_option_value_id' => $value,
				                                    'name'                    => $option_query->row['name'],
				                                    'value'                   => $option_value_query->row['name'],
				                                    'type'                    => $option_query->row['type']
				                                    // 'price'                   => $option_value_query->row['price'],  
				                                    // 'option_id'               => $option_query->row['option_id'],
				                                    // 'option_value_id'         => $option_value_query->row['option_value_id']
				                                   
				                                );
				                            }
				                    }

				                }

				        }
				                 	$original_price = $option_price;

					                			// Product Specials
								                 if($this->customer->isLogged()){
								               		 $product_special_query = $this->db->query("SELECT price,percent FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$values['product_id'] . "' AND product_option_value_id in(".$product_option_value_ids.") AND customer_group_id in (0, " . (int)$this->config->get('config_customer_group_id') . ") AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY priority ASC, price ASC LIMIT 1");
								                }else{
							                   	 	$product_special_query = $this->db->query("SELECT price,percent FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$values['product_id'] . "' AND product_option_value_id in(".$product_option_value_ids.")  AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY priority ASC, price ASC LIMIT 1");

							               		 }


								                if ($product_special_query->num_rows) {
								                    if ( $product_special_query->row['percent']) {
								                       $price =$price *$product_special_query->row['percent']/100;
								                    }else{
								                    $price -= $product_special_query->row['price'];
								                    }
								                }

								                if($original_price==$price) $original_price = 0;
								          $values['productprice'] =$price ;
								         
								          $values['original_price'] =$original_price;  
								          $values['total'] =  $price  * $values['quantity'];     
				               
	    			$products[]=$values;
				}

			}else{
				$products='';
			}
     	 return $products;
     } 

	// 根据加购物车上的产品id和option,单价 ，总价 
	public function getoptionnamebyoption($product_id,$option,$quantity)
	{
		$options=json_decode($option);
		$option_name=array();
		$price_type=$this->customer->isLogged()?(int)$this->config->get('config_customer_group_id'):'';
		$option_price = 0;
		$option_data = array();
		$product_option_value_ids='0';
		if ($options) {
		
			foreach ($options as $product_option_id => $value) {

					$option_query = $this->db->query("SELECT po.product_option_id, po.option_id, od.name, o.type FROM " . DB_PREFIX . "product_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE po.product_option_id = '" . (int)$product_option_id . "' AND po.product_id = '" . (int)$product_id . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "'");         
				 				if ($option_query->num_rows) {
									if ($option_query->row['type'] == 'select' || $option_query->row['type'] == 'radio') {
				                            $option_value_query = $this->db->query("SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price".$price_type." as price, pov.price_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$value . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "' ");
				                            if ($option_value_query->num_rows) {

				                            	$option_price += $option_value_query->row['price'];

				                            	$price = $option_price ;
				                                $values['option_name'][] = array(
				                                    'product_option_id'       => $product_option_id,
				                                    'product_option_value_id' => $value,
				                                    'name'                    => $option_query->row['name'],
				                                    'value'                   => $option_value_query->row['name'],
				                                    'type'                    => $option_query->row['type']
				                                    // 'price'                   => $option_value_query->row['price'],  
				                                    // 'option_id'               => $option_query->row['option_id'],
				                                    // 'option_value_id'         => $option_value_query->row['option_value_id']
				                                   
				                                );
				                            }
				                    }

				                }
			}
												$original_price = $option_price;

					                			// Product Specials
								                 if($this->customer->isLogged()){
								               		 $product_special_query = $this->db->query("SELECT price,percent FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$product_id . "' AND product_option_value_id in(".$product_option_value_ids.") AND customer_group_id in (0, " . (int)$this->config->get('config_customer_group_id') . ") AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY priority ASC, price ASC LIMIT 1");
								                }else{
							                   	 	$product_special_query = $this->db->query("SELECT price,percent FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$product_id . "' AND product_option_value_id in(".$product_option_value_ids.")  AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY priority ASC, price ASC LIMIT 1");

							               		 }


								                if ($product_special_query->num_rows) {
								                    if ( $product_special_query->row['percent']) {
								                       $price =$price *$product_special_query->row['percent']/100;
								                    }else{
								                    $price -= $product_special_query->row['price'];
								                    }
								                }

								                if($original_price==$price) $original_price = 0;
								          $values['productprice'] =$price ;
								         
								          $values['original_price'] =$original_price;  
								          $values['total'] =  $price  * $quantity;  
								          $option_name_value=$values;

		}

		return $option_name_value;
	}



	// 删除 定制产品
	public function delcustom_del($custom_product_id) {

		$this->db->query("DELETE FROM " . DB_PREFIX . "custom_products WHERE customer_id = '" . (int)$this->customer->getId() . "' AND custom_product_id = '" . (int)$custom_product_id . "'");
		
		 
	}
	// 获取 后台设置的属性（网帽大小，造型）
	public function getOption()
	{
		$sql = "SELECT * FROM `" . DB_PREFIX . "option` o LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE od.language_id = '" . (int)$this->config->get('config_language_id') . "'AND o.type='checkbox'";
		$query = $this->db->query($sql);
		$option_values=array();
		$option_value_data=array();
		if($query->row){
			foreach ($query->rows as $key => $value) {

				$option_value_data = array();

				$option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "option_value ov LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE ov.option_id = '" . (int)$value['option_id'] . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY ov.sort_order, ovd.name");
				
				foreach ($option_value_query->rows as $option_value) {

					$option_value_data[] = array(
						'option_value_id' => $option_value['option_value_id'],
						'name'            => $option_value['name']
					);
				}

				$option_values[] = array(
						'option_id'			 	=> $value['option_id'],
						'option_name'           => $value['name'],
						'option_value_data'		=> $option_value_data
					);
			}
		}
		return  $option_values;
	}
	// 更改定制产品数量
	public function update_custom($custom_product_id, $quantity) {
		$this->db->query("UPDATE " . DB_PREFIX . "custom_products SET quantity = '" . (int)$quantity . "' WHERE custom_product_id = '" . (int)$custom_product_id . "'  AND customer_id = '" . (int)$this->customer->getId() . "' ");
		
	}
	//定制单加入购物车
	public function addcartproduct($data=array())
	{
		// print_r($data);exit;
	     $this->db->query("INSERT " . DB_PREFIX . "custom_cart SET customer_id = '" . (int)$this->customer->getId() . "', api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "', recurring_id = '0', color = '" .$data['color'] . "', `custom_sise` = '" . $data['custom_sise'] . "', custom_parting = '" . $data['custom_parting']. "', date_added = NOW(),message = '" . $data['message'] . "',total = '" . $data['zongtotals'] . "',image = '" . $data['path'] . "'");
	     $cart_id = $this->db->getLastId();
	     // print_r($cart_id);exit;
	     if($cart_id){

	     	$q=  $this->db->query("SELECT cp.product_id,cp.option,cp.quantity FROM " . DB_PREFIX . "custom_products cp WHERE customer_id = '" . (int)$this->customer->getId() . "' ");

	     	$this->db->query("DELETE FROM " . DB_PREFIX . "custom_products WHERE customer_id = '" .(int)$this->customer->getId() . "'");

	     	 if ( $q->rows) {

			 	foreach ($q->rows as $key => $row) {

			 		$this->db->query("INSERT " . DB_PREFIX . "custom_cart_product SET cart_id = '" . (int)$cart_id . "',product_id = '" .$row['product_id'] . "', quantity = '" . $row['quantity'] . "', `option` = '" . $this->db->escape(json_encode(json_decode($row['option']))). "'");
			
			 	}
			 	
			 }
	     	
	     }
	}

	public function getcustomcartproducts()
	{
		 $customproduct_data=array();
		$cart_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "custom_cart WHERE api_id = '" . (isset($this->session->data['api_id']) ? (int)$this->session->data['api_id'] : 0) . "' AND customer_id = '" . (int)$this->customer->getId() . "' ");
		foreach ($cart_query->rows as $cart) {

			$product_value_query = $this->db->query("SELECT ccp.product_id,ccp.option,ccp.quantity FROM " . DB_PREFIX . "custom_cart_product ccp LEFT JOIN " . DB_PREFIX . "custom_cart cc ON (ccp.cart_id = cc.cart_id) WHERE ccp.cart_id = '" . (int)$cart['cart_id'] . "'");
// print_r($product_value_query);exit;
			foreach ($product_value_query->rows as $key => $product_value) {

				$option_name=$this->getoptionnamebyoption($product_value['product_id'],$product_value['option'],$product_value['quantity']);
				
				$option_names[$key] = array(
                   'product_id'       		=> $product_value['product_id'],
                   'quantity'              => $product_value['quantity'],
                   'option_name_value'  => $option_name
                );
			}

// print_r($option_names);exit;

			$customproduct_data[] = array(
                   'cart_id'       		=> $cart['cart_id'],
                   'option_name_values'  => $option_names,
                   'color'              => $cart['color'],
                   'custom_sise'        => $cart['custom_sise'],
                   'custom_parting'     => $cart['custom_parting'],
                   'message'            => $cart['message'],
                   'image'              => $cart['image']
                );
			
		}
		 // print_r($customproduct_data);exit;
return $customproduct_data;
		
	}
	// 购物车删除 定制单产品
	public function delcustomcart_del($custom_cart_id) {

		$this->db->query("DELETE FROM " . DB_PREFIX . "custom_cart WHERE customer_id = '" . (int)$this->customer->getId() . "' AND cart_id = '" . (int)$custom_cart_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "custom_cart_product WHERE  cart_id = '" . (int)$custom_cart_id . "'");
		
		 
	}
	
}