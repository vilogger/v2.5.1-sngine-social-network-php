<?php
/**
 * ajax -> posts -> story
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('../../../bootstrap.php');

// check AJAX Request
is_ajax();

// user access
user_access(true);

// check if stories enabled
if(!$system['stories_enabled']) {
	modal(MESSAGE, __("Error"), __("This feature has been disabled by the admin"));
}

try {

	// initialize the return array
	$return = array();


	switch ($_REQUEST['do']) {
		case 'publish':
			// valid inputs
			if(!isset($_POST['photos'])) {
				_error(400);
			}
			/* filter photos */
			$photos = array();
			if(isset($_POST['photos'])) {
				$_POST['photos'] = _json_decode($_POST['photos']);
				if(!is_object($_POST['photos'])) {
					_error(400);
				}
				/* filter the photos */
				foreach($_POST['photos'] as $photo) {
					$photos[] = $photo;
				}
				if(count($photos) == 0) {
					_error(400);
				}
			}
			$user->post_story($_POST['message'], $photos);
			$return['callback'] = "window.location.reload();";
			break;

		case 'create':
			// create a story
			$return['story'] = $smarty->fetch("ajax.story.tpl");
			$return['callback'] = "$('#modal').modal('show'); $('.modal-content:last').html(response.story);";
			break;
	}

	// return & exit
	return_json($return);

} catch (Exception $e) {
	modal(ERROR, __("Error"), $e->getMessage());
}


?>