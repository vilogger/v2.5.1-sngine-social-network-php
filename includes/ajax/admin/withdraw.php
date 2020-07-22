<?php
/**
 * ajax -> admin -> withdraw
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

// valid inputs
if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
	_error(400);
}

// withdraw
try {

	switch ($_POST['handle']) {

		case 'approve':
			/* approve request */
			$db->query(sprintf("UPDATE affiliates_payments SET status = '1' WHERE payment_id = %s", secure($_POST['id'], 'int') )) or _error(SQL_ERROR_THROWEN);
			break;

		case 'decline':
			/* decline request */
			$db->query(sprintf("UPDATE affiliates_payments SET status = '-1' WHERE payment_id = %s", secure($_POST['id'], 'int') )) or _error(SQL_ERROR_THROWEN);
			break;

		default:
			_error(400);
			break;
	}

	// return
	return_json();

} catch (Exception $e) {
	modal(ERROR, __("Error"), $e->getMessage());
}

?>