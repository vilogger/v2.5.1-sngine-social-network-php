<?php
/**
 * group
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('bootstrap.php');

// user access
if(!$system['system_public']) {
	user_access();
}

// check username
if(is_empty($_GET['username']) || !valid_username($_GET['username'])) {
	_error(404);
}

try {

	// [1] get main group info
	$get_group = $db->query(sprintf("SELECT * FROM groups WHERE group_name = %s", secure($_GET['username']))) or _error(SQL_ERROR_THROWEN);
	if($get_group->num_rows == 0) {
		_error(404);
	}
	$group = $get_group->fetch_assoc();
	/* check username case */
	if(strtolower($_GET['username']) == strtolower($group['group_name']) && $_GET['username'] != $group['group_name']) {
		redirect('/groups/'.$group['group_name']);
	}
	/* get group picture */
	$group['group_picture_default'] = ($group['group_picture'])? false : true;
	$group['group_picture'] = User::get_picture($group['group_picture'], 'group');
	/* get the connection */
	$group['i_joined'] = $user->check_group_membership($user->_data['user_id'], $group['group_id']);
	/* get group requests */
	if($group['group_privacy'] != "public") {
		$group['total_requests'] = $user->get_group_requests_total($group['group_id']);
	}

	// [2] get view content
	/* check group privacy */
	if($group['group_privacy'] == "secret") {
		if($group['i_joined'] != "approved" && $group['group_admin'] != $user->_data['user_id']) {
			_error(404);
		}
	}
	if($group['group_privacy'] == "closed") {
		if($group['i_joined'] != "approved" && $group['group_admin'] != $user->_data['user_id']) {
			$_GET['view'] = 'members';
		}
			
	}
	switch ($_GET['view']) {
		case '':
			/* get invites */
			$group['invites'] = $user->get_group_invites($group['group_id']);

			/* get photos */
			$group['photos'] = $user->get_photos($group['group_id'], 'group');

			/* get pinned post */
			$pinned_post = $user->get_post($group['group_pinned_post']);
			$smarty->assign('pinned_post', $pinned_post);

			/* prepare publisher */
			$smarty->assign('market_categories', $user->get_market_categories());
			$smarty->assign('feelings', get_feelings());
			$smarty->assign('feelings_types', get_feelings_types());

			/* get posts */
			$posts = $user->get_posts( array('get' => 'posts_group', 'id' => $group['group_id']) );
			/* assign variables */
			$smarty->assign('posts', $posts);
			break;

		case 'photos':
			/* get photos */
			$group['photos'] = $user->get_photos($group['group_id'], 'group');
			break;

		case 'albums':
			/* get albums */
			$group['albums'] = $user->get_albums($group['group_id'], 'group');
			break;

		case 'album':
			/* get album */
			$album = $user->get_album($_GET['id']);
			if(!$album || ($album['group_id'] != $group['group_id']) ) {
				_error(404);
			}
			/* assign variables */
			$smarty->assign('album', $album);
			break;

		case 'members':
			/* get members */
			if($group['group_members'] > 0) {
				$group['members'] = $user->get_group_members($group['group_id']);
			}
			break;

		case 'invites':
			/* check if the viewer is a group member */
			if($group['i_joined'] != "approved") {
				_error(404);
			}
			/* get invites */
			$group['invites'] = $user->get_group_invites($group['group_id']);
			break;

		case 'settings':
			/* check if the viewer is the admin */
			if($user->_data['user_id'] != $group['group_admin']) {
				_error(404);
			}
			/* get sub_view content */
			$sub_view = $_GET['id'];
			switch ($sub_view) {
				case '':
					break;

				case 'requests':
					if($group['group_privacy'] == "public") {
						_error(404);
					}
					/* get requests */
					if($group['total_requests'] > 0) {
						$group['requests'] = $user->get_group_requests($group['group_id']);
					}
					break;

				case 'delete':
					break;
				
				default:
					_error(404);
					break;
			}
			/* assign variables */
			$smarty->assign('sub_view', $sub_view);
			break;
		
		default:
			_error(404);
			break;
	}

	// recent rearches
	if(isset($_GET['ref']) && $_GET['ref'] == "qs") {
		$user->add_search_log($group['group_id'], 'group');
	}

} catch (Exception $e) {
	_error(__("Error"), $e->getMessage());
}

// page header
page_header($group['group_title']);

// assign variables
$smarty->assign('group', $group);
$smarty->assign('view', $_GET['view']);

// page footer
page_footer("group");

?>