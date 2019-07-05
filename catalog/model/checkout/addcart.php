<?php
class ModelCheckoutAddcart extends Model {
	private function querysql($sql)
	{
		$dbs= unserialize($this->config->get('db_database_data'));
		foreach ($dbs as $key => $value) {
			if($key==0){
				$this->db->query($sql);
			}else{
				$d='db'.$key;
				$this->$d->query($sql);
			}
		}
		
	}
	// 满足换购的最低正常购物车的总价
	public function lowestAmount() {
		$sql="SELECT a.fullprice FROM " . DB_PREFIX . "product_additional a LEFT JOIN  " . DB_PREFIX . "product p on p.product_id =a.product_id WHERE p.status=1  ORDER BY a.fullprice ASC";

		$query=$this->db->query($sql);
		// print_r($query->row);exit();
	
		return $query->row;
	}
	// 清空加购购物车
	public function del_add_cart() {
		if ($this->customer->getId()>0) {
			
		
		$sql="DELETE FROM ".DB_PREFIX."cart_add  WHERE  customer_id = '" . (int)$this->customer->getId() . "'";

		$query=$this->db->query($sql);
		}
	
	}
	// 删除加购购物车上产品
	public function del_add_product_by_cart_id($cart_id) {
			if ($this->customer->getId()>0) {
		$sql="DELETE FROM ".DB_PREFIX."cart_add  WHERE cart_id=".$cart_id."  AND  customer_id = '" . (int)$this->customer->getId() . "'";

		$query=$this->db->query($sql);
		}
	
	}

// 判断这个产品是否已经在加购购物车上
	public function product_in_cart($product_id,$option) {
			if ($this->customer->getId()>0) {
		$option=json_encode($option);
		$sql="SELECT  quantity FROM ".DB_PREFIX."cart_add WHERE product_id=".$product_id." AND  `option`='".$option."' AND  customer_id = '" . (int)$this->customer->getId() . "'";
		$query=$this->db->query($sql);
		// print_r($sql);exit();
		if ($query->row) {
			return $query->row['quantity'];
		}else {
			return false;
		}
	}

	}
	// 产品在加购购物车上，那么就更新数量
	public function update_product_in_cart($product_id,$option,$num) {
			if ($this->customer->getId()>0) {
		$option=json_encode($option);
		if ($num<1) {
			$sql="DELETE FROM ".DB_PREFIX."cart_add  WHERE product_id=".$product_id." AND  `option`='".$option."' AND  customer_id = '" . (int)$this->customer->getId() . "'";
		}else{
		$sql="UPDATE ".DB_PREFIX."cart_add SET quantity=".$num." WHERE product_id=".$product_id." AND  `option`='".$option."' AND  customer_id = '" . (int)$this->customer->getId() . "'";
		}
		// print_r($sql);exit();
		$query=$this->db->query($sql);
	}
	
	}
	// cart_total是正常购物车的总价
// 当前加购车上的总价
	public function addcarttotal($cart_total)
	{
			if ($this->customer->getId()>0) {
		$sql="SELECT  product_id,quantity FROM ".DB_PREFIX."cart_add WHERE customer_id = '" . (int)$this->customer->getId() . "'";
		$query=$this->db->query($sql);
		$total=0;
		$quantity=0;
		if ($query->row) {
			foreach ($query->rows as $key => $value) {
				$s="SELECT addprice  FROM ".DB_PREFIX."product_additional a   WHERE a.product_id=".$value['product_id']." AND a.fullprice < ".$cart_total." ORDER BY fullprice DESC limit 1 ";
	    			
	    		$q = $this->db->query($s);
	    		if ($q->row) {
	    			
	    		
	    		 $total+=$q->row['addprice']*$value['quantity'];
	    		 $quantity+=$value['quantity'];
	    		}
			}
		}

		return array('total'=>$total,'quantity'=>$quantity);
	}
		
	}
	// 加购车总数量
		public function addcartquantity()
	{
			if ($this->customer->getId()>0) {
		$sql="SELECT  product_id,quantity FROM ".DB_PREFIX."cart_add WHERE customer_id = '" . (int)$this->customer->getId() . "'";
		$query=$this->db->query($sql);
		$quantity=0;
		if ($query->row) {
			foreach ($query->rows as $key => $value) {
	    		 $quantity+=$value['quantity'];
			}
		}

		return $quantity;
	}
		
	}

