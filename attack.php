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

$menuhide=0;
$atkpage=1;
include "globals.php";

$_GET['ID'] = isset($_GET['ID']) && is_numeric($_GET['ID']) ? abs(@intval($_GET['ID'])) : false;
if(!$_GET['ID'])
{
print "<font color=white>Invalid Command, Try Again Later.
<br><a href='index.php'>> Go Back <</a>";
$h->endpage();
exit;
}
else if($_GET['ID'] == $userid)
{
print "<center>Only the crazy attack themselves.
<br><a href='index.php'>> Go Back <</a>";
$h->endpage();
exit;
}
else if ($ir['hp'] <= 1)
{
print "<center>Only the crazy attack when their unconscious.
<br><a href='index.php'>> Go Back <</a>";
$h->endpage();
exit;
}
else if ($_SESSION['attacklost'] == 1)
{
print "<center>Only the losers of all their EXP attack when they've already lost.
<br><a href='index.php'>> Go Back <</a>";
$_SESSION['attacklost']=0;
$h->endpage();
exit;
}
//get player data
$youdata=$ir;
$sql = sprintf("SELECT u.*,us.* FROM users u LEFT JOIN userstats us ON u.userid=us.userid WHERE u.userid=%s", $_GET['ID']);
$q=$db->query($sql);
$odata=$db->fetch_row($q);
$myabbr=($ir['gender']=="Male") ? "his" : "her";
$oabbr=($ir['gender']=="Male") ? "his" : "her";
if($ir['attacking'] && $ir['attacking'] != $_GET['ID'])
{
print "<center>Your already in a fight, but some reason cant get back to it...<br />Please wait 1 hour (game time) then you can attack players again.
<br><a href='index.php'>> Go Back <</a>";
$_SESSION['attacklost']=0;
$h->endpage();
exit;
}
if($odata['hp'] == 1)
{
print "<center>This player is unconscious.
<br><a href='index.php'>> Go Back <</a>";
$h->endpage();
$_SESSION['attacking']=0;
$ir['attacking']=0;
$db->query("UPDATE users SET attacking=0 WHERE userid=$userid");
exit;
}

$hospit = rand(10,30);
if($odata['bguard'] >0)
{
print" <center><b><font color='#FFFF00'>Holy Shit!</b></font> You Just Got Your Ass Kicked By The Bodygaurd!! You were injured and taken to the hspital for $hospit min<br/><br/><a href='index.php'>>Home</a></center>";
$h->endpage();     
$db->query("UPDATE users SET hp=0, hospital=hospital+$hospit, hospreason='Beaten Severely By Someones Personal Bodyguard' WHERE userid=$userid",$c);
exit;
}

if($_GET['nextstep'] > 100)
{
print"<center><h2><font color='red'>STALEMATE!</h2>
<a href='index.php'>> Go Back <</a></center>";
$h->endpage();
$db->query("UPDATE users SET attacking=0 WHERE userid=$userid");
event_add($odata['userid'],"<a href='viewuser.php?u=$userid'>{$youdata['username']}</a> Tried to beat you but stalemated.",$c);
event_add($youdata['userid']," You Tried to beat <a href='viewuser.php?u={$odata['userid']}'>{$odata['username']}</a> but stalemated.",$c);
exit;
}
else if($odata['hospital'])
{
print "<center>This player is in hospital.
<br><a href='index.php'>> Go Back <</a>";
$h->endpage();
$_SESSION['attacking']=0;
$ir['attacking']=0;
$db->query("UPDATE users SET attacking=0 WHERE userid=$userid");
exit;
}
else if($ir['hospital'])
{
print "<center>While in hospital you can't attack.
<br><a href='index.php'>> Go Back <</a>";
$h->endpage();
$_SESSION['attacking']=0;
$ir['attacking']=0;
$db->query("UPDATE users SET attacking=0 WHERE userid=$userid");
exit;
}
else if($odata['jail'])
{
print "<center>This player is in jail.
<br><a href='index.php'>> Go Back <</a>";
$h->endpage();
$_SESSION['attacking']=0;
$ir['attacking']=0;
$db->query("UPDATE users SET attacking=0 WHERE userid=$userid");
exit;
}
else if($ir['jail'])
{
print "<center>While in jail you can't attack.
<br><a href='index.php'>> Go Back <</a>";
$h->endpage();
$_SESSION['attacking']=0;
$ir['attacking']=0;
$db->query("UPDATE users SET attacking=0 WHERE userid=$userid");
exit;
}
else if($odata['travelling'])
{
print "<center>That player is travelling.
<br><a href='index.php'>> Go Back <</a>";
$h->endpage();
$_SESSION['attacking']=0;
$ir['attacking']=0;
$db->query("UPDATE users SET attacking=0 WHERE userid=$userid");
exit;
}
else if ($youdata['location'] != $odata['location'])
{
print "<center>You can only attack someone in the same location!
<br><a href='index.php'>> Go Back <</a>";
$h->endpage();
exit;
}
else if ($odata['hp'] <50)
{
print "<center>You can only attack those who have atleast 50% health !
<br><a href='index.php'>> Go Back <</a>";
$h->endpage();
exit;
}
else if ($ir['gang'] == $odata['gang'] && $ir['gang'] > 0)
{
print "<center>You are in the same gang as {$odata['username']}!<br>Why would you attack someone in your gang?!
<br><a href='index.php'>> Go Back <</a>";
$h->endpage();
exit;
}
else if ($ir['equip_primary'] == 0)
{
print "<center>You need a Primary Weapon to attack...<br><a href='index.php'>> Go Back <</a>";
$h->endpage();
exit;
} 



