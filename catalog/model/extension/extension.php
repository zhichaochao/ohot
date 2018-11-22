<?php
class ModelExtensionExtension extends Model {
	function getExtensions($type) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "extension WHERE `type` = '" . $this->db->escape($type) . "'");

		return $query->rows;
	}
	function getSearch() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "keywords k WHERE customer_id = '" . (int)$this->customer->getId() . "'ORDER BY k.id DESC");
		return $query->rows;
	}
	public function deleteSearch($id) {
		$query=$this->db->query("DELETE FROM `" . DB_PREFIX . "keywords` WHERE customer_id = '" . $id. "'");	
		return $query;
	}
}