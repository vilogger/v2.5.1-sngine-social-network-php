<?php
/**
 * ajax -> users -> withdraw
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

// withdraw
try {

	/* valid inputs */
	if(!valid_email($_POST['email'])) {
        throw new Exception(__("Please enter a valid email address"));
    }
    if(is_empty($_POST['amount']) || !is_numeric($_POST['amount']) || $_POST['amount'] <= 0) {
		throw new Exception(__("You have to enter valid amount"));
	}
	switch ($system['affiliate_payment_method']) {
		case 'paypal':
			$valid_methods = array('paypal');
			break;

		case 'skrill':
			$valid_methods = array('skrill');
			break;
		
		default:
			$valid_methods = array('paypal', 'skrill');
			break;
	}
	if(!isset($_POST['method']) || !in_array($_POST['method'], $valid_methods)) {
		throw new Exception(__("Please select a valid payment method"));
	}
	/* valid amount */
	if($_POST['amount'] < $system['affiliates_min_withdrawal']) {
		throw new Exception(__("Your balance is less than the minimum withdrawal request amount"));
	}
	if($_POST['amount'] > $user->_data['user_affiliate_balance']) {
		throw new Exception(__("Your balance is less than the requested amount"));
	}
	/* insert payment */
	$db->query(sprintf("INSERT INTO affiliates_payments (user_id, email, amount, method, time, status) VALUES (%s, %s, %s, %s, %s, '0')", secure($user->_data['user_id'], 'int'), secure($_POST['email']), secure($_POST['amount']), secure($_POST['method']), secure($date) )) or _error(SQL_ERROR_THROWEN);
	/* update user balance*/
	$balance = $user->_data['user_affiliate_balance'] - $_POST['amount'];
	$db->query(sprintf("UPDATE users SET user_affiliate_balance = %s WHERE user_id = %s", secure($balance), secure($user->_data['user_id'], 'int') )) or _error(SQL_ERROR_THROWEN);
	
	return_json( array('success' => true, 'message' => __("Your withdrawal request has been sent")) );

} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>