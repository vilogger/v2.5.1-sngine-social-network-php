<?php
/**
 * ajax -> core -> activation phone resend
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

// activation phone resend
try {
	$user->activation_phone_resend();
	modal(SUCCESS, __("Another SMS has been sent"), __("Please check your phone and copy the activation code to activate your account"));
} catch (Exception $e) {
	modal(ERROR, __("Error"), $e->getMessage());
}

?>