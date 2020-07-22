<?php
/**
 * ajax -> payments -> paypal
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('../../../bootstrap.php');

// check AJAX Request
is_ajax();

// user access
user_access(true);

// valid inputs
if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
	_error(400);
}

// paypal
try {

	// check package
	$package = $user->get_package($_POST['id']);
	if(!$package) {
		_error(400);
	}
	/* check if user already subscribed to this package */
	if($user->_data['user_subscribed'] && $user->_data['user_package'] == $package['package_id']) {
		modal(SUCCESS, __("Subscribed"), __("You already subscribed to this package, Please select different package"));
	}

	// get paypal link
	$link = paypal($package['package_id'], $package['price']);

	// return & exit
	return_json( array('callback' => 'window.location.href = "'.$link.'";') );

} catch (Exception $e) {
	modal(ERROR, __("Error"), $e->getMessage());
}

?>