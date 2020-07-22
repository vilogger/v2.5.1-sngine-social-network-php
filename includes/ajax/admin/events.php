<?php
/**
 * ajax -> admin -> events
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

// edit pages
try {

	switch ($_GET['do']) {
		case 'edit_event':
			/* valid inputs */
			if(!isset($_GET['id']) || !is_numeric($_GET['id'])) {
				_error(400);
			}
			/* update */
			$user->edit_event($_GET['id'], $_POST['title'], $_POST['location'], $_POST['start_date'], $_POST['end_date'], $_POST['privacy'], $_POST['category'], $_POST['description']);
			/* return */
			return_json( array('success' => true, 'message' => __("Event info have been updated")) );
			break;

		case 'add_category':
			/* insert */
			$db->query(sprintf("INSERT INTO events_categories (category_name) VALUES (%s)", secure($_POST['category_name']) )) or _error(SQL_ERROR_THROWEN);
			/* return */
			return_json( array('callback' => 'window.location = "'.$system['system_url'].'/admincp/events/categories";') );
			break;

		case 'edit_category':
			/* valid inputs */
			if(!isset($_GET['id']) || !is_numeric($_GET['id'])) {
				_error(400);
			}
			/* update */
			$db->query(sprintf("UPDATE events_categories SET category_name = %s WHERE category_id = %s", secure($_POST['category_name']), secure($_GET['id'], 'int') )) or _error(SQL_ERROR_THROWEN);
			/* return */
			return_json( array('success' => true, 'message' => __("Category info have been updated")) );
			break;

		default:
			_error(400);
			break;
	}

} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>