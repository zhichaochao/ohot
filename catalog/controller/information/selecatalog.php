<?php
	/**
     * 
     * 获取 PC和移动端 子分类控制器
     */
class ControllerInformationSelecatalog extends Controller {

	//获取 PC 端 子分类 
	public function index()
	{
		$this->load->language('information/contact');
		$this->document->setTitle($this->language->get('heading_titles'));
		$this->load->model('catalog/customized');

			 if (isset($this->request->get['catalog_id'])) {
			 	$catalog_id=$this->request->get['catalog_id'];
			 	$navs=$this->model_catalog_customized->getcustomizedFiristNavs($catalog_id);
			 	// print_r($navs);exit;
			 	foreach ($navs as $key => $value) {
			 		$child=$this->model_catalog_customized->getChildNavs($value['nav_id']);
			 		// print_r($child);exit;
			 			foreach ($child as $key => $childvalue) {
			 				$childres[]=array(
			 					'inside_id'=>$childvalue['inside_id'],
			 					'parent_id'=>$childvalue['parent_id'],
			 					'names'	   =>$childvalue['name'],
			 					);
			 			}
			 		$data['res'][]=array(
			 			'status'=>$catalog_id,
			 			'name'=>$value['name'],
			 			'child'=>$childres
			 			);
			 	}
			 }
			$data['breadcrumbs'] = array();

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_home'),
				'href' => $this->url->link('common/home')
			);
			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
			

			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
			
			$this->response->setOutput($this->load->view('information/selecatalog', $data));
	
	}
	//获取 移动 端 子分类 
	public function ydselecatalog()
	{
		$this->load->language('information/contact');
		$this->document->setTitle($this->language->get('heading_titles'));
		$this->load->model('catalog/customized');

			 if (isset($this->request->get['catalog_id'])) {
			 	$catalog_id=$this->request->get['catalog_id'];
			 	$navs=$this->model_catalog_customized->getcustomizedFiristNavs($catalog_id);
			 	// print_r($navs);exit;
			 	foreach ($navs as $key => $value) {
			 		$child=$this->model_catalog_customized->getChildNavs($value['nav_id']);
			 		// print_r($child);exit;
			 			foreach ($child as $key => $childvalue) {
			 				$childres[]=array(
			 					'inside_id'=>$childvalue['inside_id'],
			 					'parent_id'=>$childvalue['parent_id'],
			 					'names'	   =>$childvalue['name'],
			 					);
			 			}
			 		$data['ydres'][]=array(
			 			'status'=>$catalog_id,
			 			'name'=>$value['name'],
			 			'child'=>$childres
			 			);
			 	}
			 }
			$data['breadcrumbs'] = array();

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_home'),
				'href' => $this->url->link('common/home')
			);
			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
			

			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');
			
			$this->response->setOutput($this->load->view('information/ydselecatalog', $data));

	}
}