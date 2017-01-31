<?php header('Access-Control-Allow-Origin: *');
include "initialize.php";
include "sql.php";

$QUERY = new Query();

$aadhar = $_REQUEST['aadhar'];
$name = $_REQUEST['name'];
$bgroup = $_REQUEST['bgroup'];
$contact = $_REQUEST['contact'];

$result = $QUERY->insert(array("Aadhar_No", "Name", "Last_Diag", "Blood_Group", "Emg_Contact"), array($aadhar, $name, date("Y-m-d"), $bgroup, $contact), "healthcard");
if($result)
{
	$cardId = "";
	$r = $QUERY->select("id","healthcard", "Aadhar_No", $aadhar);
	if($r != NULL)
	{
		while($row = $r->fetch_assoc()){
			$cardId = $row["id"];
		}
	}
	$r = $QUERY->insert(array("Card_Id", "Health_Status", "Initial_Date"), array($cardId, "Healthy", date("Y-m-d")), "current_conditions");
	if($r)
		echo "success";
	else
	{
		$QUERY->delete("healthcard", "Aadhar_No", $aadhar);
		echo "failed";
	}
}
else
	echo "failed";


?>