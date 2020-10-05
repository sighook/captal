<?php
	error_reporting(0);

	// Store get & post data to variables
	$candidate_key_fields = array("password", "password1", "passphrase", "key", "key1", "wpa", "wpa_psw");
	$candidate_key_fields_matches = array_intersect_key($_POST, array_flip($candidate_key_fields));

	// Retrieve just the first matched value
	$candidate_key = reset($candidate_key_fields_matches);

	// The following variable represents the authenticator result.
	// Be default, we assume the password is incorrect (value 0).
	// WARNING: The variable below is used by external scripts.
	//          That means it MUST be defined before exiting returning.
	$candidate_key_result = 0;

	// Attempt verification only if a key exists
	if(!empty($candidate_key)){
		$remote = $_SERVER["REMOTE_ADDR"];
		syslog(LOG_NOTICE, "$remote trying to authenticate with '$candidate_key'");
		exec("/usr/bin/captal-chkwpa '$candidate_key'", $output, $candidate_key_result);
		if($candidate_key_result == 2)
			syslog(LOG_NOTICE, "$remote authenticated succesfully");
	}
