<?php
/**
 * ajax -> admin -> test
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('../../../bootstrap.php');

// check AJAX Request
is_ajax();

// check admin logged in
if(!$user->_logged_in || !$user->_is_admin) {
	modal(MESSAGE, __("System Message"), __("You don't have the right permission to access this"));
}

// test services
try {

	switch ($_POST['handle']) {
		case 'smtp':
			/* test */
			email_smtp_test();
			/* return */
			return_json( array('success' => true, 'message' => __("Test email has been sent to").": ".$system['system_email']) );
			break;

		case 'sms':
			/* test */
			sms_test();
			/* return */
			return_json( array('success' => true, 'message' => __("Test SMS has been sent to").": ".$system['system_phone']) );
			break;

		case 's3':
			/* test */
			aws_s3_test();
	        /* return */
			return_json( array('success' => true, 'message' => __("Connection established Successfully!")) );
			break;

		default:
			_error(400);
			break;
	}

} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>