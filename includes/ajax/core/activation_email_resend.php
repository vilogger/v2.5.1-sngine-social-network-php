<?php
/**
 * ajax -> core -> activation email resend
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
if($system['activation_type'] != "email") {
	_error(400);
}

// activation email resend
try {
	$user->activation_email_resend();
	modal(SUCCESS, __("Another activation email has been sent"), __("Please click on the link in that email to activate your account"));
} catch (Exception $e) {
	modal(ERROR, __("Error"), $e->getMessage());
}

?>