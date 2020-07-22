<?php
/**
 * page
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

	// [1] get main page info
	$get_page = $db->query(sprintf("SELECT pages.*, pages_categories.category_name FROM pages LEFT JOIN pages_categories ON pages.page_category = pages_categories.category_id WHERE page_name = %s", secure($_GET['username']))) or _error(SQL_ERROR_THROWEN);
	if($get_page->num_rows == 0) {
		_error(404);
	}
	$spage = $get_page->fetch_assoc();
	/* check username case */
	if(strtolower($_GET['username']) == strtolower($spage['page_name']) && $_GET['username'] != $spage['page_name']) {
		redirect('/pages/'.$spage['page_name']);
	}
	/* get page picture */
	$spage['page_picture_default'] = ($spage['page_picture'])? false : true;
	$spage['page_picture'] = User::get_picture($spage['page_picture'], 'page');
	/* check page category */
	$spage['category_name'] = (!$spage['category_name'])? __('N/A'): $spage['category_name']; /* in case deleted by admin */
	/* get the connection */
	$spage['i_like'] = false;
	if($user->_logged_in) {
		$get_likes = $db->query(sprintf("SELECT * FROM pages_likes WHERE page_id = %s AND user_id = %s", secure($spage['page_id'], 'int'), secure($user->_data['user_id'], 'int') )) or _error(SQL_ERROR_THROWEN);
		if($get_likes->num_rows > 0) {
			$spage['i_like'] = true;
		}
	}

	// [2] get view content
	switch ($_GET['view']) {
		case '':
			/* get invites */
			$spage['invites'] = $user->get_page_invites($spage['page_id']);

			/* get photos */
			$spage['photos'] = $user->get_photos($spage['page_id'], 'page');

			/* get pinned post */
			$pinned_post = $user->get_post($spage['page_pinned_post']);
			$smarty->assign('pinned_post', $pinned_post);

			/* prepare publisher */
			$smarty->assign('market_categories', $user->get_market_categories());
			$smarty->assign('feelings', get_feelings());
			$smarty->assign('feelings_types', get_feelings_types());

			/* get posts */
			$posts = $user->get_posts( array('get' => 'posts_page', 'id' => $spage['page_id']) );
			/* assign variables */
			$smarty->assign('posts', $posts);
			break;

		case 'photos':
			/* get photos */
			$spage['photos'] = $user->get_photos($spage['page_id'], 'page');
			break;

		case 'albums':
			/* get albums */
			$spage['albums'] = $user->get_albums($spage['page_id'], 'page');
			break;

		case 'album':
			/* get album */
			$album = $user->get_album($_GET['id']);
			if(!$album || $album['in_group'] || $album['user_type'] == "user" || ($album['user_type'] == "page" && $album['page_id'] != $spage['page_id'])) {
				_error(404);
			}
			/* assign variables */
			$smarty->assign('album', $album);
			break;

		case 'invites':
			/* check if the viewer is a page member */
			if(!$spage['i_like']) {
				_error(404);
			}
			/* get invites */
			$spage['invites'] = $user->get_page_invites($spage['page_id']);
			break;
		
		case 'settings':
			/* check if the viewer is the admin */
			if($user->_data['user_id'] != $spage['page_admin']) {
				_error(404);
			}

			/* get sub_view content */
			$sub_view = $_GET['id'];
			switch ($sub_view) {
				case '':
					/* get pages categories */
					$categories = $user->get_pages_categories();
					/* assign variables */
					$smarty->assign('categories', $categories);
					break;

				case 'verification':
					if(!$system['verification_requests']) {
						_error(404);
					}
					// check verification
					if($spage['page_verified']) {
						$case = "verified";
					} else {
						/* check verification request */
						$get_request = $db->query(sprintf("SELECT * FROM verification_requests WHERE node_id = %s AND node_type = 'page'", secure($spage['page_id'], 'int'))) or _error(SQL_ERROR_THROWEN);
						if($get_request->num_rows > 0) {
							$request = $get_request->fetch_assoc();
							if($request['status'] == '1') {
								if($spage['page_verified']) {
									$case = "verified";
								} else {
									/* remove any request */
									$db->query(sprintf("DELETE FROM verification_requests WHERE request_id = %s", secure($request['request_id'], 'int') )) or _error(SQL_ERROR_THROWEN);
									$case = "request";
								}
							} elseif ($request['status'] == '0') {
								$case = "pending";
							} else {
								$case = "declined";
							}
						} else {
							$case = "request";
						}
					}
					/* assign variables */
					$smarty->assign('case', $case);
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
		$user->add_search_log($spage['page_id'], 'page');
	}

} catch (Exception $e) {
	_error(__("Error"), $e->getMessage());
}

// page header
page_header($spage['page_title']);

// assign variables
$smarty->assign('spage', $spage);
$smarty->assign('view', $_GET['view']);

// page footer
page_footer("page");

?>