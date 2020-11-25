<?php
	$dbhost = '192.168.1.102';
	$dbuser = 'mysql_proxy'; // database username
	$dbpass = 'proxy123456'; // database password
	$dbname ='discuz'; // database name
	$link = mysql_connect($dbhost,$dbuser,$dbpass);
	if(!$link) echo "fail";
		else echo "success";
		mysql_close();
?>
