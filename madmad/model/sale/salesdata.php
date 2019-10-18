<?php
class ModelSaleSalesdata  extends Model {




	

	public function getSalesStation($data = array(),$key) {
		$sql = "SELECT o.order_id, CONCAT(o.firstname, '', o.lastname) AS customer, (SELECT os.name FROM " . DB_PREFIX . "order_status os WHERE os.order_status_id = o.order_status_id AND os.language_id = '" . (int)$this->config->get('config_language_id') . "') AS order_status, o.shipping_code, o.total, o.currency_code, o.currency_value, o.date_added, o.date_modified, o.order_no FROM `" . DB_PREFIX . "order` o";

		if (isset($data['filter_order_status'])) {
			// if($data['filter_order_status']==3){
			// 	$sql .= " WHERE (o.order_status_id = 3 OR o.order_status_id = 2)";
			// }else{

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

		if (!empty($data['filter_date_added'])) {

			$sql .= " AND   DATE(o.date_added) between DATE('" . $this->db->escape($data['filter_date_added']) . "') and DATE('" . $this->db->escape($data['filter_date_end']) . "')";
		}

		$sort_data = array(
			'o.order_id',
			'o.date_added',
			'o.date_modified',
			'o.total'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY o.total";
		} else {
			$sql .= " ORDER BY o.total";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " DESC";
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
// print_r($sql);exit;
		if ($key>0) {
				$d='db'.$key;
		$query = $this->$d->query($sql);
		}else{
				$query = $this->db->query($sql);
		}

		return $query->rows;
	}




	public function getTotalSalesStation($data = array(),$key) {
		$sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "order o";


		if (isset($data['filter_order_status'])) {
			// if($data['filter_order_status']==3){
			// 	$sql .= " WHERE (o.order_status_id = 3 OR o.order_status_id = 2)";
			// }else{
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

		if (!empty($data['filter_date_added'])) {

			$sql .= " AND   DATE(o.date_added) between DATE('" . $this->db->escape($data['filter_date_added']) . "') and DATE('" . $this->db->escape($data['filter_date_end']) . "')";
		}
		if ($key>0) {
				$d='db'.$key;
		$query = $this->$d->query($sql);
		}else{
				$query = $this->db->query($sql);
		}

		//$query = $this->db->query($sql);

		return $query->row['total'];
	}

}
