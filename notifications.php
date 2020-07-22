<?php
/**
 * notifications
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('bootstrap.php');

// user access
user_access();

// page header
page_header(__("Notifications"));


// notifications
try {

	// reset live counters
	$user->live_counters_reset('notifications');

	// get ads
	$ads = $user->ads('notifications');
	/* assign variables */
	$smarty->assign('ads', $ads);

	// get widgets
	$widgets = $user->widgets('notifications');
	/* assign variables */
	$smarty->assign('widgets', $widgets);


} catch (Exception $e) {
	_error(__("Error"), $e->getMessage());
}

// page footer
page_footer("notifications");

?>