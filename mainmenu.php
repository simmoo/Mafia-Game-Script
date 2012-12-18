<?php     
global $db,$c,$ir, $set;
$hc=$set['hospital_count'];
$jc=$set['jail_count'];
$ec=$ir['new_events'];
$mc=$ir['new_mail'];
if($ir['hospital'])
{
print "

<div class='navipart'>
<div class='navitop'><p>
<img src='images/navi_txt.gif' alt='' />
</p></div>

<div class='navi_mid'><ul>



<li> <a class='link1' href='index.php'>Home</a></li>
<li> <a class='link1' href='shops.php'>Medical Shop</a></li>
<li> <a class='link1' href='hospital.php'>Hospital ($hc)</a></li> 
<li> <a class='link1' href='inventory.php'>Inventory</a></li>";
}
elseif($ir['jail'])
{

print "

<div class='navipart'>
<div class='navitop'><p>
<img src='images/navi_txt.gif' alt='' />
</p></div>

<div class='navi_mid'><ul>


<li><a class='link1' href='jail.php'>Jail ($jc)</a></li>";
}
else
{
print "


<div class='navipart'>
<div class='navitop'><p>
<img src='images/navi_txt.gif' alt='' />
</p></div>

<div class='navi_mid'><ul>


<li><a class='link1' href='index.php'>Home</a></li><li>
<a class='link1' href='inventory.php'>Inventory</a></li>";
}
if($ec > 0) { print "<li> <a class='link1' href='events.php'>Events ($ec)</a></li>"; }
else { print "<li> <a class='link1' href='events.php'>Events (0)</a></li>"; }
if($mc > 0) { print "<li> <a class='link1' href='mailbox.php'>Mailbox ($mc)</a></li>"; }
else { print "<li> <a class='link1' href='mailbox.php'>Mailbox (0)</a></li>"; }
if($ir['new_announcements'])
{
print "<li> <a class='link1' href='announcements.php' style='font-weight: 800;'>Announcements ({$ir['new_announcements']})</a></li>";
}
else
{
print "<li> <a class='link1' href='announcements.php'>Announcements (0)</a></li>";
}


if($ir['jail'] and !$ir['hospital'])
{
print "<li> <a class='link1' href='gym.php'>Jail Gym</a></li>
<li> <a class='link1' href='hospital.php'>Hospital ($hc)</a></li>";
}
else if (!$ir['hospital'])
{
print "<li> <a class='link1' href='explore.php'>Explore</a></li>
<li> <a class='link1' href='gym.php'>Gym</a></li>
<li> <a class='link1' href='criminal.php'>Crimes</a></li>
<li> <a class='link1' href='job.php'>Your Job</a></li>
<li> <a class='link1' href='business_home.php'>Your Business</a></li>  
<li> <a class='link1' href='education.php'>Local School</a></li>
<li> <a class='link1' href='hospital.php'>Hospital ($hc)</a></li>
<li> <a class='link1' href='jail.php'>Jail ($jc)</a></li>";
}
else
{
print "<li> <a class='link1' href='jail.php'>Jail ($jc)</a></li>";
}
print "<li> <a class='link1' href='forums.php'>Forums</a></li>";

print "
<li> <a class='link1' href='newspaper.php'>Newspaper</a></li>
<li> <a class='link1' href='search.php'>Search</a></li>";
if(!$ir['jail'] && $ir['gang'])
{
print "<li> <a class='link1' href='yourgang.php'>Your Gang</a></li>


</div>

<div><img src='images/navi_btm.gif' alt='' /></div>
</div>  


";
}
if($ir['user_level'] > 1)
{
print "


<div class='navipart'>
<div class='navitop'><p>
<img src='images/staff_links.gif' alt='' /> 
</p></div>

<div class='navi_mid'><ul>
<li> <a class='link1' href='staff.php'>Staff Panel</a></li>
</div>
<div><img src='images/navi_btm.gif' alt='' /></div>
</div>    



";


print "

<div class='navipart'>
<div class='navitop'><p>
<img src='images/staff_online.gif' alt='' />
</p></div>
<div class='navi_mid'><ul> 
";
$q=$db->query("SELECT * FROM users WHERE laston>(unix_timestamp()-15*60) AND user_level>1 ORDER BY userid ASC");
while($r=$db->fetch_row($q))
{
$la=time()-$r['laston'];
$unit="secs";
if($la >= 60)
{
$la=(int) ($la/60);
$unit="mins";
}
if($la >= 60)
{
$la=(int) ($la/60);
$unit="hours";
if($la >= 24)
{
$la=(int) ($la/24);
$unit="days";
}
}
print "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='viewuser.php?u={$r['userid']}'>{$r['username']}</a> ($la $unit)<br>
</div><div><img src='images/navi_btm.gif' alt='' /></div> </div>  

";
}
}
if($ir['donatordays'])
{
print "


<div class='navipart'>
<div class='navitop'><p>
<img src='images/donators_only.gif' alt='' />
</p></div>
<div class='navi_mid'><ul> 

<li> <a class='link1' href='friendslist.php'>Friends List</a></li>
<li> <a class='link1' href='blacklist.php'>Black List</a></li>

</div>

<div><img src='images/navi_btm.gif' alt='' /></div>
</div>  


";
}
print "


<div class='navipart'>
<div class='navitop'><p>
<img src='images/other_links.gif' alt='' />
</p></div>
<div class='navi_mid'><ul> 


<li> <a class='link1' href='preferences.php'>Preferences</a></li>
<li> <a class='link1' href='preport.php'>Player Report</a></li>
<li> <a class='link1' href='helptutorial.php'>Help Tutorial</a></li>
<li> <a class='link1' href='gamerules.php'>Game Rules</a></li>
<li> <a class='link1' href='viewuser.php?u={$ir['userid']}'>My Profile</a></li>
<li> <a class='link1' href='logout.php'>Logout</a></li>

</div>

<div><img src='images/navi_btm.gif' alt='' /></div>
</div>  


" ; 



?>
