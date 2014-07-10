/*
 * 系统数据表
 */
/*
alter table sys_role_to_authorities
   drop constraint FK_SYS_ROLE_REFERENCE_SYS_ROLE;

alter table sys_role_to_authorities
   drop constraint FK_SYS_ROLE_REFERENCE_SYS_AUTH;

alter table sys_role_to_menu
   drop constraint FK_SYS_ROLE_REFERENCE_SYS_MENU;

alter table sys_role_to_menu
   drop constraint FK_SYS_MENU_REFERENCE_SYS_ROLE;

alter table sys_user
   drop constraint FK_SYS_USER_REFERENCE_SYS_ROLE;

alter table sys_user
   drop constraint FK_SYS_USER_REFERENCE_SYS_ENTE;
*/
drop table SYS_AUTHORITIES cascade constraints;

drop table SYS_ENTERPRISE cascade constraints;

drop table SYS_MENU cascade constraints;

drop table SYS_RESOURCEINFO cascade constraints;

drop table SYS_ROLE cascade constraints;

drop table SYS_ROLE_TO_AUTHORITIES cascade constraints;

drop table SYS_ROLE_TO_MENU cascade constraints;

drop index USER_LOGINNAME_INDEX;

drop table SYS_USER cascade constraints;

drop sequence SEQUENCE_SYS_AUTHORITIES;

drop sequence SEQUENCE_SYS_ENTERPRISE;

drop sequence SEQUENCE_SYS_MENU;

drop sequence SEQUENCE_SYS_RESOURCEINFO;

drop sequence SEQUENCE_SYS_ROLE;

drop sequence SEQUENCE_SYS_USER;

create sequence SEQUENCE_SYS_AUTHORITIES
start with 1
 maxvalue 999999999
 minvalue 1
 cache 10
order;

create sequence SEQUENCE_SYS_ENTERPRISE
start with 1
 maxvalue 99999999
 minvalue 1
 cache 5
order;

create sequence SEQUENCE_SYS_MENU
start with 1
 maxvalue 999999999
 minvalue 1
 cache 5
order;

create sequence SEQUENCE_SYS_RESOURCEINFO
start with 1
 maxvalue 9999999999
 minvalue 1
 cache 10
order;

create sequence SEQUENCE_SYS_ROLE
start with 1
 maxvalue 99999999
 minvalue 1
 cache 10
order;

create sequence SEQUENCE_SYS_USER
start with 1
 maxvalue 999999999
 minvalue 1
order
 cache 10;

/*==============================================================*/
/* Table: SYS_AUTHORITIES                                       */
/*==============================================================*/
create table SYS_AUTHORITIES 
(
   id                 NUMBER               not null,
   name               VARCHAR2(25 BYTE), --权限名称
   enabled              NUMBER default '0',-- 是否启用 0启动 1:停用
   module             VARCHAR2(25)  --模块
);

alter table SYS_AUTHORITIES
  add constraint PK_SYS_AUTHORITIES_ID primary key (id);

comment on table SYS_AUTHORITIES is
'权限表';

/*==============================================================*/
/* Table: sys_enterprise                                      */
/*==============================================================*/
create table SYS_ENTERPRISE 
(
   id                 NUMBER               not null,
   name               VARCHAR2(100 BYTE), --企业名称
   address            VARCHAR2(150 BYTE), --企业地址
   phoneCall          VARCHAR2(25 BYTE),  --企业电话
   enabled              NUMBER default '0'  -- 是否启用 0启动 1:停用
);

alter table SYS_ENTERPRISE
  add constraint PK_SYS_ENTERPRISE_ID primary key (id);

comment on table SYS_ENTERPRISE is
'企业信息表';

/*==============================================================*/
/* Table: sys_menu                                            */
/*==============================================================*/
create table SYS_MENU 
(
   id                 NUMBER               not null,
   name               VARCHAR2(150 BYTE), --菜单名称
   action             VARCHAR2(150 BYTE), --菜单action
   url                VARCHAR2(150 BYTE), --url地址
   i18n_key           VARCHAR2(100 BYTE), --国际化
   enabled              VARCHAR2(1 BYTE) default '0',-- 是否启用 0启动 1:停用
   parentID           NUMBER, --父类id
   reorder            NUMBER --排序
);

