<?php
/**
 * ajax -> core -> activation phone confirm
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('../../../bootstrap.php');

// check AJAX Request
is_ajax();

// check user logged in
if(!$user->_logged_in) {
	modal(LOGIN);
}

// check user activated
if(!$system['activation_enabled'] || $user->_data['user_activated']) {
	modal(SUCCESS, __("Activated"), __("Your account already activated!"));
}

// check activation type
if($system['activation_type'] != "sms") {
	_error(400);
}

// activation phone confirm
try {
	$user->activation_phone($_POST['token']);
	return_json( array('callback' => 'window.location.reload();') );
} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>