-- *************************** SqlDBM: PostgreSQL ***************************
-- * Generated by SqlDBM: Untitled project, v3 by aliataollahi021@gmail.com *



-- ************************************** DiningRoom

CREATE TABLE DiningRoom
(
 did     int8range NOT NULL,
 name    varchar(50) NULL,
 address varchar(50) NULL,
 CONSTRAINT PK_1 PRIMARY KEY ( did )
);



-- *************************** SqlDBM: PostgreSQL ***************************
-- * Generated by SqlDBM: Untitled project, v3 by aliataollahi021@gmail.com *



-- ************************************** Food

CREATE TABLE Food
(
 fid         int8range NOT NULL,
 name        varchar(50) NULL,
 ingredients text NULL,
 CONSTRAINT PK_2 PRIMARY KEY ( fid )
);







-- *************************** SqlDBM: PostgreSQL ***************************
-- * Generated by SqlDBM: Untitled project, v3 by aliataollahi021@gmail.com *



-- ************************************** option

CREATE TABLE option
(
 oid   int8range NOT NULL,
 price float NOT NULL,
 "date"  timestamp NOT NULL,
 fid   int8range NOT NULL,
 CONSTRAINT PK_3 PRIMARY KEY ( oid ),
 CONSTRAINT FK_1 FOREIGN KEY ( fid ) REFERENCES Food ( fid )
);

CREATE INDEX FK_2 ON option
(
 fid
);







-- *************************** SqlDBM: PostgreSQL ***************************
-- * Generated by SqlDBM: Untitled project, v3 by aliataollahi021@gmail.com *



-- ************************************** "User"

CREATE TABLE "User"
(
 uid        int8range NOT NULL,
 first_name varchar(50) NULL,
 last_name  varchar(50) NULL,
 birth      timestamp NULL,
 email      varchar(50) NOT NULL,
 password   varchar(50) NOT NULL,
 CONSTRAINT PK_4 PRIMARY KEY ( uid )
);







-- *************************** SqlDBM: PostgreSQL ***************************
-- * Generated by SqlDBM: Untitled project, v3 by aliataollahi021@gmail.com *



-- ************************************** reserve

CREATE TABLE reserve
(
 oid    int8range NOT NULL,
 uid    int8range NOT NULL,
 did    int8range NOT NULL,
 status varchar(50) NOT NULL,
 CONSTRAINT PK_14 PRIMARY KEY ( oid, uid, did ),
 CONSTRAINT FK_3 FOREIGN KEY ( did ) REFERENCES DiningRoom ( did ),
 CONSTRAINT FK_4 FOREIGN KEY ( oid ) REFERENCES option ( oid ),
 CONSTRAINT FK_5 FOREIGN KEY ( uid ) REFERENCES "User" ( uid )
);

CREATE INDEX FK_6 ON reserve
(
 did
);

CREATE INDEX FK_7 ON reserve
(
 oid
);

CREATE INDEX FK_8 ON reserve
(
 uid
);







-- *************************** SqlDBM: PostgreSQL ***************************
-- * Generated by SqlDBM: Untitled project, v3 by aliataollahi021@gmail.com *



-- ************************************** Student

CREATE TABLE Student
(
 uid int8range NOT NULL,
 CONSTRAINT PK_5 PRIMARY KEY ( uid ),
 CONSTRAINT FK_9 FOREIGN KEY ( uid ) REFERENCES "User" ( uid )
);

CREATE INDEX FK_10 ON Student
(
 uid
);







-- *************************** SqlDBM: PostgreSQL ***************************
-- * Generated by SqlDBM: Untitled project, v3 by aliataollahi021@gmail.com *



-- ************************************** Teacher

CREATE TABLE Teacher
(
 uid int8range NOT NULL,
 CONSTRAINT PK_6 PRIMARY KEY ( uid ),
 CONSTRAINT FK_11 FOREIGN KEY ( uid ) REFERENCES "User" ( uid )
);

CREATE INDEX FK_12 ON Teacher
(
 uid
);







-- *************************** SqlDBM: PostgreSQL ***************************
-- * Generated by SqlDBM: Untitled project, v3 by aliataollahi021@gmail.com *



-- ************************************** TransferRecord

