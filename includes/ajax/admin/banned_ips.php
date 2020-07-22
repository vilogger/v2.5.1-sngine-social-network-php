<?php
/**
 * ajax -> admin -> banned ips
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

// edit banned ips
try {

	switch ($_GET['do']) {
		case 'add':
			/* insert */
			$db->query(sprintf("INSERT INTO banned_ips (ip, time) VALUES (%s, %s)", secure($_POST['ip']), secure($date) )) or _error(SQL_ERROR_THROWEN);
			/* return */
			return_json( array('callback' => 'window.location = "'.$system['system_url'].'/admincp/banned_ips";') );
			break;
		
		default:
			_error(400);
			break;
	}

} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>