-- --------------------------------------------------------

-- 
-- Table structure for table `announcements`
-- 

CREATE TABLE `announcements` (
  `a_text` text NOT NULL,
  `a_time` int(11) NOT NULL default '0'
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `applications`
-- 

CREATE TABLE `applications` (
  `appID` int(11) NOT NULL auto_increment,
  `appUSER` int(11) NOT NULL default '0',
  `appGANG` int(11) NOT NULL default '0',
  `appTEXT` text NOT NULL,
  PRIMARY KEY  (`appID`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `attacklogs`
-- 

CREATE TABLE `attacklogs` (
  `log_id` int(11) NOT NULL auto_increment,
  `attacker` int(11) NOT NULL default '0',
  `attacked` int(11) NOT NULL default '0',
  `result` enum('won','lost') NOT NULL default 'won',
  `time` int(11) NOT NULL default '0',
  `stole` int(11) NOT NULL default '0',
  `attacklog` longtext NOT NULL,
  PRIMARY KEY  (`log_id`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `bankxferlogs`
-- 

CREATE TABLE `bankxferlogs` (
  `cxID` int(11) NOT NULL auto_increment,
  `cxFROM` int(11) NOT NULL default '0',
  `cxTO` int(11) NOT NULL default '0',
  `cxAMOUNT` int(11) NOT NULL default '0',
  `cxTIME` int(11) NOT NULL default '0',
  `cxFROMIP` varchar(15) NOT NULL default '127.0.0.1',
  `cxTOIP` varchar(15) NOT NULL default '127.0.0.1',
  `cxBANK` enum('bank','cyber') NOT NULL default 'bank',
  PRIMARY KEY  (`cxID`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `blacklist`
-- 

CREATE TABLE `blacklist` (
  `bl_ID` int(11) NOT NULL auto_increment,
  `bl_ADDER` int(11) NOT NULL default '0',
  `bl_ADDED` int(11) NOT NULL default '0',
  `bl_COMMENT` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`bl_ID`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `cashxferlogs`
-- 

CREATE TABLE `cashxferlogs` (
  `cxID` int(11) NOT NULL auto_increment,
  `cxFROM` int(11) NOT NULL default '0',
  `cxTO` int(11) NOT NULL default '0',
  `cxAMOUNT` int(11) NOT NULL default '0',
  `cxTIME` int(11) NOT NULL default '0',
  `cxFROMIP` varchar(15) NOT NULL default '127.0.0.1',
  `cxTOIP` varchar(15) NOT NULL default '127.0.0.1',
  PRIMARY KEY  (`cxID`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `challengebots`
-- 

CREATE TABLE `challengebots` (
  `cb_npcid` int(11) NOT NULL default '0',
  `cb_money` int(11) NOT NULL default '0'
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `challengesbeaten`
-- 

CREATE TABLE `challengesbeaten` (
  `userid` int(11) NOT NULL default '0',
  `npcid` int(11) NOT NULL default '0'
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `cities`
-- 

CREATE TABLE `cities` (
  `cityid` int(11) NOT NULL auto_increment,
  `cityname` varchar(255) NOT NULL default '',
  `citydesc` longtext NOT NULL,
  `cityminlevel` int(11) NOT NULL default '0',
  PRIMARY KEY  (`cityid`)
) ENGINE=MyISAM  ;

INSERT INTO `cities` VALUES('1', 'Default City', 'A standard city added to start you off', 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `contactlist`
-- 

CREATE TABLE `contactlist` (
  `cl_ID` int(11) NOT NULL auto_increment,
  `cl_ADDER` int(11) NOT NULL default '0',
  `cl_ADDED` int(11) NOT NULL default '0',
  PRIMARY KEY  (`cl_ID`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `courses`
-- 

CREATE TABLE `courses` (
  `crID` int(11) NOT NULL auto_increment,
  `crNAME` varchar(255) NOT NULL default '',
  `crDESC` text NOT NULL,
  `crCOST` int(11) NOT NULL default '0',
  `crENERGY` int(11) NOT NULL default '0',
  `crDAYS` int(11) NOT NULL default '0',
  `crSTR` int(11) NOT NULL default '0',
  `crGUARD` int(11) NOT NULL default '0',
  `crLABOUR` int(11) NOT NULL default '0',
  `crAGIL` int(11) NOT NULL default '0',
  `crIQ` int(11) NOT NULL default '0',
  PRIMARY KEY  (`crID`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `coursesdone`
-- 

CREATE TABLE `coursesdone` (
  `userid` int(11) NOT NULL default '0',
  `courseid` int(11) NOT NULL default '0'
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `crimegroups`
-- 

CREATE TABLE `crimegroups` (
  `cgID` int(11) NOT NULL auto_increment,
  `cgNAME` varchar(255) NOT NULL default '',
  `cgORDER` int(11) NOT NULL default '0',
  PRIMARY KEY  (`cgID`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `crimes`
-- 

CREATE TABLE `crimes` (
  `crimeID` int(11) NOT NULL auto_increment,
  `crimeNAME` varchar(255) NOT NULL default '',
  `crimeBRAVE` int(11) NOT NULL default '0',
  `crimePERCFORM` text NOT NULL,
  `crimeSUCCESSMUNY` int(11) NOT NULL default '0',
  `crimeSUCCESSCRYS` int(11) NOT NULL default '0',
  `crimeSUCCESSITEM` int(11) NOT NULL default '0',
  `crimeGROUP` int(11) NOT NULL default '0',
  `crimeITEXT` text NOT NULL,
  `crimeSTEXT` text NOT NULL,
  `crimeFTEXT` text NOT NULL,
  `crimeJTEXT` text NOT NULL,
  `crimeJAILTIME` int(10) NOT NULL default '0',
  `crimeJREASON` varchar(255) NOT NULL default '',
  `crimeXP` int(11) NOT NULL default '0',
  PRIMARY KEY  (`crimeID`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `crystalmarket`
-- 

CREATE TABLE `crystalmarket` (
  `cmID` int(11) NOT NULL auto_increment,
  `cmQTY` int(11) NOT NULL default '0',
  `cmADDER` int(11) NOT NULL default '0',
  `cmPRICE` int(11) NOT NULL default '0',
  PRIMARY KEY  (`cmID`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `crystalxferlogs`
-- 

CREATE TABLE `crystalxferlogs` (
  `cxID` int(11) NOT NULL auto_increment,
  `cxFROM` int(11) NOT NULL default '0',
  `cxTO` int(11) NOT NULL default '0',
  `cxAMOUNT` int(11) NOT NULL default '0',
  `cxTIME` int(11) NOT NULL default '0',
  `cxFROMIP` varchar(15) NOT NULL default '127.0.0.1',
  `cxTOIP` varchar(15) NOT NULL default '127.0.0.1',
  PRIMARY KEY  (`cxID`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `dps_accepted`
-- 

CREATE TABLE `dps_accepted` (
  `dpID` int(11) NOT NULL auto_increment,
  `dpBUYER` int(11) NOT NULL default '0',
  `dpFOR` int(11) NOT NULL default '0',
  `dpTYPE` varchar(255) NOT NULL default '',
  `dpTIME` int(11) NOT NULL default '0',
  `dpTXN` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`dpID`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `events`
-- 

CREATE TABLE `events` (
  `evID` int(11) NOT NULL auto_increment,
  `evUSER` int(11) NOT NULL default '0',
  `evTIME` int(11) NOT NULL default '0',
  `evREAD` int(11) NOT NULL default '0',
  `evTEXT` text NOT NULL,
  PRIMARY KEY  (`evID`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `fedjail`
-- 

CREATE TABLE `fedjail` (
  `fed_id` int(11) NOT NULL auto_increment,
  `fed_userid` int(11) NOT NULL default '0',
  `fed_days` int(11) NOT NULL default '0',
  `fed_jailedby` int(11) NOT NULL default '0',
  `fed_reason` text NOT NULL,
  PRIMARY KEY  (`fed_id`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `forum_forums`
-- 

CREATE TABLE `forum_forums` (
  `ff_id` int(11) NOT NULL auto_increment,
  `ff_name` varchar(255) NOT NULL default '',
  `ff_desc` varchar(255) NOT NULL default '',
  `ff_posts` int(11) NOT NULL default '0',
  `ff_topics` int(11) NOT NULL default '0',
  `ff_lp_time` int(11) NOT NULL default '0',
  `ff_lp_poster_id` int(11) NOT NULL default '0',
  `ff_lp_poster_name` text NOT NULL,
  `ff_lp_t_id` int(11) NOT NULL default '0',
  `ff_lp_t_name` varchar(255) NOT NULL default '',
  `ff_auth` enum('public','gang','staff') NOT NULL default 'public',
  `ff_owner` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ff_id`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `forum_posts`
-- 

CREATE TABLE `forum_posts` (
  `fp_id` int(11) NOT NULL auto_increment,
  `fp_topic_id` int(11) NOT NULL default '0',
  `fp_forum_id` int(11) NOT NULL default '0',
  `fp_poster_id` int(11) NOT NULL default '0',
  `fp_poster_name` text NOT NULL,
  `fp_time` int(11) NOT NULL default '0',
  `fp_subject` varchar(255) NOT NULL default '',
  `fp_text` text NOT NULL,
  `fp_editor_id` int(11) NOT NULL default '0',
  `fp_editor_name` text NOT NULL,
  `fp_editor_time` int(11) NOT NULL default '0',
  `fp_edit_count` int(11) NOT NULL default '0',
  PRIMARY KEY  (`fp_id`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `forum_topics`
-- 

CREATE TABLE `forum_topics` (
  `ft_id` int(11) NOT NULL auto_increment,
  `ft_forum_id` int(11) NOT NULL default '0',
  `ft_name` varchar(255) NOT NULL default '',
  `ft_desc` varchar(255) NOT NULL default '',
  `ft_posts` int(11) NOT NULL default '0',
  `ft_owner_id` int(11) NOT NULL default '0',
  `ft_owner_name` text NOT NULL,
  `ft_start_time` int(11) NOT NULL default '0',
  `ft_last_id` int(11) NOT NULL default '0',
  `ft_last_name` text NOT NULL,
  `ft_last_time` int(11) NOT NULL default '0',
  `ft_pinned` tinyint(4) NOT NULL default '0',
  `ft_locked` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`ft_id`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `friendslist`
-- 

CREATE TABLE `friendslist` (
  `fl_ID` int(11) NOT NULL auto_increment,
  `fl_ADDER` int(11) NOT NULL default '0',
  `fl_ADDED` int(11) NOT NULL default '0',
  `fl_COMMENT` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`fl_ID`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `gangevents`
-- 

CREATE TABLE `gangevents` (
  `gevID` int(11) NOT NULL auto_increment,
  `gevGANG` int(11) NOT NULL default '0',
  `gevTIME` int(11) NOT NULL default '0',
  `gevTEXT` text NOT NULL,
  PRIMARY KEY  (`gevID`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `gangforums_replies`
-- 

CREATE TABLE `gangforums_replies` (
  `gfr_id` int(11) NOT NULL auto_increment,
  `gfr_userid` int(11) NOT NULL default '0',
  `gfr_gangid` int(11) NOT NULL default '0',
  `gfr_topic` int(11) NOT NULL default '0',
  `gfr_text` text NOT NULL,
  `gfr_posttime` int(11) NOT NULL default '0',
  PRIMARY KEY  (`gfr_id`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `gangforums_topics`
-- 

CREATE TABLE `gangforums_topics` (
  `gft_id` int(11) NOT NULL auto_increment,
  `gft_userid` int(11) NOT NULL default '0',
  `gft_gangid` int(11) NOT NULL default '0',
  `gft_title` varchar(255) NOT NULL default '',
  `gft_text` text NOT NULL,
  `gft_replies` int(11) NOT NULL default '0',
  `gft_views` int(11) NOT NULL default '0',
  `gft_lastpost` int(11) NOT NULL default '0',
  `gft_lastposterid` int(11) NOT NULL default '0',
  `gft_starttime` int(11) NOT NULL default '0',
  PRIMARY KEY  (`gft_id`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `gangs`
-- 

CREATE TABLE `gangs` (
  `gangID` int(11) NOT NULL auto_increment,
  `gangNAME` varchar(255) NOT NULL default '',
  `gangDESC` text NOT NULL,
  `gangPREF` varchar(12) NOT NULL default '',
  `gangSUFF` varchar(12) NOT NULL default '',
  `gangMONEY` int(11) NOT NULL default '0',
  `gangCRYSTALS` int(11) NOT NULL default '0',
  `gangRESPECT` int(11) NOT NULL default '0',
  `gangPRESIDENT` int(11) NOT NULL default '0',
  `gangVICEPRES` int(11) NOT NULL default '0',
  `gangCAPACITY` int(11) NOT NULL default '0',
  `gangCRIME` int(11) NOT NULL default '0',
  `gangCHOURS` int(11) NOT NULL default '0',
  `gangAMENT` longtext NOT NULL,
  PRIMARY KEY  (`gangID`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `gangwars`
-- 

CREATE TABLE `gangwars` (
  `warID` int(11) NOT NULL auto_increment,
  `warDECLARER` int(11) NOT NULL default '0',
  `warDECLARED` int(11) NOT NULL default '0',
  `warTIME` int(11) NOT NULL default '0',
  PRIMARY KEY  (`warID`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `houses`
-- 

CREATE TABLE `houses` (
  `hID` int(11) NOT NULL auto_increment,
  `hNAME` varchar(255) NOT NULL default '',
  `hPRICE` int(11) NOT NULL default '0',
  `hWILL` int(11) NOT NULL default '0',
  PRIMARY KEY  (`hID`)
) ENGINE=MyISAM  ;

INSERT INTO `houses` VALUES(1, "Default House", 0, 100);



-- --------------------------------------------------------

-- 
-- Table structure for table `imarketaddlogs`
-- 

CREATE TABLE `imarketaddlogs` (
  `imaID` int(11) NOT NULL auto_increment,
  `imaITEM` int(11) NOT NULL default '0',
  `imaPRICE` int(11) NOT NULL default '0',
  `imaINVID` int(11) NOT NULL default '0',
  `imaADDER` int(11) NOT NULL default '0',
  `imaTIME` int(11) NOT NULL default '0',
  `imaCONTENT` text NOT NULL,
  PRIMARY KEY  (`imaID`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `imbuylogs`
-- 

CREATE TABLE `imbuylogs` (
  `imbID` int(11) NOT NULL auto_increment,
  `imbITEM` int(11) NOT NULL default '0',
  `imbADDER` int(11) NOT NULL default '0',
  `imbBUYER` int(11) NOT NULL default '0',
  `imbPRICE` int(11) NOT NULL default '0',
  `imbIMID` int(11) NOT NULL default '0',
  `imbINVID` int(11) NOT NULL default '0',
  `imbTIME` int(11) NOT NULL default '0',
  `imbCONTENT` text NOT NULL,
  PRIMARY KEY  (`imbID`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `imremovelogs`
-- 

CREATE TABLE `imremovelogs` (
  `imrID` int(11) NOT NULL auto_increment,
  `imrITEM` int(11) NOT NULL default '0',
  `imrADDER` int(11) NOT NULL default '0',
  `imrREMOVER` int(11) NOT NULL default '0',
  `imrIMID` int(11) NOT NULL default '0',
  `imrINVID` int(11) NOT NULL default '0',
  `imrTIME` int(11) NOT NULL default '0',
  `imrCONTENT` text NOT NULL,
  PRIMARY KEY  (`imrID`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `inventory`
-- 

CREATE TABLE `inventory` (
  `inv_id` int(11) NOT NULL auto_increment,
  `inv_itemid` int(11) NOT NULL default '0',
  `inv_userid` int(11) NOT NULL default '0',
  `inv_qty` int(11) NOT NULL default '0',
  PRIMARY KEY  (`inv_id`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `itembuylogs`
-- 

CREATE TABLE `itembuylogs` (
  `ibID` int(11) NOT NULL auto_increment,
  `ibUSER` int(11) NOT NULL default '0',
  `ibITEM` int(11) NOT NULL default '0',
  `ibTOTALPRICE` int(11) NOT NULL default '0',
  `ibQTY` int(11) NOT NULL default '0',
  `ibTIME` int(11) NOT NULL default '0',
  `ibCONTENT` text NOT NULL,
  PRIMARY KEY  (`ibID`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `itemmarket`
-- 

CREATE TABLE `itemmarket` (
  `imID` int(11) NOT NULL auto_increment,
  `imITEM` int(11) NOT NULL default '0',
  `imADDER` int(11) NOT NULL default '0',
  `imPRICE` int(11) NOT NULL default '0',
  `imCURRENCY` enum('money','crystals') NOT NULL default 'money',
  PRIMARY KEY  (`imID`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `items`
-- 

CREATE TABLE `items` (
  `itmid` int(11) NOT NULL auto_increment,
  `itmtype` int(11) NOT NULL default '0',
  `itmname` varchar(255) NOT NULL default '',
  `itmdesc` text NOT NULL,
  `itmbuyprice` int(11) NOT NULL default '0',
  `itmsellprice` int(11) NOT NULL default '0',
  `itmbuyable` int(11) NOT NULL default '0',
  `effect1_on` tinyint(4) NOT NULL default '0',
  `effect1` text NOT NULL,
  `effect2_on` tinyint(4) NOT NULL default '0',
  `effect2` text NOT NULL,
  `effect3_on` tinyint(4) NOT NULL default '0',
  `effect3` text NOT NULL,
  `weapon` int(11) NOT NULL default '0',
  `armor` int(11) NOT NULL default '0',
  PRIMARY KEY  (`itmid`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `itemselllogs`
-- 

CREATE TABLE `itemselllogs` (
  `isID` int(11) NOT NULL auto_increment,
  `isUSER` int(11) NOT NULL default '0',
  `isITEM` int(11) NOT NULL default '0',
  `isTOTALPRICE` int(11) NOT NULL default '0',
  `isQTY` int(11) NOT NULL default '0',
  `isTIME` int(11) NOT NULL default '0',
  `isCONTENT` text NOT NULL,
  PRIMARY KEY  (`isID`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `itemtypes`
-- 

CREATE TABLE `itemtypes` (
  `itmtypeid` int(11) NOT NULL auto_increment,
  `itmtypename` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`itmtypeid`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `itemxferlogs`
-- 

CREATE TABLE `itemxferlogs` (
  `ixID` int(11) NOT NULL auto_increment,
  `ixFROM` int(11) NOT NULL default '0',
  `ixTO` int(11) NOT NULL default '0',
  `ixITEM` int(11) NOT NULL default '0',
  `ixQTY` int(11) NOT NULL default '0',
  `ixTIME` int(11) NOT NULL default '0',
  `ixFROMIP` varchar(255) NOT NULL default '',
  `ixTOIP` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`ixID`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `jaillogs`
-- 

CREATE TABLE `jaillogs` (
  `jaID` int(11) NOT NULL auto_increment,
  `jaJAILER` int(11) NOT NULL default '0',
  `jaJAILED` int(11) NOT NULL default '0',
  `jaDAYS` int(11) NOT NULL default '0',
  `jaREASON` longtext NOT NULL,
  `jaTIME` int(11) NOT NULL default '0',
  PRIMARY KEY  (`jaID`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `jobranks`
-- 

CREATE TABLE `jobranks` (
  `jrID` int(11) NOT NULL auto_increment,
  `jrNAME` varchar(255) NOT NULL default '',
  `jrJOB` int(11) NOT NULL default '0',
  `jrPAY` int(11) NOT NULL default '0',
  `jrIQG` int(11) NOT NULL default '0',
  `jrLABOURG` int(11) NOT NULL default '0',
  `jrSTRG` int(11) NOT NULL default '0',
  `jrIQN` int(11) NOT NULL default '0',
  `jrLABOURN` int(11) NOT NULL default '0',
  `jrSTRN` int(11) NOT NULL default '0',
  PRIMARY KEY  (`jrID`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `jobs`
-- 

CREATE TABLE `jobs` (
  `jID` int(11) NOT NULL auto_increment,
  `jNAME` varchar(255) NOT NULL default '',
  `jFIRST` int(11) NOT NULL default '0',
  `jDESC` varchar(255) NOT NULL default '',
  `jOWNER` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`jID`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `mail`
-- 

CREATE TABLE `mail` (
  `mail_id` int(11) NOT NULL auto_increment,
  `mail_read` int(11) NOT NULL default '0',
  `mail_from` int(11) NOT NULL default '0',
  `mail_to` int(11) NOT NULL default '0',
  `mail_time` int(11) NOT NULL default '0',
  `mail_subject` varchar(255) NOT NULL default '',
  `mail_text` text NOT NULL,
  PRIMARY KEY  (`mail_id`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `oclogs`
-- 

CREATE TABLE `oclogs` (
  `oclID` int(11) NOT NULL auto_increment,
  `oclOC` int(11) NOT NULL default '0',
  `oclGANG` int(11) NOT NULL default '0',
  `oclLOG` text NOT NULL,
  `oclRESULT` enum('success','failure') NOT NULL default 'success',
  `oclMONEY` int(11) NOT NULL default '0',
  `ocCRIMEN` varchar(255) NOT NULL default '',
  `ocTIME` int(11) NOT NULL default '0',
  PRIMARY KEY  (`oclID`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `orgcrimes`
-- 

CREATE TABLE `orgcrimes` (
  `ocID` int(11) NOT NULL auto_increment,
  `ocNAME` varchar(255) NOT NULL default '',
  `ocUSERS` int(11) NOT NULL default '0',
  `ocSTARTTEXT` text NOT NULL,
  `ocSUCCTEXT` text NOT NULL,
  `ocFAILTEXT` text NOT NULL,
  `ocMINMONEY` int(11) NOT NULL default '0',
  `ocMAXMONEY` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ocID`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `papercontent`
-- 

CREATE TABLE `papercontent` (
  `content` longtext NOT NULL
) ENGINE=MyISAM ;

INSERT INTO `papercontent` VALUES('Here you can put game news, or prehaps an update log.');

-- --------------------------------------------------------

-- 
-- Table structure for table `polls`
-- 

CREATE TABLE `polls` (
  `id` int(11) NOT NULL auto_increment,
  `active` enum('0','1') NOT NULL default '0',
  `question` varchar(255) NOT NULL default '',
  `choice1` varchar(255) NOT NULL default '',
  `choice2` varchar(255) NOT NULL default '',
  `choice3` varchar(255) NOT NULL default '',
  `choice4` varchar(255) NOT NULL default '',
  `choice5` varchar(255) NOT NULL default '',
  `choice6` varchar(255) NOT NULL default '',
  `choice7` varchar(255) NOT NULL default '',
  `choice8` varchar(255) NOT NULL default '',
  `choice9` varchar(255) NOT NULL default '',
  `choice10` varchar(255) NOT NULL default '',
  `voted1` int(11) NOT NULL default '0',
  `voted2` int(11) NOT NULL default '0',
  `voted3` int(11) NOT NULL default '0',
  `voted4` int(11) NOT NULL default '0',
  `voted5` int(11) NOT NULL default '0',
  `voted6` int(11) NOT NULL default '0',
  `voted7` int(11) NOT NULL default '0',
  `voted8` int(11) NOT NULL default '0',
  `voted9` int(11) NOT NULL default '0',
  `voted10` int(11) NOT NULL default '0',
  `votes` int(11) NOT NULL default '0',
  `winner` int(11) NOT NULL default '0',
  `hidden` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `preports`
-- 

CREATE TABLE `preports` (
  `prID` int(11) NOT NULL auto_increment,
  `prREPORTER` int(11) NOT NULL default '0',
  `prREPORTED` int(11) NOT NULL default '0',
  `prTEXT` longtext NOT NULL,
  PRIMARY KEY  (`prID`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `referals`
-- 

CREATE TABLE `referals` (
  `refID` int(11) NOT NULL auto_increment,
  `refREFER` int(11) NOT NULL default '0',
  `refREFED` int(11) NOT NULL default '0',
  `refTIME` int(11) NOT NULL default '0',
  `refREFERIP` varchar(15) NOT NULL default '127.0.0.1',
  `refREFEDIP` varchar(15) NOT NULL default '127.0.0.1',
  PRIMARY KEY  (`refID`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `settings`
-- 

CREATE TABLE `settings` (
  `conf_id` int(11) NOT NULL auto_increment,
  `conf_name` varchar(255) NOT NULL default '',
  `conf_value` text NOT NULL,
  PRIMARY KEY  (`conf_id`)
) ENGINE=MyISAM  ;



INSERT INTO `settings` VALUES (NULL, 'validate_period', '15');
INSERT INTO `settings` VALUES (NULL, 'validate_on', '0');
INSERT INTO `settings` VALUES (NULL, 'regcap_on', '0');
INSERT INTO `settings` VALUES (NULL, 'hospital_count', '0');
INSERT INTO `settings` VALUES (NULL, 'jail_count', '0');
INSERT INTO `settings` VALUES (NULL, 'sendcrys_on', '1');
INSERT INTO `settings` VALUES (NULL, 'sendbank_on', '1');
INSERT INTO `settings` VALUES (NULL, 'ct_refillprice', '12');
INSERT INTO `settings` VALUES (NULL, 'ct_iqpercrys', '5');
INSERT INTO `settings` VALUES (NULL, 'ct_moneypercrys', '200');
INSERT INTO `settings` VALUES (NULL, 'staff_pad', 'Here you can store notes for all staff to see.');
INSERT INTO `settings` VALUES (NULL, 'willp_item', '0');
INSERT INTO `settings` VALUES (NULL, 'ravanversion', '2.5.01 (Build: 2501)');


-- --------------------------------------------------------

-- 
-- Table structure for table `shopitems`
-- 

CREATE TABLE `shopitems` (
  `sitemID` int(11) NOT NULL auto_increment,
  `sitemSHOP` int(11) NOT NULL default '0',
  `sitemITEMID` int(11) NOT NULL default '0',
  PRIMARY KEY  (`sitemID`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `shops`
-- 

CREATE TABLE `shops` (
  `shopID` int(11) NOT NULL auto_increment,
  `shopLOCATION` int(11) NOT NULL default '0',
  `shopNAME` varchar(255) NOT NULL default '',
  `shopDESCRIPTION` text NOT NULL,
  PRIMARY KEY  (`shopID`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `stafflog`
-- 

CREATE TABLE `stafflog` (
  `id` int(11) NOT NULL auto_increment,
  `user` int(11) NOT NULL default '0',
  `time` int(11) NOT NULL default '0',
  `action` varchar(255) NOT NULL default '',
  `ip` varchar(15) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  ;

-- --------------------------------------------------------

-- 
-- Table structure for table `staffnotelogs`
-- 

CREATE TABLE `staffnotelogs` (
  `snID` int(11) NOT NULL auto_increment,
  `snCHANGER` int(11) NOT NULL default '0',
  `snCHANGED` int(11) NOT NULL default '0',
  `snTIME` int(11) NOT NULL default '0',
  `snOLD` longtext NOT NULL,
  `snNEW` longtext NOT NULL,
  PRIMARY KEY  (`snID`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `surrenders`
-- 

CREATE TABLE `surrenders` (
  `surID` int(11) NOT NULL auto_increment,
  `surWAR` int(11) NOT NULL default '0',
  `surWHO` int(11) NOT NULL default '0',
  `surTO` int(11) NOT NULL default '0',
  `surMSG` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`surID`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `unjaillogs`
-- 

CREATE TABLE `unjaillogs` (
  `ujaID` int(11) NOT NULL auto_increment,
  `ujaJAILER` int(11) NOT NULL default '0',
  `ujaJAILED` int(11) NOT NULL default '0',
  `ujaTIME` int(11) NOT NULL default '0',
  PRIMARY KEY  (`ujaID`)
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `users`
-- 

CREATE TABLE `users` (
  `userid` int(11) NOT NULL auto_increment,
  `username` varchar(255) NOT NULL default '',
  `userpass` varchar(255) NOT NULL default '',
  `level` int(11) NOT NULL default '0',
  `exp` decimal(11,4) NOT NULL default '0.0000',
  `money` int(11) NOT NULL default '0',
  `crystals` int(11) NOT NULL default '0',
  `laston` int(11) NOT NULL default '0',
  `lastip` varchar(255) NOT NULL default '',
  `job` int(11) NOT NULL default '0',
  `energy` int(11) NOT NULL default '0',
  `will` int(11) NOT NULL default '0',
  `maxwill` int(11) NOT NULL default '0',
  `brave` int(11) NOT NULL default '0',
  `maxbrave` int(11) NOT NULL default '0',
  `maxenergy` int(11) NOT NULL default '0',
  `hp` int(11) NOT NULL default '0',
  `maxhp` int(11) NOT NULL default '0',
  `lastrest_life` int(11) NOT NULL default '0',
  `lastrest_other` int(11) NOT NULL default '0',
  `location` int(11) NOT NULL default '0',
  `hospital` int(11) NOT NULL default '0',
  `jail` int(11) NOT NULL default '0',
  `jail_reason` varchar(255) NOT NULL default '',
  `fedjail` int(11) NOT NULL default '0',
  `user_level` int(11) NOT NULL default '1',
  `gender` enum('Male','Female') NOT NULL default 'Male',
  `daysold` int(11) NOT NULL default '0',
  `signedup` int(11) NOT NULL default '0',
  `gang` int(11) NOT NULL default '0',
  `daysingang` int(11) NOT NULL default '0',
  `course` int(11) NOT NULL default '0',
  `cdays` int(11) NOT NULL default '0',
  `jobrank` int(11) NOT NULL default '0',
  `donatordays` int(11) NOT NULL default '0',
  `email` varchar(255) NOT NULL default '',
  `login_name` varchar(255) NOT NULL default '',
  `display_pic` text NOT NULL,
  `duties` varchar(255) NOT NULL default 'N/A',
  `bankmoney` int(11) NOT NULL default '0',
  `cybermoney` int(11) NOT NULL default '-1',
  `staffnotes` longtext NOT NULL,
  `mailban` int(11) NOT NULL default '0',
  `mb_reason` varchar(255) NOT NULL default '',
  `hospreason` varchar(255) NOT NULL default '',
  `lastip_login` varchar(255) NOT NULL default '127.0.0.1',
  `lastip_signup` varchar(255) NOT NULL default '127.0.0.1',
  `last_login` int(11) NOT NULL default '0',
  `voted` text NOT NULL,
  `crimexp` int(11) NOT NULL default '0',
  `attacking` int(11) NOT NULL default '0',
  `verified` int(11) NOT NULL default '0',
  `forumban` int(11) NOT NULL default '0',
  `fb_reason` varchar(255) NOT NULL default '',
  `posts` int(11) NOT NULL default '0',
  `forums_avatar` varchar(255) NOT NULL default '',
  `forums_signature` text NOT NULL,
  `new_events` int(11) NOT NULL default '0',
  `new_mail` int(11) NOT NULL default '0',
  `friend_count` int(11) NOT NULL default '0',
  `enemy_count` int(11) NOT NULL default '0',
  `new_announcements` int(11) NOT NULL default '0',
  `boxes_opened` int(11) NOT NULL default '0',
  `user_notepad` text NOT NULL,
  `equip_primary` int(11) NOT NULL default '0',
  `equip_secondary` int(11) NOT NULL default '0',
  `equip_armor` int(11) NOT NULL default '0',
  `force_logout` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`userid`)
) ENGINE=MyISAM  ;


ALTER TABLE `users` ADD `turns` INT( 11 ) NOT NULL DEFAULT '25';

-- --------------------------------------------------------

-- 
-- Table structure for table `userstats`
-- 

CREATE TABLE `userstats` (
  `userid` int(11) NOT NULL default '0',
  `strength` decimal(11,4) NOT NULL default '0.0000',
  `agility` decimal(11,4) NOT NULL default '0.0000',
  `guard` decimal(11,4) NOT NULL default '0.0000',
  `labour` decimal(11,4) NOT NULL default '0.0000',
  `IQ` decimal(11,6) NOT NULL default '0.000000'
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `votes`
-- 

CREATE TABLE `votes` (
  `userid` int(11) NOT NULL default '0',
  `list` varchar(255) NOT NULL default ''
) ENGINE=MyISAM ;

-- --------------------------------------------------------

-- 
-- Table structure for table `willps_accepted`
-- 

CREATE TABLE `willps_accepted` (
  `dpID` int(11) NOT NULL auto_increment,
  `dpBUYER` int(11) NOT NULL default '0',
  `dpFOR` int(11) NOT NULL default '0',
  `dpAMNT` varchar(255) NOT NULL default '',
  `dpTIME` int(11) NOT NULL default '0',
  `dpTXN` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`dpID`)
) ENGINE=MyISAM ;


-- Table structure for table `npaper`   


CREATE TABLE `npaper` (
  `npID` int(11) NOT NULL auto_increment,
  `npADDER` int(11) NOT NULL default '0',
  `npTITLE` varchar(255) NOT NULL default '',
  `npBODY` text NOT NULL,
  `npTIME` int(11) NOT NULL default '0',
  PRIMARY KEY  (`npID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;


-- Table structure for table `search`  

CREATE TABLE IF NOT EXISTS `search` (
  `searchid` int(11) NOT NULL auto_increment,
  `userid` int(11) NOT NULL default '0',
  `moneymin` int(11) NOT NULL default '1',
  `daysmax` varchar(255) NOT NULL default '',
  `daysmin` varchar(255) NOT NULL default '',
  `levelmin` int(11) NOT NULL default '1',
  `levelmax` int(11) NOT NULL default '500',
  `id` varchar(255) NOT NULL default '',
  `location` int(11) NOT NULL default '1',
  `name` varchar(255) NOT NULL default '',
  `online` varchar(255) NOT NULL default '0',
  PRIMARY KEY  (`searchid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ; 


-- ALTER TABLES


ALTER TABLE `users` ADD `ratings` INT( 11 ) NOT NULL DEFAULT '0';
ALTER TABLE `users` ADD `rates` INT( 11 ) NOT NULL DEFAULT '1';

ALTER TABLE `users` ADD `warehouse` INT(11) NOT NULL DEFAULT '0',
ADD `matches` INT(11) NOT NULL DEFAULT '0',
ADD `petrol` INT(11) NOT NULL DEFAULT '0';

ALTER TABLE `cities` ADD `citytravtime` INT(11) NOT NULL DEFAULT '0';
ALTER TABLE `users` ADD `traveltime` INT(11) NOT NULL DEFAULT '0';



CREATE TABLE IF NOT EXISTS `battle_ladders` (
  `ladderId` int(11) NOT NULL AUTO_INCREMENT,
  `ladderName` varchar(255) NOT NULL DEFAULT '',
  `ladderLevel` int(11) NOT NULL,
  PRIMARY KEY (`ladderId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `battle_members` (
  `bmemberId` int(11) NOT NULL AUTO_INCREMENT,
  `bmemberUser` int(11) NOT NULL,
  `bmemberLadder` int(11) NOT NULL,
  `bmemberScore` int(11) NOT NULL,
  `bmemberWins` int(11) NOT NULL,
  `bmemberLosses` int(11) NOT NULL,
  PRIMARY KEY (`bmemberId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;



INSERT INTO `battle_ladders` (`ladderId`, `ladderName`, `ladderLevel`) VALUES
(1, 'Beginner league', 0),
(2, 'Amateur league', 5),
(3, 'Professional league', 10),
(4, 'Master league', 15);        


CREATE TABLE IF NOT EXISTS `gComments` (
`ID` int(11) NOT NULL auto_increment,
`SenderID` int(11) NOT NULL,
`RecieverID` int(11) NOT NULL,
`Comment` text NOT NULL,
PRIMARY KEY (`ID`),
KEY `ID` (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ; 


-- -----------------------Updated April 20 ---------------------------------

--
-- Table structure for table `usershopitems`
--

CREATE TABLE IF NOT EXISTS `usershopitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopid` int(11) NOT NULL,
  `itemid` int(11) NOT NULL,
  `price` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `usershoplogs`
--

CREATE TABLE IF NOT EXISTS `usershoplogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buyer` int(11) NOT NULL,
  `seller` int(11) NOT NULL,
  `item` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `date` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `usershops`
--

CREATE TABLE IF NOT EXISTS `usershops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `size` int(11) NOT NULL,
  `money` bigint(20) NOT NULL,
  `totalsold` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;



CREATE TABLE IF NOT EXISTS `businesses` (
  `busId` int(11) NOT NULL auto_increment,
  `busName` varchar(255) NOT NULL,
  `busClass` int(11) NOT NULL,
  `busDirector` int(11) NOT NULL,
  `busProfit` bigint(25) NOT NULL,
  `busYProfit` bigint(25) NOT NULL,
  `busCust` int(11) NOT NULL,
  `busYCust` int(11) NOT NULL,
  `busCash` int(11) NOT NULL,
  `busDebt` int(11) NOT NULL,
  `busImage` varchar(255) NOT NULL,
  `busDays` bigint(32) NOT NULL default '0',
  `busEmployees` int(11) NOT NULL default '0',
  `brank` int(11) NOT NULL default '0',
  `busDesc` varchar(50) NOT NULL,
  `bussecurity` int(11) NOT NULL default '0',
  PRIMARY KEY  (`busId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;


CREATE TABLE IF NOT EXISTS `businesses_alerts` (
  `alertId` int(11) NOT NULL auto_increment,
  `alertBusiness` int(11) NOT NULL default '0',
  `alertTime` int(11) NOT NULL default '0',
  `alertText` text NOT NULL,
  PRIMARY KEY  (`alertId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

CREATE TABLE IF NOT EXISTS `businesses_apps` (
  `appId` int(11) NOT NULL auto_increment,
  `appMember` int(11) NOT NULL,
  `appBusiness` int(11) NOT NULL,
  `appText` text NOT NULL,
  `appTime` int(11) NOT NULL,
  PRIMARY KEY  (`appId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;


CREATE TABLE IF NOT EXISTS `businesses_classes` (
  `classId` int(11) NOT NULL auto_increment,
  `className` varchar(255) NOT NULL,
  `classDesc` text NOT NULL,
  `classMembers` int(11) NOT NULL,
  `classCost` int(11) NOT NULL,
  PRIMARY KEY  (`classId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `businesses_classes`
--

INSERT INTO `businesses_classes` (`classId`, `className`, `classDesc`, `classMembers`, `classCost`) VALUES
(1, 'Fireworks stand', 'Our customers will explode in delight with our fireworks. Great for holidays or any special event.', 4, 500000),
(2, 'Hair salon', 'A hair salon is a place where one goes to get their hair cut, as well as styled, highlighted or coloured.', 4, 750000),
(3, 'Law firm', 'A law firm is a business entity formed by one or more lawyers to engage in the practice of law. The money made is determined by the work hours the company sells. The amount of employees will increase this, aswell as the hired lawyers stats.', 6, 4000000),
(4, 'Flower shop', 'A store where flowers are purchased.', 4, 100000),
(5, 'Car dealership', 'Our customers need transportation. Sell them our best and send them on their way.', 8, 6000000),
(6, 'Football Club', 'Lead the way with your team and become the champions.', 10, 12000000);

CREATE TABLE IF NOT EXISTS `businesses_members` (
  `bmembId` int(11) NOT NULL auto_increment,
  `bmembMember` int(11) NOT NULL,
  `bmembBusiness` int(11) NOT NULL default '0',
  `bmembCash` int(11) NOT NULL,
  `bmembRank` int(11) NOT NULL default '0',
  `bmembDays` bigint(32) NOT NULL default '0',
  PRIMARY KEY  (`bmembId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

CREATE TABLE IF NOT EXISTS `businesses_ranks` (
  `rankId` int(11) NOT NULL auto_increment,
  `rankName` varchar(255) NOT NULL,
  `rankClass` int(11) NOT NULL,
  `rankCash` int(11) NOT NULL,
  `rankPrim` enum('labour','IQ','strength') NOT NULL,
  `rankSec` enum('labour','IQ','strength') NOT NULL,
  `rankPGain` decimal(11,2) NOT NULL,
  `rankSGain` decimal(11,2) NOT NULL,
  PRIMARY KEY  (`rankId`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `businesses_ranks`
--

INSERT INTO `businesses_ranks` (`rankId`, `rankName`, `rankClass`, `rankCash`, `rankPrim`, `rankSec`, `rankPGain`, `rankSGain`) VALUES
(1, 'Sales person', 1, 1000, 'IQ', 'labour', '30.50', '15.25'),
(2, 'Product manager', 1, 2500, 'labour', 'strength', '20.00', '10.00'),
(3, 'Cashier', 1, 5000, 'IQ', 'strength', '25.00', '12.00'),
(4, 'Stylist', 2, 800, 'IQ', 'labour', '25.00', '12.50'),
(5, 'Cleaner', 2, 1400, 'labour', 'strength', '20.00', '10.00'),
(6, 'Shampooist', 2, 2100, 'strength', 'labour', '25.00', '12.50'),
(7, 'Lawyer', 3, 1200, 'IQ', 'labour', '40.00', '20.00'),
(8, 'Cleaner', 3, 800, 'labour', 'strength', '20.00', '10.00'),
(9, 'Receptionist', 3, 600, 'IQ', 'labour', '30.00', '15.00'),
(10, 'Florist', 4, 500, 'labour', 'strength', '25.00', '12.50'),
(11, 'Cleaner', 4, 750, 'labour', 'IQ', '20.00', '10.00'),
(12, 'Salesman', 5, 3400, 'labour', 'strength', '30.00', '15.00'),
(13, 'Cleaner', 5, 1400, 'labour', 'strength', '20.00', '10.00'),
(14, 'Receptionist', 5, 900, 'IQ', 'labour', '34.00', '17.00'),
(15, 'Referee', 6, 3150, 'labour', 'strength', '15.00', '10.00'),
(16, 'Player', 6, 3500, 'labour', 'IQ', '28.00', '7.00'),
(17, 'Goal Keeper', 6, 3100, 'labour', 'strength', '25.00', '7.00');

CREATE TABLE IF NOT EXISTS `compspecials` (
  `csID` int(11) NOT NULL auto_increment,
  `csNAME` varchar(255) NOT NULL default '',
  `csJOB` int(11) NOT NULL default '0',
  `csCOST` int(11) NOT NULL default '0',
  `csMONEY` int(11) NOT NULL default '0',
  `csCRYSTALS` int(11) NOT NULL default '0',
  `csITEM` int(11) NOT NULL default '0',
  `csENDU` int(11) NOT NULL default '0',
  `csIQ` int(11) NOT NULL default '0',
  `csLABOUR` int(11) NOT NULL default '0',
  `csSTR` int(11) NOT NULL default '0',
  PRIMARY KEY  (`csID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

ALTER TABLE `users` ADD `comppoints` INT(11) NOT NULL DEFAULT '0';
ALTER TABLE `users` ADD `business` INT(11) NOT NULL DEFAULT '0';
ALTER TABLE `users` ADD `active` INT(11) NOT NULL DEFAULT '0';
ALTER TABLE `users` ADD `activedays` INT(11) NOT NULL DEFAULT '0';
ALTER TABLE businesses ADD bussecure INT( 11 ) NOT NULL DEFAULT '0';
ALTER TABLE users ADD rob INT( 11 ) NOT NULL DEFAULT '0';
ALTER TABLE userstats ADD robskill INT( 11 ) NOT NULL DEFAULT '0';
ALTER TABLE `users` ADD `bguard` INT( 11 ) NOT NULL DEFAULT '0';


INSERT INTO `compspecials` 

(`csID`,`csNAME`,`csJOB`,`csCOST`,`csMONEY`,`csCRYSTALS`,`csITEM`,`csENDU`,`csIQ`,`csLABOUR`,`csSTR`) 

VALUES  

('NULL','Labour Pack [ +100 ]','6','10','0','0','0','0','0','100','0'),
('NULL','Strength Pack [ +100 ]','6','10','0','0','0','0','0','0','100'),
('NULL','IQ Pack [ +100 ]','6','10','0','0','0','0','100','0','0'),
('NULL','Endurance Pack [ +100 ]','6','10','0','0','0','100','0','0','0'),
('NULL','Crystal Pack [ +25 ]','6','25','0','25','0','0','0','0','0'),
('NULL','Money Pack [ +5000 ]','6','25','5000','0','0','0','0','0','0'),
('NULL','Special Pack [ Every Other Pack ]','6','75','5000','25','0','100','100','100','100'),
('NULL','Labour Pack [ +100 ]','5','10','0','0','0','0','0','100','0'),
('NULL','Strength Pack [ +100 ]','5','10','0','0','0','0','0','0','100'),
('NULL','IQ Pack [ +100 ]','5','10','0','0','0','0','100','0','0'),
('NULL','Endurance Pack [ +100 ]','5','10','0','0','0','100','0','0','0'),
('NULL','Crystal Pack [ +25 ]','5','25','0','25','0','0','0','0','0'),
('NULL','Money Pack [ +5000 ]','5','25','5000','0','0','0','0','0','0'),
('NULL','Special Pack [ Every Other Pack ]','5','75','5000','25','0','100','100','100','100'),
('NULL','Labour Pack [ +100 ]','4','10','0','0','0','0','0','100','0'),
('NULL','Strength Pack [ +100 ]','4','10','0','0','0','0','0','0','100'),
('NULL','IQ Pack [ +100 ]','4','10','0','0','0','0','100','0','0'),
('NULL','Endurance Pack [ +100 ]','4','10','0','0','0','100','0','0','0'),
('NULL','Crystal Pack [ +25 ]','4','25','0','25','0','0','0','0','0'),
('NULL','Money Pack [ +5000 ]','4','25','5000','0','0','0','0','0','0'),
('NULL','Special Pack [ Every Other Pack ]','4','75','5000','25','0','100','100','100','100'),
('NULL','Labour Pack [ +100 ]','3','10','0','0','0','0','0','100','0'),
('NULL','Strength Pack [ +100 ]','3','10','0','0','0','0','0','0','100'),
('NULL','IQ Pack [ +100 ]','3','10','0','0','0','0','100','0','0'),
('NULL','Endurance Pack [ +100 ]','3','10','0','0','0','100','0','0','0'),
('NULL','Crystal Pack [ +25 ]','3','25','0','25','0','0','0','0','0'),
('NULL','Money Pack [ +5000 ]','3','25','5000','0','0','0','0','0','0'),
('NULL','Special Pack [ Every Other Pack ]','3','75','5000','25','0','100','100','100','100'),
('NULL','Labour Pack [ +100 ]','2','10','0','0','0','0','0','100','0'),
('NULL','Strength Pack [ +100 ]','2','10','0','0','0','0','0','0','100'),
('NULL','IQ Pack [ +100 ]','2','10','0','0','0','0','100','0','0'),
('NULL','Endurance Pack [ +100 ]','2','10','0','0','0','100','0','0','0'),
('NULL','Crystal Pack [ +25 ]','2','25','0','25','0','0','0','0','0'),
('NULL','Money Pack [ +5000 ]','2','25','5000','0','0','0','0','0','0'),
('NULL','Special Pack [ Every Other Pack ]','2','75','5000','25','0','100','100','100','100'),
('NULL','Labour Pack [ +100 ]','1','10','0','0','0','0','0','100','0'),
('NULL','Strength Pack [ +100 ]','1','10','0','0','0','0','0','0','100'),
('NULL','IQ Pack [ +100 ]','1','10','0','0','0','0','100','0','0'),
('NULL','Endurance Pack [ +100 ]','1','10','0','0','0','100','0','0','0'),
('NULL','Crystal Pack [ +25 ]','1','25','0','25','0','0','0','0','0'),
('NULL','Money Pack [ +5000 ]','1','25','5000','0','0','0','0','0','0'),
('NULL','Special Pack [ Every Other Pack ]','1','75','5000','25','0','100','100','100','100');        



-- 
-- Dumping data for table `crimegroups`
--


INSERT INTO `crimegroups` VALUES (1, 'Standard Crimes', 1);
INSERT INTO `crimegroups` VALUES (2, 'Arson Crimes', 2);
INSERT INTO `crimegroups` VALUES (3, 'Drug Crimes', 3);
INSERT INTO `crimegroups` VALUES (4, 'Grand Theft Autos', 4);
INSERT INTO `crimegroups` VALUES (5, 'Hitman Crimes', 5);
INSERT INTO `crimegroups` VALUES (6, 'Theft Crimes', 6);
INSERT INTO `crimegroups` VALUES (7, 'Virus Crimes', 7);


-- 
-- Dumping data for table `crimes`
-- 

INSERT INTO `crimes` VALUES (1, 'Near The Comunity Center', 1, '((WILL*0.8)/1)+(LEVEL/4)', 10, 0, 0, 1, '1. You head over to the Comunity Center.<br />\r\n2. You start scavenging for cash.<br />''', '<font color=green>Result: You collect ${money} from the gutters!', '<font color=orange>Result: There''s no change to be seen! ', '<font color=red>you got busted ', 10, 'got busted', 10);
INSERT INTO `crimes` VALUES (2, 'Under a shack', 1, '((WILL*0.8)/1.5)+(LEVEL/4)', 20, 0, 0, 1, '1. You head over to the shack of well-known Street Person, Dave.<br />\r\n2. You creep underneath and start scavenging for money.<br />''', '<font color=green>Result: You dig up ${money}!', '<font color=orange>Result: Dave finds you and says "What are you doin here?". You run off. ', '<font color=red>you got busted ', 5, 'got busted', 10);
INSERT INTO `crimes` VALUES (3, 'Music CDS', 3, '((WILL*0.8)/3)+(LEVEL/4)', 30, 0, 0, 1, '1. You go down to the local market and buy some blank CDs.<br />\r\n2. You head home and burn some music onto these CDs.<br />\r\n3. You go back to the market, set up your shop, and wait for customers.<br />''', '<font color=green>Result: You sell your stock making you ${money}!', '<font color=orange>Result: No-one wants to buy your worthless junk! ', '<font color=red>you got busted ', 7, 'got busted', 15);
INSERT INTO `crimes` VALUES (4, 'DVDs', 3, '((WILL*0.8)/3.5)+(LEVEL/4)', 34, 0, 0, 1, '1. You go down to the local market and buy some blank DVDs.<br />\r\n2. You head home and burn some videos onto these CDs.<br />\r\n3. You go back to the market, set up your shop, and wait for customers.<br />''', '<font color=green>Result: You sell your stock making you ${money}!', '<font color=orange>Result: No-one wants to buy your worthless junk! ', '<font color=red>you got busted ', 10, 'got busted', 15);
INSERT INTO `crimes` VALUES (5, 'Dog Racing', 30, '((WILL*0.7)/30)+(LEVEL/5)', 50000, 0, 0, 1, '1. You set up the equipment required.<br />\r\n2. The target comes in.<br />\r\n3. You persuade him to make a bet of $50000 on a Dog.<br />\r\n4. Using delayed TV, you show him the race, knowing he has picked the wrong one.<br />''', '<font color=green><font color=green>Result: Operation Success!</font>', '<font color=orange><font color=brown>Result: You misread the Dog that won and made him bet on the wrong Dog! Doh!</font> ', '<font color=red>you got busted ', 60, 'got caught illegaly racen dogs', 60);
INSERT INTO `crimes` VALUES (6, 'Fight Club', 85, '((WILL*0.7)/35.9)+(LEVEL/25)', 500000, 0, 0, 1, 'You go down to the docks looking for the fight club. ''', '<font color=green>You get in and start whooping them one by one until you win ,a man comes up to you, and says that was the best fight he had seen in years and gives you a share of what he''s won, ${money} ! that''s all for you he says!', '<font color=orange>Right as you get in the cops bust in and start shooting, you get hit in the head and wake up in jail.sucks to be you! lol!  ', '<font color=red>you got busted ', 190, 'got caught in illegal fight club', 190);
INSERT INTO `crimes` VALUES (7, 'Jacked up on PCP', 100, '((WILL*0.7)/35.9)+(LEVEL/75)', 1200000, 0, 0, 1, 'You have taken PCP!!!''', '<font color=green>You feel like nothing can hurt you so you run to the bank and rob it you get a half a million but that not good eough for you so you run back in and take all the gold too, looks like you made it out with ${money} you get home before the drug''s that you''re on ware off.', '<font color=orange>You  think you can''t be stoped and start running to a bank but on the way a bunch of cops are eating as you try to run by you trip and stumble, they see you and arrest you for being under the influence. ', '<font color=red>you got busted ', 200, 'got busted for assult think you where unstopable', 200);
INSERT INTO `crimes` VALUES (8, 'The Big Score', 200, '((WILL*0.7)/35.9)+(LEVEL/125)', 8000000, 0, 0, 1, 'You decide to hack a bank!''', '<font color=green>You begain hacking the banks main frame you get passed all the fire walls and put ${money} in you swiss bank. ', '<font color=orange>You begain hacking the banks main frame when the F.B.I. bust thow your doors can you say busted! ', '<font color=red>you got busted ', 400, 'got caught hacking a bank', 400);
INSERT INTO `crimes` VALUES (9, 'Burn a House', 30, '((WILL*0.7)/30)+(LEVEL/5)', 50000, 0, 0, 2, 'You drench the house in gas\r\nand throw a match at it. \r\nAfter about 2 minutes, the house is engulfed in flames. \r\n''', '<font color=green>You think to youself\r\n"this rules, why didn''t I do this sooner?\r\n', '<font color=orange>the cops roll up \r\n ', '<font color=red>you get taken to jail for arson ', 60, 'got busted for arson', 60);
INSERT INTO `crimes` VALUES (10, 'Burn a Bridge', 85, '((WILL*0.7)/35.9)+(LEVEL/25)', 100000, 0, 0, 2, 'You drench the Bridge in gas\r\nand throw a match at it. \r\nAfter about 2 minutes, the Bridge is engulfed in flames. \r\n''', '<font color=green>You think to youself\r\n"this rules, why didn''t I do this sooner?\r\n', '<font color=orange>the cops roll up \r\n ', '<font color=red>you get taken to jail for arson ', 190, 'got busted for arson', 190);
INSERT INTO `crimes` VALUES (11, 'Burn a Hotel', 100, '((WILL*0.7)/35.9)+(LEVEL/75)', 200000, 0, 0, 2, 'You drench the Hotel in gas\r\nand throw a match at it. \r\nAfter about 2 minutes, the Hotel is engulfed in flames. \r\n''', '<font color=green>You think to youself\r\n"this rules, why didn''t I do this sooner?\r\n', '<font color=orange>the cops roll up \r\n ', '<font color=red>you get taken to jail for arson ', 200, 'got busted for arson', 200);
INSERT INTO `crimes` VALUES (12, 'Burn a Warehouse', 200, '((WILL*0.7)/35.9)+(LEVEL/125)', 250000, 0, 0, 2, 'You drench the Warehouse in gas\r\nand throw a match at it. \r\nAfter about 2 minutes, the Warehouse is engulfed in flames. \r\n''', '<font color=green>You think to youself\r\n"this rules, why didn''t I do this sooner?\r\n', '<font color=orange>the cops roll up \r\n ', '<font color=red>you get taken to jail for arson ', 400, 'got busted for arson', 400);
INSERT INTO `crimes` VALUES (13, 'PCP', 8, '((WILL*0.8)/8)+(LEVEL/4)', 200, 0, 0, 3, '1. You pick up a load of PCP from your bud''s and drive south on the M1 highway.<br />\r\n2. You see coppers chasing after you, you turn off to avoid them.<br />''', '<font color=green>3. You get off their tail and deliver the goods, collecting your fee.<br />\r\n<font color=green>Result: You feel good with ${money} in your pocket!</font>', '<font color=orange><font color=brown>Result: As they pull nearer to you you leap out of the van and run off.</font> ', '<font color=red>you got busted running drugs!', 25, 'busted by the cops running drugs', 25);
INSERT INTO `crimes` VALUES (14, 'Cannabis', 20, '((WILL*0.8)/8)+(LEVEL/4)', 500, 0, 0, 3, '1. You pick up a load of Cannabis from your bud''s and drive south on the M1 highway.<br />\r\n2. You see coppers chasing after you, you turn off to avoid them.<br />''', '<font color=green>3. You get off their tail and deliver the goods, collecting your fee.<br />\r\n<font color=green>Result: You feel good with ${money} in your pocket!</font>', '<font color=orange><font color=brown>Result: As they pull nearer to you you leap out of the van and run off.</font> ', '<font color=red>you got busted running drugs!', 25, 'busted by the cops running drugs', 25);
INSERT INTO `crimes` VALUES (15, 'LSD', 40, '((WILL*0.8)/8)+(LEVEL/4)', 1000, 0, 0, 3, '1. You pick up a load of LSD from your bud''s and drive south on the M1 highway.<br />\r\n2. You see coppers chasing after you, you turn off to avoid them.<br />''', '<font color=green>3. You get off their tail and deliver the goods, collecting your fee.<br />\r\n<font color=green>Result: You feel good with ${money} in your pocket!</font>', '<font color=orange><font color=brown>Result: As they pull nearer to you you leap out of the van and run off.</font> ', '<font color=red>you got busted running drugs!', 25, 'busted by the cops running drugs', 25);
INSERT INTO `crimes` VALUES (16, 'Get some cannibis', 90, '((WILL*0.7)/35.9)+(LEVEL/50)', 1000000, 0, 0, 3, 'You go and tell the drug dealer that you want 100 lbs. of his best cannibis.''', '<font color=green>You take him to the spot and kick his Face in, you then take all the cannibis and sell it for ${money}.', '<font color=orange>You take him to the spot but right as you get there the cops are there waiting. Looks like Jail time! ', '<font color=red>you got busted ', 180, 'got caught running drugs', 180);
INSERT INTO `crimes` VALUES (17, 'GS-R turbo', 20, '((WILL*0.8)/20)+(LEVEL/4)', 0, 0, 8009, 4, '1. You head down to the local car lot.<br />\r\n2. You spot a GS-R turbo, pretty shiny you''d say!<br />\r\n3. You throw a rock at the window and hop in!<br />''', '<font color=green>Result: You insert your fake key and take off with it you now have a new GS-R turbo!', '<font color=orange>Result: There''s no battery, so the car won''t run! You hop out and run away. ', '<font color=red>you got busted for GTA', 40, 'busted by the cops for jacking cars', 40);
INSERT INTO `crimes` VALUES (18, 'Hummer', 28, '((WILL*0.7)/28)+(LEVEL/4)', 0, 0, 8011, 4, '1. You walking down a streetof a rich neighbourhood.<br />\r\n2. You see a red Hummer with the window down.<br />\r\n3. You stop to make sure no one is looking and you open it and attempt to hot wire it.<br /> \r\n''', '<font color=green>4.You hear it crank over!<br />\r\n\r\n<font color=green>Result: \r\n You speed off you in your new hummer!</font>', '<font color=orange>4. You wire it wrong and blow a fuse.<br />\r\n5. The Alarm starts screeching.<br />\r\n\r\n<font color=brown>Result: you run of before somebody notices you. Bad Luck.</font> ', '<font color=red>to late the cops seen ya', 56, 'got caught stealing a hummer', 56);
INSERT INTO `crimes` VALUES (19, 'F-150', 25, '((WILL*0.7)/25)+(LEVEL/4)', 0, 0, 8010, 4, '1. You head down to the local car lot.<br />\r\n2. You spot a F-150, ooh it looks neat!<br />\r\n3. You throw a rock at the window, but then spy a security camera attached to the steering wheel.<br />\r\n4. You jump in, make sure you''re out of the camera''s view, and attempt to work it out of its socket.<br />''', '<font color=green>5. The camera pops out, you smile and throw it away.<br />\r\nResult: You insert your fake key and take off you now have a new F-150!', '<font color=orange>Result: The camera won''t budge. You abandon your attempt and walk home. You Encounter Cops that seen the whole thing!', '<font color=red>you got busted for GTA', 50, 'busted by the cops for jacking cars', 50);
INSERT INTO `crimes` VALUES (20, 'Industrialist', 15, '((WILL*0.8)/15)+(LEVEL/4)', 2000, 0, 0, 5, '1. You arm yourself with your trusty M16 and meet your accomplice at the bus station. He gives you the job.<br />\r\n2. You drive to the target''s mansion.<br />\r\n3. He steps out of his car, you tense up and get ready to fire.<br />''', '<font color=green>4. You blow his head off.<br />\r\n<font color=green>Result: You drive home to find ${money} in your Mail Box for the job!</font>', '<font color=orange><font color=brown>Result: You wrongly identified the Industrialist, you blew a street walker''s head off instead! Unlucky!</font> ', '<font color=red>you got busted for murder', 35, 'got busted for murder', 35);
INSERT INTO `crimes` VALUES (21, 'Coke Dealer', 25, '((WILL*0.7)/25)+(LEVEL/4)', 25000, 0, 0, 5, '1. You Recieved a call for a job downtown.<br />\r\n2. You arm yourself with your trusty Sniper Rifle and head down to the Designated Area.<br />\r\n3. The Target shows up about to get into his car.<br />\r\n\r\n''', '<font color=green>4. You Take his head off clean in 1 shot.<br />\r\n<font color=green>Result: You drive home to find ${money} in your Mail Box!</font>', '<font color=orange>4. the target steps into the car and prepares to drive off.<br />\r\n5. Yours still trying to peice your gun together but forgot what part goes where.<br />\r\n\r\n<font color=brown>Result: He Drives off safely! Bad Luck!</font> ', '<font color=red>you got busted for murder', 50, 'got busted for murder', 50);
INSERT INTO `crimes` VALUES (22, 'Kill a Rich Guy', 75, '((WILL*0.7)/35.9)+(LEVEL/16)', 140000, 0, 0, 5, '1. You arm yourself with your trusty Arsenal Shipka and meet your partner at the bus station. He gives you the job.<br />\r\n2. You drive to the target''s mansion.<br />\r\n3. You step out of your car, you get fired up and get ready to fire.<br />''', '<font color=green>4. You blow his head off.<br />\r\n<font color=green>Result: You drive home to find ${money} in your mailbox for the job!</font>', '<font color=orange><font color=brown>Result: You wrongly identified the target, you blew a street walker''s head off instead! Looks Like Jail time for you!</font> ', '<font color=red>you got busted ', 150, 'got busted for murder', 150);
INSERT INTO `crimes` VALUES (23, 'Hired Gun', 150, '((WILL*0.7)/35.9)+(LEVEL/100)', 4000000, 0, 0, 5, 'You get hired on for a Hit.''', '<font color=green>You go meet the man at a shop. you get a pic of your mark you go to find the mark.you find him at the mall you get shot 3 shoots off at him you have killed the mark you go back to the shop and meet the man there you, get ${money}! for a job well done! ', '<font color=orange>You go meet the man at the shop. you get a pic of your mark you go to find the mark.you find him you get shot 3 shoots off, but you missed and hit a cop car, that was dumb now you are going to jail, say hi to bubba lol  ', '<font color=red>you got busted for murder', 300, 'got busted for murder', 300);
INSERT INTO `crimes` VALUES (24, 'Street Person', 6, '((WILL*0.8)/6)+(LEVEL/4)', 50, 0, 0, 6, '1. You go down the street searching for a Street Person.<br />\r\n2. You see a particularly nice-looking Street Person dozing on the sidewalk.<br />\r\n3. You bend down and stick your hand into his pocket.<br />', '4. You grab some notes and run away.<br />\r\n<font color=green>Result: You count up the notes, there''s ${money}!</font>', '<font color=brown>The Street Person stirs. You dash away, not wanting to let him see you.</font>', 'you got busted', 15, 'busted by the cops', 20);
INSERT INTO `crimes` VALUES (25, 'Punk', 6, '((WILL*0.8)/6.5)+(LEVEL/4)', 100, 0, 0, 6, '1. You go down the street searching for a Punk.<br />\r\n2. You see a kid listening to his walkman walk down the sidewalk.<br />\r\n3. You quietly go up to him and put a hand into his pocket.<br />', '4. You grab a wallet and run away.<br />\r\n<font color=green>Result: You open the wallet and count up the notes, there''s ${money}!</font>', '<font color=brown>Result: You hit his pocket protector, you walk away slowly.</font>', 'you got busted', 25, 'busted by the cops', 25);
INSERT INTO `crimes` VALUES (26, 'Enterprise Man', 6, '((WILL*0.8)/6.9)+(LEVEL/4)', 150, 0, 0, 6, '1. You go down the street searching for a normal everyday Enterprise Man.<br />\r\n2. You see a man briskly walking, carrying a black bag.<br />\r\n3. You quietly go up to him and reach a hand out for his bag.<br />', '4. You grab it and dash off down an streetway.<br />\r\n<font color=green>Result: You open the bag and count up the money, there''s ${money}!</font>', '<font color=brown>Result: You cop one in the nose as he shoos you away.</font>', 'you got busted', 25, 'busted by the cops', 25);
INSERT INTO `crimes` VALUES (27, 'Broken Down Home', 10, '((WILL*0.8)/10)+(LEVEL/4)', 260, 0, 0, 6, '1. You head to a back street where there are lots of Broken Down Homes.<br />\r\n2. You find a particularly nice-looking Broken Down Home, check that there''s no-one inside, and break open the door.<br />\r\n3. You start searching the draws.<br />', '<font color=green>Result: You find ${money} in a lower draw!</font>', '<font color=brown>Result: You hear footsteps. You don''t know if they are coming towards this Broken Down Home, but you can''t take the risk. You dash away with nothing in your pocket.</font>', 'you got busted', 25, 'busted by the cops', 25);
INSERT INTO `crimes` VALUES (28, 'Condo', 11, '((WILL*0.8)/11)+(LEVEL/4)', 400, 0, 0, 6, '1. You head over to your buds to pick up your assignment.<br />\r\n2. He gives you a piece of paper with the address on it. You hop in your car and drive there.<br />\r\n3. You throw a large rock at the window of the Condo and hop in.<br />\r\n4. You start searching for the MAc your bud told you to steal for him.<br />', '5. You find the MAc, it looks pretty new and powerful!<br />\r\n6. You disconnect the MAc from the power at the wall, disconnect the various wires, and pack it all into a cardboard box as tall as your head.<br />\r\n7. You carry the box into your car and drive back to your bud''s.<br />\r\n<font color=green>Result: As promised, he gives you 20% of the MAc''s worth. You feel highly content with the ${money} in your wallet.</font>', '<font color=brown>Result: The alarm sounds. You get out as fast as possible and drive away.</font>', 'you got busted', 25, 'busted by the cops', 25);
INSERT INTO `crimes` VALUES (29, 'Rob the Casino', 35, '((WILL*0.6)/35)+(LEVEL/5)', 70000, 0, 0, 6, 'Rob the Casino\r\n1. You set up the equipment required.<br />\r\n2. You Start developing some fake casino Chips.<br />\r\n3. You pack the Chips into the Suit case and Head of to the local Casino.<br />\r\n4. Once inside u Bet $70000 in a single game of BlackJack.<br />', '<font color=green>Result: Operation Success!\r\n\r\nYou Won ${money} and Exhanges the Real Chips for Cash</font>\r\n', '<font color=brown>Result: The Dealer Spots that your Chips are Fake and calls Security\r\n\r\nNot wishing to be Caught you Run of before the Security Guards Arrive.</font>', 'you got busted', 70, 'got robben the casino', 70);
INSERT INTO `crimes` VALUES (30, 'Rob the Dealer', 45, '((WILL*0.7)/35)+(LEVEL/5)', 80000, 0, 0, 6, 'Rob the Dealer\r\n1. You set up the equipment required.<br />\r\n2. You Start developing some fake Dealer Chips.<br />\r\n3. You pack the Chips into the Suit case and Head of to the local Dealer.<br />\r\n4. Once inside u Bet ${money} in a single game of BlackJack the dealer sees threw fake you hit him over the head and swipe the cash.<br />', '<font color=green>Result: Operion Success!\r\n\r\nYou got ${money} and took off running!</font>\r\n', '<font color=brown>Result: \r\n\r\nGot caught by Security Guards.</font>', 'you got busted', 90, 'got caught robbin the dealer', 90);
INSERT INTO `crimes` VALUES (31, 'Rob the Bookie', 50, '((WILL*0.7)/35)+(LEVEL/5)', 90000, 0, 0, 6, 'Rob the Bookie\r\n1. You set up the equipment required.<br />\r\n2. You Start developing some fake Chips.<br />\r\n3. You pack the Chips into the Suit case and Head of to the local Dealer.<br />\r\n4. Once inside u Bet and lose on purpose in games of BlackJack to buy your time.<br />', '<font color=green>Result: Operation Success!\r\n\r\nYou goto the back room and steal ${money}! </font>\r\n', '<font color=brown>Result: \r\n\r\nGot caught by Security Guards.</font>', 'you got busted', 100, 'got caught robbin the bookie', 100);
INSERT INTO `crimes` VALUES (32, 'Simple Virus', 9, '((WILL*0.8)/10)+(LEVEL/4)', 400, 0, 0, 7, '<font color = orange>Mr biggs gives you a call on your phone \r\nhes say he will pay you $800 dollars to infect bob''s computer\r\nwith a simple virus,You grab your simple virus disk connect to bob''s computer\r\nand upload the virus!', '<font color = green>You Success Fully Uploaded the Virus\r\n', '<font color = red>While uploading the virus the feds bust in and take you to jail!\r\n', '<font color = maroon>Your in cuffs time for jail!\r\n', 25, 'Got busted by the Fbi for infecting people with Simple Viruses!', 25);
INSERT INTO `crimes` VALUES (33, 'Polymorphic Virus', 9, '((WILL*0.8)/10)+(LEVEL/4)', 600, 0, 0, 7, '<font color = orange>Mr biggs gives you a call on your phone \r\nhes say he will pay you $600 dollars to infect bill''s computer\r\nwith a Polymorphic Virus,You grab your Polymorphic Virus disk connect to bill''s computer\r\nand upload the virus!', '<font color = green>You Success Fully Uploaded the Virus\r\n', '<font color = red>While uploading the virus the feds bust in and take you to jail!\r\n', '<font color = maroon>Your in cuffs time for jail!\r\n', 30, 'Got busted by the Fbi for infecting people with Polymorphic Viruses!', 25);
INSERT INTO `crimes` VALUES (34, 'Tunnelling Virus', 9, '((WILL*0.8)/10)+(LEVEL/4)', 700, 0, 0, 7, '<font color = orange>Mr biggs gives you a call on your phone \r\nhes say he will pay you $700 dollars to infect ted''s computer\r\nwith a Tunnelling Virus,You grab your Tunnelling Virus disk connect to ted''s computer\r\nand upload the virus!', '<font color = green>You Success Fully Uploaded the Virus\r\n', '<font color = red>While uploading the virus the feds bust in and take you to jail!\r\n', '<font color = maroon>Your in cuffs time for jail!\r\n', 33, 'Got busted by the Fbi for infecting people with Tunnelling Viruses!', 25);
INSERT INTO `crimes` VALUES (35, 'Boot Virus', 9, '((WILL*0.8)/10)+(LEVEL/4)', 800, 0, 0, 7, '<font color = orange>Mr biggs gives you a call on your phone \r\nhes say he will pay you $800 dollars to infect steve''s computer\r\nwith a Boot Virus,You grab your Boot Virus disk connect to steve''s computer\r\nand upload the virus!', '<font color = green>You Success Fully Uploaded the Virus\r\n', '<font color = red>While uploading the virus the feds bust in and take you to jail!\r\n', '<font color = maroon>Your in cuffs time for jail!\r\n', 35, 'Got busted by the Fbi for infecting people with Boot Viruses!', 25);
INSERT INTO `crimes` VALUES (36, 'Macro Virus', 9, '((WILL*0.8)/10)+(LEVEL/4)', 900, 0, 0, 7, '<font color = orange>Mr biggs gives you a call on your phone \r\nhes say he will pay you $900 dollars to infect phil''s computer\r\nwith a Macro Virus,You grab your Macro Virus disk connect to phil''s computer\r\nand upload the virus!', '<font color = green>You Success Fully Uploaded the Virus\r\n', '<font color = red>While uploading the virus the feds bust in and take you to jail!\r\n', '<font color = maroon>Your in cuffs time for jail!\r\n', 40, 'Got busted by the Fbi for infecting people with Macro Viruses!', 25);
INSERT INTO `crimes` VALUES (37, 'Active X Virus', 9, '((WILL*0.8)/10)+(LEVEL/4)', 950, 0, 0, 7, '<font color = orange>Mr biggs gives you a call on your phone \r\nhes say he will pay you $950 dollars to infect al''s computer\r\nwith a Active X Virus,You grab your Active X Virus disk connect to al''s computer\r\nand upload the virus!', '<font color = green>You Success Fully Uploaded the Virus\r\n', '<font color = red>While uploading the virus the feds bust in and take you to jail!\r\n', '<font color = maroon>Your in cuffs time for jail!\r\n', 45, 'Got busted by the Fbi for infecting people with Active X Viruses!', 25);


-- 
-- Dumping data for table `jobranks`
-- 


INSERT INTO `jobranks` VALUES (1, 'Secretary', 1, 200, 2, 5, 3, 100, 150, 120);
INSERT INTO `jobranks` VALUES (2, 'Med Student', 1, 500, 7, 20, 10, 250, 400, 320);
INSERT INTO `jobranks` VALUES (3, 'Nurse', 1, 1000, 15, 30, 18, 1000, 1500, 1200);
INSERT INTO `jobranks` VALUES (4, 'Pediatrician', 1, 2000, 20, 38, 25, 1750, 2250, 2000);
INSERT INTO `jobranks` VALUES (5, 'Surgeon', 1, 3500, 25, 45, 32, 3000, 4000, 3500);
INSERT INTO `jobranks` VALUES (6, 'Custodian', 2, 50, 1, 6, 3, 10, 10, 10);
INSERT INTO `jobranks` VALUES (7, 'Burger Flipper', 2, 200, 3, 20, 10, 20, 75, 40);
INSERT INTO `jobranks` VALUES (8, 'Drive-Thru Cashier', 2, 500, 5, 30, 15, 50, 1200, 750);
INSERT INTO `jobranks` VALUES (9, 'Cashier', 2, 1000, 8, 37, 23, 100, 2000, 1750);
INSERT INTO `jobranks` VALUES (10, 'Manager', 2, 2000, 15, 45, 30, 200, 5000, 2500);
INSERT INTO `jobranks` VALUES (11, 'Probation Officer', 3, 150, 2, 3, 3, 90, 100, 100);
INSERT INTO `jobranks` VALUES (12, 'Sargeant', 3, 400, 5, 10, 12, 200, 300, 325);
INSERT INTO `jobranks` VALUES (13, 'Lieutenant', 3, 850, 10, 20, 25, 600, 1300, 1500);
INSERT INTO `jobranks` VALUES (14, 'Captain', 3, 1700, 17, 27, 32, 1000, 3000, 3750);
INSERT INTO `jobranks` VALUES (15, 'Chief', 3, 3000, 20, 40, 45, 2500, 5500, 8500);
INSERT INTO `jobranks` VALUES (16, 'Mayor', 4, 250, 1, 2, 1, 40, 250, 75);
INSERT INTO `jobranks` VALUES (17, 'Governor', 4, 700, 5, 7, 3, 100, 800, 250);
INSERT INTO `jobranks` VALUES (18, 'Senator', 4, 1750, 9, 13, 7, 250, 2000, 750);
INSERT INTO `jobranks` VALUES (19, 'Vice-President', 4, 4000, 12, 17, 13, 750, 5000, 2000);
INSERT INTO `jobranks` VALUES (20, 'President', 4, 10000, 15, 25, 20, 2500, 15000, 5000);

-- 
-- Dumping data for table `jobs`
-- 


INSERT INTO `jobs` VALUES (4, 'Politics', 16, 'Become a politician and run this town, literally.', 'Voters');
INSERT INTO `jobs` VALUES (3, 'Law Enforcement', 11, 'Protect the citizens from the worst of the worst.', 'Officer Blackburn');
INSERT INTO `jobs` VALUES (2, 'McDaniels', 6, 'Local fast food restaurant known for good eats.', 'Mr. Daniels');
INSERT INTO `jobs` VALUES (1, 'Hospital', 1, 'Work in the hospital and save lives.', 'Mr. Radcliffe');    


CREATE TABLE `4slot` (
  `name` varchar(255) NOT NULL default '0',
  `pot` int(11) NOT NULL default '0',
  `pot2` int(11) NOT NULL default '0',
  `pot3` int(11) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO `4slot` VALUES ('1', '100', '1000', '10000');                         


ALTER TABLE houses ADD `hPIC` VARCHAR(255) NOT NULL DEFAULT '';

INSERT INTO `houses` (`hID`, `hNAME`, `hPRICE`, `hWILL`, `hPIC`) VALUES
(3, 'Trailer', 100000, 150, 'housepics/house_img2.jpg'),
(2, 'Shack', 50000, 125, 'housepics/house_img1.jpg'),
(4, 'Apartment', 150000, 200, 'housepics/house_img3.jpg'),
(5, 'Small House', 250000, 250, 'housepics/house_img4.jpg'),
(6, 'Large House', 500000, 300, 'housepics/house_img5.jpg'),
(7, 'Beach House', 750000, 400, 'housepics/house_img6.jpg'),
(8, 'Chalet', 1000000, 500, 'housepics/house_img7.jpg'),
(9, 'Villa', 1500000, 600, 'housepics/house_img8.jpg'),
(10, 'Penthouse', 2000000, 650, 'housepics/house_img9.jpg'),
(11, 'Mansion', 3500000, 900, 'housepics/house_img10.jpg'),
(12, 'Ranch', 5500000, 1100, 'housepics/house_img11.jpg'),
(13, 'Castle', 9500000, 1300, 'housepics/house_img12.jpg'),
(14, 'Motel', 14000000, 1500, 'housepics/house_img13.jpg'),
(15, 'Hotel', 30000000, 2000, 'housepics/house_img14.jpg'),
(16, 'Small Island', 45000000, 2600, 'housepics/house_img15.jpg'),
(17, 'Large Island', 75000000, 3400, 'housepics/house_img16.jpg'),
(18, 'Huge Island', 150000000, 4400, 'housepics/house_img17.jpg');


INSERT INTO `cities` (`cityid`, `cityname`, `citydesc`, `cityminlevel`, `citytravtime`) VALUES
(2, 'Spain', 'This is where the illegal becomes legal', 1, 2),
(3, 'Las Vegas', 'This is where everyone goes to make the real money', 10, 5),
(4, 'Dubai', 'Relax, make money with ease', 25, 10),
(5, 'Argentina', 'The place where the innocent always gets blamed', 50, 20),
(6, 'Bahamas', 'Just relaxs and try to forget about your criminal life.', 90, 30),
(7, 'United States', 'Always wanted to vist? Now is your chance.', 150, 40),
(8, 'Tsu Teichu', 'A place well known for super weapons', 200, 50);


INSERT INTO `itemtypes` (`itmtypeid`, `itmtypename`) VALUES (1, 'Food'),
(2, 'Electronics'),
(3, 'Melee Weapon'),
(4, 'Gun'),
(5, 'Medical'),
(6, 'Collectible'),
(7, 'Armour');


INSERT INTO `items` (`itmid`, `itmtype`, `itmname`, `itmdesc`, `itmbuyprice`, `itmsellprice`, `itmbuyable`) VALUES (1, 1, 'Sack Lunch', 'Deliciously filled with nutrients. Even has a slice of your favorite cake!', 95000, 0, 1),
(3, 5, 'Small Potion', 'Restores some health.', 500, 400, 1),
(4, 5, 'First Aid Lotion', 'Heals a  considerable amount of health.', 1500, 750, 1),
(5, 1, 'Hamburger', 'A scrumptious burger.', 30, 20, 1),
(6, 1, 'Sugar Snake', 'A snake covered in sugar.', 10, 5, 1),
(7, 3, 'Dagger', 'A small gold dagger.', 200, 100, 1),
(8, 3, 'Kitchen Knife', 'A knife filled with dreaded spirits of dead animals.', 2500, 1500, 1),
(9, 3, 'Chainsaw', 'Cut up your foes.', 13250, 10925, 1),
(10, 4, 'Pistol', 'A small blue pistol.', 500, 400, 1),
(11, 4, 'Colt', 'An average gun.', 5000, 3750, 1),
(12, 4, 'Rifle', 'The standard in modern weaponry.', 25000, 17850, 1),
(16, 3, 'Bat', 'A cricket bat.', 75, 50, 1),
(14, 4, 'Mini-Rocket Launcher', 'Blast your foes.', 99450, 78765, 1),
(15, 1, 'SuperDuper Stick', 'restores 100% energy', 2147483647, 2147483647, 1),
(34, 5, 'Will Potion', 'Heals will to 100%', 0, 0, 0),
(35, 4, 'Scout Sniper rifle', 'will hurt big time', 99393, 78353, 1),
(36, 4, 'Minigun', 'Sheer power', 100000, 75000, 1),
(37, 3, 'Diamond Dagger', 'Stabbing power to the max.', 450000, 275000, 1),
(38, 4, 'Rocket Launcher', 'Boom.', 220000, 170000, 1),
(39, 4, 'M16', 'Super Gun', 49000, 38000, 1),
(40, 6, 'Mafia Game Special', 'Extremely rare collectors item.', 0, 0, 0),
(42, 6, 'Tit an Implant', 'Titans own way of saying hi.', 0, 0, 0),
(74, 7, 'Leather Jacket', 'Nice biker style jacket', 750, 500, 1),
(43, 6, 'Arsons Zippo', 'Arsons odd fantasy.', 0, 0, 0),
(44, 3, 'Demon Sword', 'Ultimate weapon.', 0, 0, 0),
(45, 6, 'Gothic Warrior-Doll', 'Strong Warrior Slave', 0, 0, 0),
(46, 2, 'Videogame Boy 2002', 'The ultimate in console action.', 0, 0, 0),
(47, 6, 'JaggerDoll', 'Won in a test of wits.', 0, 0, 0),
(49, 4, 'Hunting Bow', 'Medium range bow, silent and efficient', 425, 210, 1),
(50, 3, 'Foldable Chair', 'infamous folding chair as seen in WWF!', 750, 375, 1),
(51, 3, 'Nail Filer', 'nail accessory', 300, 150, 1),
(52, 6, 'MasturNATion Doll', 'You can sure put this doll to good use.', 0, 0, 0),
(53, 6, 'Toonces Bouquet', '231 beautiful roses', 0, 0, 0),
(55, 6, 'Nahdus Rubik Cube', '', 0, 0, 0),
(48, 6, 'Ablemits Doll', 'If you have it then you are so lucky.', 0, 0, 0),
(56, 4, 'Calibre Machine Gun', 'Brute power', 175000, 130000, 1),
(57, 4, 'Benelli m1', 'Automatic Shotgun', 33000, 26500, 1),
(58, 4, 'F90 Sub Machine Gun', 'extremely fast short to meduim distance gun', 40000, 30000, 1),
(59, 6, 'Noobi Diapers', 'For newbies', 0, 0, 0),
(60, 3, 'Gladius', 'Superior dagger', 40000, 30000, 1),
(61, 3, 'Katana', 'Japanese style sword', 95000, 78000, 1),
(62, 3, 'Claymore', 'Mysterious Medievil Sword', 125000, 95000, 1),
(63, 3, 'Ragnarok', 'Mythical eastern Weapon', 175000, 125000, 1),
(64, 3, 'Diamond Sword', 'Cutting power to the max.', 2000000, 1700000, 1),
(65, 4, 'Battlements', 'Fully loaded battlements.', 5000000, 4000000, 1),
(66, 6, 'Conerias Duck Tape', 'Coneria brand duck tape', 0, 0, 0),
(67, 6, 'Super Plushie', 'Good toy! What more could you want!', 0, 0, 0),
(68, 6, 'Titanium NightVision Goggles', 'Increases your sight and accuracy at night', 0, 0, 0),
(69, 6, 'Cyber-Surfboard', 'Netbois !!!!', 0, 0, 0),
(70, 6, 'Nyuuubii Sword', 'Sword of the gods made for newbies', 0, 0, 0),
(71, 7, 'Thick Jacket', 'Warm clothing for the long winter', 100, 75, 1),
(73, 7, 'Trash Can Lid', 'Hard Round metal Lid', 200, 150, 1),
(75, 7, 'Riot Shield', 'standard issue shield', 3000, 2250, 1),
(77, 7, 'Semi-bullet proof Vest', 'Excellent Shield for beginners', 8750, 6000, 1),
(78, 6, 'Nuclear Bomb', 'Can kill anyone in one blow even though the guy is lvl 100000000 and has there stats higher than everyone! ****This weapon is restricted to poor people, but still can be buyable for a high enough prize****NOTE: This weapon can kill every member in the game and can gain you heaps of exp ! The Deadlyest weapon in the whole world', 1000000000, 0, 0),
(79, 7, 'Helmet and Vest', 'Newbie Shiled', 25000, 17850, 1),
(80, 7, 'Plated armour', 'Heavy armour', 75000, 50000, 1),
(93, 7, 'God Father Suit', 'Advanced version: Agile body suit with maximum protection', 3250000, 2800000, 1),
(94, 7, 'Conerias DuckTaped Suit', 'Made with superior brand of duck tape', 150000, 125000, 1),
(83, 7, 'Mini-Tank', 'Small tank almost bullet proof', 750000, 550000, 1),
(92, 7, 'Diamond Suit', 'Agile body suit with super protection', 1500000, 1100000, 1),
(91, 7, 'Gothic Plate', 'Improved Shiled', 300000, 225000, 1),
(86, 4, 'mini-Rail Gun', 'New Improve technology', 4000000, 3000000, 1),
(87, 4, 'Mounted Rail Gun', 'Usually mounted on tanks', 10000000, 7500000, 1),
(90, 4, 'Arsons FlameThrower', 'Flamethrower', 150000, 115000, 1),
(89, 3, 'Light Saber', ' Unique Item ', 50000000, 40000000, 1),
(95, 6, 'Fifty Cent Piece', 'A small piece of ancient Mono History.', 0, 0, 0),
(96, 6, '1 Dollar', '1 freaking dollar coin.', 0, 0, 0),
(97, 7, 'Plasma Shield', 'Battery powered arm guard', 25000000, 17500000, 1),
(98, 7, 'Rynax Plasma Shield', 'Made form a new type of power source', 60000000, 40000000, 1),
(99, 4, 'Plasma Gun', 'Fires Bolts of plasma Energy', 35000000, 22500000, 1),
(100, 4, 'Plasma Rifle', 'Full automatic energy rifle', 75000000, 50000000, 1),
(102, 4, 'Nuke Gun', 'Kill anyone with just one shot', 200000000, 125000000, 1),
(105, 6, 'Conerians', 'Awarded to helpful players. Can be redeemed for rewards.', 0, 5000, 0),
(107, 4, 'Bio Aeroactive 350', 'Shoots green plasma', 500000000, 300000000, 1);



INSERT INTO `shops` (`shopID`, `shopLOCATION`, `shopNAME`, `shopDESCRIPTION`) VALUES (6, 1, 'Industrial Weapons', 'All the high techweapons you could need'),
(2, 1, 'Pharmacy Shop', 'The one-stop medi-shop.'),
(3, 1, 'Weapons Central', 'The one place for all weapons.'),
(4, 1, 'Weed store', 'We sell Weed'),
(5, 1, 'Drug Store', 'We sell Steriods'),
(10, 1,'Strong Weaponary', 'Space age weaponary here'),
(9, 1, 'Ultra Weapons', 'Only the truly powerful weapons.');


-- 
-- End of File`
--
