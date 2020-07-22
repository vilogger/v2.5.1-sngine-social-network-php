<?php
/**
 * ajax -> chat -> check conversation
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
if(!isset($_GET['uid']) && !is_numeric($_GET['uid'])) {
	_error(400);
}


// check mutual conversation
try {

	// initialize the return array
	$return = array();

	// check mutual conversation
	$mutual_conversation = $user->get_mutual_conversation((array)$_GET['uid'], true);
	if($mutual_conversation) {
		$return['conversation_id'] = $mutual_conversation;
	}
	
	// return & exit
	return_json($return);

} catch (Exception $e) {
	modal(ERROR, __("Error"), $e->getMessage());
}

?>