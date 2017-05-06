prompt PL/SQL Developer import file
prompt Created on 2017��5��6�� by KingWanGe
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
values (5, '5��', 32, 'Y', null);
insert into BUILDING (bid, bname, plies, state, remark)
values (6, '6��', 23, 'Y', null);
insert into BUILDING (bid, bname, plies, state, remark)
values (7, '7��', 24, 'Y', null);
insert into BUILDING (bid, bname, plies, state, remark)
values (1, '1��', 23, 'Y', '666');
insert into BUILDING (bid, bname, plies, state, remark)
values (2, '2��', 24, 'Y', '�ٺ�');
insert into BUILDING (bid, bname, plies, state, remark)
values (4, '3��', 30, 'Y', null);
insert into BUILDING (bid, bname, plies, state, remark)
values (3, '4��', 23, 'Y', null);
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
values (7, '����', '320522199410216711', '15665167096', to_date('09-05-2017', 'dd-mm-yyyy'), null);
insert into OWER (oid, oname, identity, tel, intime, remark)
values (8, '����', '320522199410216711', '15665167096', to_date('07-05-2017', 'dd-mm-yyyy'), null);
insert into OWER (oid, oname, identity, tel, intime, remark)
values (5, '�ϴ�', '320522199410216711', '15665167096', to_date('17-04-2017', 'dd-mm-yyyy'), null);
insert into OWER (oid, oname, identity, tel, intime, remark)
values (6, '�϶�', '320522199410216711', '18796221163', to_date('08-05-1915', 'dd-mm-yyyy'), null);
insert into OWER (oid, oname, identity, tel, intime, remark)
values (4, '��Ȩ', '320522199410216711', '18796221163', to_date('01-05-2017', 'dd-mm-yyyy'), null);
insert into OWER (oid, oname, identity, tel, intime, remark)
values (3, '����', '320522199410216711', '15665167096', to_date('28-05-1917', 'dd-mm-yyyy'), '�ٺ�');
insert into OWER (oid, oname, identity, tel, intime, remark)
values (1, '������', '320522199410216711', '15665167096', to_date('17-04-2017', 'dd-mm-yyyy'), null);
insert into OWER (oid, oname, identity, tel, intime, remark)
values (2, '����', '320522199410216711', '18796221163', to_date('08-05-1915', 'dd-mm-yyyy'), '�ط�');
insert into OWER (oid, oname, identity, tel, intime, remark)
values (27, '������', '320522199410216711', '15665167096', to_date('22-05-2017', 'dd-mm-yyyy'), null);
insert into OWER (oid, oname, identity, tel, intime, remark)
values (9, '÷˷', '320522199410216711', '15665167096', to_date('10-05-2017', 'dd-mm-yyyy'), '׼����ס');
insert into OWER (oid, oname, identity, tel, intime, remark)
values (10, '������', '320522199410216711', '15665167096', to_date('09-05-2017', 'dd-mm-yyyy'), null);
insert into OWER (oid, oname, identity, tel, intime, remark)
values (11, '���˸�', '320522199410216711', '15665167096', to_date('06-05-2017', 'dd-mm-yyyy'), null);
insert into OWER (oid, oname, identity, tel, intime, remark)
values (12, '������', '320522199410216711', '15665167096', to_date('10-05-2017', 'dd-mm-yyyy'), null);
insert into OWER (oid, oname, identity, tel, intime, remark)
values (13, 'лѷ', '320522199410216711', '15665167096', to_date('10-05-2017', 'dd-mm-yyyy'), null);
insert into OWER (oid, oname, identity, tel, intime, remark)
values (14, '����', '320522199410216711', '15665167096', to_date('06-05-2017', 'dd-mm-yyyy'), null);
insert into OWER (oid, oname, identity, tel, intime, remark)
values (15, '���Ƕ�', '320522199410216734', '15665167096', to_date('10-05-2017', 'dd-mm-yyyy'), null);
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
values (5, '����', 'M', '15665167096', '���ݹ���ѧԺ', '���', null);
insert into CLEANMANAGE (cmid, cmname, sex, tel, address, cleanarea, remark)
values (6, '����', 'F', '15665167096', '���ݹ���ѧԺ', '����칫��', null);
insert into CLEANMANAGE (cmid, cmname, sex, tel, address, cleanarea, remark)
values (3, '����', 'M', '15665167096', '���ݹ���ѧԺ', '��̳', null);
insert into CLEANMANAGE (cmid, cmname, sex, tel, address, cleanarea, remark)
values (7, '������', 'F', '18796221162', '�������������ݹ���ѧԺ', 'ӭ����', null);
insert into CLEANMANAGE (cmid, cmname, sex, tel, address, cleanarea, remark)
values (8, '����', 'M', '18796221162', '�Ͼ��껨̨��', '����', null);
insert into CLEANMANAGE (cmid, cmname, sex, tel, address, cleanarea, remark)
values (9, '���', 'F', '18796221162', '�������������ݹ���ѧԺ', '3��������', null);
insert into CLEANMANAGE (cmid, cmname, sex, tel, address, cleanarea, remark)
values (1, '����', 'M', '18796221163', '�ʼ���ѧԺ', '���������', null);
insert into CLEANMANAGE (cmid, cmname, sex, tel, address, cleanarea, remark)
values (2, '������', 'M', '18796221163', '�ʼ���ѧԺ', '����', null);
insert into CLEANMANAGE (cmid, cmname, sex, tel, address, cleanarea, remark)
values (4, '����', 'M', '15665167096', '�ʼ���ѧԺ', '������', '����');
commit;
prompt 9 records loaded
prompt Loading RESIDENT...
insert into RESIDENT (rsid, rid, rsname, rsex, identity, tel, remark)
values (4, 3, '�ϴ�', 'M', '320522199410216711', '15665167096', null);
insert into RESIDENT (rsid, rid, rsname, rsex, identity, tel, remark)
values (5, 5, '����', 'M', '320522199410216711', '15665167096', null);
insert into RESIDENT (rsid, rid, rsname, rsex, identity, tel, remark)
values (6, 6, '��ϣ', 'F', '320522199410216711', '15665167096', null);
insert into RESIDENT (rsid, rid, rsname, rsex, identity, tel, remark)
values (7, 7, '����', 'F', '320522199410216711', '15665167096', null);
insert into RESIDENT (rsid, rid, rsname, rsex, identity, tel, remark)
values (1, 1, '����', 'M', '320522199410216711', '18796221163', '����');
insert into RESIDENT (rsid, rid, rsname, rsex, identity, tel, remark)
values (2, 4, '���', 'M', '320522199410216711', '15665167096', '��������');
insert into RESIDENT (rsid, rid, rsname, rsex, identity, tel, remark)
values (3, 2, '�ŷ�', 'M', '320522199410216711', '15665167099', 'Ұ�ŷ�');
insert into RESIDENT (rsid, rid, rsname, rsex, identity, tel, remark)
values (10, 15, '����', 'F', '320522199410216711', '15665167096', null);
insert into RESIDENT (rsid, rid, rsname, rsex, identity, tel, remark)
values (8, 8, '��³��', 'M', '320522199410216711', '15665167096', null);
insert into RESIDENT (rsid, rid, rsname, rsex, identity, tel, remark)
values (9, 10, '·��', 'M', '320522199410216711', '15665167096', null);
insert into RESIDENT (rsid, rid, rsname, rsex, identity, tel, remark)
values (11, 9, '�ޱ�', 'F', '320522199410216711', '15665167096', null);
insert into RESIDENT (rsid, rid, rsname, rsex, identity, tel, remark)
values (12, 12, 'ɽ��', 'M', '320522199410216711', '15665167096', null);
insert into RESIDENT (rsid, rid, rsname, rsex, identity, tel, remark)
values (13, 14, '������', 'M', '320522199410216711', '15665167096', null);
commit;
prompt 13 records loaded
prompt Loading COMPLAINT...
insert into COMPLAINT (cpid, rsid, cpcontent, submissiontime, state, handleinfo)
values (4, 1, '��������̫��', to_date('06-05-2017 22:29:33', 'dd-mm-yyyy hh24:mi:ss'), 'N', null);
insert into COMPLAINT (cpid, rsid, cpcontent, submissiontime, state, handleinfo)
values (5, 1, '�����������ҳ���', to_date('06-05-2017 22:30:32', 'dd-mm-yyyy hh24:mi:ss'), 'N', null);
insert into COMPLAINT (cpid, rsid, cpcontent, submissiontime, state, handleinfo)
values (6, 3, 'ľ��ά���ٶ�̫��', to_date('06-05-2017 22:31:12', 'dd-mm-yyyy hh24:mi:ss'), 'N', null);
insert into COMPLAINT (cpid, rsid, cpcontent, submissiontime, state, handleinfo)
values (7, 3, '��๤����1B1����ݱ��ϲ���ɨ��', to_date('06-05-2017 22:32:21', 'dd-mm-yyyy hh24:mi:ss'), 'N', null);
insert into COMPLAINT (cpid, rsid, cpcontent, submissiontime, state, handleinfo)
values (8, 3, '��������֪ͨ���1�ŵ������������ý���', to_date('06-05-2017 22:33:53', 'dd-mm-yyyy hh24:mi:ss'), 'N', null);
insert into COMPLAINT (cpid, rsid, cpcontent, submissiontime, state, handleinfo)
values (9, 4, '���ݱ���û�˴���', to_date('06-05-2017 22:38:01', 'dd-mm-yyyy hh24:mi:ss'), 'N', null);
commit;
prompt 6 records loaded
prompt Loading SECURITY...
insert into SECURITY (sid, sname, sex, identity, tel, job, address, territory, worktype, remark)
values (5, '����', 'M', '320522199410216711', '15665167096', 'S', '���ݹ���ѧԺ', 'һ��', 'D', null);
insert into SECURITY (sid, sname, sex, identity, tel, job, address, territory, worktype, remark)
values (6, '����', 'M', '320522199410216711', '15665167096', 'C', '���ݹ���ѧԺ', '����', 'N', null);
insert into SECURITY (sid, sname, sex, identity, tel, job, address, territory, worktype, remark)
values (7, '����', 'M', '320522199410216711', '18796221162', 'S', '�������������ݹ���ѧԺ', '1����2����¥', 'D', null);
insert into SECURITY (sid, sname, sex, identity, tel, job, address, territory, worktype, remark)
values (1, '���', 'M', '320522199410216711', '15665167096', 'S', '�ʼ���ѧԺ', '1����5��', 'D', null);
insert into SECURITY (sid, sname, sex, identity, tel, job, address, territory, worktype, remark)
values (2, '������', 'M', '320522199410216711', '18796221163', 'C', '�ʼ���ѧԺ', null, 'N', null);
insert into SECURITY (sid, sname, sex, identity, tel, job, address, territory, worktype, remark)
values (3, '������', 'M', '320522199410216711', '15665167099', 'C', '�ʼ���ѧԺ', null, 'N', null);
insert into SECURITY (sid, sname, sex, identity, tel, job, address, territory, worktype, remark)
values (4, '����', 'M', '320522199410216712', '15665167099', 'C', '�ʼ���ѧԺ', null, 'N', '������');
commit;
prompt 7 records loaded
prompt Loading EQUIPMENT...
insert into EQUIPMENT (eid, ename, enumber, vendor, producedate, maintenancetime, sid, remark)
values (4, '����', 4, '�й��������޹�˾', to_date('03-05-2017', 'dd-mm-yyyy'), '1��', 6, null);
insert into EQUIPMENT (eid, ename, enumber, vendor, producedate, maintenancetime, sid, remark)
values (5, '��ˮ��', 300, '�й�ˮ�ܹ�˾', to_date('01-05-2017', 'dd-mm-yyyy'), '3����', 3, null);
insert into EQUIPMENT (eid, ename, enumber, vendor, producedate, maintenancetime, sid, remark)
values (6, '·��', 30, '�й��ƾ߹�˾', to_date('06-05-2017', 'dd-mm-yyyy'), '3����', 2, null);
insert into EQUIPMENT (eid, ename, enumber, vendor, producedate, maintenancetime, sid, remark)
values (1, '����˨', 12, '�й���������޹�˾', to_date('01-01-2012', 'dd-mm-yyyy'), '2����', 1, null);
insert into EQUIPMENT (eid, ename, enumber, vendor, producedate, maintenancetime, sid, remark)
values (2, '��ǧ', 4, '��ǧ��˾', to_date('05-05-2017', 'dd-mm-yyyy'), '3����', 4, null);
insert into EQUIPMENT (eid, ename, enumber, vendor, producedate, maintenancetime, sid, remark)
values (3, '�����', 3, '�������˾', to_date('28-03-2017', 'dd-mm-yyyy'), '2����', 5, null);
commit;
prompt 6 records loaded
prompt Loading HIRE...
insert into HIRE (hid, hname, rid, htel, checkindate, duedate, remark)
values (1, '���', 4, '18796221162', to_date('10-05-2017', 'dd-mm-yyyy'), to_date('14-06-2017', 'dd-mm-yyyy'), null);
insert into HIRE (hid, hname, rid, htel, checkindate, duedate, remark)
values (2, '����', 1, '18796221162', to_date('02-05-2017', 'dd-mm-yyyy'), to_date('09-05-2017', 'dd-mm-yyyy'), '������');
insert into HIRE (hid, hname, rid, htel, checkindate, duedate, remark)
values (3, '������', 2, '18796221162', to_date('11-04-2017', 'dd-mm-yyyy'), to_date('09-05-2017', 'dd-mm-yyyy'), null);
insert into HIRE (hid, hname, rid, htel, checkindate, duedate, remark)
values (7, '������', 15, '15665167096', to_date('16-05-2017', 'dd-mm-yyyy'), to_date('17-05-2017', 'dd-mm-yyyy'), null);
insert into HIRE (hid, hname, rid, htel, checkindate, duedate, remark)
values (4, '�س�', 8, '15665167096', to_date('09-05-2017', 'dd-mm-yyyy'), to_date('25-05-2017', 'dd-mm-yyyy'), null);
insert into HIRE (hid, hname, rid, htel, checkindate, duedate, remark)
values (5, '����', 5, '15665167096', to_date('17-05-2017', 'dd-mm-yyyy'), to_date('07-02-2018', 'dd-mm-yyyy'), null);
insert into HIRE (hid, hname, rid, htel, checkindate, duedate, remark)
values (6, '������', 3, '15665167096', to_date('10-05-2017', 'dd-mm-yyyy'), to_date('24-05-2017', 'dd-mm-yyyy'), null);
insert into HIRE (hid, hname, rid, htel, checkindate, duedate, remark)
values (8, '÷��', 12, '15665167096', to_date('09-05-2017', 'dd-mm-yyyy'), to_date('17-05-2017', 'dd-mm-yyyy'), null);
insert into HIRE (hid, hname, rid, htel, checkindate, duedate, remark)
values (9, '�˳�', 10, '15665167096', to_date('17-05-2017', 'dd-mm-yyyy'), to_date('25-05-2017', 'dd-mm-yyyy'), null);
insert into HIRE (hid, hname, rid, htel, checkindate, duedate, remark)
values (10, '����', 7, '15665167096', to_date('15-05-2017', 'dd-mm-yyyy'), to_date('17-05-2017', 'dd-mm-yyyy'), null);
insert into HIRE (hid, hname, rid, htel, checkindate, duedate, remark)
values (11, '���˸�', 14, '15665167096', to_date('16-05-2017', 'dd-mm-yyyy'), to_date('24-05-2017', 'dd-mm-yyyy'), null);
commit;
prompt 11 records loaded
prompt Loading MAINTAINMAN...
insert into MAINTAINMAN (mmid, name, repairtype, tel, id)
values (1, '����', 'Wood', '18796221163', 3);
insert into MAINTAINMAN (mmid, name, repairtype, tel, id)
values (2, '����', 'Air', '18796221163', 4);
insert into MAINTAINMAN (mmid, name, repairtype, tel, id)
values (3, '����', 'Warm', '15665167099', 5);
insert into MAINTAINMAN (mmid, name, repairtype, tel, id)
values (4, '�հ�ȫ', 'Lock', '15665167096', 6);
insert into MAINTAINMAN (mmid, name, repairtype, tel, id)
values (5, '�ܲ�', 'Water', '15665167096', 7);
insert into MAINTAINMAN (mmid, name, repairtype, tel, id)
values (6, '����', 'Power', '18796221163', 8);
insert into MAINTAINMAN (mmid, name, repairtype, tel, id)
values (7, '�����', 'Other', '15665167099', 9);
commit;
prompt 7 records loaded
prompt Loading MAINTAIN...
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (6, '��Ʋ�����', 1, '����', to_date('06-05-2017 14:40:40', 'dd-mm-yyyy hh24:mi:ss'), '15665167096', 'N', null, 6);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (7, '�Ż���', 2, '����', to_date('06-05-2017 14:42:34', 'dd-mm-yyyy hh24:mi:ss'), '15665167096', 'N', null, 1);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (8, '�յ�������', 2, '����', to_date('06-05-2017 14:43:08', 'dd-mm-yyyy hh24:mi:ss'), '15665167096', 'N', null, 2);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (9, 'ů��������', 2, '����', to_date('06-05-2017 14:43:22', 'dd-mm-yyyy hh24:mi:ss'), '15665167096', 'N', null, 3);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (10, '���򲻿�', 1, '����', to_date('06-05-2017 14:39:54', 'dd-mm-yyyy hh24:mi:ss'), '15665167096', 'N', null, 4);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (11, 'ˮ�ܱ���', 1, '����', to_date('06-05-2017 14:40:08', 'dd-mm-yyyy hh24:mi:ss'), '15665167096', 'N', null, 5);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (12, 'ˮ��©ˮ', 2, '��Ȩ', to_date('06-05-2017 22:25:02', 'dd-mm-yyyy hh24:mi:ss'), '15665167096', 'N', null, 5);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (13, '��̨�Źز���', 2, '��Ȩ', to_date('06-05-2017 22:25:29', 'dd-mm-yyyy hh24:mi:ss'), '15665167096', 'N', null, 1);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (14, '��̨��������', 2, '��Ȩ', to_date('06-05-2017 22:26:01', 'dd-mm-yyyy hh24:mi:ss'), '15665167096', 'N', null, 7);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (15, '��̨������', 2, '�ŷ�', to_date('06-05-2017 22:34:20', 'dd-mm-yyyy hh24:mi:ss'), '15665167096', 'N', null, 4);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (16, 'ԡ�Ҳ�����ˮ', 2, '�ŷ�', to_date('06-05-2017 22:35:10', 'dd-mm-yyyy hh24:mi:ss'), '15665167096', 'N', null, 5);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (17, '¥���ƻ���', 2, '�ŷ�', to_date('06-05-2017 22:36:32', 'dd-mm-yyyy hh24:mi:ss'), '15665167096', 'N', null, 6);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (18, '���ݲ�����', 2, '�ŷ�', to_date('06-05-2017 22:36:57', 'dd-mm-yyyy hh24:mi:ss'), '15665167096', 'N', null, 6);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (19, '������ݲ�����', 3, '����', to_date('06-05-2017 22:38:36', 'dd-mm-yyyy hh24:mi:ss'), '15665167096', 'N', null, 6);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (20, 'ƴľ�ذ��ѿ���', 3, '����', to_date('06-05-2017 22:39:08', 'dd-mm-yyyy hh24:mi:ss'), '15665167096', 'N', null, 1);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (1, '���ӻ���', 4, '����', to_date('05-05-2017', 'dd-mm-yyyy'), '15665167096', 'Y', null, 1);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (2, '���ӻ���', 4, '��ǿ', to_date('05-05-2017', 'dd-mm-yyyy'), '15665167096', 'Y', null, 1);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (3, '������', 4, '��ǿ��', to_date('05-05-2017', 'dd-mm-yyyy'), '15665167096', 'N', null, 1);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (4, '��������', 4, '�ŷ�', to_date('05-05-2017', 'dd-mm-yyyy'), '15665167096', 'N', null, 2);
insert into MAINTAIN (mid, mcontent, rid, mname, repairdate, mtel, type, remark, mmid)
values (5, 'ů��Ƭ����', 4, '��Ȩ', to_date('05-05-2017 22:22:19', 'dd-mm-yyyy hh24:mi:ss'), '15665167096', 'N', null, 3);
commit;
prompt 20 records loaded
set feedback on
set define on
prompt Done.
