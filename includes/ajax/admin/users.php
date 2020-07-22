<?php
/**
 * ajax -> admin -> users
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('../../../bootstrap.php');

// check AJAX Request
is_ajax();


// check admin logged in
if(!$user->_logged_in || !$user->_is_admin) {
	modal(MESSAGE, __("System Message"), __("You don't have the right permission to access this"));
}

// valid inputs
if(!isset($_GET['id']) || !is_numeric($_GET['id'])) {
	_error(400);
}

// edit users
try {

	// get user info
	$get_user_info = $db->query(sprintf("SELECT * FROM users WHERE user_id = %s", secure($_GET['id'], 'int') )) or _error(SQL_ERROR);
	if($get_user_info->num_rows == 0) {
		_error(400);
		throw new Exception(__("This account not exist"));
	}
	$user_info = $get_user_info->fetch_assoc();

	switch ($_GET['do']) {
		case 'edit_account':
			/* check if changing #1 user's group */
			if($_GET['id'] == '1' && $_POST['user_group'] != '1') {
				throw new Exception(__("You can not change the group of this user"));
			}
			/* check username */
			if(strtolower($_POST['user_name']) != strtolower($user_info['user_name'])) {
				/* prepare */
				if(!valid_username($_POST['user_name'])) {
					throw new Exception(__("Please enter a valid username (a-z0-9_.) with minimum 3 characters long"));
				}
				if(reserved_username($_POST['user_name'])) {
                    throw new Exception(__("You can't use")." <strong>".$_POST['user_name']."</strong> ".__("as username"));
                }
				if($user->check_username($_POST['user_name'])) {
					throw new Exception(__("Sorry, it looks like")." <strong>".$_POST['user_name']."</strong> ".__("belongs to an existing account"));
				}
			}
			/* check email */
			if(strtolower($_POST['user_email']) != strtolower($user_info['user_email'])) {
				/* prepare */
				if(!valid_email($_POST['user_email'])) {
					throw new Exception(__("Please enter a valid email address"));
				}
				if($user->check_email($_POST['user_email'])) {
					throw new Exception(__("Sorry, it looks like")." <strong>".$_POST['user_email']."</strong> ".__("belongs to an existing account"));
				}
			}
			/* check password */
			if($_POST['user_password'] == "") {
				/* no changes use the same hashed password */
				$_POST['user_password'] = $user_info['user_password'];
			} else {
				if(strlen($_POST['user_password']) < 6) {
					throw new Exception(__("Password must be at least 6 characters long. Please try another"));
				}
				$_POST['user_password'] = _password_hash($_POST['user_password']);
			}
			/* prepare */
			$_POST['user_verified'] = (isset($_POST['user_verified']))? '1' : '0';
			$_POST['user_banned'] = (isset($_POST['user_banned']))? '1' : '0';
			$_POST['user_activated'] = (isset($_POST['user_activated']))? '1' : '0';
			/* update */
			$db->query(sprintf("UPDATE users SET user_verified = %s, user_banned = %s, user_activated = %s, user_group = %s, user_name = %s, user_email = %s, user_password = %s WHERE user_id = %s", secure($_POST['user_verified']), secure($_POST['user_banned']), secure($_POST['user_activated']), secure($_POST['user_group'], 'int'), secure($_POST['user_name']), secure($_POST['user_email']), secure($_POST['user_password']), secure($_GET['id'], 'int') )) or _error(SQL_ERROR_THROWEN);
			/* return */
			return_json( array('success' => true, 'message' => __("User info have been updated")) );
			break;

		case 'edit_profile':
			/* validate firstname */
            if(is_empty($_POST['user_firstname'])) {
                throw new Exception(__("You must enter first name"));
            }
            if(!valid_name($_POST['user_firstname'])) {
                throw new Exception(__("First name contains invalid characters"));
            }
            if(strlen($_POST['user_firstname']) < 3) {
                throw new Exception(__("First name must be at least 3 characters long. Please try another"));
            }
            /* validate lastname */
            if(is_empty($_POST['user_lastname'])) {
                throw new Exception(__("You must enter last name"));
            }
            if(!valid_name($_POST['user_lastname'])) {
                throw new Exception(__("Last name contains invalid characters"));
            }
            if(strlen($_POST['user_lastname']) < 3) {
                throw new Exception(__("Last name must be at least 3 characters long. Please try another"));
            }
            /* validate gender */
            if($_POST['user_gender'] == "none") {
                throw new Exception(__("Please select either Male or Female"));
            }
            $_POST['user_gender'] = ($_POST['user_gender'] == "male")? "male" : "female";
            /* validate birthdate */
            if($_POST['birth_year'] != "none" && $_POST['birth_month'] != "none" && $_POST['birth_day'] != "none") {
				$_POST['user_birthdate'] = $_POST['birth_year'].'-'.$_POST['birth_month'].'-'.$_POST['birth_day'];
			} else {
				$_POST['user_birthdate'] = 'null';
			}
			/* validate relationship */
            if($_POST['user_relationship'] == "none") {
                $_POST['user_relationship'] = 'null';
            } else {
                $relationships = array('single', 'relationship', 'married', "complicated", 'separated', 'divorced', 'widowed');
                if(!in_array($_POST['user_relationship'], $relationships)) {
                    throw new Exception(__("Please select a valid relationship"));
                }
            }
            /* validate website */
            if(!is_empty($_POST['user_website'])) {
                if(!valid_url($_POST['user_website'])) {
                    throw new Exception(__("Please enter a valid website"));
                }
            } else {
                $_POST['user_website'] = 'null';
            }
            /* validate facebook */
            if(!is_empty($_POST['facebook']) && !valid_url($_POST['facebook'])) {
                throw new Exception(__("Please enter a valid Facebook Profile URL"));
            }
            /* validate twitter */
            if(!is_empty($_POST['twitter']) && !valid_url($_POST['twitter'])) {
                throw new Exception(__("Please enter a valid Twitter Profile URL"));
            }
            /* validate google */
            if(!is_empty($_POST['google']) && !valid_url($_POST['google'])) {
                throw new Exception(__("Please enter a valid Google+ Profile URL"));
            }
            /* validate youtube */
            if(!is_empty($_POST['youtube']) && !valid_url($_POST['youtube'])) {
                throw new Exception(__("Please enter a valid YouTube Profile URL"));
            }
            /* validate instagram */
            if(!is_empty($_POST['instagram']) && !valid_url($_POST['instagram'])) {
                throw new Exception(__("Please enter a valid Instagram Profile URL"));
            }
            /* validate linkedin */
            if(!is_empty($_POST['linkedin']) && !valid_url($_POST['linkedin'])) {
                throw new Exception(__("Please enter a valid Linkedin Profile URL"));
            }
            /* validate vkontakte */
            if(!is_empty($_POST['vkontakte']) && !valid_url($_POST['vkontakte'])) {
                throw new Exception(__("Please enter a valid Vkontakte Profile URL"));
            }
			/* update */
			$db->query(sprintf("UPDATE users SET user_firstname = %s, user_lastname = %s, user_gender = %s, user_birthdate = %s, user_relationship = %s, user_biography = %s, user_website = %s, user_work_title = %s, user_work_place = %s, user_current_city = %s, user_hometown = %s, user_edu_major = %s, user_edu_school = %s, user_edu_class = %s, user_social_facebook = %s, user_social_twitter = %s, user_social_google = %s, user_social_youtube = %s, user_social_instagram = %s, user_social_linkedin = %s, user_social_vkontakte = %s WHERE user_id = %s", secure($_POST['user_firstname']), secure($_POST['user_lastname']), secure($_POST['user_gender']), secure($_POST['user_birthdate']), secure($_POST['user_relationship']), secure($_POST['user_biography']), secure($_POST['user_website']), secure($_POST['user_work_title']), secure($_POST['user_work_place']), secure($_POST['user_current_city']), secure($_POST['user_hometown']), secure($_POST['user_edu_major']), secure($_POST['user_edu_school']), secure($_POST['user_edu_class']), secure($_POST['facebook']), secure($_POST['twitter']), secure($_POST['google']), secure($_POST['youtube']), secure($_POST['instagram']), secure($_POST['linkedin']), secure($_POST['vkontakte']), secure($_GET['id'], 'int') )) or _error(SQL_ERROR_THROWEN);
			/* return */
			return_json( array('success' => true, 'message' => __("User info have been updated")) );
			break;

		case 'edit_privacy':
			/* prepare */
			$_POST['privacy_chat'] = ($_POST['privacy_chat'] == 0)? 0 : 1;
            $privacy = array('me', 'friends', 'public');
            if(!in_array($_POST['privacy_wall'], $privacy) || !in_array($_POST['privacy_birthdate'], $privacy) || !in_array($_POST['privacy_relationship'], $privacy) || !in_array($_POST['privacy_basic'], $privacy) || !in_array($_POST['privacy_work'], $privacy) || !in_array($_POST['privacy_location'], $privacy) || !in_array($_POST['privacy_education'], $privacy) || !in_array($_POST['privacy_other'], $privacy) || !in_array($_POST['privacy_friends'], $privacy) || !in_array($_POST['privacy_photos'], $privacy) || !in_array($_POST['privacy_pages'], $privacy) || !in_array($_POST['privacy_groups'], $privacy) || !in_array($_POST['privacy_events'], $privacy)) {
                _error(400);
            }
			/* update */
			$db->query(sprintf("UPDATE users SET user_chat_enabled = %s, user_privacy_wall = %s, user_privacy_birthdate = %s, user_privacy_relationship = %s, user_privacy_basic = %s, user_privacy_work = %s, user_privacy_location = %s, user_privacy_education = %s, user_privacy_other = %s, user_privacy_friends = %s, user_privacy_photos = %s, user_privacy_pages = %s, user_privacy_groups = %s, user_privacy_events = %s WHERE user_id = %s", secure($_POST['privacy_chat']), secure($_POST['privacy_wall']), secure($_POST['privacy_birthdate']), secure($_POST['privacy_relationship']), secure($_POST['privacy_basic']), secure($_POST['privacy_work']), secure($_POST['privacy_location']), secure($_POST['privacy_education']), secure($_POST['privacy_other']), secure($_POST['privacy_friends']), secure($_POST['privacy_photos']), secure($_POST['privacy_pages']), secure($_POST['privacy_groups']), secure($_POST['privacy_events']), secure($_GET['id'], 'int') )) or _error(SQL_ERROR_THROWEN);
			/* return */
			return_json( array('success' => true, 'message' => __("User info have been updated")) );
			break;

		case 'edit_membership':
			/* valid inputs */
			if(!isset($_POST['package']) || !is_numeric($_POST['package'])) {
				_error(400);
			}
			/* update user package */
        	$db->query(sprintf("UPDATE users SET user_verified = '1', user_subscribed = '1', user_package = %s, user_subscription_date = %s, user_boosted_posts = '0', user_boosted_pages = '0' WHERE user_id = %s", secure($_POST['package'], 'int'), secure($date), secure($_GET['id'], 'int') )) or _error(SQL_ERROR_THROWEN);
			/* return */
			return_json( array('success' => true, 'message' => __("User info have been updated")) );
			break;
		
		default:
			_error(400);
			break;
	}

} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>