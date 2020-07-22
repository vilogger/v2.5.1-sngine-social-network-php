<?php
/**
 * contact
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('bootstrap.php');

// check if contact enabled
if(!$system['contact_enabled']) {
	_error(404);
}

// page header
page_header($system['system_title'].' - '.__("Contact Us"));

try {

	// get ads
	$ads = $user->ads('contact');
	/* assign variables */
	$smarty->assign('ads', $ads);

	// get widgets
	$widgets = $user->widgets('contact');
	/* assign variables */
	$smarty->assign('widgets', $widgets);

} catch (Exception $e) {
	_error(__("Error"), $e->getMessage());
}

// page footer
page_footer("contact");

?>