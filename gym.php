<?php
$macropage="gym.php";
require "globals.php";
if($ir['hospital']) { die("<prb>This page cannot be accessed while in hospital.</prb>"); }
$statnames=array(
'Strength' => 'strength',
'Agility' => 'agility',
'Guard' => 'guard',
'Labour' => 'labour');
$_POST['amnt']=abs((int) $_POST['amnt']);
if(!$ir['jail'])
{
print "<div class='gympage'>
 <div class='gympart'>
 <div class='gymtxt'><img src='images/gym_txt.jpg' alt='' /></div>
</div>";
}
else
{
  print "
  <div class='gympage'>
    <div class='gympart'></div>
  
  ";
}


if($_POST['stat'] && $_POST['amnt'])
{
  $stat=$statnames[$_POST['stat']];
  if(!$stat)
  {
    die("<prb><br>This stat cannot be trained.</prb>");
  }
  if($_POST['amnt'] > $ir['energy'])
  {
    print("<prb><font color='red'>You do not have enough energy to train that much.</font></prb>");
  }
  else
  {
    $gain=0;
    for($i=0; $i<$_POST['amnt']; $i++)
    {
      $gain+=rand(1,3)/rand(800,1000)*rand(800,1000)*(($ir['will']+20)/150);
      $ir['will']-=rand(1,3);
      if($ir['will'] < 0) { $ir['will']=0; }
    }
    if($ir['jail']) { $gain/=2; }
    $db->query("UPDATE `userstats` SET `{$stat}` = `{$stat}` + $gain WHERE `userid` = $userid");
    $db->query("UPDATE `users` SET `will` = {$ir['will']}, energy = energy - {$_POST['amnt']} WHERE `userid` = $userid");
    $inc=$ir[$stat]+$gain;
    $inc2=$ir['energy']-$_POST['amnt'];
    if($stat=="strength")
    {
      print "
      <div id='mainOutput' style='text-align: center; color: green;  width: 600px; border: 1px solid #222222; height: 70px;
                        margin: 0 auto 10px; clear: both; position: relative; left: -20px; padding: 8px'>
                        
                        
      You start to lift some weights, You go heavier and heavier until You are out of energy.<br />
      You have gained {$gain} strength by doing {$_POST['amnt']} sets of weights.<br />
      You now have {$inc} strength and {$inc2} energy left. 
      
      </div></div>   
      
      
      ";
    }
    elseif($stat=="agility")
    {
      print "
       <div id='mainOutput' style='text-align: center; color: green;  width: 600px; border: 1px solid #222222; height: 70px;
                        margin: 0 auto 10px; clear: both; position: relative; left: -20px; padding: 8px'>
      You Begin to run on the treadmill, You keep tapping the faster button till you fly off the damn thing!.<br />
      You have gained {$gain} agility by doing {$_POST['amnt']} minutes of running.<br />
      You now have {$inc} agility and {$inc2} energy left.
      </div></div> ";
    }
    elseif($stat=="guard")
    {
      print "
      <div id='mainOutput' style='text-align: center; color: green;  width: 600px; border: 1px solid #222222; height: 70px;
                        margin: 0 auto 10px; clear: both; position: relative; left: -20px; padding: 8px'>
      You jump into the pool and begin swimming, you keep flapping your arms in the water like Michael Felps, you get a cramp and almost drown.<br />
      You have gained {$gain} guard by doing {$_POST['amnt']} minutes of swimming.<br />
      You now have {$inc} guard and {$inc2} energy left.
      </div></div> ";
    }
    elseif($stat=="labour")
    {
      print "
       <div id='mainOutput' style='text-align: center; color: green;  width: 600px; border: 1px solid #222222; height: 70px;
                        margin: 0 auto 10px; clear: both; position: relative; left: -20px; padding: 8px'>
      You walk over to the front desk, and ask the manager If you can volunteer to help the gym out, He says unload the boxes In the back, You unload boxes until the gym closes<br />
      You have gained {$gain} labour by unloading {$_POST['amnt']} boxes.<br />
      You now have {$inc} labour and {$inc2} energy left.
      </div></div> ";
    }
    $ir['energy']-=$_POST['amnt'];
    $ir[$stat]+=$gain;
  }
}
$ir['strank']=get_rank($ir['strength'],'strength');
$ir['agirank']=get_rank($ir['agility'],'agility');
$ir['guarank']=get_rank($ir['guard'],'guard');
$ir['labrank']=get_rank($ir['labour'],'labour');


if(  $ir['energy'] == "0"   )
{
print "

<table width='90%'><tr><td><p>
You dont have any energy for taining <a href='crystaltemple.php?spend=refill'><font color='green'>[Refill Energy]</font></a></p></td></tr></table>
<br /> 
";
}

else

{ 

print "

<table width='90%'><tr><td><p>
You can train up to <prb> {$ir['energy']} </prb> times with your
current energy.</p></td></tr></table>
<br />";
}

print " 
  
<table width='90%' class='table'>
<tr>
   <form action='gym.php' method='post'>
   <input type='hidden' name='stat' value='Strength'></input>
   <th width='15%'><ph2>Strength:</ph2></th>
   <td width='15%'>{$ir['strength']}</td>
   <td width='10%'>Rank {$ir['strank']}</td>
   <td width='40%'>Times to train: <input name='amnt' type='text' style='color: black;background-color: white;' value='{$ir['energy']}' > </input> </td>
   <td width='20%'>  <input type=image name='submit' src='images/trainbtn.jpg' alt='Home' border='0''> </input> </td>
   </form>
</tr>
<tr>
   <form action='gym.php' method='post'>
   <input type='hidden' name='stat' value='Agility'></input>
   <th width='15%'><ph2>Agility:</ph2></th>
   <td width='15%'>{$ir['agility']}</td>
   <td width='10%'>Rank {$ir['agirank']}</td>
   <td width='40%'>Times to train: <input type='text' style='color: black;  background-color: white;' name='amnt' value='{$ir['energy']}'></input></td>
   <td width='20%'><input type=image name='submit' src='images/trainbtn.jpg' alt='Home' border='0''> </input> </td>   
   </form>
</tr>
<tr>
   <form action='gym.php' method='post'>
   <input type='hidden' name='stat' value='Guard'></input>
   <th width='15%'><ph2>Guard:</ph2></th>
   <td width='15%'>{$ir['guard']}</td>
   <td width='10%'>Rank {$ir['guarank']}</td>
   <td width='40%'>Times to train: <input type='text' style='color: black;  background-color: white;' name='amnt' value='{$ir['energy']}'></input></td>
   <td width='20%'><input type=image name='submit' src='images/trainbtn.jpg' alt='Home' border='0''> </input> </td>   
   </form>
</tr>
<tr>
   <form action='gym.php' method='post'>
   <input type='hidden' name='stat' value='Labour'></input>
   <th width='15%'><ph2>Labour:</ph2></th>
   <td width='15%'>{$ir['labour']}</td>
   <td width='10%'>Rank {$ir['labrank']}</td>
   <td width='40%'>Times to train: <input type='text' style='color: black; background-color: white;' name='amnt' value='{$ir['energy']}'></input></td>
   <td width='20%'><input type=image name='submit' src='images/trainbtn.jpg' alt='Home' border='0''> </input> </td>   
   </form>
</tr>
</table><br />";


$h->endpage();
?>