print "<table width=100%><tr><td colspan=2 align=center>";
if($_GET['wepid'])
{
if($_SESSION['attacking']==0 && $ir['attacking'] == 0)
{
if ($youdata['energy'] >= $youdata['maxenergy']/2)
{

$youdata['energy']-= floor($youdata['maxenergy']/2);
$me=floor($youdata['maxenergy']/2);
$db->query("UPDATE users SET energy=energy- {$me} WHERE userid=$userid");
$_SESSION['attacklog']="";
$_SESSION['attackdmg']=0;
}
else
{
print "You can only attack someone when you have 50% energy";
exit;
}
}
$_SESSION['attacking']=1;
$ir['attacking']=$odata['userid'];
$db->query("UPDATE users SET attacking={$ir['attacking']} WHERE userid=$userid");
$_GET['wepid'] = (int) $_GET['wepid'];
$_GET['nextstep'] = (int) $_GET['nextstep'];
//damage

if($_GET['wepid'] != $ir['equip_primary'] && $_GET['wepid'] != $ir['equip_secondary'])
{
print "Stop trying to abuse a game bug. You can lose all your EXP for that.<br />
<a href='index.php'>&gt; Home</a>";
$db->query("UPDATE users SET exp=0 where userid=$userid",$c);
die("");
}
$qo=$db->query("SELECT i.* FROM items i   WHERE i.itmid={$_GET['wepid']}");
$r1=$db->fetch_row($qo);
$mydamage=(int) (($r1['weapon']*$youdata['strength']/($odata['guard']/1.5))*(rand(8000,12000)/10000));
$hitratio=max(10,min(60*$ir['agility']/$odata['agility'],95));
 if(rand(1,100) <= $hitratio )
{
$q3=$db->query("SELECT i.armor FROM items i   WHERE itmid={$odata['equip_armor']} ORDER BY rand()");
if($db->num_rows($q3))
{
$mydamage-=$db->fetch_single($q3);
}
if($mydamage < -100000) { $mydamage=abs($mydamage); }
else if($mydamage < 1) { $mydamage=1; }
$crit=rand(1,40);
if($crit==17) { $mydamage*=rand(20,40)/10; } else if($crit==25 or $crit == 8) { $mydamage/=(rand(20,40)/10); } 
$mydamage=round($mydamage);
$odata['hp']-=$mydamage;
if($odata['hp']==1) { $odata['hp']=0;$mydamage+=1; }
$db->query("UPDATE users SET hp=hp-$mydamage WHERE userid={$_GET['ID']}");
print "<font color=red>{$_GET['nextstep']}. Using your {$r1['itmname']} you hit {$odata['username']} doing $mydamage damage ({$odata['hp']})</font><br />\n";
$_SESSION['attackdmg']+=$mydamage;
$_SESSION['attacklog'].="<font color=red>{$_GET['nextstep']}. Using {$myabbr} {$r1['itmname']} {$ir['username']} hit {$odata['username']} doing $mydamage damage ({$odata['hp']})</font><br />\n";
}
else
{
print "<font color=red>{$_GET['nextstep']}. You tried to hit {$odata['username']} but missed ({$odata['hp']})</font><br />\n";
$_SESSION['attacklog'].="<font color=red>{$_GET['nextstep']}. {$ir['username']} tried to hit {$odata['username']} but missed ({$odata['hp']})</font><br />\n";
}
if($odata['hp'] <= 0)
{
$odata['hp']=0;
$_SESSION['attackwon']=$_GET['ID'];
$db->query("UPDATE users SET hp=0 WHERE userid={$_GET['ID']}");
print "<br /> 
<b>What do you want to do with {$odata['username']} now?</b><br /><br />
<form action='attackwon.php?ID={$_GET['ID']}' method='post'><input type='submit' STYLE='color: white;  background-color: red;' value='Mug Them' />  </form>  <br />  
<form action='attackbeat.php?ID={$_GET['ID']}' method='post'><input type='submit' STYLE='color: white;  background-color: green;' value='Hospitalize Them' />  </form>  <br /> 
<form action='attacktake.php?ID={$_GET['ID']}' method='post'><input type='submit' STYLE='color: black;  background-color: white;' value='Leave Them' /> </form>  <br /> 

<br /> 


NB:If you not choose any of the option above you lose all your EXP point !  <br /> <br />   

If you and the enemy beaten are on the same battle ladder mug them to get points added to the ladder table !  



";
}

else {
//choose opp gun
$eq=$db->query("SELECT i.* FROM  items i  WHERE i.itmid IN({$odata['equip_primary']}, {$odata['equip_secondary']})");
if(mysql_num_rows($eq) == 0)
{
$wep="Fists";
$dam=(int)((((int) ($odata['strength']/$ir['guard']/100)) +1)*(rand(8000,12000)/10000));
}
else
{
$cnt=0;
while($r=$db->fetch_row($eq))
{
$enweps[]=$r;
$cnt++;
}
$weptouse=rand(0,$cnt-1);
$wep=$enweps[$weptouse]['itmname'];
$dam=(int) (($enweps[$weptouse]['weapon']*$odata['strength']/($youdata['guard']/1.5))*(rand(8000,12000)/10000));
}
$hitratio=max(10,min(60*$odata['agility']/$ir['agility'],95));
if(rand(1,100) <= $hitratio)
{
$q3=$db->query("SELECT i.armor FROM items i   WHERE itmid={$ir['equip_armor']} ORDER BY rand()");
if($db->num_rows($q3))
{
$dam-=$db->fetch_single($q3);
}
if($dam < -100000) { $dam=abs($dam); }
else if($dam < 1) { $dam=1; }
$crit=rand(1,40);
if($crit==17) { $dam*=rand(20,40)/10; } else if($crit==25 or $crit == 8) { $dam/=(rand(20,40)/10); } 
$dam=round($dam);
$youdata['hp']-=$dam;
if ($youdata['hp']==1) { $dam+=1; $youdata['hp']=0; }
$db->query("UPDATE users SET hp=hp-$dam WHERE userid=$userid");
$ns=$_GET['nextstep']+1;
print "<font color=blue>{$ns}. Using $oabbr $wep {$odata['username']} hit you doing $dam damage ({$youdata['hp']})</font><br />\n";
$_SESSION['attacklog'].="<font color=blue>{$ns}. Using $oabbr $wep {$odata['username']} hit {$ir['username']} doing $dam damage ({$youdata['hp']})</font><br />\n";
}
else
{
$ns=$_GET['nextstep']+1;
print "<font color=red>{$ns}. {$odata['username']} tried to hit you but missed ({$youdata['hp']})</font><br />\n";
$_SESSION['attacklog'].="<font color=blue>{$ns}. {$odata['username']} tried to hit {$ir['username']} but missed ({$youdata['hp']})</font><br />\n";
}
if($youdata['hp'] <= 0)
{
$youdata['hp']=0;
$_SESSION['attacklost']=1;
$db->query("UPDATE users SET hp=0 WHERE userid=$userid");
print "<form action='attacklost.php?ID={$_GET['ID']}' method='post'><input type='submit' STYLE='color: black;  background-color: white;' value='Continue' />";
}
}
}

