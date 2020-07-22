<?php
/**
 * ajax -> core -> translator
 * 
 * @package Sngine
 * @author Zamblek
 */

// fetch bootstrap
require('../../../bootstrap.php');

// check AJAX Request
is_ajax();

// valid inputs
if(!isset($_POST['language'])) {
	_error(400);
}

// translator
try {

	// check language
	$get_language = $db->query(sprintf("SELECT * FROM system_languages WHERE code = %s", secure($_POST['language']))) or _error(SQL_ERROR_THROWN);
	if($get_language->num_rows == 0) {
		_error(400);
	}
	$language = $get_language->fetch_assoc();

	// set language
	$expire = time()+2592000;
	setcookie('s_lang', $language['code'], $expire, '/');
	
	// return & exit
	return_json( array('callback' => 'window.location.reload();') );

} catch (Exception $e) {
	modal(ERROR, __("Error"), $e->getMessage());
}

?>