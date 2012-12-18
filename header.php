<?php     

/**************************************************************************************************
| Software Name        : Mafia Game Scripts Online Mafia Game
| Software Author      : Mafia Game Scripts
| Software Version     : Version 2.3.1 Build 2301
| Website              : http://www.mafiagamescript.net/
| E-mail               : support@mafiagamescript.net
|**************************************************************************************************
| The source files are subject to the Mafia Game Script End-User License Agreement included in License Agreement.html
| The files in the package must not be distributed in whole or significant part.
| All code is copyrighted unless otherwise advised.
| Do Not Remove Powered By Mafia Game Scripts without permission .         
|**************************************************************************************************
| Copyright (c) 2010 Mafia Game Script . All rights reserved.
|**************************************************************************************************/

class headers {
function startheaders() {  
global $ir, $set;
global $_CONFIG;
define("MONO_ON", 1);
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
$q=$db->query("SELECT userid FROM users");
$membs=$db->num_rows($q);
$q=$db->query("SELECT userid FROM users WHERE bankmoney>-1");
$banks=$db->num_rows($q);
$q=$db->query("SELECT userid FROM users WHERE gender='Male'");
$male=$db->num_rows($q);
$q=$db->query("SELECT userid FROM users WHERE gender='Female'");
$fem=$db->num_rows($q);
$money=money_formatter($ir['money']);
$crystals=money_formatter($ir['crystals'],'');
$cn=0;
// Users Online , Counts Users Online In Last 15 minutes                                                                           
$q=$db->query("SELECT * FROM users WHERE laston>unix_timestamp()-15*60 ORDER BY laston DESC");
$online=$db->num_rows($q);
$ec=$ir['new_events'];
$mc=$ir['new_mail'];

$ids_checkpost=urldecode($_SERVER['QUERY_STRING']);
if(eregi("[\'|'/'\''<'>'*'~'`']",$ids_checkpost) || strstr($ids_checkpost,'union') || strstr($ids_checkpost,'java') || strstr($ids_checkpost,'script') || strstr($ids_checkpost,'substring(') || strstr($ids_checkpost,'ord()')){

$passed=0;
echo "<center> <font color=red> Hack attempt <br/>!!! WARNING !!! <br/>

Malicious Code Detected! The staff has been notified.</font></center>"; 
event_add(1,"  <a href='viewuser.php?u={$ir['userid']}'>  <font color=red> ".$ir['username']."</font> </a>  <b> Tried to use [".$_SERVER['SCRIPT_NAME']."{$ids_checkpost}].. ",$c); 
$h->endpage();
exit;

} 


echo <<<EOF
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>{$set['game_name']} - Massive Multiplayer Online Role Playing Game </title>
<meta name="keywords" content="RPG, Online Games, Online Mafia Game" />
<meta name="description" content=" {$set['game_name']} - Online Mafia Game " />
<meta name="author" content="Mafia Game Scripts " />
<meta name="copyright" content="Copyright {$_SERVER['HTTP_HOST']} " />
<link rel="SHORTCUT ICON" href="favicon.ico" />
<script src="js/jquery-1.js" type="text/javascript"></script>
<link rel="stylesheet" href="css/styleold.css" type="text/css" />
<link rel="stylesheet" href="css/stylenew.css" type="text/css" />

<script type="text/javascript" src="js/header.js"></script>
<style type="text/css">
.boston a{
background:url(images/boston.jpg) no-repeat;
}

.boston a:hover{
background:url(images/boston_hover.jpg) no-repeat;
}
</style>
<!--<script type="text/javascript">
$(document).ready(function(){
$.get("userstatajax.php",function(res){
if(res)
{
var resarray = res.split('||||||');
$('.profile_mid').html(resarray[0]);
$('#points_money').html(resarray[1]);
}
});
});
</script>-->
</head>
<body id="sub" class="yui-skin-sam">

<div id="pagecontainer">
<!-- Header Part Starts -->
<div class="headerpart">

<div class="onlinegame"></div>
<div class="toplist">

</div>
</div>



<!-- //Header Part End -->  

<!-- Inner Page Top Starts -->

<div class="innertopbg">
<div class="toprow1">
<div class="toprow1_col1">
<div class="logo"><a href="index.php"><img src="images/logo.jpg" alt="Logo"/></a></div>
<div class="needbtn"></div>        
<div class="top_leftbtn">
<div class="leftbtn1"> 



</div>
<div class="leftbtn2"> 

</div>

</div>
</div>
<div class="toprow1_col2">
<div class="tot_txt">Total Mobsters:&nbsp;&nbsp;<span>$membs</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Online Now: <span>$online</span></div>
<div class="messagepart">
<div class="message_txt"><a href="mailbox.php" style="color:#fff;"><span>($mc)</span> Messages</a></div>

<div class="event_txt"><a href="events.php" style="color:#fff;"><span>($ec)</span> Events</a></div> </div>  <br/>
<div class="messagepart" id="points_money">
<div class="point_txt">Crystals:&nbsp;<span> $crystals </span><br/></div>
<div class="gold_txt">Money:&nbsp;<span>$money</span></div>

</div>              
</div>
</div>
<!-- Menu Part Starts -->
<div class="toprow2">
<div><img src="images/menu_left.jpg" alt="" /></div>
<div class="menu_md">
<ul>
<li class="ihome_active"><a href="index.php"></a></li>

<li class="gym"><a href="gym.php">&nbsp;</a></li>
<li class="news"><a href="newspaper.php">&nbsp;</a></li>
<li class="forum"><a href="forums.php">&nbsp;</a></li>
<li class="boston"><a href="explore.php">&nbsp;</a></li>
<li class="protect"><a href="bodyguard.php">&nbsp;</a></li>
<li class="logout"><a href="logout.php">&nbsp;</a></li>                            
</ul>                        
</div>
<div><img src="images/menu_right.jpg" alt="" /></div>
</div>            
<!-- //Menu Part End -->

</div>  

<!-- //Inner Page Top End -->


<div class="toprow2">
<div><img src="images/menu_left.jpg" alt="" /></div>
<div class="menu_md">


<br/>


<h2 class="headerpart1a"><span class='text2 title4'>Support {$set['game_name']} <a href='voting.php'>Vote</a> | <a href='donator.php'>Donate</a> | <a href='willpotion.php'>Will Potion</a></span></h2>



</div><div><img src="images/menu_right.jpg" alt="" /></div>
</div>  </div><br/> 
<br/> <br/><br/>    

<div class="gymbg">
<div id="centercontainer">

<div id="centermaincontainer">

<!-- Center Part Starts -->
                    <div class="icenterpart"><div class="icolumn1">



EOF;
}
function userdata($ir,$lv,$fm,$cm,$dosessh=1)
{
global $db,$c,$userid, $set;
$IP = $_SERVER['REMOTE_ADDR'];
$IP=addslashes($IP);
$IP=mysql_real_escape_string($IP);
$IP=strip_tags($IP);
$db->query("UPDATE users SET laston=unix_timestamp(),lastip='$IP' WHERE userid=$userid");
$_GET['ID'] = abs(@intval($_GET['ID']));
$_GET['reply'] = abs(@intval($_GET['reply']));


if(!$ir['email'])
{
global $domain;
die ("<body>Your account may be broken. Please mail help@{$domain} stating your username and player ID.");
}
if($dosessh && ($_SESSION['attacking'] || $ir['attacking']))
{
print "<CENTER><P><b><font color=red>You lost all your EXP for running from the fight.</font></b></P></CENTER> <br/><br/>";
$db->query("UPDATE users SET exp=0,attacking=0 WHERE userid=$userid");
$_SESSION['attacking']=0;
}
$enperc=(int) ($ir['energy']/$ir['maxenergy']*100);
$wiperc=(int) ($ir['will']/$ir['maxwill']*100);
$experc=(int) ( $ir['exp']/$ir['exp_needed']*100);
$brperc=(int) ($ir['brave']/$ir['maxbrave']*100);
$hpperc=(int) ($ir['hp']/$ir['maxhp']*100);
$enopp=100-$enperc;
$wiopp=100-$wiperc;
$exopp=100-$experc;
$bropp=100-$brperc;
$hpopp=100-$hpperc;
$d="";
$u=$ir['username'];
if($ir['donatordays']) { $u = "<font color=green>{$ir['username']}</font>";$d="<img src='donator.gif' alt='Donator: {$ir['donatordays']} Days Left' title='Donator: {$ir['donatordays']} Days Left' />"; }

$gn=""; 
global $staffpage;

$bgcolor = 'FFFFFF';     

include "travellingglobals.php";

if($ir['fedjail'])
{
$q=$db->query("SELECT * FROM fedjail WHERE fed_userid=$userid");
$r=$db->fetch_row($q);
die(" <br /><br /><br /><br /><br /> <CENTER><P> <b><font color=red size=+1>You have been put in the {$set['game_name']} Federal Jail for {$r['fed_days']} day(s).<br /> <br />
Reason: {$r['fed_reason']}</font></b> </P></CENTER> </body></html>"); 
}



if(file_exists('ipbans/'.$IP))
{
die("<br /><br /><br /><br /><br /><CENTER><P><b><font color=red size=+1>Your IP has been banned from {$set['game_name']}, there is no way around this.</font></b></P></CENTER></body></html>");
}

print <<<OUT

<!-- Begin Main Content -->     





<table width="950" border="0" align="center" cellpadding="0" cellspacing="0">    
<tr valign="top">
<td width="181"><table width="181" border="0" cellspacing="0" cellpadding="0">
<tr><td class="text2 height:40px;"><table width="181" border="0" cellspacing="0" cellpadding="0">
</table></table>

<!-- Side Panel -->



<div class="profilepart" id="profilepart">
<div class="profiletxt"><p><img src="images/profile_txt.jpg" alt="" /></p></div>
<div class="profile_mid">
<div class="profile_con">
<div class="gunimg"><img alt='User Pic' src='{$ir['display_pic']} ' width='75' height='75' /></div>
<div class="guntxt">

<style="color:#ffffff;"><b><a href='viewuser.php?u={$ir['userid']}'> $gn{$u} </a> [{$ir['userid']}] $d </b><br/>
<span>Money:</span> {$fm}<br/>
<span>Level:</span> {$ir['level']} <br/>
<span>Crystals:</span> {$cm} <br/>

</div>


</div>                    
<div class="energypart">


<b>Energy:</b> {$enperc}% <a href='crystaltemple.php?spend=refill'><font color='green'>[Refill Energy]</font></a><br />
<img src=bar_left.gif height=13><img src=bargreen.gif width=$enperc height=13><img src=barred.gif width=$enopp height=13><img src=bar_fil_end.gif height=13><br />
<b>Will:</b> {$wiperc}% <br />
<img src=bar_left.gif height=13><img src=barblue.gif width=$wiperc height=13><img src=barred.gif width=$wiopp height=13><img src=bar_fil_end.gif height=13><br />
<b>Brave:</b> {$ir['brave']}/{$ir['maxbrave']} <br />
<img src=bar_left_purp.gif height=13><img src=barpurple.gif width=$brperc height=13><img src=barred.gif width=$bropp height=13><img src=bar_fil_end.gif height=13><br />
<b>EXP:</b> {$experc}%<br />
<img src=bar_left.gif height=13><img src=bargreen.gif width=$experc height=13><img src=barred.gif width=$exopp height=13><img src=bar_fil_end.gif height=13><br />
<b>Health:</b> {$hpperc}% <br />
<img src=bar_left.gif height=13><img src=bargreen.gif width=$hpperc height=13><img src=barred.gif width=$hpopp height=13><img src=bar_fil_end.gif height=13><br />


</div>        
</div>
<div><img src="images/profile_btm.gif" alt="" /></div>    
</div>    

<!-- Links -->
OUT;
}
function menuarea()
{
include "mainmenu.php";
global $ir,$c;
$bgcolor = '000000';
print '</td><td width="2" class="linegrad" bgcolor="#'.$bgcolor.'">&nbsp;</td><td width="80%"  bgcolor="#'.$bgcolor.'" valign="top"><center>';

if($ir['hospital'])
{
print "<font color='red'><b>NOTE:</b></font> You are currently in hospital for {$ir['hospital']} minutes.<br/><br />";
}
if($ir['jail'])
{
print "<font color='red'><b>NOTE:</b></font> You are currently in jail for {$ir['jail']} minutes.<br/><br />";
}

if($ir['traveltime'] > 0)
{
print "<font color = 'red' /><b>Travelling for <b>{$ir['traveltime']} minutes</b>.</font><br /><br />";
} 

if($ir['bguard'] >0)
{
print "<font color='green'><b>NOTE:</b></font> Your Bodyguard is protecting you for {$ir['bguard']} more minutes.<br/><br/>";
}


}
function smenuarea()
{
include "smenu.php";
global $ir,$c;
$bgcolor = '000000';
print '</td><td width="2" class="linegrad" bgcolor="#'.$bgcolor.'"> &nbsp; </td><td width="80%"  bgcolor="#'.$bgcolor.'" valign="top"><center>';
}
function endpage()
{
global $db;

//  Do Not Remove Powered By Mafia Game Script without permission .

// However, if you would like to use the script without the powered by links you may do so by purchasing a Copyright removal license for a very low fee.  

include "footer.php";


}    
} 
?>
