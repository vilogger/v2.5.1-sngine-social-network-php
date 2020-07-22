<?php
/**
 * ajax -> users -> settings
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

// settings
try {

	switch ($_GET['edit']) {

		case 'username':
			/* valid inputs */
			if(!isset($_POST['username'])) {
				_error(400);
			}
			$user->settings($_GET['edit'], $_POST);
			return_json( array('success' => true, 'message' => __("Your username has been updated")) );
			break;

		case 'email':
			/* valid inputs */
			if(!isset($_POST['email'])) {
				_error(400);
			}
			$user->settings($_GET['edit'], $_POST);
			return_json( array('success' => true, 'message' => __("Your email has been updated")) );
			break;

		case 'password':
			/* valid inputs */
			if(!isset($_POST['current']) || !isset($_POST['new']) || !isset($_POST['confirm']) ) {
				_error(400);
			}
			$user->settings($_GET['edit'], $_POST);
			return_json( array('success' => true, 'message' => __("Your password has been updated")) );
			break;

		case 'basic':
			/* valid inputs */
			if(!isset($_POST['firstname']) || !isset($_POST['lastname']) || !isset($_POST['gender']) || !isset($_POST['birth_month']) || !isset($_POST['birth_day']) || !isset($_POST['birth_year']) || !isset($_POST['relationship'])  || !isset($_POST['biography'])  || !isset($_POST['website'])  ) {
				_error(400);
			}
			$user->settings($_GET['edit'], $_POST);
			return_json( array('success' => true, 'message' => __("Your profile info has been updated")) );
			break;

		case 'work':
			/* valid inputs */
			if(!isset($_POST['work_title']) || !isset($_POST['work_place']) ) {
				_error(400);
			}
			$user->settings($_GET['edit'], $_POST);
			return_json( array('success' => true, 'message' => __("Your profile info has been updated")) );
			break;

		case 'location':
			/* valid inputs */
			if(!isset($_POST['city']) || !isset($_POST['hometown']) ) {
				_error(400);
			}
			$user->settings($_GET['edit'], $_POST);
			return_json( array('success' => true, 'message' => __("Your profile info has been updated")) );
			break;

		case 'education':
			/* valid inputs */
			if(!isset($_POST['edu_major']) || !isset($_POST['edu_school']) || !isset($_POST['edu_class'])) {
				_error(400);
			}
			$user->settings($_GET['edit'], $_POST);
			return_json( array('success' => true, 'message' => __("Your profile info has been updated")) );
			break;

		case 'social':
			/* valid inputs */
			if(!isset($_POST['facebook']) || !isset($_POST['twitter']) || !isset($_POST['google']) || !isset($_POST['youtube']) || !isset($_POST['instagram']) || !isset($_POST['linkedin']) || !isset($_POST['vkontakte'])) {
				_error(400);
			}
			$user->settings($_GET['edit'], $_POST);
			return_json( array('success' => true, 'message' => __("Your profile info has been updated")) );
			break;

		case 'other':
			$user->settings($_GET['edit'], $_POST);
			return_json( array('success' => true, 'message' => __("Your profile info has have been updated")) );
			break;

		case 'privacy':
			$user->settings($_GET['edit'], $_POST);
			return_json( array('success' => true, 'message' => __("Your privacy settings have been updated")) );
			break;

		case 'notifications':
			/* prepare */
			$_POST['email_post_likes'] = (isset($_POST['email_post_likes']))? '1' : '0';
			$_POST['email_post_comments'] = (isset($_POST['email_post_comments']))? '1' : '0';
			$_POST['email_post_shares'] = (isset($_POST['email_post_shares']))? '1' : '0';
			$_POST['email_wall_posts'] = (isset($_POST['email_wall_posts']))? '1' : '0';
			$_POST['email_mentions'] = (isset($_POST['email_mentions']))? '1' : '0';
			$_POST['email_profile_visits'] = (isset($_POST['email_profile_visits']))? '1' : '0';
			$_POST['email_friend_requests'] = (isset($_POST['email_friend_requests']))? '1' : '0';
			$_POST['email_page_likes'] = (isset($_POST['email_page_likes']))? '1' : '0';
			$_POST['email_group_joins'] = (isset($_POST['email_group_joins']))? '1' : '0';
			$user->settings($_GET['edit'], $_POST);
			return_json( array('success' => true, 'message' => __("Your email notifications settings have been updated")) );
			break;

		case 'notifications_sound':
			/* valid inputs */
			if(!isset($_GET['notifications_sound'])) {
				_error(400);
			}
			$user->settings($_GET['edit'], $_GET);
			return_json();
			break;

		case 'clear_search_log':
			$user->clear_search_log();
			return_json();
			break;

		case 'chat':
			/* valid inputs */
			if(!isset($_POST['privacy_chat'])) {
				_error(400);
			}
			$user->settings($_GET['edit'], $_POST);
			return_json( array('success' => true, 'message' => __("Your privacy settings have been updated")) );
			break;

		default:
			_error(400);
			break;
	}

} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>