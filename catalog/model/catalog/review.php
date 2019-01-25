<?php
class ModelCatalogReview extends Model {
	public function addReview($product_id, $data , $path=array()) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "review SET author = '" . $this->db->escape($data['name']) . "', customer_id = '" . (int)$this->customer->getId() . "', product_id = '" . (int)$product_id . "', text = '" . $this->db->escape($data['text']) . "', rating = '" . (int)$data['rating'] . "', date_added = NOW()");

		$review_id = $this->db->getLastId();

        //将上传的图片添加入库
		if($path){
			foreach($path as $row){
				$sql = "INSERT INTO " . DB_PREFIX . "review_img SET review_id = '".$review_id."',path='".$row."',createTime='".time()."'";
				$this->db->query($sql);
			}
		}

        //后台有设置review模块要发送邮件的话,则发送(原本已有)
		if (in_array('review', (array)$this->config->get('config_mail_alert'))) {
			$this->load->language('mail/review');
			$this->load->model('catalog/product');

			$product_info = $this->model_catalog_product->getProduct($product_id);

			$subject = sprintf($this->language->get('text_subject'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));

			$message  = $this->language->get('text_waiting') . "\n";
			$message .= sprintf($this->language->get('text_product'), html_entity_decode($product_info['name'], ENT_QUOTES, 'UTF-8')) . "\n";
			$message .= sprintf($this->language->get('text_reviewer'), html_entity_decode($data['name'], ENT_QUOTES, 'UTF-8')) . "\n";
			$message .= sprintf($this->language->get('text_rating'), $data['rating']) . "\n";
			$message .= $this->language->get('text_review') . "\n";
			$message .= html_entity_decode($data['text'], ENT_QUOTES, 'UTF-8') . "\n\n";

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($this->config->get('config_email'));
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
			$mail->setSubject($subject);
			$mail->setText($message);
			$mail->send();

			// Send to additional alert emails
			$emails = explode(',', $this->config->get('config_alert_email'));

			foreach ($emails as $email) {
				if ($email && filter_var($email, FILTER_VALIDATE_EMAIL)) {
					$mail->setTo($email);
					$mail->send();
				}
			}
		}
	}


    /**
     * 根据产品ID获取对应的产品评论内容(新)
     * @author   dyl   783973660@qq.com  2016.9.7改
     * @param    String  $productIdString  产品ID的字符串(可能有多个)
     * @param    Int     $start            开始的记录数
     * @param    Int     $limit            每页显示的记录数
     */
	//public function getReviewsByProductId($product_id, $start = 0, $limit = 20) {
	public function getReviewsByProductId($productIdString, $start = 0, $limit = 20) {
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 20;
		}

		//$query = $this->db->query("SELECT r.review_id, r.author, r.rating, r.text, p.product_id, pd.name, p.price, p.image, r.date_added FROM " . DB_PREFIX . "review r LEFT JOIN " . DB_PREFIX . "product p ON (r.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = '" . (int)$product_id . "' AND p.date_available <= NOW() AND p.status = '1' AND r.status = '1' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY r.date_added DESC LIMIT " . (int)$start . "," . (int)$limit);
		$sql = "SELECT r.review_id, r.author, r.rating, r.text,p.product_id, pd.name, p.price, p.image, r.date_added
				FROM " . DB_PREFIX . "review r LEFT JOIN " . DB_PREFIX . "product p ON (r.product_id = p.product_id)
				LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id)
				WHERE p.product_id in (" . $productIdString . ") AND p.date_available <= NOW() AND p.status = '1'
				AND r.status = '1' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'
				ORDER BY r.date_added DESC LIMIT " . (int)$start . "," . (int)$limit;
		$query = $this->db->query($sql);

		return $query->rows;
	}

    //旧
	/*public function getTotalReviewsByProductId($product_id) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "review r LEFT JOIN " . DB_PREFIX . "product p ON (r.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = '" . (int)$product_id . "' AND p.date_available <= NOW() AND p.status = '1' AND r.status = '1' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row['total'];
	}*/

	/**
     * 根据产品的ID字符串获取该产品的评论总次数
     * @author  dyl 783973660@qq.com 2016.9.7
     * @param   String  $productIdString  产品的ID字符串(可能有多个ID连接在一起)
     */
	public function getTotalReviewsByProductId($productIdString) {
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "review r LEFT JOIN " . DB_PREFIX . "product p ON (r.product_id = p.product_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id in (" . $productIdString . ") AND p.date_available <= NOW() AND p.status = '1' AND r.status = '1' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
		$query = $this->db->query($sql);
		return $query->row['total'];
	}

	/**
     * 根据产品的relation_product获取相关产品的ID
     * @author  dyl 783973660@qq.com 2016.9.7
     * @param   String  $relation_product  产品的关联model
     */
	public function getTotalReviewsByRelatePro($relation_product){
       $sql = "SELECT product_id FROM " . DB_PREFIX . "product
	   		   WHERE relation_product = '".$relation_product."' AND status=1";
       $query = $this->db->query($sql);
	   return !empty($query->rows) ? $query->rows : array();
	}

   /**
	* 获取评论图片
	* @author  dyl 783973660@qq.com 2016.9.7
    * @param   Int  $review_id   评论的id
	*/
	public function getReviewImg($review_id){
		$sql = "select * from " . DB_PREFIX . "review_img where review_id = '".$review_id."' limit 6";
		$query = $this->db->query($sql);
		return $query->rows;
	}

	/**
     * 根据产品ID获取该产品的评论总分数
     * @author  dyl 783973660@qq.com 2016.9.7
     * @param   Int  $product_id  产品ID
     */
	public function getRatingByProductId($productIdString){
	   $sql = "SELECT sum(rating) as rating FROM " . DB_PREFIX . "review
	   		   WHERE product_id in (".$productIdString.") AND status=1";
       $query = $this->db->query($sql);
	   return $query->row['rating'];
	}


	public function getcoupon() {
		// if ($limit==3) {
		// 	$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "coupon o WHERE status='1' AND o.uses_total != 0  AND o.date_end >= NOW() ORDER BY o.coupon_id desc  limit $limit ");
		// }else{
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "coupon o WHERE status='1' AND o.uses_total != 0  AND o.date_end >= NOW() AND o.status_c = 1 ORDER BY o.coupon_id desc   ");
		// }
		

		return $query->rows;
	}

	public function addcoupon($coupon_id) {

		$querys = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_coupon WHERE coupon_id = '" . (int)$coupon_id . "' AND customer_id= '" . (int)$this->customer->getId() . "'");
		$querysrow= $querys->row;

		$pricequery = $this->db->query("SELECT * FROM " . DB_PREFIX . "coupon WHERE coupon_id = '" . (int)$coupon_id . "' ");
		// print_r($pricequery->row['discount']);exit;
		if(empty($querys->row)){

			$this->db->query("INSERT INTO " . DB_PREFIX . "customer_coupon SET customer_id = '" . (int)$this->customer->getId() . "', coupon_id = '" . (int)$coupon_id . "',price='" .$pricequery->row['discount']. "'");

			$resquerys = $this->db->query("SELECT * FROM " . DB_PREFIX . "coupon WHERE coupon_id = '" . (int)$coupon_id . "'");
			$row= $resquerys->row;

			$sucs =$this->db->query("UPDATE " . DB_PREFIX . "coupon SET uses_total = ".($row['uses_total']-1)." WHERE coupon_id= '" .(int)$coupon_id. "' ");
			$suc=$this->db->query("SELECT price FROM " . DB_PREFIX . "customer_coupon WHERE coupon_id = '" . (int)$coupon_id . "'AND customer_id= '" . (int)$this->customer->getId() . "'");
		}else{
			$sucquery =$this->db->query("UPDATE " . DB_PREFIX . "customer_coupon SET total = ".($querysrow['total']+1)." WHERE coupon_id= '" .(int)$coupon_id. "'AND customer_id= '" . (int)$this->customer->getId() . "' ");

			$suc=$this->db->query("SELECT price FROM " . DB_PREFIX . "customer_coupon WHERE coupon_id = '" . (int)$coupon_id . "'AND customer_id= '" . (int)$this->customer->getId() . "'");
			// $resquerys = $this->db->query("SELECT * FROM " . DB_PREFIX . "coupon WHERE coupon_id = '" . (int)$coupon_id . "'");
			// $row= $resquerys->row;

			// $suc =$this->db->query("UPDATE " . DB_PREFIX . "coupon SET uses_total = ".($row['uses_total']-1)." WHERE coupon_id= '" .(int)$coupon_id. "' ");
		// print_r(11222);exit();
		}
		// print_r($suc);exit();
		return $suc->row;
	}

	public function getcoupons($coupon_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "coupon WHERE coupon_id = '" . (int)$coupon_id . "'  AND status='1'");
        // $querys = $this->db->query ("SELECT * from " . DB_PREFIX . "coupon_history where coupon_id='" . (int)$coupon_id . "' AND customer_id = '" . (int)$this->customer->getId(). "'");
        // if($querys->rows){
        // 	$usecoupon=1;
        // }else{
        // 	$usecoupon=0;
        // }
		if ($query->rows) {
			return array(
				'coupon_id'       => $query->row['coupon_id'],
				'name'       => $query->row['name'],
				'type'       => $query->row['type'],
				'code'       => $query->row['code'],
				// 'usecoupon'       => $usecoupon,
				'discount'       => $query->row['discount'],
				'date_end'       => $query->row['date_end'],
				'total'       => $query->row['total'],
				'name'       => $query->row['name'],
				);
		}else{
		return false;
		}
		// return $query->rows;
	}
	// Array (
	//  [cid] => 2
	//   [customer_id] => 333 
	//   [coupon_id] => 25
	//    [total] => 5
	//     ) 
	public function getCustomerUseCoupon($cart_total) {
		$query = $this->db->query("SELECT code FROM " . DB_PREFIX ."coupon c LEFT JOIN " .DB_PREFIX. "customer_coupon cc ON (c.coupon_id=cc.coupon_id) WHERE cc.customer_id= '" . (int)$this->customer->getId() . "'AND c.status='1' AND c.status_c='1' AND c.date_end >= NOW() AND c.total <='".$cart_total."' ORDER BY price DESC LIMIT 1");
		return $query;	
	}

	public function getCustomerCoupon() {
		// $limit='';
		// if ($filter_data['limit']>0) {
		// 	$limit.=' limit '.$filter_data['start'].','.$filter_data['limit'];
		// }
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_coupon cc LEFT JOIN " .DB_PREFIX. "coupon c ON (c.coupon_id=cc.coupon_id) WHERE cc.customer_id = '" . (int)$this->customer->getId(). "' AND c.status='1' AND c.date_end >= NOW()");
		// print_r($query);exit;
		// $query->rows;
		if(!empty($query->rows)){
			foreach ($query->rows as $result) {
			$coupon_data[$result['coupon_id']] = $this->getcoupons($result['coupon_id']);
		}
		return $coupon_data;
		}else{
		return false;
		}
		
		
	}
	public function getCustomerCouponun() {
		// $limit='';
		// if ($filter_data['limit']>0) {
		// 	$limit.=' limit '.$filter_data['start'].','.$filter_data['limit'];
		// }
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_coupon cc LEFT JOIN " .DB_PREFIX. "coupon c ON (c.coupon_id=cc.coupon_id) WHERE cc.customer_id = '" . (int)$this->customer->getId(). "' AND c.status='1' AND c.date_end < NOW()");
		// print_r($query);exit;
		// $query->rows;
		if(!empty($query->rows)){
			foreach ($query->rows as $result) {
			$coupon_data[$result['coupon_id']] = $this->getcoupons($result['coupon_id']);
		}
		return $coupon_data;
		}else{
		return false;
		}
		
		
	}
}