CREATE TABLE TransferRecord
(
 cid    int8range NOT NULL,
 status varchar(50) NOT NULL,
 "date"   timestamp NOT NULL,
 amount float NOT NULL,
 "from"   int8range NOT NULL,
 "to"     int8range NOT NULL,
 CONSTRAINT PK_7 PRIMARY KEY ( cid ),
 CONSTRAINT FK_13 FOREIGN KEY ( "from" ) REFERENCES Student ( uid ),
 CONSTRAINT FK_14 FOREIGN KEY ( "to" ) REFERENCES Student ( uid )
);

CREATE INDEX FK_15 ON TransferRecord
(
 "from"
);

CREATE INDEX FK_16 ON TransferRecord
(
 "to"
);







-- *************************** SqlDBM: PostgreSQL ***************************
-- * Generated by SqlDBM: Untitled project, v3 by aliataollahi021@gmail.com *



-- ************************************** Payment

CREATE TABLE Payment
(
 pid    int8range NOT NULL,
 amount float NOT NULL,
 status varchar(50) NOT NULL,
 "date"   timestamp NULL,
 uid    int8range NOT NULL,
 CONSTRAINT PK_8 PRIMARY KEY ( pid ),
 CONSTRAINT FK_17 FOREIGN KEY ( uid ) REFERENCES Student ( uid )
);

CREATE INDEX FK_18 ON Payment
(
 uid
);







-- *************************** SqlDBM: PostgreSQL ***************************
-- * Generated by SqlDBM: Untitled project, v3 by aliataollahi021@gmail.com *



-- ************************************** QRCODE

CREATE TABLE QRCODE
(
 uid        int8range NOT NULL,
 qid        int8range NOT NULL,
 expiredate timestamp NOT NULL,
 value      varchar(50) NOT NULL,
 CONSTRAINT PK_9 PRIMARY KEY ( uid, qid ),
 CONSTRAINT FK_19 FOREIGN KEY ( uid ) REFERENCES Student ( uid )
);

CREATE INDEX FK_20 ON QRCODE
(
 uid
);







-- *************************** SqlDBM: PostgreSQL ***************************
-- * Generated by SqlDBM: Untitled project, v3 by aliataollahi021@gmail.com *



-- ************************************** "Group"

CREATE TABLE "Group"
(
 gid     int8range NOT NULL,
 name    varchar(50) NULL,
 ownerid int8range NOT NULL,
 CONSTRAINT PK_10 PRIMARY KEY ( gid ),
 CONSTRAINT FK_21 FOREIGN KEY ( ownerid ) REFERENCES Student ( uid )
);

CREATE INDEX FK_28 ON "Group"
(
 ownerid
);







-- *************************** SqlDBM: PostgreSQL ***************************
-- * Generated by SqlDBM: Untitled project, v3 by aliataollahi021@gmail.com *



-- ************************************** InGroup

CREATE TABLE InGroup
(
 uid int8range NOT NULL,
 gid int8range NOT NULL,
 CONSTRAINT PK_11 PRIMARY KEY ( uid, gid ),
 CONSTRAINT FK_22 FOREIGN KEY ( uid ) REFERENCES Student ( uid ),
 CONSTRAINT FK_23 FOREIGN KEY ( gid ) REFERENCES "Group" ( gid )
);

CREATE INDEX FK_24 ON InGroup
(
 uid
);

CREATE INDEX FK_25 ON InGroup
(
 gid
);







-- *************************** SqlDBM: PostgreSQL ***************************
-- * Generated by SqlDBM: Untitled project, v3 by aliataollahi021@gmail.com *



-- ************************************** Admin

CREATE TABLE Admin
(
 aid      int8range NOT NULL,
 username varchar(50) NOT NULL,
 password varchar(50) NOT NULL,
 CONSTRAINT PK_12 PRIMARY KEY ( aid )
);







-- *************************** SqlDBM: PostgreSQL ***************************
-- * Generated by SqlDBM: Untitled project, v3 by aliataollahi021@gmail.com *



-- ************************************** Announcement

CREATE TABLE Announcement
(
 anid         int8range NOT NULL,
 otherdetails text NULL,
 "date"         timestamp NOT NULL,
 subject      varchar(50) NULL,
 aid          int8range NOT NULL,
 CONSTRAINT PK_13 PRIMARY KEY ( anid ),
 CONSTRAINT FK_26 FOREIGN KEY ( aid ) REFERENCES Admin ( aid )
);

CREATE INDEX FK_27 ON Announcement
(
 aid
);







