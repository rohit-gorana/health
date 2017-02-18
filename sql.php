/*
PHP-MySql Database Functions
Author: Rohit Gorana
*/
<?php 
	class Query 
	{
		
		
		function select($selection, $table, $key, $value)
		{
			$sql = "SELECT ";
			if(is_array($selection) == true)
			{
				foreach($selection as $column)
				{
					$sql .= $column." , ";
				}
				$sql = substr($sql, 0, strlen($sql)- 2);
				
			}
			else
			{
				$sql .= $selection. " ";
			}
			
			$sql .= "FROM ". $table." ";
			if(isset($key))
			{
				if(is_array($key) == true)
				{
				
					$sql .= "WHERE ";
					for($i=0; $i< sizeof($key); $i++) 
					{
						$sql .= $key[$i]. " = " . $value[$i] . " AND ";
					}
					$sql = substr($sql, 0, strlen($sql)- 5);
				}
				else
				{
					$sql .= "WHERE ".$key. " = ". $value;
				}
			}
			
			
			
			$result = $GLOBALS['conn']->query($sql);
			if($result -> num_rows > 0)
				return $result;
			else
				return NULL;
		}
		
		function insert($insertion, $value, $table)
		{
			$sql = "INSERT INTO ". $table. " ( ";
			foreach($insertion as $column)
			{
				$sql .= $column." , ";
			}
			$sql = substr($sql, 0, strlen($sql)- 2);
			
			$sql .= ") VALUES ( ";
			foreach($value as $column)
			{
				$sql .= "'" . $column."' , ";
			}
			$sql = substr($sql, 0, strlen($sql)- 2);
			$sql .= ") ";
			
			$GLOBALS['conn']->query($sql);
			return true;
		}
		
		function delete($table, $key, $value)
		{
			$sql = "DELETE FROM ". $table. " ";
			if(is_array($key) == true)
			{
				
				$sql .= "WHERE ";
				for($i=0; $i< sizeof($key); $i++) 
				{
					$sql .= $key[$i]. " = " . $value[$i] . " AND ";
				}
				$sql = substr($sql, 0, strlen($sql)- 5);
			}
			else
			{
				$sql .= "WHERE ".$key. " = ". $value;
			}
			$GLOBALS['conn']->query($sql);
			return true;
			
		}
		
		function find( $string, $column, $table, $key, $value)
		{
			$sql = "SELECT ". $column. " FROM ". $table. " ";
			if(isset($key))
			{
				if(is_array($key) == true)
				{
				
					$sql .= "WHERE ";
					for($i=0; $i< sizeof($key); $i++) 
					{
						$sql .= $key[$i]. " = " . $value[$i] . " AND ";
					}
					$sql = substr($sql, 0, strlen($sql)- 5);
				}
				else
				{
					$sql .= "WHERE ".$key. " = ". $value;
				}
			}
			

			$result = $GLOBALS['conn']->query($sql);
			if($result -> num_rows > 0)
			{
				while($row = $result -> fetch_assoc())
				{
					if($row[$column] == $string)
						return true;
				}
			}
			return false;
		}
		
		function update( $table, $column, $data, $key, $value)
		{
			$sql = "UPDATE ". $table. " SET ";
			if(is_array($column) == true)
			{
				for($i=0; $i< sizeof($column); $i++) 
				{
					$sql .= $column[$i]. " = '" . $data[$i] . "' , ";
				}
				$sql = substr($sql, 0, strlen($sql)- 2);
			}
			else
				$sql .= $column. " = '" . $data . "' "; 
				
			if(is_array($key) == true)
			{
				
				$sql .= "WHERE ";
				for($i=0; $i< sizeof($key); $i++) 
				{
					$sql .= $key[$i]. " = " . $value[$i] . " AND ";
				}
				$sql = substr($sql, 0, strlen($sql)- 5);
			}
			else
			{
				$sql .= "WHERE ".$key. " = ". $value;
			}
			
			$GLOBALS['conn']->query($sql);
			return true;
		}
		
		function count($column, $table, $key=null, $value=null)
		{
			$sql = "SELECT COUNT(".$column. ") AS Total FROM ". $table . " ";
			
			if(isset($key))
			{
				if(is_array($key) == true)
				{
				
					$sql .= "WHERE ";
					for($i=0; $i< sizeof($key); $i++) 
					{
						$sql .= $key[$i]. " = " . $value[$i] . " AND ";
					}
					$sql = substr($sql, 0, strlen($sql)- 5);
				}
				else
				{
					$sql .= "WHERE ".$key. " = ". $value;
				}
			}
			
			
			$result = $GLOBALS['conn']->query($sql);
			if($result != NULL)
			{
				while($row = $result->fetch_assoc()){
					return $row['Total'];
				}
			}
		}
		
		function execute($sql)
		{
			$result = $GLOBALS['conn']->query($sql);
			if($result != NULL)
			{
				return $result;
			}
			else
				return null;
		}
	}
	
	 
?>
