<?php header('Access-Control-Allow-Origin: *');
include "initialize.php";
include "sql.php";

$QUERY = new Query();

$id = $_REQUEST['id'];

$CARD = NULL;
$STATUS = NULL;
$CON_COND = array();
$HISTORY = array();
$ALLERGIES = array();
$RISK_FACTORS = array();

$result = $QUERY->select("*", "healthcard", "id", $id);
if($result != NULL)
{
	while($row = $result->fetch_assoc()){
		$CARD = $row;
	}
}

$result = $QUERY->select(array("Health_Status", "Initial_Date"), "current_conditions", "Card_Id", $id);
if($result != NULL)
{
	while($row = $result->fetch_assoc()){
		$STATUS = $row;
	}
}

$result = $QUERY->select(array("Chr_Condition", "Status"), "chronic_conditions", "Card_Id", $id);
if($result != NULL)
{
	while($row = $result->fetch_assoc()){
		array_push($CON_COND, $row);
	}
}

$result = $QUERY->select(array("Start_Date", "End_Date", "Diagnosis", "Result", "Notes"), "history", "Card_Id", $id);
if($result != NULL)
{
	while($row = $result->fetch_assoc()){
		array_push($HISTORY, $row);
	}
}

$result = $QUERY->select("Allergy", "allergies", "Card_id", $id);
if($result != NULL)
{
	while($row = $result->fetch_assoc()){
		array_push($ALLERGIES, $row);
	}
}

$DATA = array($CARD, $STATUS, $CON_COND, $HISTORY, $ALLERGIES);



echo json_encode($DATA);
?>