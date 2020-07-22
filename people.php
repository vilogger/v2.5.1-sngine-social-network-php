<?php
/**
 * friend_requests
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
			page_header(__("Discover People"));

			$people = $user->get_new_people();
			$smarty->assign('people', $people);
			break;

		case 'find':
			// page header
			page_header(__("Find People"));

			if(!isset($_POST['submit'])) {
				redirect('/people');
			}
			$people = $user->search_users($_POST['query'], $_POST['gender'], $_POST['relationship'], $_POST['status']);
			$smarty->assign('people', $people);
			break;

		case 'friend_requests':
			// page header
			page_header(__("Friend Requests"));
			break;

		case 'sent_requests':
			// page header
			page_header(__("Friend Requests Sent"));
			break;

		default:
			_error(404);
			break;
	}
	/* assign variables */
	$smarty->assign('view', $_GET['view']);

	// get ads
	$ads = $user->ads('people');
	/* assign variables */
	$smarty->assign('ads', $ads);

	// get widgets
	$widgets = $user->widgets('people');
	/* assign variables */
	$smarty->assign('widgets', $widgets);
	
} catch (Exception $e) {
	_error(__("Error"), $e->getMessage());
}

// page footer
page_footer("people");

?>