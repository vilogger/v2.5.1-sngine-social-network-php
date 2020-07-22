<?php
/**
 * ajax -> admin -> static
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

// edit static pages
try {

	switch ($_GET['do']) {
		case 'edit':
			/* valid inputs */
			if(!isset($_GET['id']) || !is_numeric($_GET['id'])) {
				_error(400);
			}
			/* prepare */
			$_POST['in_footer'] = (isset($_POST['in_footer']))? '1' : '0';
			/* update */
			$db->query(sprintf("UPDATE static_pages SET page_url = %s, page_title = %s, page_text = %s, in_footer = %s WHERE page_id = %s", secure($_POST['page_url']), secure($_POST['page_title']), secure($_POST['page_text']), secure($_POST['in_footer']), secure($_GET['id'], 'int') )) or _error(SQL_ERROR_THROWEN);
			/* return */
			return_json( array('success' => true, 'message' => __("Static page info have been updated")) );
			break;

		case 'add':
			/* check page URL */
			if(is_empty($_POST['page_url']) || !valid_username($_POST['page_url'])) {
				throw new Exception(__("Please enter a valid URL to your page"));
			}
			$check_url = $db->query(sprintf("SELECT * FROM static_pages WHERE page_url = %s", secure($_POST['page_url']) )) or _error(SQL_ERROR_THROWEN);
			if($check_url->num_rows > 0) {
				throw new Exception(__("Sorry, it looks like")." <strong>".$_POST['page_url']."</strong> ".__("belongs to an existing static page"));
			}
			/* prepare */
			$_POST['in_footer'] = (isset($_POST['in_footer']))? '1' : '0';
			/* insert */
			$db->query(sprintf("INSERT INTO static_pages (page_url, page_title, page_text, in_footer) VALUES (%s, %s, %s, %s)", secure($_POST['page_url']), secure($_POST['page_title']), secure($_POST['page_text']), secure($_POST['in_footer']) )) or _error(SQL_ERROR_THROWEN);
			/* return */
			return_json( array('callback' => 'window.location = "'.$system['system_url'].'/admincp/static";') );
			break;
		
		default:
			_error(400);
			break;
	}

} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>