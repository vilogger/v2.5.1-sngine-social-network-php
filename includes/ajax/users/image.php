<?php
/**
 * ajax -> users -> image
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

// remove image (picture|cover)
try {

	// initialize the return array
	$return = array();

	switch ($_POST['handle']) {
		case 'cover-user':
			/* update user cover */
			$db->query(sprintf("UPDATE users SET user_cover = null, user_cover_id = null WHERE user_id = %s", secure($user->_data['user_id'], 'int') )) or _error(SQL_ERROR_THROWEN);
			break;

		case 'picture-user':
			/* update user picture */
			$db->query(sprintf("UPDATE users SET user_picture = null, user_picture_id = null WHERE user_id = %s", secure($user->_data['user_id'], 'int') )) or _error(SQL_ERROR_THROWEN);
			/* return */
			$return['file'] = $user->get_picture('', $user->_data['user_gender']);
			break;

		case 'cover-page':
			/* check if page id is set */
			if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
				_error(403);
			}
			/* check if the user is the page admin */
			$check = $db->query(sprintf("SELECT * FROM pages WHERE page_id = %s AND page_admin = %s", secure($_POST['id'], 'int'), secure($user->_data['user_id'], 'int') )) or _error(SQL_ERROR_THROWEN);
			if($check->num_rows == 0) {
				_error(403);
			}
			/* update page cover */
			$db->query(sprintf("UPDATE pages SET page_cover = null, page_cover_id = null WHERE page_id = %s", secure($_POST['id'], 'int') )) or _error(SQL_ERROR_THROWEN);
			break;

		case 'picture-page':
			/* check if page id is set */
			if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
				_error(403);
			}
			/* check if the user is the page admin */
			$check = $db->query(sprintf("SELECT * FROM pages WHERE page_id = %s AND page_admin = %s", secure($_POST['id'], 'int'), secure($user->_data['user_id'], 'int') )) or _error(SQL_ERROR_THROWEN);
			if($check->num_rows == 0) {
				_error(403);
			}
			/* update page picture */
			$db->query(sprintf("UPDATE pages SET page_picture = null, page_picture_id = null WHERE page_id = %s", secure($_POST['id'], 'int') )) or _error(SQL_ERROR_THROWEN);
			/* return */
			$return['file'] = $user->get_picture('', 'page');
			break;

		case 'cover-group':
			/* check if group id is set */
			if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
				_error(403);
			}
			/* check if the user is the group admin */
			$check = $db->query(sprintf("SELECT * FROM groups WHERE group_id = %s AND group_admin = %s", secure($_POST['id'], 'int'), secure($user->_data['user_id'], 'int') )) or _error(SQL_ERROR_THROWEN);
			if($check->num_rows == 0) {
				_error(403);
			}
			/* update group cover */
			$db->query(sprintf("UPDATE groups SET group_cover = null, group_cover_id = null WHERE group_id = %s", secure($_POST['id'], 'int') )) or _error(SQL_ERROR_THROWEN);
			break;

		case 'picture-group':
			/* check if group id is set */
			if(!isset($_POST['id']) || !is_numeric($_POST['id'])) {
				_error(403);
			}
			/* check if the user is the group admin */
			$check = $db->query(sprintf("SELECT * FROM groups WHERE group_id = %s AND group_admin = %s", secure($_POST['id'], 'int'), secure($user->_data['user_id'], 'int') )) or _error(SQL_ERROR_THROWEN);
			if($check->num_rows == 0) {
				_error(403);
			}
			/* update group picture */
			$db->query(sprintf("UPDATE groups SET group_picture = null, group_picture_id = null WHERE group_id = %s", secure($_POST['id'], 'int') )) or _error(SQL_ERROR_THROWEN);
			/* return */
			$return['file'] = $user->get_picture('', 'group');
			break;

		default:
			_error(400);
			break;
	}

	// return & exit
	return_json($return);

}catch (Exception $e) {
	modal(ERROR, __("Error"), $e->getMessage());
}

?>