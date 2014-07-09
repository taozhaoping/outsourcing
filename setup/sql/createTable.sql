 --USERINFO
 CREATE TABLE t_user (
  id         NUMBER not null,
  userName varchar(20) NOT NULL ,--COMMENT '账号',
  userPassword varchar(100) not NULL, -- COMMENT '密码',
  roleID number NOT NULL, --COMMENT '角色ID',
  isDelete varchar(1) default '0',-- COMMENT '逻辑删除 0：正常 1删除',
  userType varchar(1) default '0',-- COMMENT '用户类型0：超级管理员 1：公司管理员，2：普通员工',
  employeeID number not NULL-- COMMENT '员工信息ID',
  
) ;
alter table t_user
  add constraint user_id primary key (ID);
  
-- Create sequence 
create sequence SEQUENCE_T_USER
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 10;