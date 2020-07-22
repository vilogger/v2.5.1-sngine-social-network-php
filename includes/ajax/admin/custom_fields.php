<?php
/**
 * ajax -> admin -> custom fields
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

// edit custom fields
try {

	switch ($_GET['do']) {
		case 'edit':
			/* valid inputs */
			if(!isset($_GET['id']) || !is_numeric($_GET['id'])) {
				_error(400);
			}
			if(is_empty($_POST['label'])) {
				throw new Exception(__("You have to enter the field label"));
			}
			$types = array('textbox', 'textarea', 'selectbox');
			if(!in_array($_POST['type'], $types)) {
				throw new Exception(__("You have to select a valid type"));
			}
			if($_POST['type'] == "selectbox") {
				if(is_empty($_POST['select_options'])) {
					throw new Exception(__("You have to enter the select options"));
				}
			}
			if(is_empty($_POST['length']) || !is_numeric($_POST['length'])) {
				throw new Exception(__("You have to enter valid field length"));
			}
			if($_POST['length'] <= 0 || $_POST['length'] > 1000) {
				throw new Exception(__("The field minimum length is 1 and maximum 1000 characters"));
			}
			/* prepare */
			$_POST['mandatory'] = (isset($_POST['mandatory']))? '1' : '0';
			$_POST['in_registration'] = (isset($_POST['in_registration']))? '1' : '0';
			$_POST['in_profile'] = (isset($_POST['in_profile']))? '1' : '0';
			/* update */
			$db->query(sprintf("UPDATE custom_fields SET type = %s, select_options = %s, label = %s, description = %s, place = %s, length = %s, mandatory = %s, in_registration = %s, in_profile = %s WHERE field_id = %s", secure($_POST['type']), secure($_POST['select_options']), secure($_POST['label']), secure($_POST['description']), secure($_POST['place']), secure($_POST['length'], 'int'), secure($_POST['mandatory']), secure($_POST['in_registration']), secure($_POST['in_profile']), secure($_GET['id'], 'int') )) or _error(SQL_ERROR_THROWEN);
			/* return */
			return_json( array('success' => true, 'message' => __("Field info have been updated")) );
			break;

		case 'add':
			/* valid inputs */
			if(is_empty($_POST['label'])) {
				throw new Exception(__("You have to enter the field label"));
			}
			$types = array('textbox', 'textarea', 'selectbox');
			if(!in_array($_POST['type'], $types)) {
				throw new Exception(__("You have to select a valid type"));
			}
			if($_POST['type'] == "selectbox") {
				if(is_empty($_POST['select_options'])) {
					throw new Exception(__("You have to enter the select options"));
				}
			}
			if(is_empty($_POST['length']) || !is_numeric($_POST['length'])) {
				throw new Exception(__("You have to enter valid field length"));
			}
			if($_POST['length'] <= 0 || $_POST['length'] > 1000) {
				throw new Exception(__("The field minimum length is 1 and maximum 1000 characters"));
			}
			/* prepare */
			$_POST['mandatory'] = (isset($_POST['mandatory']))? '1' : '0';
			$_POST['in_registration'] = (isset($_POST['in_registration']))? '1' : '0';
			$_POST['in_profile'] = (isset($_POST['in_profile']))? '1' : '0';
			/* insert */
			$db->query(sprintf("INSERT INTO custom_fields (type, select_options, label, description, place, length, mandatory, in_registration, in_profile) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)", secure($_POST['type']), secure($_POST['select_options']), secure($_POST['label']), secure($_POST['description']), secure($_POST['place']), secure($_POST['length'], 'int'), secure($_POST['mandatory']), secure($_POST['in_registration']), secure($_POST['in_profile']) )) or _error(SQL_ERROR_THROWEN);
			/* return */
			return_json( array('callback' => 'window.location = "'.$system['system_url'].'/admincp/custom_fields";') );
			break;
		
		default:
			_error(400);
			break;
	}

} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>