alter table SYS_MENU
  add constraint PK_SYS_MENU_ID primary key (id);
  
comment on table SYS_MENU is
'菜单表';

/*==============================================================*/
/* Table: sys_resourceInfo                                    */
/*==============================================================*/
create  table SYS_RESOURCEINFO 
(
   id                 NUMBER               not null,
   name               VARCHAR2(30 BYTE), --资源名称
   value              VARCHAR2(30 BYTE), --资源属性
   type               VARCHAR2(5 BYTE), --资源类别
   createTime         DATE,
   updateTime         DATE,
   enabled              NUMBER default '0'-- 是否启用 0启动 1:停用
);

alter table SYS_RESOURCEINFO
  add constraint PK_SYS_RESOURCEINFO_ID primary key (id);

comment on table SYS_RESOURCEINFO is
'资源信息表';

/*==============================================================*/
/* Table: sys_role                                            */
/*==============================================================*/
create table SYS_ROLE 
(
   id                 NUMBER               not null,
   name               VARCHAR2(50 BYTE), --角色名称
   createTime         DATE,
   updateTime         DATE
);

alter table SYS_ROLE
  add constraint PK_SYS_ROLE_ID primary key (id);

comment on table SYS_ROLE is
'角色信息表';

/*==============================================================*/
/* Table: sys_role_to_authorities                             */
/*==============================================================*/
create table SYS_ROLE_TO_AUTHORITIES 
(
   role_id            number,
   authorities_id     NUMBER
);

/*==============================================================*/
/* Table: sys_role_to_menu                                    */
/*==============================================================*/
create table SYS_ROLE_TO_MENU 
(
   menu_id            NUMBER,
   role_id            NUMBER
);

comment on table SYS_ROLE_TO_MENU is
'角色和菜单中间表（一对多）';

/*==============================================================*/
/* Table: sys_user                                            */
/*==============================================================*/
create table SYS_USER 
(
   id                 NUMBER               not null,
   loginName          VARCHAR2(20 BYTE)    not null, --登录账号
   userPassword       VARCHAR2(100 BYTE)   not null, --登录密码
   name               VARCHAR2(20), --姓名
   enabled              VARCHAR2(1 BYTE) default '0',-- 是否启用 0启动 1:停用
   userType           VARCHAR2(1 BYTE), --用户类型
   role_id            NUMBER, --角色id
   enterprise_id      NUMBER, --企业id
   email              VARCHAR2(25 BYTE), --电子邮件
   age                date, --出生日期
   sex                VARCHAR2(1 BYTE),--性别
   phone              VARCHAR2(20 BYTE), -- 座机号码
   qq                 VARCHAR2(20 BYTE), --qq号码
   mobile_number      VARCHAR2(20 BYTE), --手机号码
   entryTime          DATE, -- 入职时间
   address            VARCHAR2(100 BYTE), --家庭住址
   education_background VARCHAR2(1 BYTE),
   createTime         DATE, --创建时间
   updateTime         DATE --修改时间
);


alter table SYS_USER
  add constraint PK_SYS_USER_ID primary key (id);

/*==============================================================*/
/* Index: user_loginName_index                                */
/*==============================================================*/
create index USER_LOGINNAME_INDEX on SYS_USER (
   loginName ASC
);

/*
alter table sys_role_to_authorities
   add constraint FK_SYS_ROLE_REFERENCE_SYS_ROLE foreign key (role_id)
      references sys_role (id);

alter table sys_role_to_authorities
   add constraint FK_SYS_ROLE_REFERENCE_SYS_AUTH foreign key (authorities_id)
      references SYS_AUTHORITIES (id);

alter table sys_role_to_menu
   add constraint FK_SYS_ROLE_REFERENCE_SYS_MENU foreign key (menu_id)
      references sys_menu (id);

alter table sys_role_to_menu
   add constraint FK_SYS_MENU_REFERENCE_SYS_ROLE foreign key (role_id)
      references sys_role (id);

alter table sys_user
   add constraint FK_SYS_USER_REFERENCE_SYS_ROLE foreign key (role_id)
      references sys_role (id);

alter table sys_user
   add constraint FK_SYS_USER_REFERENCE_SYS_ENTE foreign key (enterprise_id)
      references sys_enterprise (id);
*/