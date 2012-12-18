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

$macropage="criminal.php";
include "globals.php";
if($ir['jail'] or $ir['hospital']) { print "This page cannot be accessed while in jail or hospital.";

$h->endpage(); 
exit; 
}
$q2=$db->query("SELECT * FROM crimes ORDER BY crimeBRAVE ASC");
while ($r2=$db->fetch_row($q2))
{
$crimes[]=$r2;
}
$q=$db->query("SELECT * FROM crimegroups ORDER by cgORDER ASC");
print "

<div class='crimepage'>
<div class='crime_toppart'> 
<div class='toppara'></div>                    
</div><div id='crime_process'></div>

<div class='crime_txt'><img src='images/crime_txt.jpg' alt='' /></div>
<div class='choosetxt'>Choose the type of crime you would like to perform</div>

<table width='90%' cellspacing=1 class='table'><tr><th>Crime</th> <th>Cost</th> <th>Jail Time If You Fail</th><th>Payout</th> <th>Do</th></tr>";
while($r=$db->fetch_row($q))
{
print "<tr><td align='center' colspan='5' class='h'> <b>{$r['cgNAME']}</b></td></tr>";
foreach($crimes as $v)
{
if($v['crimeGROUP'] == $r['cgID']) 
{
print "<tr> <td>{$v['crimeNAME']}</td> <td>{$v['crimeBRAVE']} Brave</td> <td>{$v['crimeJAILTIME']} Minutes</td> <td> \${$v['crimeSUCCESSMUNY']} </td>  <td><div class='perform_btn'><a href='docrime.php?c={$v['crimeID']}'>Do</a></div></td> </tr>";
}
}
}
print "</table>";
$h->endpage();
?>

