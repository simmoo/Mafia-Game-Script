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

include "globals.php";
$tresder=(int) rand(100,999);
global $db, $ir, $userid, $h, $db;
$cityname = $db->fetch_single($db->query("SELECT cityname FROM cities WHERE cityid = ".$ir['location']));
$citycount = $db->fetch_single($db->query("SELECT COUNT(*) FROM users WHERE location = ".$ir['location'])); 
if($ir['jail'] or $ir['hospital']) { print "This page cannot be accessed while in jail or hospital.";

$h->endpage(); 
exit; 
}
print "


<div class='generalinfo_txt'>
<div><img src='images/info_left.jpg' alt='' /></div>
<div class='info_mid'><h2 style='padding-top:10px;'><marquee>You Are Currently Exploring $cityname !</marquee> </h2></div>
<div><img src='images/info_right.jpg' alt='' /></div>

</div>
<div class='generalinfo_simple'><center><img src=images/Boston.png width='600' height='240' alt='City' title='Cityimage' /></center><br />





<div align='left' class='explorehead' style='background-color:#555; padding-left:40px;'>There are $citycount people in $cityname !</div><br />
<table class='table' width='85%'>

<tr valign='middle'>
<th width='34%'><img src='images/basket.png' alt='shop' /> Shops</th>
<th width='33%'><img src='images/building.png' alt='bis' /> Business's</th>
<th width='33%'><img src='images/coins.png' alt='casino' /> Casino</th>
</tr>
<tr style='height: 100%;'>
<td valign='top'>
<a href='shops.php'>City Shops</a><br />
<a href='playershops.php'>Player Shops</a><br /> 
<a href='itemmarket.php'>Item Market</a><br />
<a href='cmarket.php'>Crystal Market</a><br />
</td>
<td valign='top'>
<a href='business_view.php'>Business Listings</a><br /> 
<a href='travel.php'>Travel Agency</a><br />
<a href='estate.php'>Real Estate</a><br />
<a href='bank.php'>City Bank</a>";
if($ir['level'] >= 5)
{
print "<br />
<a href='cyberbank.php'>Cyber Bank</a><br />";
}
print "</td>
<td valign='top'>  
<a href='slotsmachine.php?tresde=$tresder'>Slots Machine</a><br />
<a href='magicslots.php'>Magic Slots</a><br />
<a href='roulette.php?tresde=$tresder'>Roulette</a><br />
<a href='lucky.php'>Lucky Boxes</a>  ";
if($ir['location'] == 5)
{
print "<br />
<a href='slotsmachine3.php'>Super Slots</a><br />";
}
print "</td></tr>

<tr>
<th width='33%'><img src='images/door.png' alt='life' /> Your Life</th>
<th><img src='images/sport_soccer.png' alt='act' /> Mysterious</th>
<th><img src='images/building_link.png' alt='head' /> Headquarters</th>
</tr>

<tr style='height: 100%;'>
<td valign='top'>
<a href='viewuser.php?u={$ir['userid']}'>Your Profile</a><br />
<a href='business_home.php'>Your Business</a><br />  ";

$checkforshop=$db->query("select * from usershops where userid=$userid");
if(mysql_num_rows($checkforshop)!=0)
{
print"<a href='myshop.php'>Your Shop</a> <br/>";
}
print"
<a href='inventory.php'>Inventory</a><br />
<a href='mailbox.php'>Mailbox</a><br />
<a href='polling.php'>Polls</a><br />
<a href='forums.php'>Forums</a><br />
<a href='gamestation.php'>Game Station</a><br />  
</td>
<td valign='top'>
<a href='battle_ladder.php'>Battle Ladder</a><br /> 
<a href='battletent.php'>Battle Tent</a><br />  
<a href='crystaltemple.php'>Crystal Temple</a><br />
<a href='streets.php'>Search Streets</a><br />
<a href='attacklist.php'>Player Attack List</a><br />
<a href='cityusers.php'>Players in your City</a><br />
</td>
<td valign='top'>
<a href='stats.php'>Game Stats</a><br />
<a href='stafflist.php'>{$set['game_name']} Staff</a><br />
<a href='halloffame.php'>Hall of Fame</a><br />
<a href='usersonline.php'>Users Online</a><br />
<a href='userlist.php'>User List</a><br />
<a href='preport.php'>Player Report</a><br />
<a href='fedjail.php'>Federal Jail</a><br />
</tr>

<tr>
<th><img src='images/information.png' alt='info' /> Information</th>
<th>&nbsp;</th>
<th><img src='images/user_suit.png' alt='Platoon' /> Gang</th>
</tr>

<tr style='height: 100%;'>
<td valign='top'>
<a href='helptutorial.php'>Tutorial</a><br />
<a href='gamerules.php'>Rules</a><br />
</td>
<td valign='top'>&nbsp;
</td>
<td valign='top'>
<a href='gangs.php'>Gang List</a><br />
<a href='gangs.php?action=gang_wars'>Gang Wars</a><br />
<a href='yourgang.php'>Your Gang</a><br />


";






print "  


</td></tr></table> </div><div><img src='images/generalinfo_btm.jpg' alt='' /></div><br></div></div></div></div></div>


This is your referal link: http://{$domain}/signup.php?REF=$userid <br><br />
Every signup from this link earns you two valuable crystals!";
$h->endpage();
?>

