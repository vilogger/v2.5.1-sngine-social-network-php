<?php
/**
 * ajax -> core -> social signup
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('../../../bootstrap.php');

// check AJAX Request
is_ajax();

// check user logged in
if($user->_logged_in) {
    return_json( array('callback' => 'window.location.reload();') );
}

// check if registration is open
if(!$system['registration_enabled']) {
	return_json( array('error' => true, 'message' => __('Registration is closed right now')) );
}

// signup
try {
    $user->socail_register($_POST['first_name'], $_POST['last_name'], $_POST['username'], $_POST['email'], $_POST['password'], $_POST['gender'], $_POST['avatar'], $_POST['provider']);
    return_json( array('callback' => 'window.location = site_path;') );
} catch (Exception $e) {
	return_json( array('error' => true, 'message' => $e->getMessage()) );
}

?>