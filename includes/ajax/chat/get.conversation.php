<?php
/**
 * ajax -> chat -> get conversation
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
/* if conversation_id not set -> ids must be numeric */
if(!isset($_GET['conversation_id']) && !is_numeric($_GET['ids'])) {
	_error(400);
}

// get conversation
try {

	// initialize the return array
	$return = array();

	/* get conversation */
	$conversation = $user->get_conversation($_GET['conversation_id']);
	if($conversation) {
		/* get conversation messages */
		$conversation['messages'] = $user->get_conversation_messages($conversation['conversation_id']);
		/* assign variables */
		$smarty->assign('conversation', $conversation);
		/* return */
		$return['conversation'] = $smarty->fetch("ajax.chat.conversation.tpl");
	}

	// return & exit
	return_json($return);

}catch (Exception $e) {
	modal(ERROR, __("Error"), $e->getMessage());
}

?>