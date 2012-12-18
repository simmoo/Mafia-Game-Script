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

include "globals.php";
$_GET['delete'] = abs((int) $_GET['delete']);
if($_GET['delete'])
{
$db->query("DELETE FROM events WHERE evID={$_GET['delete']} AND evUSER=$userid");
print "<b>Event Deleted</b><br><br />";
}

if($_GET['delall'])
{
print "

<div id='mainOutput' style='text-align: center; color: white;  width: 600px; border: 1px solid #222222; height: 70px;
margin: 0 auto 10px; clear: both; position: relative; left: -20px; padding: 8px'>

This will delete all your events.
There is <font color='red'><b>NO</b></font> undo, so be sure.<br> <br>
<a href='events.php?delall2=1'> <font color='red'> Yes! Delete all my events </font> </a><br> <br>
<a href='events.php'><font color='green'>No! Go Back</font></a><br>


";
$h->endpage();
exit;
}
if($_GET['delall2'])
{
    
$am=$db->num_rows($db->query("SELECT * FROM events WHERE evUSER=$userid"));
$db->query("DELETE FROM events WHERE evUSER=$userid"); 

print "

<div id='mainOutput' style='text-align: center; color: white;  width: 600px; border: 1px solid #222222; height: 70px;
margin: 0 auto 10px; clear: both; position: relative; left: -20px; padding: 8px'>

All <b><font color='red'>{$am}</b></font> events you had were deleted!<br> <br>
<a href='events.php'> <font color='white'> Back </font> </a><br>

";
$h->endpage();
exit;
}
print "
<div class='generalinfo_txt'>
<div><img src='images/info_left.jpg' alt='' /></div>
<div class='info_mid'><h2 style='padding-top:10px;'> Latest 10 Events </h2></div>
<div><img src='images/info_right.jpg' alt='' /></div> </div>
<div class='generalinfo_simple'><br> <br><br>

<a href='events.php?delall=1'>Delete All Events</a><br>";
$q=$db->query("SELECT * FROM events WHERE evUSER=$userid ORDER BY evTIME DESC LIMIT 10;");
print "<table width=75% cellspacing=1 class='table'> <tr style='background:gray;'> <th>Time</th> <th>Event</th><th>Links</th> </tr>";
while($r=$db->fetch_row($q))
{
print "<tr><td>".date('F j Y, g:i:s a',$r['evTIME']);
if (!$r['evREAD'])
{
print "<br /><b>New!</b>";
}
print "</td><td>{$r['evTEXT']}</td><td><a href='events.php?delete={$r['evID']}'>Delete</a></td></tr>";
}
print "</table></div><div><img src='images/generalinfo_btm.jpg' alt='' /></div><br></div></div></div></div></div>";
if($ir['new_events'] > 0)
{
$db->query("UPDATE events SET evREAD=1 WHERE evUSER=$userid");
$db->query("UPDATE users SET new_events=0 WHERE userid=$userid");
}
$h->endpage();
?>

