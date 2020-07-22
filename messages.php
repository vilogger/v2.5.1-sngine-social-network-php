<?php
/**
 * messages
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('bootstrap.php');

// user access
user_access();

// page header
page_header(__("Messages"));

try {

	// check the view
	$view = (!isset($_GET['view']))? 'message' : 'new';

	// get view content
	if($view == 'message') {
		if (!isset($_GET['cid'])) {
			if(count($user->_data['conversations']) > 0) {
				$conversation = $user->_data['conversations'][0];
				$conversation['messages'] = $user->get_conversation_messages($conversation['conversation_id']);
			}
		} else {
			/* check cid is valid */
			if(is_empty($_GET['cid']) || !is_numeric($_GET['cid'])) {
				_error(404);
			}
			$conversation = $user->get_conversation($_GET['cid']);
			$conversation['messages'] = $user->get_conversation_messages($conversation['conversation_id']);
		}
		// assign variables
		$smarty->assign('conversation', $conversation);
	}
	/* assign variables */
	$smarty->assign('view', $view);

} catch (Exception $e) {
	_error(__("Error"), $e->getMessage());
}

// page footer
page_footer("messages");

?>