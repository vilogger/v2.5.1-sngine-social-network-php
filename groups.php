<?php
/**
 * groups
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('bootstrap.php');

// user access
user_access();

try {

	// get view content
	switch ($_GET['view']) {
		case '':

			// page header
			page_header(__("Discover Groups"));
			
			// get new groups
			$groups = $user->get_groups(array('suggested' => true));
			/* assign variables */
			$smarty->assign('groups', $groups);
			$smarty->assign('get', "suggested_groups");

			break;
		
		case 'joined':

			// page header
			page_header(__("Joined Groups"));
			
			// get joined groups
			$groups = $user->get_groups( array('user_id' => $user->_data['user_id']) );
			/* assign variables */
			$smarty->assign('groups', $groups);
			$smarty->assign('get', "joined_groups");

			break;

		case 'manage':

			// page header
			page_header(__("Your Groups"));
			
			// get managed groups
			$groups = $user->get_groups();
			/* assign variables */
			$smarty->assign('groups', $groups);
			$smarty->assign('get', "groups");

			break;

		default:
			_error(404);
			break;
	}
	/* assign variables */
	$smarty->assign('view', $_GET['view']);
	
} catch (Exception $e) {
	_error(__("Error"), $e->getMessage());
}

// page footer
page_footer("groups");

?>