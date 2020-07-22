<?php
/**
 * ajax -> admin -> groups
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

// edit groups
try {

	/* valid inputs */
	if(!isset($_GET['id']) || !is_numeric($_GET['id'])) {
		_error(400);
	}
	/* update */
	$user->edit_group($_GET['id'], $_POST['group_title'], $_POST['group_name'], $_POST['group_privacy'], $_POST['group_description']);
	/* return */
	return_json( array('success' => true, 'message' => __("Group info have been updated")) );

} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>