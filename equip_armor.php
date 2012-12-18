<?php
include "globals.php";
$_GET['ID'] = abs((int) $_GET['ID']);
$id=$db->query("SELECT iv.*,it.* FROM inventory iv LEFT JOIN items it ON iv.inv_itemid=it.itmid WHERE iv.inv_id={$_GET['ID']} AND iv.inv_userid=$userid LIMIT 1");
if($db->num_rows($id)==0)
{
print "Invalid item ID.
<br />
<a href='inventory.php'>Back</a>";
$h->endpage();
exit;
}
else
{
$r=$db->fetch_row($id);
}
if(!$r['armor'])
{
print "This item cannot be equipped to this slot.
<br />
<a href='inventory.php'>Back</a>";
$h->endpage();
exit;
}
if($_GET['type'])
{
if(!in_array($_GET['type'], array("equip_armor")))
{
print "This slot ID is not valid.";
$h->endpage();
exit;
}
if($ir[$_GET['type']])
{
item_add($userid, $ir[$_GET['type']], 1);
}
item_remove($userid, $r['itmid'], 1);
$db->query("UPDATE users SET {$_GET['type']} = {$r['itmid']} WHERE userid={$userid}");
print "Item {$r['itmname']} equipped successfully.
<br />
<a href='inventory.php'>Back</a>";
}
else
{
print "
<div class='generalinfo_txt'>
<div><img src='images/info_left.jpg' alt='' /></div>
<div class='info_mid'><h2 style='padding-top:10px;'> Equip Armor</h2></div>
<div><img src='images/info_right.jpg' alt='' /></div> </div>
<div class='generalinfo_simple'><br> <br><br>

<form action='equip_armor.php' method='get'>
<input type='hidden' name='ID' value='{$_GET['ID']}' />
Click Equip Armor to equip {$r['itmname']} as your armor, if you currently have any armor equipped it will be removed back to your inventory.<br />
<input type='hidden' name='type' value='equip_armor'  />
<input type='submit' STYLE='color: black;  background-color: white;' value='Equip Armor' /></form> </div><div><img src='images/generalinfo_btm.jpg' alt='' /></div><br></div></div></div></div></div>";
}
$h->endpage();
?>
