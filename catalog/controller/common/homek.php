<?php
class ControllerCommonHomek extends Controller {
	public function index() {
$data['asd']=0;
		$this->response->setOutput($this->load->view('common/homek', $data));
	}
   
}
