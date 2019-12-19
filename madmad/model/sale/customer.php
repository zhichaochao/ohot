<?php
class ModelSaleCustomer extends Model {

	public function editToken($customer_id, $token) {
		$this->db->query("UPDATE " . DB_PREFIX . "customer SET token = '" . $this->db->escape($token) . "' WHERE customer_id = '" . (int)$customer_id . "'");
	}

	public function getCustomer($customer_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "customer WHERE customer_id = '" . (int)$customer_id . "'");

		return $query->row;
	}

	public function getCustomers($data = array()) {
		$sql = "SELECT *, CONCAT(c.firstname, ' ', c.lastname) AS name, cgd.name AS customer_group FROM " . DB_PREFIX . "customer c LEFT JOIN " . DB_PREFIX . "customer_group_description cgd ON (c.customer_group_id = cgd.customer_group_id) WHERE cgd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		$implode = array();

		if (!empty($data['filter_name'])) {
			$implode[] = "CONCAT(c.firstname, ' ', c.lastname) LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_email'])) {
			$implode[] = "c.email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
		}

		if (isset($data['filter_newsletter']) && !is_null($data['filter_newsletter'])) {
			$implode[] = "c.newsletter = '" . (int)$data['filter_newsletter'] . "'";
		}

		if (!empty($data['filter_customer_group_id'])) {
			$implode[] = "c.customer_group_id = '" . (int)$data['filter_customer_group_id'] . "'";
		}

		if (!empty($data['filter_ip'])) {
			$implode[] = "c.customer_id IN (SELECT customer_id FROM " . DB_PREFIX . "customer_ip WHERE ip = '" . $this->db->escape($data['filter_ip']) . "')";
		}

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$implode[] = "c.status = '" . (int)$data['filter_status'] . "'";
		}

		if (isset($data['telephone']) && !is_null($data['telephone'])) {
			$implode[] = "c.telephone = '" . (int)$data['telephone'] . "'";
		}

		if (isset($data['filter_approved']) && !is_null($data['filter_approved'])) {
			$implode[] = "c.approved = '" . (int)$data['filter_approved'] . "'";
		}

		if (!empty($data['filter_date_added'])) {
			$implode[] = "DATE(c.date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if ($implode) {
			$sql .= " AND " . implode(" AND ", $implode);
		}

		$sort_data = array(
			'name',
			'c.email',
			'customer_group',
			'c.status',
			'c.approved',
			'c.ip',
			'c.telephone',
			'c.date_added'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY name";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getTotalCustomers($data = array()) {
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer";

		$implode = array();

		if (!empty($data['filter_name'])) {
			$implode[] = "CONCAT(firstname, ' ', lastname) LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
		}

		if (!empty($data['filter_email'])) {
			$implode[] = "email LIKE '" . $this->db->escape($data['filter_email']) . "%'";
		}

		if (isset($data['filter_newsletter']) && !is_null($data['filter_newsletter'])) {
			$implode[] = "newsletter = '" . (int)$data['filter_newsletter'] . "'";
		}

		if (!empty($data['filter_customer_group_id'])) {
			$implode[] = "customer_group_id = '" . (int)$data['filter_customer_group_id'] . "'";
		}

		if (!empty($data['filter_ip'])) {
			$implode[] = "customer_id IN (SELECT customer_id FROM " . DB_PREFIX . "customer_ip WHERE ip = '" . $this->db->escape($data['filter_ip']) . "')";
		}

		if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
			$implode[] = "status = '" . (int)$data['filter_status'] . "'";
		}

		if (isset($data['telephone']) && !is_null($data['telephone'])) {
			$implode[] = "telephone = '" . (int)$data['telephone'] . "'";
		}


		if (isset($data['filter_approved']) && !is_null($data['filter_approved'])) {
			$implode[] = "approved = '" . (int)$data['filter_approved'] . "'";
		}

		if (!empty($data['filter_date_added'])) {
			$implode[] = "DATE(date_added) = DATE('" . $this->db->escape($data['filter_date_added']) . "')";
		}

		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}

		$query = $this->db->query($sql);

		return $query->row['total'];
	}
	/**
	 * 获取用户所有支付成功订单的总价
	 * @author yufeng
	 */
	public function getHistoryOrderTotals($customer_id){
		$sql = "SELECT COUNT(DISTINCT o.order_id) as orders, ROUND(SUM(o.total),2) as order_totals FROM " . DB_PREFIX . "order o
			   LEFT JOIN " . DB_PREFIX . "order_status os ON (o.order_status_id = os.order_status_id)
			   	 WHERE (os.name = 'Processing' OR os.name = 'Shipped' OR os.name = 'Complete'OR os.name = 'Paid') AND
			   		 o.customer_id = '" . (int)$customer_id . "'";
	
		$query = $this->db->query($sql);
		return $query->row;
	}
	
	public function getNextCustomerGroups($customer_id){
		$sql = "SELECT ROUND(total_order,2) AS total_order FROM " . DB_PREFIX . "customer_group cg WHERE
			    total_order > (SELECT cg.total_order FROM " . DB_PREFIX . "customer_group cg LEFT JOIN " . DB_PREFIX . "customer c ON (c.customer_group_id = cg.customer_group_id) WHERE c.customer_id = '" . (int)$customer_id. "')
			    ORDER BY total_order ASC LIMIT 1";
			// print_r($sql);exit;    
		$query = $this->db->query($sql);
		
		return $query->row;
	}
	public function getlastCustomerOrdertotal($customer_id)
	{

	$sql = "SELECT SUM(total) as numtotal FROM " . DB_PREFIX . "order WHERE PERIOD_DIFF(date_format(now( ), '%Y%m') , date_format(date_added, '%Y%m')) = 1 AND customer_id = '" . (int)$customer_id . "' "  ;
	$query = $this->db->query($sql);
	return $query->row;
	}

	public function getlastCustomerOrders($data = array())
	{

	$sql = "SELECT o.order_id,o.order_no,o.reading, o.payment_type, o.payment_method, o.email,o.telephone, o.order_status_id as orderstatus, CONCAT(o.firstname, ' ', o.lastname) AS customer, (SELECT os.name FROM " . DB_PREFIX . "order_status os WHERE os.order_status_id = o.order_status_id AND os.language_id = '" . (int)$this->config->get('config_language_id') . "') AS status, o.shipping_code, o.total, o.currency_code, o.currency_value, o.date_added, o.date_modified FROM " . DB_PREFIX . "order o  "  ;


		if (isset($data['filter_order_status'])) {

				$implode = array();

			$order_statuses = explode(',', $data['filter_order_status']);

			foreach ($order_statuses as $order_status_id) {
				$implode[] = "o.order_status_id = '" . (int)$order_status_id . "'";
			}

			if ($implode) {
				$sql .= " WHERE (" . implode(" OR ", $implode) . ")";
			}

			// }

		} else {
			$sql .= " WHERE o.order_status_id > '0'";
		}
		if (isset($data['customer_id'])) {
			$sql .= "AND customer_id= '" . $data['customer_id'] . "'"; 
		}
		if (!empty($data['filter_orderdate_added'])) {

			$sql .= " AND   DATE(o.date_added) between DATE('" . $this->db->escape($data['filter_orderdate_added']) . "') and DATE('" . $this->db->escape($data['filter_orderdate_end']) . "')";
		}
	$query = $this->db->query($sql);

	return $query->rows;
	}
}
