<?php
class ModelCatalogProduct extends Model {


    public function editProduct($product_id, $data) {

        // print_r($data);exit();

        //加载Model
        $this->load->model("catalog/option");

     
        // print_r($data['product_option']);exit;


        if (isset($data['product_option'])) {


            foreach ($data['product_option'] as $product_option) {
                if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') {

                    if ($product_option['product_option_id']){

                        if (isset($product_option['required']) && !empty($product_option['required'])) {
       
  
                            foreach ($product_option['product_option_value'] as $product_option_value) {

                                if ($product_option_value['product_option_value_id']) {

                       
                                     $sql="UPDATE " . DB_PREFIX . "product_option_value SET  price1 = '" . (float)$product_option_value['price1'] . "',price2 = '" . (float)$product_option_value['price2'] . "',price3 = '" . (float)$product_option_value['price3'] . "',price4 = '" . (float)$product_option_value['price4'] . "',price5 = '" . (float)$product_option_value['price5'] . "',price6 = '" . (float)$product_option_value['price6'] . "',price7 = '" . (float)$product_option_value['price7'] . "', price_prefix = '" . $this->db->escape($product_option_value['price_prefix']) . "', points = '" . (int)$product_option_value['points'] . "' WHERE product_option_value_id = '" . $product_option_value['product_option_value_id'] . "'";

                                        $this->db->query($sql);
                                  

                                    
                                }

                             
                            }
                        }
                       
                    }

                 
                }

              
            }
        }

        $datas=array(

        'product_id'=>$product_id, //产品id
        'content'=>'修改产品', //内容备注
        'type'=>'2',  //1,添加，2，修改，3，复制，4，批量导入,5,同步
    
        );
         $this->changeProductLogs($datas);

// print_r($product_id);

// print_r($data['product_special']);
$sp_id=array();
        