print "</td></tr>";
if($youdata['hp'] <= 0 || $odata['hp'] <= 0)
{
print "</table>";
}
else
{
$vars['hpperc']=round($youdata['hp']/$youdata['maxhp']*100);
$vars['hpopp']=100-$vars['hpperc'];
$vars2['hpperc']=round($odata['hp']/$odata['maxhp']*100);
$vars2['hpopp']=100-$vars2['hpperc'];


$mw=$db->query("SELECT i.* FROM  items i  WHERE i.itmid IN({$ir['equip_primary']}, {$ir['equip_secondary']})");
print "<tr><td colspan=2 align='center'>Attack with:<br />";
if($db->num_rows($mw) > 0)
{
while($r=$db->fetch_row($mw))

{
if(!$_GET['nextstep']) { $ns=1; } else { $ns=$_GET['nextstep']+2; }
if($r['itmid']==$ir['equip_primary'])
{
print "<b>Primary Weapon:</b> ";
}
if($r['itmid']==$ir['equip_secondary'])
{
print "<b>Secondary Weapon:</b> ";
}
print "<a href='attack.php?nextstep=$ns&amp;ID={$_GET['ID']}&amp;wepid={$r['itmid']}'>{$r['itmname']}</a><br />";
}
}
else
{
print "You have nothing to fight with.";
}
print "</table>";
print " 

<table width='50%' align='center'><tr><td align=right>Your Health: </td><td><img src=bargreen.gif width={$vars['hpperc']} height=13><img src=barred.gif width={$vars['hpopp']} height=13></td><tr><td align=right>Opponents Health:  </td><td><img src=bargreen.gif width={$vars2['hpperc']} height=13><img src=barred.gif width={$vars2['hpopp']} height=13></td></tr></table>";
}
$h->endpage();
?>
