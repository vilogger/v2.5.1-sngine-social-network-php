<?php
/**
 * paypal
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('bootstrap.php');

// user access
if(!$user->_logged_in) {
	user_login();
}

// process paypal payments
try {

	if($_GET['status'] == 'success') {
		// valid inputs
		if(!isset($_GET['package_id']) || !is_numeric($_GET['package_id'])) {
			_error(400);
		}
		if(!isset($_GET['paymentId']) || !isset($_GET['PayerID'])) {
			_error(400);
		}
		// check package
		$package = $user->get_package($_GET['package_id']);
		if(!$package) {
			_error(400);
		}
		// check payment
		$payment  = paypal_check($_GET['paymentId'], $_GET['PayerID']);
		if($payment) {
			// update user package
			$user->update_user_package($package['package_id'], $package['name'], $package['price']);
		}
	}
	redirect();

} catch (Exception $e) {
	_error('System Message', $e->getMessage());
}