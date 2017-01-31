<?php header('Access-Control-Allow-Origin: *');
include "initialize.php";
include "sql.php";

$QUERY = new Query();

$Healthy = $QUERY->count("Health_Status", "current_conditions", "Health_Status", "'Healthy'");
$Total = $QUERY->count("Health_Status", "current_conditions");

$HEALTH_STATUS = array($Healthy, $Total);

$CHR_CONDITIONS = array();

$result = $QUERY->execute("SELECT Chr_Condition, Count(Chr_Condition)as Total From chronic_conditions group by Chr_Condition ");
if($result != NULL)
{
	while($row = $result->fetch_assoc()){
		array_push($CHR_CONDITIONS, $row);
	}
}



$HISTORY = array();

$result = $QUERY->execute("select 
datediff(max(history.Start_Date), min(history.Start_Date)) AS Diff
From history");
if($result != NULL)
{
	
	while($row = $result->fetch_assoc()){
		if($row['Diff'] > 360)
		{
			$r = $QUERY->execute("SELECT YEAR(Start_Date) AS Label, COUNT(*) AS Total FROM history GROUP BY Year(Start_Date) ORDER BY Start_Date");
			if($r != NULL)
			{
				while($row = $r->fetch_assoc()){
					array_push($HISTORY, $row);
				}
			}
		}
		else
		{
			$r = $QUERY->execute("SELECT MONTHNAME(Start_Date) AS Label, COUNT(*) AS Total FROM history GROUP BY MONTHNAME(Start_Date) ORDER BY Start_Date");
			if($r != NULL)
			{
				while($row = $r->fetch_assoc()){
					array_push($HISTORY, $row);
				}
			}
		}
		
	}
}
$DATA = array($HEALTH_STATUS, $CHR_CONDITIONS, $HISTORY);
echo json_encode($DATA);

?>