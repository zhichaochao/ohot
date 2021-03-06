<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));
		if (isset($this->request->get['route'])) {
			$this->document->addLink($this->config->get('config_url'), 'canonical');
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

        //banner轮播图
        $setting_info = array("name"=>"Home Page", "banner_id"=>1, "width"=>1536, "height"=>720, "mwidth"=>710,  "mheight"=>480, "status"=>1 );
        // print_r( $setting_info);exit();
		$data['slideshow'] = $this->load->controller('extension/module/slideshow',$setting_info);
        // print_r($data['slideshow']);exit();

        //读取首页的中间图片
		$this->load->model('design/banner');
		$this->load->model('tool/image');
		 $data['fasts'] = array();
        $results = $this->model_design_banner->getBanner(2);
        foreach ($results as $result) {
            if ($result['image']) {
                $image=$this->model_tool_image->resize($result['image'], 480, 480);
                if ( $result['mimage']) {
                   $mimage=  $this->model_tool_image->resize($result['mimage'], 230, 320);
                }else{
                     $mimage=$image;
                }
                $data['fasts'][] = array(
                    'title' => $result['title'],
                    'mtitle' => $result['mtitle'],
                    'link'  => $result['link'],
                    'image' =>   $image,
                    'mimage' => $mimage
                );

            }
        }
        // print_r( $data['fasts']);exit();
		//读取首页的中间图片,end

        //首页的产品分类显示
        // Menu
        $this->load->model('catalog/category');
        $this->load->model('tool/image');
   

        //加载model
        $this->load->model('catalog/product');
        //首页推荐商品
        $recommend_products = $this->model_catalog_product->getRecommendProducts();
        $i = 0;
        foreach($recommend_products as $key=>$row){
        	$recommend_products[$key]['key_id'] = $i;   //作为索引值 dyl add
        
        	$recommend_products[$key]['description'] = utf8_substr(strip_tags(html_entity_decode($row['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..';
        
        	if($recommend_products[$key]['image']){
        		$recommend_products[$key]['image'] = $this->model_tool_image->resize($row['image'], 228, 228);
        	}else{
        		$recommend_products[$key]['image'] = $this->model_tool_image->resize('placeholder.png', 228, 228);
        	}
        
        	$recommend_products[$key]['product_link'] = $this->url->link('product/product','product_id='.$row['product_id']);
        	$recommend_products[$key]['texture'] = $this->model_catalog_product->getOptionDes('Texture',$row['product_id']);
        	$recommend_products[$key]['price'] = $this->currency->format($row['price'], $this->session->data['currency']);
        	$recommend_products[$key]['min_name'] = utf8_substr(strip_tags($row['name']),0,40).'...';
        	$i++;
        }
        
        $data['recommend_products'] = $recommend_products;
        $this->load->model('common/gallery');
       
        $gallerys=$this->model_common_gallery->getGallerys(array('is_home'=>1,'start'=>0));
        foreach ($gallerys as $key => $value) {
            $gallerys[$key]['url']=$this->url->link('product/product','product_id='.$value['product_id']);
             $gallerys[$key]['image']= $this->model_tool_image->resize($value['image'], 241, 241);
        }
          $data['gallerys'] =$gallerys;

        $this->load->model('common/home');
          $homes=$this->model_common_home->getHomePages();
        if ($homes) {
          foreach ($homes as $key => $value) {
            if($key==3){
                 $homes[$key]['image']= $this->model_tool_image->resize($value['image'], 1537, 600);   
            }else{
                $homes[$key]['image']= $this->model_tool_image->resize($value['image'], 1040, 560);
            }
              
              $homes[$key]['mimage']= $this->model_tool_image->resize($value['mimage'], 710, 400);
              $homes[$key]['title']= $value['title'];
                $homes[$key]['category']= $this->model_catalog_category->getCategory($value['category_id']);
                $category_path=$this->get_category_path($value['category_id']);
              $homes[$key]['category_url']=$this->url->link('product/category', 'path=' .$category_path);
            $filter_data = array(
                'filter_category_id' => $value['category_id'],
                'filter_sub_category' => true,       //dyl add
                // 'filter_filter'      => $filter,
                'sort'               =>'DESC',
                'order'              => 'id',
                'start'              => 0,
                'limit'              => 5
            );

            $product_total = $this->model_catalog_product->getTotalProducts($filter_data);

             $res= $this->model_catalog_product->getProducts($filter_data);
             $childs=array();
             foreach ($res as $k => $val) {

                if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
                    $price = $this->currency->format($val['price'], $this->session->data['currency']);
                } else {
                    $price = false;
                }
                if ($this->customer->isLogged()) {
                    $special = $this->model_catalog_product->getSpecialPrice($val['product_id']);
                }

                $childs[] = array(
                    'product_id' =>$val['product_id'] , 
                    'image' =>$this->model_tool_image->resize($val['image'],400, 400),
                    'price'       => $price,
                    'name'        => utf8_substr(strip_tags($val['name']),0,40).'...',
                    'special'     => isset($special) ? $special : '',
                    'url'=> $this->url->link('product/product', 'product_id=' . $val['product_id']),
                     );
             }
              $homes[$key]['child'] = $childs;

          }
        }
        $data['homes']=$homes;
        $data['video']=HTTPS_SERVERS. $homes[0]['video'];
        if(isset($this->session->data['choose'])){ $data['choose']=1; }else { $data['choose']=''; }
        // unset($this->session->data['choose']);
        

        $this->load->model('catalog/review');
        $resultcoupon = $this->model_catalog_review->getcoupon();
        

        if($resultcoupon){
        foreach ($resultcoupon as $key => $value) {

             $data['resultcoupon'][] = array(
                'coupon_id'     => $value['coupon_id'],
                'name'          => $value['name'],
                'code'          => $value['code'],
                'discountp'     =>floatval($value['discount']),
                'discount'      =>$this->currency->format(floatval($value['discount']),$this->session->data['currency']), 
                'type'          => $value['type'],
                'total'         => $this->currency->format($value['total'],$this->session->data['currency']),
                'date_end'      => date($this->language->get('date_format_short'), strtotime($value['date_end']))
                );
        }
        }else{
             $data['resultcoupon']='';
        }




        $data['addcouponcus'] = $this->url->link('common/home/addcus', '', true);
        $data['login'] = $this->url->link('account/login');
        $data['choose_url']=$this->url->link('common/home/set_session', '', true);
		$this->response->setOutput($this->load->view('common/home', $data));
	}


    public function addcus() {

        $json = array();
        if ($this->customer->isLogged()) {

        if (isset($this->request->post['coupon_id'])) {
            $coupon_id = $this->request->post['coupon_id'];
        }
// print_r($coupon_id);exit;
        $this->load->model('catalog/review');

        $coupon_info = $this->model_catalog_review->getcoupons($coupon_id);
// print_r($coupon_info);exit;
        if ($coupon_info) {
            
                // Edit customers cart
                $this->load->model('catalog/review');

               $result= $this->model_catalog_review->addcoupon($this->request->post['coupon_id']);
                // print_r($result);exit;
                $json['price'] = $this->currency->format(floatval($result['price']),$this->session->data['currency']);
                $json['success'] = "success";

                // $json['total'] =  $this->model_catalog_review->getTotalsThumbs($this->request->post['review_id']);
                // print_r($json['total']);
           
            }

         } else {

                $json['error'] =  $this->url->link('account/login', '', true);
            }

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($json));
    }



    protected function get_category_path($category_id)
    {
        $this->load->model('catalog/category');

        $category_info = $this->model_catalog_category->getCategory($category_id);
        if ($category_info['parent_id']==0) {
            return $category_info['category_id'];
        }else{
            $path=$this->get_category_path($category_info['parent_id']);
            return $path."_".$category_id;
        }
    }
  public function set_session() {

        $this->session->data['choose'] =1 ;
        $this->response->redirect($this->url->link('common/home', '', true));

    }
    /**
     * 判断设备是否是移动设备
     * @return boolean
     */
    public  function isMobile()
    {
        // 如果有HTTP_X_WAP_PROFILE则一定是移动设备
        if (isset ($_SERVER['HTTP_X_WAP_PROFILE'])) {
            return true;
        }
        // 如果via信息含有wap则一定是移动设备,部分服务商会屏蔽该信息
        if (isset ($_SERVER['HTTP_VIA'])) {
            // 找不到为flase,否则为true
            return stristr($_SERVER['HTTP_VIA'], "wap") ? true : false;
        }
        // 脑残法，判断手机发送的客户端标志,兼容性有待提高
        if (isset ($_SERVER['HTTP_USER_AGENT'])) {
            $clientkeywords = array ('nokia',
                'sony',
                'ericsson',
                'mot',
                'samsung',
                'htc',
                'sgh',
                'lg',
                'sharp',
                'sie-',
                'philips',
                'panasonic',
                'alcatel',
                'lenovo',
                'iphone',
                'ipod',
                'blackberry',
                'meizu',
                'android',
                'netfront',
                'symbian',
                'ucweb',
                'windowsce',
                'palm',
                'operamini',
                'operamobi',
                'openwave',
                'nexusone',
                'cldc',
                'midp',
                'wap',
                'mobile'
            );
            // 从HTTP_USER_AGENT中查找手机浏览器的关键字
            if (preg_match("/(" . implode('|', $clientkeywords) . ")/i", strtolower($_SERVER['HTTP_USER_AGENT']))) {
                return true;
            }
        }
        // 协议法，因为有可能不准确，放到最后判断
        if (isset ($_SERVER['HTTP_ACCEPT'])) {
            // 如果只支持wml并且不支持html那一定是移动设备
            // 如果支持wml和html但是wml在html之前则是移动设备
            if ((strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') !== false) && (strpos($_SERVER['HTTP_ACCEPT'], 'text/html') === false || (strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') < strpos($_SERVER['HTTP_ACCEPT'], 'text/html')))) {
                return true;
            }
        }
        return false;
    }
}
