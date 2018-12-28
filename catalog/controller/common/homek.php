<?php
class ControllerCommonHomek extends Controller {
	public function index() {
		if (isset($this->request->get['email'])) {
			# code...

               //发送邮件
               $this->load->language('mail/customer');
               $this->load->model('account/customer');
            
             
                 //邮箱头部信息
         
         		 $message  = "test,if you get it tell me\n\n";

               $mail = new Mail();
               $mail->protocol = $this->config->get('config_mail_protocol');
               $mail->parameter = $this->config->get('config_mail_parameter');
               $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
               $mail->smtp_username = $this->config->get('config_mail_smtp_username');
               $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
               $mail->smtp_port = $this->config->get('config_mail_smtp_port');
               $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

               $mail->setTo($this->request->get['email']);                     //发给系统管理员的邮箱(接收人邮箱)
               $mail->setFrom($this->config->get('config_mail_parameter'));      //发送人
               $mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));    //发送者名字
               $mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'),'test'), ENT_QUOTES, 'UTF-8'));
               $mail->setSubject('test');  
                                                          //邮件标题
               // 邮件模板
               $mail->setHtml( $message );

               $mail->setText(html_entity_decode($message, ENT_QUOTES, 'UTF-8'));
               $mail->send();

               $json=$mail->send();
               if ($json) {
              	print_r($json);
               }else{
               	print_r($this->request->get['email'].' success');
               }
           }else{
           	print_r('email please');
           }
	}

	public function order()
	{
		$order_id=$this->request->get['order_id'];
		$order_status_id=$this->request->get['status_id'];

		$this->load->model('checkout/order');
		 $this->model_checkout_order->sendEmail($order_id,$order_status_id);
	}
   
}