                if (isset($data['product_special'])) {
            //是否同步同类产品的折扣信息
        
            foreach ($data['product_special'] as $key => $product_special) {
            
                    if (isset($product_special['product_special_id'])&&$product_special['product_special_id']>0){
                        $sp_id[]=$product_special['product_special_id'];
                        if (isset($product_special['date_end']) && !empty($product_special['date_end'])) {
                           $this->db->query("UPDATE " . DB_PREFIX . "product_special SET
                            customer_group_id = '" . (int)$product_special['customer_group_id'] . "',
                                product_option_value_id = '" . (int)$product_special['product_option_value_id'] . "',
                            priority = '" . (int)$product_special['priority'] . "',
                            price = '" . (float)$product_special['price'] . "',
                            percent = '" . (float)$product_special['percent'] . "',
                            date_start = '" . $this->db->escape($product_special['date_start']) . "',
                            date_end = '" . $this->db->escape($product_special['date_end']) . "' WHERE product_special_id = '" . $product_special['product_special_id'] . "'");
                        }
                        else {
                         $this->db->query("DELETE FROM " . DB_PREFIX . "product_special WHERE product_special_id = '" . $product_special['product_special_id'] . "'");
                        }
                    }
                    else {
                         if (isset($product_special['date_end']) && !empty($product_special['date_end'])) {
                          
                       $this->db->query("INSERT INTO " . DB_PREFIX . "product_special SET
                        product_id = '" . (int)$product_id . "',
                        customer_group_id = '" . (int)$product_special['customer_group_id'] . "',
                        priority = '" . (int)$product_special['priority'] . "',
                            product_option_value_id = '" . (int)$product_special['product_option_value_id'] . "',
                        price = '" . (float)$product_special['price'] . "',
                        percent = '" . (float)$product_special['percent'] . "',
                        date_start = '" . $this->db->escape($product_special['date_start']) . "',
                        date_end = '" . $this->db->escape($product_special['date_end']) . "'");
                       $sp_id[]= $this->db->getLastId();
                        }
                    }
                
        
        }
        if ( $sp_id) {
           $this->db->query("DELETE FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$product_id . "' AND product_special_id not in(".implode(',',  $sp_id).")");
        }else{
              $this->db->query("DELETE FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$product_id . "'");
                       
        }
    }
     // $q=$this->db->query('SELECT * from th_product_special  WHERE product_id='.(int)$product_id);
    //  print_r($q->rows);
    // exit();

        $price=$this->getProductSpecials($product_id);
        // print_r($price);exit();
        if ($price) {
            $price=$price[0]['special_price'];
        }else{
            $price=$this->getProductPrice($product_id);
        }
        //算一个最低价，来排序
         $this->db->query("UPDATE " . DB_PREFIX . "product SET price='".$price."' WHERE product_id= '" . (int)$product_id . "'");
        
     
    }

    public function copyProduct($product_id) {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "product p WHERE p.product_id = '" . (int)$product_id . "'");

        if ($query->num_rows) {
            $data = $query->row;

            $data['sku'] = '';
            $data['upc'] = '';
            $data['viewed'] = '0';
            $data['keyword'] = '';
            $data['status'] = '1';

            $data['product_attribute'] = $this->getProductAttributes($product_id);
            $data['product_description'] = $this->getProductDescriptions($product_id);
            $data['product_discount'] = $this->getProductDiscounts($product_id);
            $data['product_filter'] = $this->getProductFilters($product_id);
            $data['product_image'] = $this->getProductImages($product_id);
            $data['product_option'] = $this->getProductOptions($product_id);
            $data['product_related'] = $this->getProductRelated($product_id);
            $data['product_reward'] = $this->getProductRewards($product_id);
            $data['product_special'] = $this->getProductSpecials($product_id);
            $data['product_category'] = $this->getProductCategories($product_id);
            $data['product_download'] = $this->getProductDownloads($product_id);
            $data['product_layout'] = $this->getProductLayouts($product_id);
            $data['product_store'] = $this->getProductStores($product_id);
            $data['product_recurrings'] = $this->getRecurrings($product_id);

            $this->addProduct($data);
        }
    }

    public function deleteProduct($product_id) {
        $this->db->query("DELETE FROM " . DB_PREFIX . "product WHERE product_id = '" . (int)$product_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$product_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "product_description WHERE product_id = '" . (int)$product_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$product_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "product_filter WHERE product_id = '" . (int)$product_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$product_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "product_option WHERE product_id = '" . (int)$product_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "product_option_value WHERE product_id = '" . (int)$product_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$product_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "product_related WHERE related_id = '" . (int)$product_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$product_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$product_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$product_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "product_to_download WHERE product_id = '" . (int)$product_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "product_to_layout WHERE product_id = '" . (int)$product_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "product_to_store WHERE product_id = '" . (int)$product_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "product_recurring WHERE product_id = " . (int)$product_id);
        $this->db->query("DELETE FROM " . DB_PREFIX . "review WHERE product_id = '" . (int)$product_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$product_id . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "coupon_product WHERE product_id = '" . (int)$product_id . "'");

        //删除产品的询盘信息(dyl add)
        $this->db->query("DELETE FROM " . DB_PREFIX . "product_inquiry WHERE product_id = '" . (int)$product_id . "'");

        $this->cache->delete('product');
    }

    public function getProduct($product_id) {
        $query = $this->db->query("SELECT DISTINCT *, (SELECT keyword FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$product_id . "') AS keyword FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = '" . (int)$product_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

        return $query->row;
    }

    public function getProducts($data = array()) {
        $sql = "SELECT *  FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON ( p.product_id=p2c.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

        if (!empty($data['filter_name'])) {
            $sql .= " AND (pd.name LIKE '%" . $this->db->escape($data['filter_name']) . "%' OR pd.name LIKE '%" . $this->db->escape($data['filter_name'])  . "%')";
        }

        if (!empty($data['filter_model'])) {
            $sql .= " AND p.model LIKE '%" . $this->db->escape($data['filter_model']) . "%'";
        }
        if (!empty($data['filter_category_id'])) {
                $sql .= " AND p2c.category_id=".(int)$data['filter_category_id']." ";
        }
        if (isset($data['filter_sortorder']) && !is_null($data['filter_sortorder'])) {
            $sql .= " AND p.sort_order = '" . (int)$data['filter_sortorder'] . "'";
        }

        if (isset($data['filter_price']) && !is_null($data['filter_price'])) {
            $sql .= " AND p.price LIKE '" . $this->db->escape($data['filter_price']) . "%'";
        }

        if (isset($data['filter_quantity']) && !is_null($data['filter_quantity'])) {
            $sql .= " AND p.quantity = '" . (int)$data['filter_quantity'] . "'";
        }

        if (isset($data['filter_relation_product'])) {
            $sql .= " AND p.relation_product LIKE '%" . $this->db->escape($data['filter_relation_product']) . "%'";
        }

        if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
            $sql .= " AND p.status = '" . (int)$data['filter_status'] . "'";
        }
        
        if (isset($data['filter_free_postage']) && !is_null($data['filter_free_postage'])) {
            $sql .= " AND p.free_postage = '" . (int)$data['filter_free_postage'] . "'";
        }

        if (isset($data['filter_image']) && !is_null($data['filter_image'])) {
            if ($data['filter_image'] == 1) {
                $sql .= " AND (p.image IS NOT NULL AND p.image <> '' AND p.image <> 'no_image.png')";
            } else {
                $sql .= " AND (p.image IS NULL OR p.image = '' OR p.image = 'no_image.png')";
            }
        }

        $sql .= " GROUP BY p.product_id";

        $sort_data = array(
            'pd.name',
            'p.model',
            'p.price',
            'p.quantity',
            'p.browse',
            'p.relation_product',
            'p.status',
            'p.sort_order',
            'pd.product_id'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            // $sql .= " ORDER BY " . $data['sort'];
            $sql .= " ORDER BY p.date_modified";
            // print_r(1);exit();
        } else {
            // print_r($data['sort']);
            // $sql .= " ORDER BY pd.name";
            $sql .= " ORDER BY p.date_modified";
            // print_r(2);exit();
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
        // print_r($sql);exit();

        $query = $this->db->query($sql);

        return $query->rows;
    }

    public function getProductses($data) {
       if(empty($data)){
            $sql = "SELECT *  FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";
        }else{
            $sql = "SELECT *  FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON ( p.product_id=p2c.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p2c.category_id=".(int)$data['category_id']."";
        }

        $sql .= " GROUP BY p.product_id";
            $sql .= " ORDER BY p.status";
            $sql .= " DESC";

        $query = $this->db->query($sql);

        return $query->rows;
    }

    public function getProductsByCategoryId($category_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN "

            . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN "

            . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id) "

            . "WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p2c.category_id = '" . (int)$category_id . "' ORDER BY pd.name ASC");

        return $query->rows;
    }

    public function getProductDescriptions($product_id) {
        $product_description_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_description WHERE product_id = '" . (int)$product_id . "'");

        foreach ($query->rows as $result) {
            $product_description_data[$result['language_id']] = array(
                'name'             => $result['name'],
                'description'      => $result['description'],
                'm_description'    => $result['m_description'],  //M端产品描述
                'meta_title'       => $result['meta_title'],
                'meta_description' => $result['meta_description'],
                'meta_keyword'     => $result['meta_keyword'],
                'material'     => $result['material'],
                'tag'              => $result['tag']
            );
        }

        return $product_description_data;
    }

    public function getProductCategories($product_id) {
        $product_category_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$product_id . "'");

        foreach ($query->rows as $result) {
            $product_category_data[] = $result['category_id'];
        }

        return $product_category_data;
    }

