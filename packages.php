<?php
/**
 * packages
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('bootstrap.php');

// page header
page_header($system['system_title']." &rsaquo; ".__("Packages"));

try {

	// get packages
	$packages = $user->get_packages();
	/* assign variables */
	$smarty->assign('packages', $packages);
	$smarty->assign('packages_count', count($packages));

} catch (Exception $e) {
	_error(__("Error"), $e->getMessage());
}

// page footer
page_footer("packages");

?>