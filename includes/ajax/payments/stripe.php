<?php
/**
 * ajax -> payments -> stripe
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
if(!isset($_POST['token'])) {
	_error(400);
}

// stripe
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

	// process
	require_once(ABSPATH.'includes/libs/Stripe/init.php');
	$secret_key = ($system['stripe_mode'] == "live")? $system['stripe_live_secret'] : $system['stripe_test_secret'];
	\Stripe\Stripe::setApiKey($secret_key);
	$customer = \Stripe\Customer::create(array(
        'source' => $_POST['token']
    ));
    $charge   = \Stripe\Charge::create(array(
        'customer' => $customer->id,
        'receipt_email' => $_POST['email'],
        'amount' => $package['price']*100,
        'currency' => $system['system_currency']
    ));
    if($charge) {
    	// update user package
		$user->update_user_package($package['package_id'], $package['name'], $package['price']);
    }

	// return & exit
	return_json( array('callback' => 'window.location.href = "'.$system['system_url'].'";') );

} catch (Exception $e) {
	modal(ERROR, __("Error"), $e->getMessage());
}

?>