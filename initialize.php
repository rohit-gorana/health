<?php

	$json = json_decode(file_get_contents('config.json'));
	
	
	$conn = new mysqli($json->server, $json->username, $json->password, "health");
	if(!$conn)
	{
		die("Connection failed:" . mysql_error());
	}
	
	
?>