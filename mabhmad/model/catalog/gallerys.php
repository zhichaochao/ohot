<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/14
 * Time: 16:35
 */

class ModelCatalogGallerys extends Model
{

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
    public function getGalleryInfos($out_id){
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "outsidevideo WHERE out_id = " . (int)$out_id);

        return $query->row;
    }

    public function getGalleryImages($out_id){
        $query = $this->db->query("SELECT image, sort_order FROM " . DB_PREFIX . "gallery_image WHERE out_id = " . (int)$out_id );

        return $query->rows;
    }

    public function getGalleryss($data = array()) {

        $sql = "SELECT * FROM " . DB_PREFIX . "outsidevideo ";

        // if (!empty($data['filter_gallery_title'])) {
        //     $sql .= " AND gallery_title like '%" . $this->db->escape($data['filter_gallery_title']) . "%'";
        // }

        // if (isset($data['filter_product_name']) && !is_null($data['filter_product_name'])) {
        //     $sql .= " AND product_name = '" . $this->db->escape($data['filter_product_name']) . "'";
        // }

        // if (!empty($data['filter_author'])) {
        //     $sql .= " AND author like '%" . $this->db->escape($data['filter_author']) . "%'";
        // }

        // $sort_data = array(
        //     'gallery_title',
        //     'product_name'
        // );

        // if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
        //     $sql .= " ORDER BY " . $data['sort'];
        // } else {
        //     $sql .= " ORDER BY out_id";
        // }

        // if (isset($data['order']) && ($data['order'] == 'DESC')) {
        //     $sql .= " DESC";
        // } else {
        //     $sql .= " ASC";
        // }

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

    public function getTotalgalleryss($data = array()){
        $sql = "SELECT COUNT(*) AS total FROM " . DB_PREFIX . "outsidevideo  ";

        // if (isset($data['filter_gallery_title']) && !is_null($data['filter_gallery_title'])) {
        //     $sql .= " AND gallery_title like '%" . $this->db->escape($data['filter_gallery_title']) . "%'";
        // }

        // if (!empty($data['filter_product_name'])) {
        //     $sql .= " AND product_name = '" . $this->db->escape($data['filter_product_name']) . "'";
        // }

        // if (!empty($data['filter_author'])) {
        //     $sql .= " AND author = '" . $this->db->escape($data['filter_author']) . "'";
        // }

        $query = $this->db->query($sql);

        if($query->row){
            $total = $query->row['total'];
        }
        else{
            $total = 0;
        }

        return $total;
    }

    public function addGallerys($data = array()){

        $sql = "INSERT INTO  " . DB_PREFIX . "outsidevideo set out_url = ' " .$this->db->escape($data['out_url']) . "' ";
// print_r($sql);exit();
        $this->querysql($sql);

        $out_id = $this->db->getLastId();

       

        return $out_id;
    }

    public function editGallerys($out_id, $data){
        // print_r($data);exit;

        $this->querysql("UPDATE " . DB_PREFIX . "outsidevideo SET out_url = '" . $this->db->escape($data['out_url']). "' WHERE out_id = " . (int)$out_id);


    }

    public function deleteGallerys($out_id) {
        $sql = "DELETE FROM " . DB_PREFIX . "outsidevideo WHERE out_id = " .$out_id;

        $this->querysql($sql);

        return true;
    }
}