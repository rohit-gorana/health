<?php header('Access-Control-Allow-Origin: *');
include "initialize.php";
include "sql.php";

$QUERY = new Query();

$id = $_REQUEST['id'];

$response = "";
$result = $QUERY->find($id, "Aadhar_No", "healthcard", "Aadhar_No", $id);
$exists = $result;

	
$result = $QUERY->select("*", "aadhar", "uid", $id);
if($result != NULL)
{
	while($row = $result->fetch_assoc()){
		if($exists)
			$response = "exists";
		else
			$response = "success";
		echo json_encode(array($response, $row));
	}

}
else
{
	$response = "failed";
	echo json_encode(array($response));
}



?>