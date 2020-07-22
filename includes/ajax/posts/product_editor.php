<?php
/**
 * ajax -> posts -> product editor
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
if(!isset($_GET['post_id']) || !is_numeric($_GET['post_id'])) {
	_error(400);
}

// product editor
try {

	// initialize the return array
	$return = array();

	// get post
	$post = $user->get_post($_GET['post_id']);
	if(!$post)  {
		_error(400);
	}
	/* assign variables */
	$smarty->assign('post', $post);
	$smarty->assign('market_categories', $user->get_market_categories());
	/* return */
	$return['template'] = $smarty->fetch("ajax.product_editor.tpl");
	$return['callback'] = "$('#modal').modal('show'); $('.modal-content:last').html(response.template);";

	// return & exit
	return_json($return);

} catch (Exception $e) {
	modal(ERROR, __("Error"), $e->getMessage());
}

?>