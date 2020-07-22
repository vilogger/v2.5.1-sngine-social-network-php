<?php
/**
 * ajax -> albums -> update
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
if(!isset($_GET['id']) || !is_numeric($_GET['id'])) {
	_error(400);
}

// edit album
try {

	// initialize the return array
	$return = array();

	// get album
	$album = $user->get_album($_GET['id']);
	/* assign variables */
	$smarty->assign('album', $album);
	/* return */
	$return['album_edit'] = $smarty->fetch("ajax.album_edit.tpl");
	$return['callback'] = "$('#modal').modal('show'); $('.modal-content:last').html(response.album_edit);";

	// return & exit
	return_json($return);

} catch (Exception $e) {
	modal(ERROR, __("Error"), $e->getMessage());
}


?>