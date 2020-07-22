<?php
/**
 * ajax -> users -> connect
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
if(!in_array($_POST['do'], array('block', 'unblock', 'friend-accept', 'friend-decline', 'friend-add', 'friend-cancel', 'friend-remove', 'follow', 'unfollow', 'page-like', 'page-unlike', 'page-boost', 'page-unboost', 'page-invite', 'group-join', 'group-leave', 'group-invite', 'group-accept', 'group-decline', 'event-go', 'event-ungo', 'event-interest', 'event-uninterest', 'event-invite'))) {
	_error(400);
}
/* check id */
if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
	_error(400);
}
/* check uid */
if(isset($_POST['uid']) && !is_numeric($_POST['uid'])) {
	_error(400);
}

// connect api
try {

	// connect user
	$_POST['uid'] = ($_POST['uid'] == '0')? null: $_POST['uid'];
	$user->connect($_POST['do'], $_POST['id'], $_POST['uid']);

	// return & exit
	return_json();

} catch (Exception $e) {
	modal(ERROR, __("Error"), $e->getMessage());
}

?>