<?php
/**
 * ajax -> admin -> newsletter
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

// newsletter
try {

	/* valid inputs */
	if(is_empty($_POST['subject'])) {
        throw new Exception(__("You must enter the email subject"));
    }
    if(is_empty($_POST['message'])) {
        throw new Exception(__("You must enter the message subject"));
    }
    /* send email */
    if($_POST['is_test']) {
    	if(!_email($system['system_email'], $_POST['subject'], $_POST['message'], $_POST['is_html'])) {
            throw new Exception(__("Email could not be sent"));
        }
    } else {
    	switch ($_POST['to']) {
    		case 'active':
    			$get_users = $db->query("SELECT user_email FROM users WHERE user_activated = '1'") or _error(SQL_ERROR_THROWEN);
    			while($_user = $get_users->fetch_assoc()) {
    				_email($_user['user_email'], $_POST['subject'], $_POST['message'], $_POST['is_html']);
    			}
    			break;

    		case 'inactive':
    			$get_users = $db->query("SELECT user_email FROM users WHERE user_activated = '0'") or _error(SQL_ERROR_THROWEN);
    			while($_user = $get_users->fetch_assoc()) {
    				_email($_user['user_email'], $_POST['subject'], $_POST['message'], $_POST['is_html']);
    			}
    			break;
    		
    		default:
    			$get_users = $db->query("SELECT user_email FROM users") or _error(SQL_ERROR_THROWEN);
    			while($_user = $get_users->fetch_assoc()) {
    				_email($_user['user_email'], $_POST['subject'], $_POST['message'], $_POST['is_html']);
    			}
    			break;
    	}
    }
	return_json( array('success' => true, 'message' => __("Email has been sent successfully")) );

} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>