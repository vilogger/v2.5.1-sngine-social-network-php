<?php
/**
 * games
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('bootstrap.php');


// games enabled
if(!$system['games_enabled']) {
	_error(404);
}

// user access
user_access();

try {

	// get view content
	switch ($_GET['view']) {
		case '':

			// page header
			page_header(__("Discover Games"));

			// get games
			$games = $user->get_games();
			/* assign variables */
			$smarty->assign('games', $games);
			$smarty->assign('get', "games");
			
			break;
		
		case 'played':

			// page header
			page_header(__("Your Games"));

			// get games
			$games = $user->get_games(0, true);
			/* assign variables */
			$smarty->assign('games', $games);
			$smarty->assign('get', "played_games");
			
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
page_footer("games");

?>