<?php
/**
 * ajax -> users -> started
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

// started
try {
	$user->settings('started', $_POST);
	return_json( array('success' => true, 'message' => __("Your info has been updated")) );
} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>