    //new add
    public function getProductCategoryNames($product_id) {
        $product_category_data = array();
    
        $query = $this->db->query("SELECT c.parent_id, c.category_id, cd.name FROM " . DB_PREFIX . "product_to_category pc 
            INNER JOIN " . DB_PREFIX . "category c ON c.category_id=pc.category_id
            INNER JOIN " . DB_PREFIX . "category_description cd ON cd.category_id=pc.category_id
            WHERE pc.product_id = '" . (int)$product_id . "' ORDER BY c.parent_id");
    
        $data = array();
        foreach ($query->rows as $v) $data[$v['parent_id']] = $v;
        $row = current($data);
        while ($row){
            $product_category_data[] = $row['name'];
            $row = isset($data[$row['category_id']]) ? $data[$row['category_id']] : false;
        }    
    
        return $product_category_data;
    }

    public function getProductFilters($product_id) {
        $product_filter_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_filter WHERE product_id = '" . (int)$product_id . "'");

        foreach ($query->rows as $result) {
            $product_filter_data[] = $result['filter_id'];
        }

        return $product_filter_data;
    }

    public function getProductAttributes($product_id) {
        $product_attribute_data = array();

        $product_attribute_query = $this->db->query("SELECT attribute_id FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$product_id . "' GROUP BY attribute_id");

        foreach ($product_attribute_query->rows as $product_attribute) {
            $product_attribute_description_data = array();

            $product_attribute_description_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$product_id . "' AND attribute_id = '" . (int)$product_attribute['attribute_id'] . "'");

            foreach ($product_attribute_description_query->rows as $product_attribute_description) {
                $product_attribute_description_data[$product_attribute_description['language_id']] = array('text' => $product_attribute_description['text']);
            }

            $product_attribute_data[] = array(
                'attribute_id'                  => $product_attribute['attribute_id'],
                'product_attribute_description' => $product_attribute_description_data
            );
        }

        return $product_attribute_data;
    }

    public function getProductOptions($product_id) {
        $product_option_data = array();

        $product_option_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_option` po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN `" . DB_PREFIX . "option_description` od ON (o.option_id = od.option_id) WHERE po.product_id = '" . (int)$product_id . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "'");

        foreach ($product_option_query->rows as $product_option) {
            $product_option_value_data = array();

            $product_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON(pov.option_value_id = ov.option_value_id) WHERE pov.product_option_id = '" . (int)$product_option['product_option_id'] . "' ORDER BY ov.sort_order ASC");

            foreach ($product_option_value_query->rows as $product_option_value) {
                $product_option_value_data[] = array(
                    'product_option_value_id' => $product_option_value['product_option_value_id'],
                    'option_value_id'         => $product_option_value['option_value_id'],
                    'quantity'                => $product_option_value['quantity'],
                    'subtract'                => $product_option_value['subtract'],
                    'price'                   => $product_option_value['price'],
                    'price1'                   => $product_option_value['price1'],
                    'price2'                   => $product_option_value['price2'],
                    'price3'                   => $product_option_value['price3'],
                    'price4'                   => $product_option_value['price4'],
                    'price5'                   => $product_option_value['price5'],
                    'price6'                   => $product_option_value['price6'],
                    'price7'                   => $product_option_value['price7'],
                    'price_prefix'            => $product_option_value['price_prefix'],
                    'points'                  => $product_option_value['points'],
                    'points_prefix'           => $product_option_value['points_prefix'],
                    'weight'                  => $product_option_value['weight'],
                    'weight_prefix'           => $product_option_value['weight_prefix']
                );
            }

            $product_option_data[] = array(
                'product_option_id'    => $product_option['product_option_id'],
                'product_option_value' => $product_option_value_data,
                'option_id'            => $product_option['option_id'],
                'name'                 => $product_option['name'],
                'type'                 => $product_option['type'],
                'value'                => $product_option['value'],
                'required'             => $product_option['required']
            );
        }

        return $product_option_data;
    }

    public function getProductOptionss($product_id) {
        $product_option_data = array();

        $product_option_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_option` po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN `" . DB_PREFIX . "option_description` od ON (o.option_id = od.option_id) WHERE po.product_id = '" . (int)$product_id . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "'AND (po.option_id=26 or po.option_id=14 )");

        foreach ($product_option_query->rows as $product_option) {
            $product_option_value_data = array();

            $product_option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON(pov.option_value_id = ov.option_value_id) WHERE pov.product_option_id = '" . (int)$product_option['product_option_id'] . "' ORDER BY ov.sort_order ASC");

            foreach ($product_option_value_query->rows as $product_option_value) {
                $product_option_value_data[] = array(
                    'product_option_value_id' => $product_option_value['product_option_value_id'],
                    'option_value_id'         => $product_option_value['option_value_id'],
                    'quantity'                => $product_option_value['quantity'],
                    'subtract'                => $product_option_value['subtract'],
                    'price'                   => $product_option_value['price'],
                    'price1'                   => $product_option_value['price1'],
                    'price2'                   => $product_option_value['price2'],
                    'price3'                   => $product_option_value['price3'],
                    'price4'                   => $product_option_value['price4'],
                    'price5'                   => $product_option_value['price5'],
                    'price6'                   => $product_option_value['price6'],
                    'price7'                   => $product_option_value['price7'],
                    'price_prefix'            => $product_option_value['price_prefix'],
                    'points'                  => $product_option_value['points'],
                    'points_prefix'           => $product_option_value['points_prefix'],
                    'weight'                  => $product_option_value['weight'],
                    'weight_prefix'           => $product_option_value['weight_prefix']
                );
            }

            $product_option_data[] = array(
                'product_option_id'    => $product_option['product_option_id'],
                'product_option_value' => $product_option_value_data,
                'option_id'            => $product_option['option_id'],
                'name'                 => $product_option['name'],
                'type'                 => $product_option['type'],
                'value'                => $product_option['value'],
                'required'             => $product_option['required']
            );
        }

        return $product_option_data;
    }

    public function getProductOptionValue($product_id, $product_option_value_id) {
        $query = $this->db->query("SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_id = '" . (int)$product_id . "' AND pov.product_option_value_id = '" . (int)$product_option_value_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

        return $query->row;
    }

    public function getProductImages($product_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$product_id . "' ORDER BY sort_order ASC");

        return $query->rows;
    }

    public function getProductDiscounts($product_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$product_id . "' ORDER BY quantity, priority, price");

        return $query->rows;
    }
    // 后台获取一个活动价

