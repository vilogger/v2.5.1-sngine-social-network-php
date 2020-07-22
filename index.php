<?php
/**
 * index
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('bootstrap.php');

try {

	// check user logged in
	if(!$user->_logged_in) {

		// page header
		page_header(__("Welcome to").' '.$system['system_title']);

		// get random users
		if($system['system_random_profiles']) {
			$random_profiles = array();
			$get_random_profiles = $db->query("SELECT user_name, user_firstname, user_lastname, user_gender, user_picture FROM users ORDER BY RAND() LIMIT 4") or _error(SQL_ERROR_THROWEN);
			if($get_random_profiles->num_rows > 0) {
				while($random_profile = $get_random_profiles->fetch_assoc()) {
					$random_profile['user_picture'] = User::get_picture($random_profile['user_picture'], $random_profile['user_gender']);
					$random_profiles[] = $random_profile;
				}
			}
			/* assign variables */
			$smarty->assign('random_profiles', $random_profiles);
		}

		// get custom fields
		$smarty->assign('custom_fields', $user->get_custom_fields());

	} else {

		// user access
		user_access();

		// get view content
		switch ($_GET['view']) {
			case '':
				// page header
				page_header($system['system_title']);

				// get stories
				if($system['stories_enabled']) {
					$stories = $user->get_stories();
					$smarty->assign('stories', $stories);
				}

				// prepare publisher
				$smarty->assign('market_categories', $user->get_market_categories());
				$smarty->assign('feelings', get_feelings());
				$smarty->assign('feelings_types', get_feelings_types());

				// check daytime messages
				$daytime_msg_enabled = (isset($_COOKIE['dt_msg']))? false : $system['daytime_msg_enabled'];
				$smarty->assign('daytime_msg_enabled', $daytime_msg_enabled);

				// get boosted post
				if($system['packages_enabled']) {
					$boosted_post = $user->get_boosted_post();
					$smarty->assign('boosted_post', $boosted_post);
				}

				// get posts (newsfeed)
				$posts = $user->get_posts();
				/* assign variables */
				$smarty->assign('posts', $posts);
				break;

			case 'saved':
				// page header
				page_header(__("Saved Posts"));

				// get posts (saved)
				$posts = $user->get_posts( array('get' => 'saved') );
				/* assign variables */
				$smarty->assign('posts', $posts);
				break;

			case 'articles':
				// page header
				page_header(__("My Articles"));

				// get posts (articles)
				$posts = $user->get_posts( array('get' => 'posts_profile', 'id' => $user->_data['user_id'], 'filter' => 'article' ) );
				/* assign variables */
				$smarty->assign('posts', $posts);
				break;

			case 'products':
				// page header
				page_header(__("My Products"));

				// get posts (saved)
				$posts = $user->get_posts( array('get' => 'posts_profile', 'id' => $user->_data['user_id'], 'filter' => 'product' ) );
				/* assign variables */
				$smarty->assign('posts', $posts);
				break;

			default:
				_error(404);
				break;
		}
		/* assign variables */
		$smarty->assign('view', $_GET['view']);

		if($system['packages_enabled']) {
			// get pro members
			$pro_members = $user->get_pro_members();
			/* assign variables */
			$smarty->assign('pro_members', $pro_members);

			// get promoted pages
			$promoted_pages = $user->get_pages(array('promoted' => true));
			/* assign variables */
			$smarty->assign('promoted_pages', $promoted_pages);
		}

		// get new pages
		$new_pages = $user->get_pages(array('suggested' => true, 'random' => 'true', 'results' => 5));
		/* assign variables */
		$smarty->assign('new_pages', $new_pages);

		// get new groups
		$new_groups = $user->get_groups(array('suggested' => true, 'random' => 'true', 'results' => 5));
		/* assign variables */
		$smarty->assign('new_groups', $new_groups);

		// get new events
		$new_events = $user->get_events(array('suggested' => true, 'random' => 'true', 'results' => 5));
		/* assign variables */
		$smarty->assign('new_events', $new_events);

		// get announcements
		$announcements = $user->announcements();
		/* assign variables */
		$smarty->assign('announcements', $announcements);

		// get ads
		$ads = $user->ads('home');
		/* assign variables */
		$smarty->assign('ads', $ads);

		// get widgets
		$widgets = $user->widgets('home');
		/* assign variables */
		$smarty->assign('widgets', $widgets);

	}

} catch (Exception $e) {
	_error(__("Error"), $e->getMessage());
}

// page footer
page_footer("index");

?>