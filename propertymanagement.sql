prompt PL/SQL Developer import file
prompt Created on 2017年5月6日 by KingWanGe
set feedback off
set define off
prompt Creating BUILDING...
create table BUILDING
(
  bid    NUMBER(6) not null,
  bname  VARCHAR2(20) not null,
  plies  NUMBER(6) not null,
  state  VARCHAR2(10) not null,
  remark VARCHAR2(40)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table BUILDING
  add primary key (BID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating USERS...
create table USERS
(
  id        NUMBER(6) not null,
  username  VARCHAR2(20) not null,
  password  VARCHAR2(20) not null,
  authority VARCHAR2(10)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table USERS
  add primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating OWER...
create table OWER
(
  oid      NUMBER(6) not null,
  oname    VARCHAR2(20) not null,
  identity VARCHAR2(20),
  tel      VARCHAR2(20) not null,
  intime   DATE,
  remark   VARCHAR2(40)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table OWER
  add primary key (OID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating ROOM...
create table ROOM
(
  rid   NUMBER(6) not null,
  bid   NUMBER(6),
  rname VARCHAR2(20),
  oid   NUMBER(6),
  type  VARCHAR2(10),
  rarea NUMBER(6,2),
  id    NUMBER(6)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table ROOM
  add primary key (RID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ROOM
  add constraint ROOM_BID_FK foreign key (BID)
  references BUILDING (BID);
alter table ROOM
  add constraint ROOM_ID_FK foreign key (ID)
  references USERS (ID);
alter table ROOM
  add constraint ROOM_OID_FK foreign key (OID)
  references OWER (OID);

prompt Creating CHARGE...
create table CHARGE
(
  cid         NUMBER(6) not null,
  rid         NUMBER(6),
  cname       VARCHAR2(20) not null,
  price       NUMBER(10,2),
  chargestate VARCHAR2(10),
  remark      VARCHAR2(40),
  chargedate  DATE
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table CHARGE
  add primary key (CID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CHARGE
  add constraint CHARGE_RID_FK foreign key (RID)
  references ROOM (RID);

prompt Creating CLEANMANAGE...
create table CLEANMANAGE
(
  cmid      NUMBER(6) not null,
  cmname    VARCHAR2(20) not null,
  sex       VARCHAR2(10),
  tel       VARCHAR2(20) not null,
  address   VARCHAR2(50),
  cleanarea VARCHAR2(40),
  remark    VARCHAR2(40)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table CLEANMANAGE
  add primary key (CMID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating RESIDENT...
create table RESIDENT
(
  rsid     NUMBER(6) not null,
  rid      NUMBER(6),
  rsname   VARCHAR2(20) not null,
  rsex     VARCHAR2(10),
  identity VARCHAR2(20),
  tel      VARCHAR2(20) not null,
  remark   VARCHAR2(40)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table RESIDENT
  add primary key (RSID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table RESIDENT
  add constraint RESIDENT_RID_FK foreign key (RID)
  references ROOM (RID);

prompt Creating COMPLAINT...
create table COMPLAINT
(
  cpid           NUMBER(6) not null,
  rsid           NUMBER(6),
  cpcontent      VARCHAR2(40),
  submissiontime DATE,
  state          VARCHAR2(10),
  handleinfo     VARCHAR2(40)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table COMPLAINT
  add primary key (CPID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table COMPLAINT
  add constraint COMPLAINT_RSID_FK foreign key (RSID)
  references RESIDENT (RSID);

prompt Creating SECURITY...
create table SECURITY
(
  sid       NUMBER(6) not null,
  sname     VARCHAR2(20) not null,
  sex       VARCHAR2(10),
  identity  VARCHAR2(20),
  tel       VARCHAR2(20),
  job       VARCHAR2(10),
  address   VARCHAR2(50),
  territory VARCHAR2(30),
  worktype  VARCHAR2(10),
  remark    VARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table SECURITY
  add primary key (SID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Creating EQUIPMENT...
create table EQUIPMENT
(
  eid             NUMBER(6) not null,
  ename           VARCHAR2(20) not null,
  enumber         NUMBER(6),
  vendor          VARCHAR2(20),
  producedate     DATE,
  maintenancetime VARCHAR2(20),
  sid             NUMBER(6),
  remark          VARCHAR2(40)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table EQUIPMENT
  add primary key (EID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table EQUIPMENT
  add constraint EQUIPMENT_SID_FK foreign key (SID)
  references SECURITY (SID);

prompt Creating HIRE...
create table HIRE
(
  hid         NUMBER(6) not null,
  hname       VARCHAR2(20) not null,
  rid         NUMBER(6),
  htel        VARCHAR2(20) not null,
  checkindate DATE,
  duedate     DATE,
  remark      VARCHAR2(40)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table HIRE
  add primary key (HID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table HIRE
  add constraint HIRE_RID_FK foreign key (RID)
  references ROOM (RID);

prompt Creating MAINTAINMAN...
create table MAINTAINMAN
(
  mmid       NUMBER(6) not null,
  name       VARCHAR2(20),
  repairtype VARCHAR2(20),
  tel        VARCHAR2(20),
  id         NUMBER(6)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table MAINTAINMAN
  add primary key (MMID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MAINTAINMAN
  add constraint MAINTAINMAN_ID_FK foreign key (ID)
  references USERS (ID);

prompt Creating MAINTAIN...
create table MAINTAIN
(
  mid        NUMBER(6) not null,
  mcontent   VARCHAR2(40),
  rid        NUMBER(6),
  mname      VARCHAR2(20),
  repairdate DATE,
  mtel       VARCHAR2(20),
  type       VARCHAR2(10),
  remark     VARCHAR2(40),
  mmid       NUMBER(6)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table MAINTAIN
  add primary key (MID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table MAINTAIN
  add constraint MAINTAIN_MMID_FK foreign key (MMID)
  references MAINTAINMAN (MMID);
alter table MAINTAIN
  add constraint MAINTAIN_RID_FK foreign key (RID)
  references ROOM (RID);

prompt Loading BUILDING...
insert into BUILDING (bid, bname, plies, state, remark)
values (5, '5幢', 32, 'Y', null);
insert into BUILDING (bid, bname, plies, state, remark)
values (6, '6幢', 23, 'Y', null);
insert into BUILDING (bid, bname, plies, state, remark)
values (7, '7幢', 24, 'Y', null);
insert into BUILDING (bid, bname, plies, state, remark)
values (1, '1幢', 23, 'Y', '666');
insert into BUILDING (bid, bname, plies, state, remark)
values (2, '2幢', 24, 'Y', '嘿嘿');
insert into BUILDING (bid, bname, plies, state, remark)
values (4, '3幢', 30, 'Y', null);
insert into BUILDING (bid, bname, plies, state, remark)
values (3, '4幢', 23, 'Y', null);
commit;
prompt 7 records loaded
prompt Loading USERS...
insert into USERS (id, username, password, authority)
values (10, 'zhuhu10', '123456', 'B');
insert into USERS (id, username, password, authority)
values (11, 'zhuhu11', '123456', 'B');
insert into USERS (id, username, password, authority)
values (12, 'zhuhu12', '123456', 'B');
insert into USERS (id, username, password, authority)
values (13, 'zhuhu13', '123456', 'B');
insert into USERS (id, username, password, authority)
values (14, 'zhuhu14', '123456', 'B');
insert into USERS (id, username, password, authority)
values (15, 'zhuhu15', '123456', 'B');
insert into USERS (id, username, password, authority)
values (16, 'zhuhu16', '123456', 'B');
insert into USERS (id, username, password, authority)
values (17, 'zhuhu17', '123456', 'B');
insert into USERS (id, username, password, authority)
values (18, 'zhuhu18', '123456', 'B');
insert into USERS (id, username, password, authority)
values (19, 'zhuhu19', '123456', 'B');
insert into USERS (id, username, password, authority)
values (20, 'zhuhu20', '123456', 'B');
insert into USERS (id, username, password, authority)
values (21, 'zhuhu21', '123456', 'B');
insert into USERS (id, username, password, authority)
values (22, 'zhuhu22', '123456', 'B');
insert into USERS (id, username, password, authority)
values (23, 'zhuhu23', '123456', 'B');
insert into USERS (id, username, password, authority)
values (24, 'zhuhu24', '123456', 'B');
insert into USERS (id, username, password, authority)
values (25, 'zhuhu25', '123456', 'B');
insert into USERS (id, username, password, authority)
values (26, 'zhuhu26', '123456', 'B');
insert into USERS (id, username, password, authority)
values (27, 'zhuhu27', '123456', 'B');
insert into USERS (id, username, password, authority)
values (28, 'zhuhu28', '123456', 'B');
insert into USERS (id, username, password, authority)
values (29, 'zhuhu29', '123456', 'B');
insert into USERS (id, username, password, authority)
values (30, 'zhuhu20', '123456', 'B');
insert into USERS (id, username, password, authority)
values (8, 'zhaoyun', '123456', 'C');
insert into USERS (id, username, password, authority)
values (9, 'zhuzhu', '123456', 'C');
insert into USERS (id, username, password, authority)
values (1, 'admin', '123456', 'A');
insert into USERS (id, username, password, authority)
values (3, 'doubi', '123456', 'C');
insert into USERS (id, username, password, authority)
values (4, 'wange', '123456', 'C');
insert into USERS (id, username, password, authority)
values (5, 'paopao', '123456', 'C');
insert into USERS (id, username, password, authority)
values (6, 'wange1', '123456', 'C');
insert into USERS (id, username, password, authority)
values (7, 'shadow', '123456', 'C');
commit;
prompt 29 records loaded
prompt Loading OWER...
insert into OWER (oid, oname, identity, tel, intime, remark)
values (7, '莱尔', '320522199410216711', '15665167096', to_date('09-05-2017', 'dd-mm-yyyy'), null);
insert into OWER (oid, oname, identity, tel, intime, remark)
values (8, '不二', '320522199410216711', '15665167096', to_date('07-05-2017', 'dd-mm-yyyy'), null);
insert into OWER (oid, oname, identity, tel, intime, remark)
values (5, '老大', '320522199410216711', '15665167096', to_date('17-04-2017', 'dd-mm-yyyy'), null);
insert into OWER (oid, oname, identity, tel, intime, remark)
values (6, '老二', '320522199410216711', '18796221163', to_date('08-05-1915', 'dd-mm-yyyy'), null);
insert into OWER (oid, oname, identity, tel, intime, remark)
values (4, '孙权', '320522199410216711', '18796221163', to_date('01-05-2017', 'dd-mm-yyyy'), null);
insert into OWER (oid, oname, identity, tel, intime, remark)
values (3, '亮亮', '320522199410216711', '15665167096', to_date('28-05-1917', 'dd-mm-yyyy'), '嘿嘿');
insert into OWER (oid, oname, identity, tel, intime, remark)
values (1, '姜俊杰', '320522199410216711', '15665167096', to_date('17-04-2017', 'dd-mm-yyyy'), null);
insert into OWER (oid, oname, identity, tel, intime, remark)
values (2, '钢炮', '320522199410216711', '18796221163', to_date('08-05-1915', 'dd-mm-yyyy'), '地方');
insert into OWER (oid, oname, identity, tel, intime, remark)
values (27, '张三丰', '320522199410216711', '15665167096', to_date('22-05-2017', 'dd-mm-yyyy'), null);
insert into OWER (oid, oname, identity, tel, intime, remark)
values (9, '梅朔', '320522199410216711', '15665167096', to_date('10-05-2017', 'dd-mm-yyyy'), '准备入住');
insert into OWER (oid, oname, identity, tel, intime, remark)
values (10, '戴运来', '320522199410216711', '15665167096', to_date('09-05-2017', 'dd-mm-yyyy'), null);
insert into OWER (oid, oname, identity, tel, intime, remark)
values (11, '张兴刚', '320522199410216711', '15665167096', to_date('06-05-2017', 'dd-mm-yyyy'), null);
insert into OWER (oid, oname, identity, tel, intime, remark)
values (12, '王逢州', '320522199410216711', '15665167096', to_date('10-05-2017', 'dd-mm-yyyy'), null);
insert into OWER (oid, oname, identity, tel, intime, remark)
values (13, '谢逊', '320522199410216711', '15665167096', to_date('10-05-2017', 'dd-mm-yyyy'), null);
insert into OWER (oid, oname, identity, tel, intime, remark)
values (14, '邵熙', '320522199410216711', '15665167096', to_date('06-05-2017', 'dd-mm-yyyy'), null);
insert into OWER (oid, oname, identity, tel, intime, remark)
values (15, '沈亚东', '320522199410216734', '15665167096', to_date('10-05-2017', 'dd-mm-yyyy'), null);
commit;
prompt 16 records loaded
prompt Loading ROOM...
insert into ROOM (rid, bid, rname, oid, type, rarea, id)
values (5, 1, '1B123', 4, 'One', 90, 15);
insert into ROOM (rid, bid, rname, oid, type, rarea, id)
values (6, 2, '2A101', 4, 'Two', 100, 16);
insert into ROOM (rid, bid, rname, oid, type, rarea, id)
values (7, 2, '2A102', 4, 'Two', 100, 17);
insert into ROOM (rid, bid, rname, oid, type, rarea, id)
values (8, 2, '2A103', 4, 'Two', 100, 18);
insert into ROOM (rid, bid, rname, oid, type, rarea, id)
values (9, 2, '2A104', 4, 'Two', 100, 19);
insert into ROOM (rid, bid, rname, oid, type, rarea, id)
values (10, 2, '2A105', 4, 'Two', 100, 20);
insert into ROOM (rid, bid, rname, oid, type, rarea, id)
values (11, 2, '2B106', 4, 'Two', 100, 21);
insert into ROOM (rid, bid, rname, oid, type, rarea, id)
values (1, 1, '1B110', 3, 'One', 134, 10);
insert into ROOM (rid, bid, rname, oid, type, rarea, id)
values (2, 1, '1B111', 1, 'One', 123, 11);
insert into ROOM (rid, bid, rname, oid, type, rarea, id)
values (3, 1, '1A110', 4, 'One', 90, 12);
insert into ROOM (rid, bid, rname, oid, type, rarea, id)
values (4, 1, '1B101', 2, 'Three', 123, 13);
insert into ROOM (rid, bid, rname, oid, type, rarea, id)
values (12, 4, '3A102', 7, 'Three', 120, 30);
insert into ROOM (rid, bid, rname, oid, type, rarea, id)
values (13, 4, '3A202', 4, 'Four', 120, 22);
insert into ROOM (rid, bid, rname, oid, type, rarea, id)
values (14, 4, '3A301', 1, 'Three', 202, 23);
insert into ROOM (rid, bid, rname, oid, type, rarea, id)
values (15, 4, '3B201', 3, 'Four', 129, 24);
insert into ROOM (rid, bid, rname, oid, type, rarea, id)
values (16, 3, '4A201', 3, 'Three', 130, 14);
commit;
prompt 16 records loaded
prompt Loading CHARGE...
insert into CHARGE (cid, rid, cname, price, chargestate, remark, chargedate)
values (5, 5, 'F', 20, 'Y', null, to_date('06-05-2017 21:36:09', 'dd-mm-yyyy hh24:mi:ss'));
insert into CHARGE (cid, rid, cname, price, chargestate, remark, chargedate)
values (1, 1, 'W', 300.12, 'Y', null, to_date('05-05-2017 07:42:40', 'dd-mm-yyyy hh24:mi:ss'));
insert into CHARGE (cid, rid, cname, price, chargestate, remark, chargedate)
values (2, 1, 'E', 120, 'Y', null, to_date('05-05-2017 09:11:46', 'dd-mm-yyyy hh24:mi:ss'));
insert into CHARGE (cid, rid, cname, price, chargestate, remark, chargedate)
values (3, 1, 'F', 120, 'Y', 'gg', to_date('05-05-2017 22:00:32', 'dd-mm-yyyy hh24:mi:ss'));
insert into CHARGE (cid, rid, cname, price, chargestate, remark, chargedate)
values (4, 2, 'W', 300, 'Y', 'lll', to_date('05-05-2017 22:02:39', 'dd-mm-yyyy hh24:mi:ss'));
insert into CHARGE (cid, rid, cname, price, chargestate, remark, chargedate)
values (6, 5, 'W', 100.5, 'N', null, null);
insert into CHARGE (cid, rid, cname, price, chargestate, remark, chargedate)
values (7, 5, 'E', 120.9, 'Y', null, to_date('06-05-2017 21:29:13', 'dd-mm-yyyy hh24:mi:ss'));
insert into CHARGE (cid, rid, cname, price, chargestate, remark, chargedate)
values (8, 5, 'P', 200.98, 'N', null, null);
insert into CHARGE (cid, rid, cname, price, chargestate, remark, chargedate)
values (9, 6, 'W', 233.1, 'N', null, null);
insert into CHARGE (cid, rid, cname, price, chargestate, remark, chargedate)
values (10, 6, 'E', 100.5, 'N', null, null);
insert into CHARGE (cid, rid, cname, price, chargestate, remark, chargedate)
values (11, 6, 'F', 200.98, 'Y', null, to_date('06-05-2017 21:37:28', 'dd-mm-yyyy hh24:mi:ss'));
insert into CHARGE (cid, rid, cname, price, chargestate, remark, chargedate)
values (12, 6, 'P', 300.1, 'Y', null, to_date('06-05-2017 21:37:53', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 12 records loaded
prompt Loading CLEANMANAGE...
insert into CLEANMANAGE (cmid, cmname, sex, tel, address, cleanarea, remark)
values (5, '莱恩', 'M', '15665167096', '徐州工程学院', '活动区', null);
insert into CLEANMANAGE (cmid, cmname, sex, tel, address, cleanarea, remark)
values (6, '莱拉', 'F', '15665167096', '徐州工程学院', '管理办公室', null);
insert into CLEANMANAGE (cmid, cmname, sex, tel, address, cleanarea, remark)
values (3, '布尔', 'M', '15665167096', '徐州工程学院', '花坛', null);
insert into CLEANMANAGE (cmid, cmname, sex, tel, address, cleanarea, remark)
values (7, '王阿姨', 'F', '18796221162', '徐州云龙区徐州工程学院', '迎客厅', null);
insert into CLEANMANAGE (cmid, cmname, sex, tel, address, cleanarea, remark)
values (8, '徐盼', 'M', '18796221162', '南京雨花台区', '厨房', null);
insert into CLEANMANAGE (cmid, cmname, sex, tel, address, cleanarea, remark)
values (9, '李阿姨', 'F', '18796221162', '徐州云龙区徐州工程学院', '3幢卫生间', null);
insert into CLEANMANAGE (cmid, cmname, sex, tel, address, cleanarea, remark)
values (1, '邵熙', 'M', '18796221163', '皇家理工学院', '广告栏附近', null);
insert into CLEANMANAGE (cmid, cmname, sex, tel, address, cleanarea, remark)
values (2, '金三胖', 'M', '18796221163', '皇家理工学院', '厕所', null);
insert into CLEANMANAGE (cmid, cmname, sex, tel, address, cleanarea, remark)
values (4, '安倍', 'M', '15665167096', '皇家理工学院', '格瑞特', '让人');
commit;
prompt 9 records loaded
prompt Loading RESIDENT...
insert into RESIDENT (rsid, rid, rsname, rsex, identity, tel, remark)
values (4, 3, '老大', 'M', '320522199410216711', '15665167096', null);
insert into RESIDENT (rsid, rid, rsname, rsex, identity, tel, remark)
values (5, 5, '莱恩', 'M', '320522199410216711', '15665167096', null);
insert into RESIDENT (rsid, rid, rsname, rsex, identity, tel, remark)
values (6, 6, '南希', 'F', '320522199410216711', '15665167096', null);
insert into RESIDENT (rsid, rid, rsname, rsex, identity, tel, remark)
values (7, 7, '丽萨', 'F', '320522199410216711', '15665167096', null);
insert into RESIDENT (rsid, rid, rsname, rsex, identity, tel, remark)
values (1, 1, '亮亮', 'M', '320522199410216711', '18796221163', '刚来');
insert into RESIDENT (rsid, rid, rsname, rsex, identity, tel, remark)
values (2, 4, '万哥', 'M', '320522199410216711', '15665167096', '体验生活');
insert into RESIDENT (rsid, rid, rsname, rsex, identity, tel, remark)
values (3, 2, '张飞', 'M', '320522199410216711', '15665167099', '野张飞');
insert into RESIDENT (rsid, rid, rsname, rsex, identity, tel, remark)
values (10, 15, '娜美', 'F', '320522199410216711', '15665167096', null);
insert into RESIDENT (rsid, rid, rsname, rsex, identity, tel, remark)
values (8, 8, '布鲁克', 'M', '320522199410216711', '15665167096', null);
insert into RESIDENT (rsid, rid, rsname, rsex, identity, tel, remark)
values (9, 10, '路飞', 'M', '320522199410216711', '15665167096', null);
insert into RESIDENT (rsid, rid, rsname, rsex, identity, tel, remark)
values (11, 9, '罗宾', 'F', '320522199410216711', '15665167096', null);
insert into RESIDENT (rsid, rid, rsname, rsex, identity, tel, remark)
values (12, 12, '山治', 'M', '320522199410216711', '15665167096', null);
insert into RESIDENT (rsid, rid, rsname, rsex, identity, tel, remark)
values (13, 14, '弗莱齐', 'M', '320522199410216711', '15665167096', null);
commit;
prompt 13 records loaded
prompt Loading COMPLAINT...
insert into COMPLAINT (cpid, rsid, cpcontent, submissiontime, state, handleinfo)
values (4, 1, '玻璃修理太慢', to_date('06-05-2017 22:29:33', 'dd-mm-yyyy hh24:mi:ss'), 'N', null);
insert into COMPLAINT (cpid, rsid, cpcontent, submissiontime, state, handleinfo)
values (5, 1, '保安成龙和我吵架', to_date('06-05-2017 22:30:32', 'dd-mm-yyyy hh24:mi:ss'), 'N', null);
insert into COMPLAINT (cpid, rsid, cpcontent, submissiontime, state, handleinfo)
values (6, 3, '木工维修速度太慢', to_date('06-05-2017 22:31:12', 'dd-mm-yyyy hh24:mi:ss'), 'N', null);
insert into COMPLAINT (cpid, rsid, cpcontent, submissiontime, state, handleinfo)
values (7, 3, '清洁工电梯1B1层电梯边上不打扫。', to_date('06-05-2017 22:32:21', 'dd-mm-yyyy hh24:mi:ss'), 'N', null);
insert into COMPLAINT (cpid, rsid, cpcontent, submissiontime, state, handleinfo)
values (8, 3, '外来朋友通知编号1号的门卫，还不让进。', to_date('06-05-2017 22:33:53', 'dd-mm-yyyy hh24:mi:ss'), 'N', null);
insert into COMPLAINT (cpid, rsid, cpcontent, submissiontime, state, handleinfo)
values (9, 4, '电梯报修没人处理', to_date('06-05-2017 22:38:01', 'dd-mm-yyyy hh24:mi:ss'), 'N', null);
commit;
prompt 6 records loaded
prompt Loading SECURITY...
insert into SECURITY (sid, sname, sex, identity, tel, job, address, territory, worktype, remark)
values (5, '张三', 'M', '320522199410216711', '15665167096', 'S', '徐州工程学院', '一期', 'D', null);
insert into SECURITY (sid, sname, sex, identity, tel, job, address, territory, worktype, remark)
values (6, '李四', 'M', '320522199410216711', '15665167096', 'C', '徐州工程学院', '二期', 'N', null);
insert into SECURITY (sid, sname, sex, identity, tel, job, address, territory, worktype, remark)
values (7, '成龙', 'M', '320522199410216711', '18796221162', 'S', '徐州云龙区徐州工程学院', '1幢到2幢大楼', 'D', null);
insert into SECURITY (sid, sname, sex, identity, tel, job, address, territory, worktype, remark)
values (1, '万哥', 'M', '320522199410216711', '15665167096', 'S', '皇家理工学院', '1幢到5幢', 'D', null);
insert into SECURITY (sid, sname, sex, identity, tel, job, address, territory, worktype, remark)
values (2, '董亮亮', 'M', '320522199410216711', '18796221163', 'C', '皇家理工学院', null, 'N', null);
insert into SECURITY (sid, sname, sex, identity, tel, job, address, territory, worktype, remark)
values (3, '亮钢炮', 'M', '320522199410216711', '15665167099', 'C', '皇家理工学院', null, 'N', null);
insert into SECURITY (sid, sname, sex, identity, tel, job, address, territory, worktype, remark)
values (4, '董亮', 'M', '320522199410216712', '15665167099', 'C', '皇家理工学院', null, 'N', '哈哈哈');
commit;
prompt 7 records loaded
prompt Loading EQUIPMENT...
insert into EQUIPMENT (eid, ename, enumber, vendor, producedate, maintenancetime, sid, remark)
values (4, '大门', 4, '中国铁门有限公司', to_date('03-05-2017', 'dd-mm-yyyy'), '1年', 6, null);
insert into EQUIPMENT (eid, ename, enumber, vendor, producedate, maintenancetime, sid, remark)
values (5, '下水管', 300, '中国水管公司', to_date('01-05-2017', 'dd-mm-yyyy'), '3个月', 3, null);
insert into EQUIPMENT (eid, ename, enumber, vendor, producedate, maintenancetime, sid, remark)
values (6, '路灯', 30, '中国灯具公司', to_date('06-05-2017', 'dd-mm-yyyy'), '3个月', 2, null);
insert into EQUIPMENT (eid, ename, enumber, vendor, producedate, maintenancetime, sid, remark)
values (1, '消防栓', 12, '中国万金油有限公司', to_date('01-01-2012', 'dd-mm-yyyy'), '2个月', 1, null);
insert into EQUIPMENT (eid, ename, enumber, vendor, producedate, maintenancetime, sid, remark)
values (2, '秋千', 4, '秋千公司', to_date('05-05-2017', 'dd-mm-yyyy'), '3个月', 4, null);
insert into EQUIPMENT (eid, ename, enumber, vendor, producedate, maintenancetime, sid, remark)
values (3, '发电机', 3, '发电机公司', to_date('28-03-2017', 'dd-mm-yyyy'), '2个月', 5, null);
commit;
prompt 6 records loaded
prompt Loading HIRE...
insert into HIRE (hid, hname, rid, htel, checkindate, duedate, remark)
values (1, '万哥', 4, '18796221162', to_date('10-05-2017', 'dd-mm-yyyy'), to_date('14-06-2017', 'dd-mm-yyyy'), null);
insert into HIRE (hid, hname, rid, htel, checkindate, duedate, remark)
values (2, '钢炮', 1, '18796221162', to_date('02-05-2017', 'dd-mm-yyyy'), to_date('09-05-2017', 'dd-mm-yyyy'), '啦啦啦');
insert into HIRE (hid, hname, rid, htel, checkindate, duedate, remark)
values (3, '董亮亮', 2, '18796221162', to_date('11-04-2017', 'dd-mm-yyyy'), to_date('09-05-2017', 'dd-mm-yyyy'), null);
insert into HIRE (hid, hname, rid, htel, checkindate, duedate, remark)
values (7, '王逢州', 15, '15665167096', to_date('16-05-2017', 'dd-mm-yyyy'), to_date('17-05-2017', 'dd-mm-yyyy'), null);
insert into HIRE (hid, hname, rid, htel, checkindate, duedate, remark)
values (4, '秦冲', 8, '15665167096', to_date('09-05-2017', 'dd-mm-yyyy'), to_date('25-05-2017', 'dd-mm-yyyy'), null);
insert into HIRE (hid, hname, rid, htel, checkindate, duedate, remark)
values (5, '王凯', 5, '15665167096', to_date('17-05-2017', 'dd-mm-yyyy'), to_date('07-02-2018', 'dd-mm-yyyy'), null);
insert into HIRE (hid, hname, rid, htel, checkindate, duedate, remark)
values (6, '董亮亮', 3, '15665167096', to_date('10-05-2017', 'dd-mm-yyyy'), to_date('24-05-2017', 'dd-mm-yyyy'), null);
insert into HIRE (hid, hname, rid, htel, checkindate, duedate, remark)
values (8, '梅翔', 12, '15665167096', to_date('09-05-2017', 'dd-mm-yyyy'), to_date('17-05-2017', 'dd-mm-yyyy'), null);
insert into HIRE (hid, hname, rid, htel, checkindate, duedate, remark)
values (9, '邓超', 10, '15665167096', to_date('17-05-2017', 'dd-mm-yyyy'), to_date('25-05-2017', 'dd-mm-yyyy'), null);
insert into HIRE (hid, hname, rid, htel, checkindate, duedate, remark)
values (10, '安娜', 7, '15665167096', to_date('15-05-2017', 'dd-mm-yyyy'), to_date('17-05-2017', 'dd-mm-yyyy'), null);
insert into HIRE (hid, hname, rid, htel, checkindate, duedate, remark)
values (11, '张兴刚', 14, '15665167096', to_date('16-05-2017', 'dd-mm-yyyy'), to_date('24-05-2017', 'dd-mm-yyyy'), null);
commit;
prompt 11 records loaded
prompt Loading MAINTAINMAN...
insert into MAINTAINMAN (mmid, name, repairtype, tel, id)
values (1, '张三', 'Wood', '18796221163', 3);
insert into MAINTAINMAN (mmid, name, repairtype, tel, id)
values (2, '李四', 'Air', '18796221163', 4);
insert into MAINTAINMAN (mmid, name, repairtype, tel, id)
values (3, '王五', 'Warm', '15665167099', 5);
insert into MAINTAINMAN (mmid, name, repairtype, tel, id)
values (4, '苏安全', 'Lock', '15665167096', 6);
insert into MAINTAINMAN (mmid, name, repairtype, tel, id)
values (5, '曹操', 'Water', '15665167096', 7);
insert into MAINTAINMAN (mmid, name, repairtype, tel, id)
values (6, '刘备', 'Power', '18796221163', 8);
insert into MAINTAINMAN (mmid, name, repairtype, tel, id)
values (7, '诸葛亮', 'Other', '15665167099', 9);
commit;
prompt 7 records loaded
prompt Loading MAINTAIN...
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (6, '电灯不亮了', 1, '张三', to_date('06-05-2017 14:40:40', 'dd-mm-yyyy hh24:mi:ss'), '15665167096', 'N', null, 6);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (7, '门坏了', 2, '李四', to_date('06-05-2017 14:42:34', 'dd-mm-yyyy hh24:mi:ss'), '15665167096', 'N', null, 1);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (8, '空调不制冷', 2, '李四', to_date('06-05-2017 14:43:08', 'dd-mm-yyyy hh24:mi:ss'), '15665167096', 'N', null, 2);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (9, '暖气有问题', 2, '李四', to_date('06-05-2017 14:43:22', 'dd-mm-yyyy hh24:mi:ss'), '15665167096', 'N', null, 3);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (10, '锁打不开', 1, '张三', to_date('06-05-2017 14:39:54', 'dd-mm-yyyy hh24:mi:ss'), '15665167096', 'N', null, 4);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (11, '水管爆了', 1, '张三', to_date('06-05-2017 14:40:08', 'dd-mm-yyyy hh24:mi:ss'), '15665167096', 'N', null, 5);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (12, '水管漏水', 2, '孙权', to_date('06-05-2017 22:25:02', 'dd-mm-yyyy hh24:mi:ss'), '15665167096', 'N', null, 5);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (13, '阳台门关不上', 2, '孙权', to_date('06-05-2017 22:25:29', 'dd-mm-yyyy hh24:mi:ss'), '15665167096', 'N', null, 1);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (14, '阳台玻璃碎了', 2, '孙权', to_date('06-05-2017 22:26:01', 'dd-mm-yyyy hh24:mi:ss'), '15665167096', 'N', null, 7);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (15, '阳台锁坏了', 2, '张飞', to_date('06-05-2017 22:34:20', 'dd-mm-yyyy hh24:mi:ss'), '15665167096', 'N', null, 4);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (16, '浴室不出冷水', 2, '张飞', to_date('06-05-2017 22:35:10', 'dd-mm-yyyy hh24:mi:ss'), '15665167096', 'N', null, 5);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (17, '楼道灯坏了', 2, '张飞', to_date('06-05-2017 22:36:32', 'dd-mm-yyyy hh24:mi:ss'), '15665167096', 'N', null, 6);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (18, '电梯不能用', 2, '张飞', to_date('06-05-2017 22:36:57', 'dd-mm-yyyy hh24:mi:ss'), '15665167096', 'N', null, 6);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (19, '本层电梯不能用', 3, '刘备', to_date('06-05-2017 22:38:36', 'dd-mm-yyyy hh24:mi:ss'), '15665167096', 'N', null, 6);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (20, '拼木地板裂开了', 3, '刘备', to_date('06-05-2017 22:39:08', 'dd-mm-yyyy hh24:mi:ss'), '15665167096', 'N', null, 1);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (1, '椅子坏了', 4, '邵熙', to_date('05-05-2017', 'dd-mm-yyyy'), '15665167096', 'Y', null, 1);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (2, '桌子坏了', 4, '倔强', to_date('05-05-2017', 'dd-mm-yyyy'), '15665167096', 'Y', null, 1);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (3, '来来来', 4, '倔强青', to_date('05-05-2017', 'dd-mm-yyyy'), '15665167096', 'N', null, 1);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (4, '不能制冷', 4, '张飞', to_date('05-05-2017', 'dd-mm-yyyy'), '15665167096', 'N', null, 2);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (5, '暖气片坏了', 4, '孙权', to_date('05-05-2017 22:22:19', 'dd-mm-yyyy hh24:mi:ss'), '15665167096', 'N', null, 3);
commit;
prompt 20 records loaded
set feedback on
set define on
prompt Done.
