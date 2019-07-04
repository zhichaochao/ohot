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
	// 换购的金额
	public function lowestAmount() {
		$sql="SELECT a.fullprice FROM " . DB_PREFIX . "product_additional a LEFT JOIN  " . DB_PREFIX . "product p on p.product_id =a.product_id WHERE p.status=1  ORDER BY a.fullprice ASC";

		$query=$this->db->query($sql);
		// print_r($query->row);exit();
	
		return $query->row;
	}

	public function addOrder($data) {
		

		return $order_id;
	}



}