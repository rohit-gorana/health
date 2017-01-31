<?php header('Access-Control-Allow-Origin: *');



class settings
{
	public $host;
	public $server;
	public $username;
	public $password;
}

$set = new settings();

$set->host = $_REQUEST['host'];
$set->server = $_REQUEST['server'];
$set->username = $_REQUEST['username'];
$set->password = $_REQUEST['password'];

$file = fopen("config.json", "w");
fwrite($file, json_encode($set));
fclose($file);

$response = array("Success");


echo "success";


?>