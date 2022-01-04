--
-- Table structure for table `ActionLog`
--

DROP TABLE IF EXISTS `ActionLog`;
CREATE TABLE `ActionLog` (
  `logId` int(11) NOT NULL AUTO_INCREMENT,
  `contactId` int(11) NOT NULL,
  `destContactId` int(11) DEFAULT NULL,
  `trueContactId` int(11) DEFAULT NULL,
  `paperId` int(11) DEFAULT NULL,
  `timestamp` bigint(11) NOT NULL,
  `ipaddr` varbinary(39) DEFAULT NULL,
  `action` varbinary(4096) NOT NULL,
  `data` varbinary(8192) DEFAULT NULL,
  PRIMARY KEY (`logId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Table structure for table `Capability`
--

DROP TABLE IF EXISTS `Capability`;
CREATE TABLE `Capability` (
  `capabilityType` int(11) NOT NULL,
  `contactId` int(11) NOT NULL,
  `paperId` int(11) NOT NULL,
  `timeExpires` bigint(11) NOT NULL,
  `salt` varbinary(255) NOT NULL,
  `data` varbinary(4096) DEFAULT NULL,
  PRIMARY KEY (`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Table structure for table `ContactInfo`
--

DROP TABLE IF EXISTS `ContactInfo`;
CREATE TABLE `ContactInfo` (
  `contactId` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varbinary(120) NOT NULL DEFAULT '',
  `lastName` varbinary(120) NOT NULL DEFAULT '',
  `unaccentedName` varbinary(240) NOT NULL DEFAULT '',
  `email` varchar(120) NOT NULL,
  `preferredEmail` varchar(120) DEFAULT NULL,
  `affiliation` varbinary(2048) NOT NULL DEFAULT '',
  `orcid` varbinary(64) DEFAULT NULL,
  `phone` varbinary(64) DEFAULT NULL,
  `country` varbinary(256) DEFAULT NULL,
  `password` varbinary(2048) NOT NULL,
  `passwordTime` bigint(11) NOT NULL DEFAULT 0,
  `passwordUseTime` bigint(11) NOT NULL DEFAULT 0,
  `collaborators` varbinary(8192) DEFAULT NULL,
  `updateTime` bigint(11) NOT NULL DEFAULT 0,
  `lastLogin` bigint(11) NOT NULL DEFAULT 0,
  `defaultWatch` int(11) NOT NULL DEFAULT 2,
  `roles` tinyint(1) NOT NULL DEFAULT 0,
  `disabled` tinyint(1) NOT NULL DEFAULT 0,
  `contactTags` varbinary(4096) DEFAULT NULL,
  `data` varbinary(32767) DEFAULT NULL,
  `primaryContactId` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`contactId`),
  UNIQUE KEY `email` (`email`),
  KEY `roles` (`roles`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Table structure for table `DeletedContactInfo`
--

DROP TABLE IF EXISTS `DeletedContactInfo`;
CREATE TABLE `DeletedContactInfo` (
  `contactId` int(11) NOT NULL,
  `firstName` varbinary(120) NOT NULL,
  `lastName` varbinary(120) NOT NULL,
  `unaccentedName` varbinary(240) NOT NULL,
  `email` varchar(120) NOT NULL,
  `affiliation` varbinary(2048) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Table structure for table `DocumentLink`
--

DROP TABLE IF EXISTS `DocumentLink`;
CREATE TABLE `DocumentLink` (
  `paperId` int(11) NOT NULL,
  `linkId` int(11) NOT NULL,
  `linkType` int(11) NOT NULL,
  `documentId` int(11) NOT NULL,
  PRIMARY KEY (`paperId`,`linkId`,`linkType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Table structure for table `FilteredDocument`
--

DROP TABLE IF EXISTS `FilteredDocument`;
CREATE TABLE `FilteredDocument` (
  `inDocId` int(11) NOT NULL,
  `filterType` int(11) NOT NULL,
  `outDocId` int(11) NOT NULL,
  `createdAt` bigint(11) NOT NULL,
  PRIMARY KEY (`inDocId`,`filterType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Table structure for table `Formula`
--

DROP TABLE IF EXISTS `Formula`;
CREATE TABLE `Formula` (
  `formulaId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `expression` varbinary(4096) NOT NULL,
  `createdBy` int(11) NOT NULL DEFAULT 0,
  `timeModified` bigint(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`formulaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Table structure for table `Invitation`
--

DROP TABLE IF EXISTS `Invitation`;
CREATE TABLE `Invitation` (
  `invitationId` int(11) NOT NULL AUTO_INCREMENT,
  `invitationType` int(11) NOT NULL,
  `email` varchar(120) NOT NULL,
  `firstName` varbinary(120) DEFAULT NULL,
  `lastName` varbinary(120) DEFAULT NULL,
  `affiliation` varbinary(2048) DEFAULT NULL,
  `requestedBy` int(11) NOT NULL,
  `timeRequested` bigint(11) NOT NULL DEFAULT 0,
  `timeRequestNotified` bigint(11) NOT NULL DEFAULT 0,
  `salt` varbinary(255) NOT NULL,
  `data` varbinary(4096) DEFAULT NULL,
  PRIMARY KEY (`invitationId`),
  UNIQUE KEY `salt` (`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Table structure for table `InvitationLog`
--

DROP TABLE IF EXISTS `InvitationLog`;
CREATE TABLE `InvitationLog` (
  `logId` int(11) NOT NULL AUTO_INCREMENT,
  `invitationId` int(11) NOT NULL,
  `mailId` int(11) DEFAULT NULL,
  `contactId` int(11) NOT NULL,
  `action` int(11) NOT NULL,
  `timestamp` bigint(11) NOT NULL,
  PRIMARY KEY (`logId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Table structure for table `MailLog`
--

DROP TABLE IF EXISTS `MailLog`;
CREATE TABLE `MailLog` (
  `mailId` int(11) NOT NULL AUTO_INCREMENT,
  `contactId` int NOT NULL DEFAULT 0,
  `recipients` varbinary(200) NOT NULL,
  `q` varbinary(4096) DEFAULT NULL,
  `t` varbinary(200) DEFAULT NULL,
  `paperIds` blob,
  `cc` blob,
  `replyto` blob,
  `subject` blob,
  `emailBody` blob,
  `fromNonChair` tinyint(1) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`mailId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Table structure for table `Paper`
--

DROP TABLE IF EXISTS `Paper`;
CREATE TABLE `Paper` (
  `paperId` int(11) NOT NULL AUTO_INCREMENT,
  `title` varbinary(512) DEFAULT NULL,
  `authorInformation` varbinary(8192) DEFAULT NULL,
  `abstract` varbinary(16384) DEFAULT NULL,
  `collaborators` varbinary(8192) DEFAULT NULL,
  `timeSubmitted` bigint(11) NOT NULL DEFAULT 0,
  `timeWithdrawn` bigint(11) NOT NULL DEFAULT 0,
  `timeFinalSubmitted` bigint(11) NOT NULL DEFAULT 0,
  `timeModified` bigint(11) NOT NULL DEFAULT 0,
  `paperStorageId` int(11) NOT NULL DEFAULT 0,
  # `sha1` copied from PaperStorage to reduce joins
  `sha1` varbinary(64) NOT NULL DEFAULT '',
  `finalPaperStorageId` int(11) NOT NULL DEFAULT 0,
  `blind` tinyint(1) NOT NULL DEFAULT 1,
  `outcome` tinyint(1) NOT NULL DEFAULT 0,
  `leadContactId` int(11) NOT NULL DEFAULT 0,
  `shepherdContactId` int(11) NOT NULL DEFAULT 0,
  `managerContactId` int(11) NOT NULL DEFAULT 0,
  `capVersion` int(1) NOT NULL DEFAULT 0,
  # next 3 fields copied from PaperStorage to reduce joins
  `size` int(11) NOT NULL DEFAULT 0,
  `mimetype` varbinary(80) NOT NULL DEFAULT '',
  `timestamp` bigint(11) NOT NULL DEFAULT 0,
  `pdfFormatStatus` bigint(11) NOT NULL DEFAULT 0,
  `withdrawReason` varbinary(1024) DEFAULT NULL,
  `paperFormat` tinyint(1) DEFAULT NULL,
  `dataOverflow` longblob,
  PRIMARY KEY (`paperId`),
  KEY `timeSubmitted` (`timeSubmitted`),
  KEY `leadContactId` (`leadContactId`),
  KEY `shepherdContactId` (`shepherdContactId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Table structure for table `PaperComment`
--

DROP TABLE IF EXISTS `PaperComment`;
CREATE TABLE `PaperComment` (
  `paperId` int(11) NOT NULL,
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `contactId` int(11) NOT NULL,
  `timeModified` bigint(11) NOT NULL,
  `timeNotified` bigint(11) NOT NULL DEFAULT 0,
  `timeDisplayed` bigint(11) NOT NULL DEFAULT 0,
  `comment` varbinary(32767) DEFAULT NULL,
  `commentType` int(11) NOT NULL DEFAULT 0,
  `replyTo` int(11) NOT NULL,
  `ordinal` int(11) NOT NULL DEFAULT 0,
  `authorOrdinal` int(11) NOT NULL DEFAULT 0,
  `commentTags` varbinary(1024) DEFAULT NULL,
  `commentRound` int(11) NOT NULL DEFAULT 0,
  `commentFormat` tinyint(1) DEFAULT NULL,
  `commentOverflow` longblob,
  PRIMARY KEY (`paperId`,`commentId`),
  UNIQUE KEY `commentId` (`commentId`),
  KEY `contactId` (`contactId`),
  KEY `timeModifiedContact` (`timeModified`,`contactId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Table structure for table `PaperConflict`
--

DROP TABLE IF EXISTS `PaperConflict`;
CREATE TABLE `PaperConflict` (
  `paperId` int(11) NOT NULL,
  `contactId` int(11) NOT NULL,
  `conflictType` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`contactId`,`paperId`),
  KEY `paperId` (`paperId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Table structure for table `PaperOption`
--

DROP TABLE IF EXISTS `PaperOption`;
CREATE TABLE `PaperOption` (
  `paperId` int(11) NOT NULL,
  `optionId` int(11) NOT NULL,
  `value` bigint(11) NOT NULL DEFAULT 0,
  `data` varbinary(32767) DEFAULT NULL,
  `dataOverflow` longblob,
  PRIMARY KEY (`paperId`,`optionId`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Table structure for table `PaperReview`
--

DROP TABLE IF EXISTS `PaperReview`;
CREATE TABLE `PaperReview` (
  `paperId` int(11) NOT NULL,
  `reviewId` int(11) NOT NULL AUTO_INCREMENT,
  `contactId` int(11) NOT NULL,
  `reviewToken` int(11) NOT NULL DEFAULT 0,
  `reviewType` tinyint(1) NOT NULL DEFAULT 0,
  `reviewRound` int(1) NOT NULL DEFAULT 0,
  `requestedBy` int(11) NOT NULL DEFAULT 0,
  `reviewBlind` tinyint(1) NOT NULL DEFAULT 1,
  `reviewModified` bigint(1) NOT NULL DEFAULT 0,
  `reviewSubmitted` bigint(1) DEFAULT NULL,
  `reviewAuthorSeen` bigint(1) DEFAULT NULL,
  `reviewOrdinal` int(1) NOT NULL DEFAULT 0,
  `timeDisplayed` bigint(11) NOT NULL DEFAULT 0,
  `timeApprovalRequested` bigint(11) NOT NULL DEFAULT 0,
  `reviewNeedsSubmit` tinyint(1) NOT NULL DEFAULT 1,
  `reviewViewScore` tinyint(2) NOT NULL DEFAULT -3,

  `timeRequested` bigint(11) NOT NULL DEFAULT 0,
  `timeRequestNotified` bigint(11) NOT NULL DEFAULT 0,
  `reviewAuthorModified` bigint(1) DEFAULT NULL,
  `reviewNotified` bigint(1) DEFAULT NULL,
  `reviewAuthorNotified` bigint(11) NOT NULL DEFAULT 0,
  `reviewEditVersion` int(1) NOT NULL DEFAULT 0,
  `reviewWordCount` int(11) DEFAULT NULL,
  `reviewFormat` tinyint(1) DEFAULT NULL,

  `overAllMerit` tinyint(1) NOT NULL DEFAULT 0,
  `reviewerQualification` tinyint(1) NOT NULL DEFAULT 0,
  `novelty` tinyint(1) NOT NULL DEFAULT 0,
  `technicalMerit` tinyint(1) NOT NULL DEFAULT 0,
  `interestToCommunity` tinyint(1) NOT NULL DEFAULT 0,
  `longevity` tinyint(1) NOT NULL DEFAULT 0,
  `grammar` tinyint(1) NOT NULL DEFAULT 0,
  `likelyPresentation` tinyint(1) NOT NULL DEFAULT 0,
  `suitableForShort` tinyint(1) NOT NULL DEFAULT 0,
  `potential` tinyint(4) NOT NULL DEFAULT 0,
  `fixability` tinyint(4) NOT NULL DEFAULT 0,

  `tfields` longblob,
  `sfields` varbinary(2048) DEFAULT NULL,
  `data` varbinary(8192) DEFAULT NULL,

  PRIMARY KEY (`paperId`,`reviewId`),
  UNIQUE KEY `reviewId` (`reviewId`),
  KEY `contactId` (`contactId`),
  KEY `reviewType` (`reviewType`),
  KEY `reviewRound` (`reviewRound`),
  KEY `requestedBy` (`requestedBy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Table structure for table `PaperReviewPreference`
--

DROP TABLE IF EXISTS `PaperReviewPreference`;
CREATE TABLE `PaperReviewPreference` (
  `paperId` int(11) NOT NULL,
  `contactId` int(11) NOT NULL,
  `preference` int(4) NOT NULL DEFAULT 0,
  `expertise` int(4) DEFAULT NULL,
  PRIMARY KEY (`paperId`,`contactId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Table structure for table `PaperReviewRefused`
--

DROP TABLE IF EXISTS `PaperReviewRefused`;
CREATE TABLE `PaperReviewRefused` (
  `paperId` int(11) NOT NULL,
  `email` varchar(120) NOT NULL,
  `firstName` varbinary(120) DEFAULT NULL,
  `lastName` varbinary(120) DEFAULT NULL,
  `affiliation` varbinary(2048) DEFAULT NULL,
  `contactId` int(11) NOT NULL,
  `refusedReviewId` int(11) DEFAULT NULL,
  `refusedReviewType` tinyint(1) NOT NULL DEFAULT 0,
  `reviewRound` int(1) DEFAULT NULL,
  `requestedBy` int(11) NOT NULL,
  `timeRequested` bigint(11) DEFAULT NULL,
  `refusedBy` int(11) DEFAULT NULL,
  `timeRefused` bigint(11) DEFAULT NULL,
  `data` varbinary(8192) DEFAULT NULL,
  `reason` varbinary(32767) DEFAULT NULL,
  PRIMARY KEY (`paperId`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Table structure for table `PaperStorage`
--

DROP TABLE IF EXISTS `PaperStorage`;
CREATE TABLE `PaperStorage` (
  `paperId` int(11) NOT NULL,
  `paperStorageId` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` bigint(11) NOT NULL,
  `mimetype` varbinary(80) NOT NULL DEFAULT '',
  `paper` longblob,
  `compression` tinyint(1) NOT NULL DEFAULT 0,
  `sha1` varbinary(64) NOT NULL DEFAULT '',
  `crc32` binary(4) DEFAULT NULL,
  `documentType` int(3) NOT NULL DEFAULT 0,
  `filename` varbinary(255) DEFAULT NULL,
  `infoJson` varbinary(32768) DEFAULT NULL,
  `size` bigint(11) DEFAULT NULL,
  `filterType` int(3) DEFAULT NULL,
  `originalStorageId` int(11) DEFAULT NULL,
  `inactive` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`paperId`,`paperStorageId`),
  UNIQUE KEY `paperStorageId` (`paperStorageId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Table structure for table `PaperTag`
--

DROP TABLE IF EXISTS `PaperTag`;
CREATE TABLE `PaperTag` (
  `paperId` int(11) NOT NULL,
  `tag` varchar(80) NOT NULL,		# case-insensitive; see TAG_MAXLEN in init.php
  `tagIndex` float NOT NULL DEFAULT 0,
  PRIMARY KEY (`paperId`,`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Table structure for table `PaperTagAnno`
--

DROP TABLE IF EXISTS `PaperTagAnno`;
CREATE TABLE `PaperTagAnno` (
  `tag` varchar(80) NOT NULL,   # case-insensitive; see TAG_MAXLEN in init.php
  `annoId` int(11) NOT NULL,
  `tagIndex` float NOT NULL DEFAULT 0,
  `heading` varbinary(8192) DEFAULT NULL,
  `annoFormat` tinyint(1) DEFAULT NULL,
  `infoJson` varbinary(32768) DEFAULT NULL,
  PRIMARY KEY (`tag`,`annoId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Table structure for table `PaperTopic`
--

DROP TABLE IF EXISTS `PaperTopic`;
CREATE TABLE `PaperTopic` (
  `paperId` int(11) NOT NULL,
  `topicId` int(11) NOT NULL,
  PRIMARY KEY (`paperId`,`topicId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Table structure for table `PaperWatch`
--

DROP TABLE IF EXISTS `PaperWatch`;
CREATE TABLE `PaperWatch` (
  `paperId` int(11) NOT NULL,
  `contactId` int(11) NOT NULL,
  `watch` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`paperId`,`contactId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Table structure for table `ReviewRating`
--

DROP TABLE IF EXISTS `ReviewRating`;
CREATE TABLE `ReviewRating` (
  `paperId` int(11) NOT NULL,
  `reviewId` int(11) NOT NULL,
  `contactId` int(11) NOT NULL,
  `rating` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`paperId`,`reviewId`,`contactId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Table structure for table `ReviewRequest`
--

DROP TABLE IF EXISTS `ReviewRequest`;
CREATE TABLE `ReviewRequest` (
  `paperId` int(11) NOT NULL,
  `email` varchar(120) NOT NULL,
  `firstName` varbinary(120) DEFAULT NULL,
  `lastName` varbinary(120) DEFAULT NULL,
  `affiliation` varbinary(2048) DEFAULT NULL,
  `reason` varbinary(32767) DEFAULT NULL,
  `requestedBy` int(11) NOT NULL,
  `timeRequested` bigint(11) NOT NULL,
  `reviewRound` int(1) DEFAULT NULL,
  PRIMARY KEY (`paperId`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Table structure for table `Settings`
--

DROP TABLE IF EXISTS `Settings`;
CREATE TABLE `Settings` (
  `name` varbinary(256) NOT NULL,
  `value` bigint(11) NOT NULL,
  `data` varbinary(32767) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Table structure for table `TopicArea`
--

DROP TABLE IF EXISTS `TopicArea`;
CREATE TABLE `TopicArea` (
  `topicId` int(11) NOT NULL AUTO_INCREMENT,
  `topicName` varbinary(1024) DEFAULT NULL,
  PRIMARY KEY (`topicId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



--
-- Table structure for table `TopicInterest`
--

DROP TABLE IF EXISTS `TopicInterest`;
CREATE TABLE `TopicInterest` (
  `contactId` int(11) NOT NULL,
  `topicId` int(11) NOT NULL,
  `interest` int(1) NOT NULL,
  PRIMARY KEY (`contactId`,`topicId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;




insert into Settings (name, value) values ('allowPaperOption', 252);
insert into Settings (name, value) values ('setupPhase', 1);
-- there are no submissions yet
insert into Settings (name, value) values ('no_papersub', 1);
-- collect PC conflicts from authors by default, but not collaborators
insert into Settings (name, value) values ('sub_pcconf', 1);
-- default chair-only tags
insert into Settings (name, value, data) values ('tag_chair', 1, 'accept reject pcpaper');
-- default: allow PC members to review any paper
insert into Settings (name, value) values ('pcrev_any', 1);
-- default: allow external reviewers to see the other reviews
insert into Settings (name, value) values ('extrev_view', 2);
-- default: administrators must approve potentially-conflicted external reviews
insert into Settings (name, value) values ('extrev_chairreq', 2);
-- default outcome map
insert into Settings (name, value, data) values ('outcome_map', 1, '{"0":"Unspecified","-1":"Rejected","1":"Accepted"}');
-- default review form
insert into Settings (name, value, data) values ('review_form',1,'{"overAllMerit":{"name":"Overall merit","order":1,"visibility":"au","options":["Reject","Weak reject","Weak accept","Accept","Strong accept"]},"reviewerQualification":{"name":"Reviewer expertise","order":2,"visibility":"au","options":["No familiarity","Some familiarity","Knowledgeable","Expert"]},"t01":{"name":"Paper summary","order":3,"visibility":"au"},"t02":{"name":"Comments for author","order":4,"visibility":"au"},"t03":{"name":"Comments for PC","order":5,"visibility":"pc"}}');

insert ignore into PaperStorage set
    paperStorageId=1, paperId=0, timestamp=0, mimetype='text/plain',
    paper='', sha1=x'da39a3ee5e6b4b0d3255bfef95601890afd80709',
    documentType=0, size=0;
