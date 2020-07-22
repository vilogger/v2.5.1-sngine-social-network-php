<?php
/**
 * ajax -> chat -> reaction
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
if(!isset($_POST['conversation_id']) || !is_numeric($_POST['conversation_id'])) {
	_error(400);
}

// reaction
try {

	// initialize the return array
	$return = array();

	switch ($_POST['do']) {
		
		case 'close':
			/* unset from opened chat boxes & return */
			if(($key = array_search($_POST['conversation_id'], $_SESSION['chat_boxes_opened'])) !== false) {
				unset($_SESSION['chat_boxes_opened'][$key]);
				/* reindex the array */
				$_SESSION['chat_boxes_opened'] = array_values($_SESSION['chat_boxes_opened']);
			}
			break;

		case 'delete':
			$user->delete_conversation($_POST['conversation_id']);
			/* unset from opened chat boxes & return */
			if(($key = array_search($_POST['conversation_id'], $_SESSION['chat_boxes_opened'])) !== false) {
				unset($_SESSION['chat_boxes_opened'][$key]);
				/* reindex the array */
				$_SESSION['chat_boxes_opened'] = array_values($_SESSION['chat_boxes_opened']);
			}
			$return['callback'] = 'window.location = "'.$system['system_url'].'/messages"';
			break;

		default:
			_error(400);
			break;
	}

	// return & exit
	return_json($return);

} catch (Exception $e) {
	modal(ERROR, __("Error"), $e->getMessage());
}

?>