    public function getProductSpecials($product_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$product_id . "' ORDER BY priority, price");
        $rows=array();
        foreach ($query->rows as $key => $value) {

        if (($value['date_start'] == '0000-00-00' || strtotime($value['date_start']) < time()) && ($value['date_end'] == '0000-00-00' || strtotime($value['date_end']) > time())) {

            if ($value['product_option_value_id']==0) {
                $value['old_price']=$this->getProductPrice($product_id);
            }else{
                $queryk = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_option_value WHERE product_option_value_id = '" . (int)$value['product_option_value_id'] . "'");
                $tem=$queryk->row;
                $value['old_price']=$tem['price'];
                // print_r($tem);

            }
            // print_r($value);exit();
            if ($value['percent'] > 0) {
                $value['special_price']=$value['old_price']*$value['percent']/100;
            }else{
                    $value['special_price']=$value['old_price']-$value['price'];
            }
            $rows[]=$value;
        }
        break;
        }
        // print_r($rows);exit();

        return $rows;
    }

    public function getProductRewards($product_id) {
        $product_reward_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$product_id . "'");

        foreach ($query->rows as $result) {
            $product_reward_data[$result['customer_group_id']] = array('points' => $result['points']);
        }

        return $product_reward_data;
    }

    public function getProductDownloads($product_id) {
        $product_download_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_download WHERE product_id = '" . (int)$product_id . "'");

        foreach ($query->rows as $result) {
            $product_download_data[] = $result['download_id'];
        }

        return $product_download_data;
    }

    public function getProductStores($product_id) {
        $product_store_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_store WHERE product_id = '" . (int)$product_id . "'");

        foreach ($query->rows as $result) {
            $product_store_data[] = $result['store_id'];
        }

        return $product_store_data;
    }

    public function getProductLayouts($product_id) {
        $product_layout_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_layout WHERE product_id = '" . (int)$product_id . "'");

        foreach ($query->rows as $result) {
            $product_layout_data[$result['store_id']] = $result['layout_id'];
        }

        return $product_layout_data;
    }

    public function getProductRelated($product_id) {
        $product_related_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_related WHERE product_id = '" . (int)$product_id . "'");

        foreach ($query->rows as $result) {
            $product_related_data[] = $result['related_id'];
        }

        return $product_related_data;
    }

    public function getRecurrings($product_id) {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_recurring` WHERE product_id = '" . (int)$product_id . "'");

        return $query->rows;
    }

    public function getTotalProducts($data = array()) {
        $sql = "SELECT COUNT(DISTINCT p.product_id) AS total FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p2c.product_id = pd.product_id)";

        $sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

        if (!empty($data['filter_name'])) {
            $sql .= " AND pd.name LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
        }

        if (!empty($data['filter_model'])) {
            $sql .= " AND p.model LIKE '%" . $this->db->escape($data['filter_model']) . "%'";
        }

        if (isset($data['filter_price']) && !is_null($data['filter_price'])) {
            $sql .= " AND p.price LIKE '" . $this->db->escape($data['filter_price']) . "%'";
        }

        if (isset($data['filter_quantity']) && !is_null($data['filter_quantity'])) {
            $sql .= " AND p.quantity = '" . (int)$data['filter_quantity'] . "'";
        }
        if (!empty($data['filter_category_id'])) {
                $sql .= " AND p2c.category_id=".(int)$data['filter_category_id']." ";
        }
        if (isset($data['filter_sortorder']) && !is_null($data['filter_sortorder'])) {
            $sql .= " AND p.sort_order = '" . (int)$data['filter_sortorder'] . "'";
        }

        if (isset($data['filter_relation_product'])) {
            $sql .= " AND p.relation_product LIKE '%" . $this->db->escape($data['filter_relation_product']) . "%'";
        }

        if (isset($data['filter_status']) && !is_null($data['filter_status'])) {
            $sql .= " AND p.status = '" . (int)$data['filter_status'] . "'";
        }
        
        if (isset($data['filter_free_postage']) && !is_null($data['filter_free_postage'])) {
            $sql .= " AND p.free_postage = '" . (int)$data['filter_free_postage'] . "'";
        }

        if (isset($data['filter_image']) && !is_null($data['filter_image'])) {
            if ($data['filter_image'] == 1) {
                $sql .= " AND (p.image IS NOT NULL AND p.image <> '' AND p.image <> 'no_image.png')";
            } else {
                $sql .= " AND (p.image IS NULL OR p.image = '' OR p.image = 'no_image.png')";
            }
        }

        $query = $this->db->query($sql);

        return $query->row['total'];
    }

    public function getTotalProductsByTaxClassId($tax_class_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product WHERE tax_class_id = '" . (int)$tax_class_id . "'");

        return $query->row['total'];
    }

    public function getTotalProductsByStockStatusId($stock_status_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product WHERE stock_status_id = '" . (int)$stock_status_id . "'");

        return $query->row['total'];
    }

    public function getTotalProductsByWeightClassId($weight_class_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product WHERE weight_class_id = '" . (int)$weight_class_id . "'");

        return $query->row['total'];
    }

    public function getTotalProductsByLengthClassId($length_class_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product WHERE length_class_id = '" . (int)$length_class_id . "'");

        return $query->row['total'];
    }

    public function getTotalProductsByDownloadId($download_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product_to_download WHERE download_id = '" . (int)$download_id . "'");

        return $query->row['total'];
    }

    public function getTotalProductsByManufacturerId($manufacturer_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product WHERE manufacturer_id = '" . (int)$manufacturer_id . "'");

        return $query->row['total'];
    }

    public function getTotalProductsByAttributeId($attribute_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product_attribute WHERE attribute_id = '" . (int)$attribute_id . "'");

        return $query->row['total'];
    }

    public function getTotalProductsByOptionId($option_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product_option WHERE option_id = '" . (int)$option_id . "'");

        return $query->row['total'];
    }

    public function getTotalProductsByProfileId($recurring_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product_recurring WHERE recurring_id = '" . (int)$recurring_id . "'");

        return $query->row['total'];
    }

    public function getTotalProductsByLayoutId($layout_id) {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "product_to_layout WHERE layout_id = '" . (int)$layout_id . "'");

        return $query->row['total'];
    }

   /**
    * 获取option属性名字
    * @author  dyl  志超
    
    */
    public function getProductOptionnames($product_id,$option_id) {
        $query = $this->db->query("SELECT ov.*,pov.product_id ,pov.product_option_value_id  FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value_description ov on ov.option_value_id=pov.option_value_id  WHERE pov.product_id = '" . (int)$product_id . "' AND pov.option_id = '" . (int)$option_id . "'");
        // print_r($query->rows);exit();
        return $query->rows;
    }
    
    public function getProductOptionname($option_value_id) {
        $query = $this->db->query("SELECT name FROM " . DB_PREFIX . "option_value_description  WHERE option_value_id = '" . (int)$option_value_id . "' AND language_id = 1");
            return $query->row;
    }
    public function UpdateOptionVluePrice($product_option_value_id,$data=array())
    {
         $this->db->query("UPDATE " . DB_PREFIX . "product_option_value SET price5 = '" . $this->db->escape($data['price5']) . "',price6 = '" . $this->db->escape($data['price6']) . "',price7= '" . $this->db->escape($data['price7']) . "' WHERE product_option_value_id = '" . (int)$product_option_value_id . "'");
    }

 
   /**
    * 获取一个option价格
    * @author  dyl  志超
    
    */
    public function getProductPrice($product_id) {
        $query = $this->db->query("SELECT  min(price) as price,product_option_value_id FROM " . DB_PREFIX . "product_option_value   WHERE product_id='".$product_id."' GROUP BY option_id");
        $price=0;
    
        if ($query->rows) {
            foreach ($query->rows as $key => $value) {
                $price+=$value['price'];
            }
         } 
        return $price;
    }


 

   /**
    * 获取option属性值
    * @author  dyl  783973660@qq.com  2016.9.6
    * @param   String   $value   传递要查询的属性名
    */
    public function getOption($value = ''){
        if(empty($value)){
            return false;
        }

        $sql = "select ovd.option_value_id,ovd.name from ".DB_PREFIX."option_value_description ovd
                left join ".DB_PREFIX."option_description as od on od.option_id = ovd.option_id
                where od.name = '".$value."'";

        $query = $this->db->query($sql);

        $data = array();

        foreach($query->rows as $key=>$row){
            $data[$key]['option_value_id'] = intval($row['option_value_id']);
            $data[$key]['name'] = $row['name'];
        }

        return $data;

    }

    /**
     * 获取同步折扣的所有产品并判断是否可以同步（product_relation、color_id相同的一类产品）
     * @param String $relation_product   产品关联模型
     * @param Int    $color_id           颜色ID
     */
    public function getPercentProductId($relation_product, $color_id){
        $sql = "SELECT product_id FROM " . DB_PREFIX . "product WHERE
                relation_product = '" . $this->db->escape($relation_product) . "'
                        AND color_id = '" . (int)$color_id . "'";
    
        $query = $this->db->query($sql);
        return $query->rows;
    }
    
    /** 
     * 查找相同用户分组情况下，时间是否有交集，有交集则表示其他同类产品在使用不同的折扣或折后价（不能更新），反之则可以更新折扣，最后返回冲突数据的行数
     * @param array $product_specials  特价产品的信息
     * @param array $num               冲突数据的行数
     */
    public function syncValidate($product_specials){
        $num = [];
        foreach ($product_specials as $key => $product_special) {
            $sql = "SELECT product_id FROM " . DB_PREFIX . "product_special WHERE
                        customer_group_id = '" . $product_special['customer_group_id'] . "' AND
                            (date_start >= '" . $product_special['date_start'] . "' AND '" . $product_special['date_end'] . "' >= date_start) OR
                            ('" . $product_special['date_start'] . "' >= date_start AND date_end >= '" . $product_special['date_end'] . "') OR
                            (date_end >= '" . $product_special['date_start'] . "' AND '" . $product_special['date_end'] . "' >= date_end)";
//common::pre($sql);
            $query = $this->db->query($sql);
            if (!empty($query->rows)) {
                $num[] = $key + 1;
            }
        }
        
        return $num;
    }
    
    /** 
      * 同步同类产品的折扣信息
      * @param array $product_specials  特价产品的信息
      * @param String $relation_product   产品关联模型
      * @param Int    $color_id           颜色ID
      */
    public function syncProductPercent($product_specials, $relation_product, $color_id){
        $product_ids = $this->getPercentProductId($relation_product, $color_id);

        foreach($product_ids as $product_id){
            $this->db->query("DELETE FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$product_id['product_id'] . "'");
        }

        foreach ($product_specials as $product_special){
            foreach($product_ids as $product_id){
                //同类产品只能同步折扣，不能同步折后价
                $this->db->query("INSERT INTO " . DB_PREFIX . "product_special SET
                        product_id = '" . (int)$product_id['product_id'] . "',
                        customer_group_id = '" . (int)$product_special['customer_group_id'] . "',
                        priority = '" . (int)$product_special['priority'] . "',
                        percent = '" . (float)$product_special['percent'] . "',
                        date_start = '" . $this->db->escape($product_special['date_start']) . "',
                        date_end = '" . $this->db->escape($product_special['date_end']) . "'");
            }
        }
    }

    public function getbrowse($product_id)
    {
        $sql="SELECT browse from " . DB_PREFIX . "product WHERE product_id = '" . (int)$product_id. "' ";
         // $dbs= unserialize($this->config->get('db_database_data'));
        $res=$this->db->query($sql)->row;
        // $res=array();
        // // $total=0;
        // foreach ($dbs as $key => $value) {
        //     // print_r($key);exit;
        //     if($key==0){
        //       $res[]=  $this->db->query($sql)->row;

        //     }else{
        //         $d='db'.$key;
        //         $res[]=$this->$d->query($sql)->row;
        //     }
        //     // $total+=$res['browse'];
        // }
        // print_r($res);exit;
     return $res;

    }
    public function getCategories($parent_id = 0) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) LEFT JOIN " . DB_PREFIX . "category_to_store c2s ON (c.category_id = c2s.category_id) WHERE c.parent_id = '" . (int)$parent_id . "' AND cd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND c2s.store_id = '" . (int)$this->config->get('config_store_id') . "'  AND c.status = '1' ORDER BY c.sort_order, LCASE(cd.name)");

        return $query->rows;
    }
     public function getProductAdditional($product_id) {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_additional pa  WHERE product_id = '" . (int)$product_id. "' ");

        return $query->rows;
    }

    public function changeProductLogs($datas)
    {
            $ip=$this->getIp();

            $user_id=$this->session->data['user_id'];
            $query = $this->db->query("SELECT u.username FROM " . DB_PREFIX . "user u  WHERE user_id = '" . (int)$user_id. "' ");
            if($query->row){
                $username=$query->row['username'];
            }

        $sql="INSERT INTO " . DB_PREFIX . "product_logs SET ip = '" . $ip . "',username = '" . $username . "', product_id = '" . $this->db->escape($datas['product_id']) . "',user_id = '" . $user_id . "', type = '" . $this->db->escape($datas['type']) . "',content = '" . $this->db->escape($datas['content']) . "',data_added=NOW()";

        $this->db->query($sql);
                    

    }

    function getIp()
    {
        if (isset($_SERVER["HTTP_CLIENT_IP"]) &&$_SERVER["HTTP_CLIENT_IP"] && strcasecmp($_SERVER["HTTP_CLIENT_IP"], "unknown")) {
            $ip = $_SERVER["HTTP_CLIENT_IP"];
        } else {
            if (isset($_SERVER["HTTP_X_FORWARDED_FOR"]) &&$_SERVER["HTTP_X_FORWARDED_FOR"] && strcasecmp($_SERVER["HTTP_X_FORWARDED_FOR"], "unknown")) {
                $ip = $_SERVER["HTTP_X_FORWARDED_FOR"];
            } else {
                if (isset($_SERVER["REMOTE_ADDR"]) &&$_SERVER["REMOTE_ADDR"] && strcasecmp($_SERVER["REMOTE_ADDR"], "unknown")) {
                    $ip = $_SERVER["REMOTE_ADDR"];
                } else {
                    if (isset ($_SERVER['REMOTE_ADDR']) && $_SERVER['REMOTE_ADDR'] && strcasecmp($_SERVER['REMOTE_ADDR'],
                            "unknown")
                    ) {
                        $ip = $_SERVER['REMOTE_ADDR'];
                    } else {
                        $ip = "unknown";
                    }
                }
            }
        }
        return ($ip);
    }
    public function getProductslog($data = array()) {

        $sql = "SELECT *  FROM " . DB_PREFIX . "product_logs pl WHERE 1";

        if (!empty($data['filter_name'])) {
            $sql .= " AND  (pl.content LIKE '%" . $this->db->escape($data['filter_name']) . "%' OR pl.content LIKE '%" . $this->db->escape($data['filter_name'])  . "%')";
        }

        $sort_data = array(
            'pl.data_added'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY pl.data_added";
        } else {
            $sql .= " ORDER BY pl.data_added";
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
    public function getTotalProductslog($data = array()) {
        $sql = "SELECT COUNT(DISTINCT pl.id) AS total FROM " . DB_PREFIX . "product_logs pl WHERE 1";


        if (!empty($data['filter_name'])) {
            $sql .= " AND pl.content LIKE '%" . $this->db->escape($data['filter_name']) . "%'";
        }


        $query = $this->db->query($sql);

        return $query->row['total'];
    }
}