	// 获取加购车的产品
	public function addcartproducts()
	{
			if ($this->customer->getId()>0) {
		$sql="SELECT c.cart_id, c.product_id,c.quantity,p.image,pd.name,c.option FROM ".DB_PREFIX."cart_add c LEFT JOIN ".DB_PREFIX."product p on c.product_id=p.product_id  LEFT JOIN ".DB_PREFIX."product_description  pd ON p.product_id = pd.product_id  WHERE c.customer_id = '" . (int)$this->customer->getId() . "'  AND pd.language_id = '" . $this->config->get('config_language_id') . "' ";
		$query=$this->db->query($sql);
		$quantity=0;
		$products=array();
		if ($query->row) {
			foreach ($query->rows as $key => $value) {
				$value['option_name']=$this->getoptionnamebyoption($value['product_id'],$value['option']);
	    		$products[]=$value;
			}
		}
		return $products;
	}
		
	}
	// 根据加购物车上的产品id和option,来或者本产品已经选好的选项
	public function getoptionnamebyoption($product_id,$option)
	{
		$options=json_decode($option);
		$option_name=array();
		if ($options) {
		
			foreach ($options as $product_option_id => $value) {
				  $option_query = $this->db->query("SELECT po.product_option_id, po.option_id, od.name, o.type FROM " . DB_PREFIX . "product_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE po.product_option_id = '" . (int)$product_option_id . "' AND po.product_id = '" . (int)$product_id . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "'");
				   if ($option_query->num_rows) {  
                        $option_value_query = $this->db->query("SELECT pov.option_id,pov.option_value_id, pov.product_option_value_id, ovd.name, pov.quantity FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$value . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
                        	if ($option_value_query->row&&$option_value_query->row['option_id']==ADD_CART_OPTION_ID) {
                        		// 库存信息从主站来
                        		$quantity=$this->getQuantityInwwwByProductOptionValueId($value);
                        		$option_value_query->row['quantity'];

                        		$option_name=$option_value_query->row;
                        	}

                        	
                    }


			
			}
		}

		return $option_name;
	}

	// 查总站库存
	public function getQuantityInwwwByProductOptionValueId($product_option_value_id)
	{
		$quantity=0;
		$sql="SELECT quantity FROM ".DB_PREFIX."product_option_value WHERE product_option_value_id=".(int)$product_option_value_id;
		$query= $this->db1->query($sql);
		if ($query->row) {
			$quantity=$query->row['quantity'];
		}
		return $quantity;
	}
	// 查加购车上的加购产品是不是够足够库存
	// 返回没库存的cart_id数组
	public function CheckStock()
	{
		$res=array();
		$products=$this->addcartproducts();
		foreach ($products as $key => $value) {
			$quantity=$this->getQuantityInwwwByProductOptionValueId($value['option_name']['product_option_value_id']);
			if ($quantity<$value['quantity']) {
				$res[]=$value['cart_id'];
			}
		}
		// print_r($products);exit();

		return $res;
	}
	// 根据加购车更改主站库存
	public function UpdateStock()
	{
		
		$res=$this->CheckStock();
		if ($res) {
			return $res;
		}else{
			$this->db1->query("LOCK TABLES ".DB_PREFIX."product_option_value WRITE;");
			$products=$this->addcartproducts();
			foreach ($products as $key => $value) {
				$quantity=$this->getQuantityInwwwByProductOptionValueId($value['option_name']['product_option_value_id']);
				$quantity-=$value['quantity'];
				$this->db1->query("UPDATE ".DB_PREFIX."product_option_value SET quantity=".$quantity." WHERE product_option_value_id=".$value['option_name']['product_option_value_id']);
			}
			$this->db1->query("UNLOCK TABLES");
		}

	}

	// 取消订单，根据订单，恢复加购产品的库存
	public function RecoveryStock($order_id)
	{
		# code...
	}


}