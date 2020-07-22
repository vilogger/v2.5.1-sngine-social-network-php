<?php
/**
 * game
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

// valid inputs
if(!isset($_GET['id']) || !is_numeric($_GET['id'])) {
	_error(404);
}

try {

	// get game
	$game = $user->get_game($_GET['id']);
	if(!$game)  {
		_error(404);
	}
	/* assign variables */
	$smarty->assign('game', $game);

} catch (Exception $e) {
	_error(__("Error"), $e->getMessage());
}

// page header
page_header($game['title']);

// page footer
page_footer("game");

?>