<?php
/**************************************************************************************************
| Software Name        : Ravan Scripts Online Mafia Game
| Software Author      : Ravan Soft Tech
| Software Version     : Version 2.0.1 Build 2101
| Website              : http://www.ravan.info/
| E-mail               : support@ravan.info
|**************************************************************************************************
| The source files are subject to the Ravan Scripts End-User License Agreement included in License Agreement.html
| The files in the package must not be distributed in whole or significant part.
| All code is copyrighted unless otherwise advised.
| Do Not Remove Powered By Ravan Scripts without permission .         
|**************************************************************************************************
| Copyright (c) 2010 Ravan Scripts . All rights reserved.
|**************************************************************************************************/
session_start();
if(get_magic_quotes_gpc() == 0)
{
foreach($_POST as $k => $v)
{
  $_POST[$k]=addslashes($v);
}
foreach($_GET as $k => $v)
{
  $_GET[$k]=addslashes($v);
}
}

include "config.php";
include "language.php";
global $_CONFIG;
define("MONO_ON", 1);
require "class/class_db_{$_CONFIG['driver']}.php";
$db=new database;
$db->configure($_CONFIG['hostname'],
 $_CONFIG['username'],
 $_CONFIG['password'],
 $_CONFIG['database'],
 $_CONFIG['persistent']);
$db->connect();
$c=$db->connection_id;
$set=array();
$settq=$db->query("SELECT * FROM settings");
while($r=$db->fetch_row($settq))
{
$set[$r['conf_name']]=$r['conf_value'];
}
if ($_POST['username'] == "" || $_POST['password'] == "")
{
die("<h3>{$set['game_name']} Error</h3>
$nofill<br>
<a href=login.php>&gt; Back</a>");
}
$uq=$db->query("SELECT userid FROM users WHERE login_name='{$_POST['username']}' AND `userpass`=md5('{$_POST['password']}')");
if ($db->num_rows($uq)==0)
{
die("<h3>{$set['game_name']} Error</h3>
$invalid<br>
<a href=login.php>&gt; $lerrortry</a>");
}
else
{
$_SESSION['loggedin']=1;
$mem=$db->fetch_row($uq);
$_SESSION['userid']=$mem['userid'];
$IP = $_SERVER['REMOTE_ADDR'];
$IP=addslashes($IP);
$IP=mysql_real_escape_string($IP);
$IP=strip_tags($IP);
$db->query("UPDATE users SET lastip_login='$IP',last_login=unix_timestamp() WHERE userid={$mem['userid']}");
$db->query("UPDATE users SET active=1 WHERE userid={$mem['userid']}");
if($set['validate_period'] == "login" && $set['validate_on'])
{
$db->query("UPDATE users SET verified=0 WHERE userid={$mem['userid']}");
}
header("Location: index.php");
}

?>

