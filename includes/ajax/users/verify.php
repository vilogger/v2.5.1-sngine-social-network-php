<?php
/**
 * ajax -> users -> verify
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

// verify
try {

	// check node
	if(isset($_POST['id']) && is_numeric($_POST['id'])) {
		/* check if the user is the page admin */
		$check = $db->query(sprintf("SELECT * FROM pages WHERE page_id = %s AND page_admin = %s", secure($_POST['id'], 'int'), secure($user->_data['user_id'], 'int') )) or _error(SQL_ERROR_THROWEN);
		if($check->num_rows == 0) {
			_error(403);
		}
		$node_type = "page";
		$node_id = $_POST['id'];
	} else {
		$node_type = "user";
		$node_id = $user->_data['user_id'];
	}

	// handle do
	switch ($_POST['do']) {
		case 'request':
			$db->query(sprintf("INSERT INTO verification_requests (node_id, node_type, time, status) VALUES (%s, %s, %s, '0')", secure($node_id, 'int'), secure($node_type), secure($date) )) or _error(SQL_ERROR_THROWEN);
			break;

		case 'cancel':
			$db->query(sprintf("DELETE FROM verification_requests WHERE node_id = %s AND node_type = %s", secure($node_id, 'int'), secure($node_type) )) or _error(SQL_ERROR_THROWEN);
			break;
		
		default:
			_error(400);
			break;
	}
	

	// return & exit
	return_json();

} catch (Exception $e) {
	modal(ERROR, __("Error"), $e->getMessage());
}

?>