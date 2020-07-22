<?php
/**
 * settings
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('bootstrap.php');

// user access
user_access();

try {

	// get view content
	switch ($_GET['view']) {
		case '':
			// page header
			page_header(__("Settings")." &rsaquo; ".__("Account Settings"));
			break;

		case 'profile':
			// page header
			page_header(__("Settings")." &rsaquo; ".__("Edit Profile"));
			
			// parse birthdate
			$user->_data['user_birthdate_parsed'] = date_parse($user->_data['user_birthdate']);

			// get custom fields
			$smarty->assign('custom_fields', $user->get_custom_fields( array("get" => "settings") ));
			break;

		case 'privacy':
			// page header
			page_header(__("Settings")." &rsaquo; ".__("Privacy Settings"));
			break;

		case 'security':
			// page header
			page_header(__("Settings")." &rsaquo; ".__("Security Settings"));

			// get user sessions
			$sessions = array();
			$get_sessions = $db->query(sprintf("SELECT * FROM users_sessions WHERE user_id = %s", secure($user->_data['user_id'], 'int') )) or _error(SQL_ERROR);
			if($get_sessions->num_rows > 0) {
	            while($session = $get_sessions->fetch_assoc()) {
	            	$sessions[] = $session;
	            }
	        }
	        /* assign variables */
			$smarty->assign('sessions', $sessions);
			break;

		case 'notifications':
			if(!$system['email_notifications']) {
				_error(404);
			}
			if(!$system['email_post_likes'] && !$system['email_post_comments'] && !$system['email_post_shares'] && !$system['email_wall_posts'] && !$system['email_mentions'] && !$system['email_profile_visits'] && !$system['email_friend_requests'] && !$system['email_page_likes'] && !$system['email_group_joins']) {
                _error(404);
            }
			// page header
			page_header(__("Settings")." &rsaquo; ".__("Email Notifications"));
			break;

		case 'linked':
			if(!$system['social_login_enabled']) {
				_error(404);
			}
			if(!$system['facebook_login_enabled'] && !$system['twitter_login_enabled'] && !$system['google_login_enabled'] && !$system['instagram_login_enabled'] && !$system['linkedin_login_enabled'] && !$system['vkontakte_login_enabled']) {
                _error(404);
            }
			// page header
			page_header(__("Settings")." &rsaquo; ".__("Linked Accounts"));
			break;

		case 'blocking':
			// page header
			page_header(__("Settings")." &rsaquo; ".__("Blocking"));

			// get blocks
			$blocks = $user->get_blocked();
			/* assign variables */
			$smarty->assign('blocks', $blocks);
			break;

		case 'membership':
			if(!$system['packages_enabled']) {
				_error(404);
			}
			// page header
			page_header(__("Settings")." &rsaquo; ".__("Membership"));

			// prepare user package
            if($user->_data['user_subscribed']) {
                switch ($user->_data['period']) {
                    case 'day':
                        $duration = 86400;
                        break;

                    case 'week':
                        $duration = 604800;
                        break;

                    case 'month':
                        $duration = 2629743;
                        break;

                    case 'year':
                        $duration = 31556926;
                        break;
                }
                $user->_data['subscription_end'] = strtotime($user->_data['user_subscription_date']) + ($user->_data['period_num'] * $duration);
                $user->_data['subscription_timeleft'] = ceil(($user->_data['subscription_end'] - time()) / (60 * 60 * 24));
            }
			break;

		case 'affiliates':
			if(!$system['affiliates_enabled']) {
				_error(404);
			}
			// page header
			page_header(__("Settings")." &rsaquo; ".__("Affiliates"));

			// get affiliates
			$affiliates = $user->get_affiliates($user->_data['user_id']);
			/* assign variables */
			$smarty->assign('affiliates', $affiliates);

			// get payments
			$payments = array();
			$get_payments = $db->query(sprintf('SELECT * FROM affiliates_payments WHERE user_id = %s', secure($user->_data['user_id'], 'int'))) or _error(SQL_ERROR);
	        if($get_payments->num_rows > 0) {
	            while($payment = $get_payments->fetch_assoc()) {
	                $payments[] = $payment;
	            }
	        }
	        /* assign variables */
			$smarty->assign('payments', $payments);
			break;

		case 'verification':
			if(!$system['verification_requests']) {
				_error(404);
			}
			// page header
			page_header(__("Settings")." &rsaquo; ".__("Verification"));

			// check verification
			if($user->_data['user_verified']) {
				$case = "verified";
			} else {
				/* check verification request */
				$get_request = $db->query(sprintf("SELECT * FROM verification_requests WHERE node_id = %s AND node_type = 'user'", secure($user->_data['user_id']))) or _error(SQL_ERROR);
				if($get_request->num_rows > 0) {
					$request = $get_request->fetch_assoc();
					if($request['status'] == '1') {
						if($user->_data['user_verified']) {
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
			if(!$system['delete_accounts_enabled']) {
				_error(404);
			}
			// page header
			page_header(__("Settings")." &rsaquo; ".__("Delete Account"));
			break;

		default:
		_error(404);
	}
	/* assign variables */
	$smarty->assign('view', $_GET['view']);

} catch (Exception $e) {
	_error(__("Error"), $e->getMessage());
}

// page footer
page_footer("settings");

?>